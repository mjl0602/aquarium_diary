// lib/pages/home_page.dart

import 'dart:io';

import 'package:aquarium_diary/database/_isar.dart';
import 'package:aquarium_diary/database/enums.dart';
import 'package:aquarium_diary/database/models/aquarium.dart';
import 'package:aquarium_diary/database/models/media.dart';
import 'package:aquarium_diary/database/models/record.dart';
import 'package:aquarium_diary/global/userDefault.dart';
import 'package:aquarium_diary/pages/forms/aquarium_form_page.dart';
import 'package:aquarium_diary/pages/forms/water_change_form_page.dart';
import 'package:aquarium_diary/pages/forms/feeding_form_page.dart';
import 'package:aquarium_diary/pages/forms/water_quality_test_form_page.dart';
import 'package:aquarium_diary/pages/forms/new_creature_form_page.dart';
import 'package:aquarium_diary/pages/forms/new_equipment_form_page.dart';
import 'package:aquarium_diary/pages/forms/creature_status_change_form_page.dart';
import 'package:aquarium_diary/pages/forms/equipment_status_change_form_page.dart';
import 'package:aquarium_diary/pages/home/views/album_tab_widget.dart';
import 'package:aquarium_diary/pages/home/views/detail_tab_widget.dart';
import 'package:aquarium_diary/pages/home/views/record_card_view.dart';
import 'package:aquarium_diary/pages/views/aquarium_action_sheet.dart';
import 'package:aquarium_diary/r.dart';
import 'package:aquarium_diary/style/color.dart';
import 'package:aquarium_diary/style/text.dart';
import 'package:aquarium_diary/tools/eazy_push.dart';
import 'package:oktoast/oktoast.dart';
import 'package:aquarium_diary/tools/record_actions.dart';
import 'package:flutter/material.dart';
import 'package:isar_community/isar.dart';
import 'package:tapped/tapped.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController = TabController(length: 3, vsync: this);
  late ScrollController _scrollController;

  double get headerAspectRatio => 12 / 16;

  // 用于通知标题颜色变化的 ValueNotifier
  final ValueNotifier<Color> _titleColorNotifier = ValueNotifier(Colors.white);

  Aquarium? homeAquarium;
  String? _aquariumPhotoPath;

  // 记录相关状态
  List<Record> _records = [];
  bool _recordsLoading = true;

  Future<void> loadHomePageAqua() async {
    final id = UserDefault.homePageAQ.value;
    if (id == null) return;
    homeAquarium = await isar.aquariums.get(id);
    _loadPrimaryPhoto();
    setState(() {});
  }

  Future<void> _loadPrimaryPhoto() async {
    final aquariumId = homeAquarium?.id;
    if (aquariumId == null) return;
    try {
      final photos = await isar.medias
          .filter()
          .refTypeEqualTo(RefType.aquarium)
          .refIdEqualTo(aquariumId)
          .sortByCreatedAtDesc()
          .findAll();
      if (photos.isNotEmpty) {
        final primary = photos.firstWhere(
          (p) => p.isPrimary,
          orElse: () => photos.first,
        );
        _aquariumPhotoPath = primary.thumbnailPath ?? primary.filePath;
      } else {
        _aquariumPhotoPath = null;
      }
    } catch (e) {
      _aquariumPhotoPath = null;
    }
  }

  Future<void> _loadRecords() async {
    setState(() => _recordsLoading = true);

    try {
      // 加载记录
      List<Record> records;

      if (homeAquarium?.id != null) {
        // 过滤特定鱼缸的记录
        records = await isar.records
            .filter()
            .aquariumIdEqualTo(homeAquarium!.id)
            .findAll();
      } else {
        // 加载所有记录
        records = await isar.records.where().findAll();
      }

      // 按记录时间排序
      records.sort((a, b) => b.recordTime.compareTo(a.recordTime));
      _records = records;
    } catch (e) {
      print('加载记录失败: $e');
      _records = [];
    } finally {
      setState(() => _recordsLoading = false);
    }
  }

  void _showRecordDetails(Record record) {
    // 根据记录类型跳转到对应的编辑页面
    final formPage = _getFormPageForRecord(record);
    if (formPage == null) return;

    formPage.pushAsPage<Record>(context).then((result) {
      if (result != null) {
        _loadRecords();
      }
    });
  }

  /// 跳转不同记录类型对应页面
  Widget? _getFormPageForRecord(Record record) {
    final rt = record.recordType;
    final ot = record.operationType;

    switch (rt) {
      case RecordType.maintenance:
        return WaterChangeFormPage(
          record: record,
          aquariumId: record.aquariumId,
        );
      case RecordType.creature:
        switch (ot) {
          case OperationType.create:
            return NewCreatureFormPage(
              record: record,
              aquariumId: record.aquariumId,
            );
          case OperationType.sell:
            return CreatureStatusChangeFormPage(
              record: record,
              aquariumId: record.aquariumId,
            );
          case OperationType.loss:
            return CreatureStatusChangeFormPage(
              record: record,
              aquariumId: record.aquariumId,
            );
          case OperationType.statusChange:
            return CreatureStatusChangeFormPage(
              record: record,
              aquariumId: record.aquariumId,
            );
        }
      case RecordType.equipment:
        switch (ot) {
          case OperationType.create:
            return NewEquipmentFormPage(
              record: record,
              aquariumId: record.aquariumId,
            );
          case OperationType.sell:
            return CreatureStatusChangeFormPage(
              record: record,
              aquariumId: record.aquariumId,
            );
          case OperationType.loss:
            return CreatureStatusChangeFormPage(
              record: record,
              aquariumId: record.aquariumId,
            );
          case OperationType.statusChange:
            return EquipmentStatusChangeFormPage(
              record: record,
              aquariumId: record.aquariumId,
            );
        }
      case RecordType.aquarium:
        return WaterQualityTestFormPage(
          record: record,
          aquariumId: record.aquariumId,
        );
    }
  }

  Future<void> _showRecordActions(Record record) async {
    final action = await showRecordActions(context, record: record);
    if (action == null) return;

    switch (action) {
      case RecordAction.edit:
        _showRecordDetails(record);
        break;
      case RecordAction.delete:
        await isar.writeTxn(() async {
          await isar.records.delete(record.id);
        });
        showToast('已删除');
        _loadRecords();
        break;
    }
  }

  // 模拟总价格和开缸天数（实际应计算得出）
  final double totalPrice = 0;

  Future<void> _showSelector() async {
    final selected = await AquariumSelector.select(
      context: context,
      currentAquarium: homeAquarium,
    );
    if (selected != null) {
      UserDefault.homePageAQ.value = selected.id;
      await loadHomePageAqua();
      _loadRecords();
    }
  }

  @override
  void initState() {
    super.initState();

    _scrollController = ScrollController();
    _scrollController.addListener(_updateTitleColor);
    loadHomePageAqua();
    _loadRecords();
  }

  // 根据偏移量更新颜色
  void _updateTitleColor() {
    final offset = _scrollController.offset;
    final maxExtent = _maxScrollExtent;
    if (maxExtent <= 0) return;

    // 计算滚动比例 (0 = 完全展开, 1 = 完全收起)
    final t = (offset / maxExtent).clamp(0.0, 1.0);
    // 插值颜色：白色 -> 深灰色 (可根据需要调整)
    final newColor = Color.lerp(Colors.white, StColor.darkGray, t)!;
    if (_titleColorNotifier.value != newColor) {
      _titleColorNotifier.value = newColor;
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _tabController.dispose();
    _titleColorNotifier.dispose();
    super.dispose();
  }

  // 标题最大滚动距离
  double get _maxScrollExtent {
    final screenWidth = MediaQuery.of(context).size.width;
    final cardHeight = screenWidth * headerAspectRatio;
    final topPadding = MediaQuery.of(context).padding.top;
    final toolbarHeight = kToolbarHeight + topPadding;
    final expandedHeight = cardHeight + toolbarHeight;
    return expandedHeight - kToolbarHeight;
  }

  // 快速记录导航方法
  void _addWaterChange() {
    if (homeAquarium == null) return;
    WaterChangeFormPage.addWaterChange(
      context,
      aquariumId: homeAquarium!.id,
      isBottomSheet: true,
    );
  }

  void _addFeeding() {
    if (homeAquarium == null) return;
    FeedingFormPage.addFeeding(
      context,
      aquariumId: homeAquarium!.id,
      isBottomSheet: true,
    );
  }

  void _addWaterQualityTest() {
    if (homeAquarium == null) return;
    WaterQualityTestFormPage.addWaterQualityTest(
      context,
      aquariumId: homeAquarium!.id,
      testType: 'pH', // 默认测试类型
      isBottomSheet: true,
    );
  }

  Future<void> _addNewCreature() async {
    if (homeAquarium == null) return;
    final result = await NewCreatureFormPage.addNewCreature(
      context,
      aquariumId: homeAquarium!.id,
      creatureName: '新生物',
      isBottomSheet: true,
    );
    if (result != null) {
      _loadRecords();
    }
  }

  Future<void> _addNewEquipment() async {
    if (homeAquarium == null) return;
    final result = await NewEquipmentFormPage.addNewEquipment(
      context,
      aquariumId: homeAquarium!.id,
      equipmentName: '新设备',
      isBottomSheet: true,
    );
    if (result != null) {
      _loadRecords();
    }
  }

  void _addCreatureStatusChange() {
    if (homeAquarium == null) return;
    // 对于状态变化，我们需要sourceId，暂时无法提供
    // 显示提示信息
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('请先在记录页面中选择要操作的具体生物'),
        duration: const Duration(seconds: 2),
      ),
    );
    // 或者跳转到记录tab
    _tabController.animateTo(1);
  }

  void _addEquipmentStatusChange() {
    if (homeAquarium == null) return;
    // 对于状态变化，我们需要sourceId，暂时无法提供
    // 显示提示信息
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('请先在记录页面中选择要操作的具体设备'),
        duration: const Duration(seconds: 2),
      ),
    );
    // 或者跳转到记录tab
    _tabController.animateTo(1);
  }

  @override
  Widget build(BuildContext context) {
    if (homeAquarium == null) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              StText.big('鱼缸日记'),
              StText.normal('巴拉巴拉一堆话，目前略去'),
              Tapped(
                onTap: () async {
                  final targetAQ = await AquariumFormPage.add(context);
                  if (targetAQ == null) return;
                  UserDefault.homePageAQ.value = targetAQ.id;
                  loadHomePageAqua();
                },
                child: Container(
                  height: 48,
                  decoration: BoxDecoration(
                    color: StColor.primary,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: StText.medium(
                      '+ 添加鱼缸',
                      style: const TextStyle(color: StColor.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }

    final screenWidth = MediaQuery.of(context).size.width;
    final cardHeight = screenWidth * headerAspectRatio;
    final topPadding = MediaQuery.of(context).padding.top;
    final toolbarHeight = kToolbarHeight + topPadding;
    final expandedHeight = cardHeight + toolbarHeight;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: NestedScrollView(
        controller: _scrollController,
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              expandedHeight: expandedHeight,
              floating: false,
              pinned: true,
              centerTitle: false,
              title: ValueListenableBuilder<Color>(
                valueListenable: _titleColorNotifier,
                builder: (context, color, _) {
                  return Tapped(
                    onTap: _showSelector,
                    child: StText.big(
                      homeAquarium?.name,
                      style: TextStyle(
                        color: color,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  );
                },
              ),
              actions: [],
              backgroundColor: StColor.lightGray,
              foregroundColor: StColor.darkGray,
              elevation: 0,
              flexibleSpace: FlexibleSpaceBar(
                background: AquariumCard(
                  cardHeight: cardHeight,
                  aquarium: homeAquarium!,
                  totalPrice: totalPrice,
                  daysSinceSetup: homeAquarium!.daysSinceSetup,
                  photoPath: _aquariumPhotoPath,
                ),
              ),
            ),
            SliverPersistentHeader(
              delegate: _SliverTabBarDelegate(
                TabBar(
                  controller: _tabController,
                  labelColor: StColor.primary,
                  unselectedLabelColor: StColor.gray,
                  indicatorColor: StColor.primary,
                  indicatorWeight: 2,
                  tabs: const [
                    Tab(text: '详情'),
                    Tab(text: '相册'),
                    Tab(text: '记录'),
                  ],
                ),
                48.0,
              ),
              pinned: true,
            ),
          ];
        },
        body: TabBarView(
          controller: _tabController,
          children: [
            DetailTabWidget(
              aquarium: homeAquarium,
              creatures: _records
                  .where((r) => r.recordType == RecordType.creature)
                  .toList(),
              equipment: _records
                  .where((r) => r.recordType == RecordType.equipment)
                  .toList(),
              onAddWaterChange: () => _addWaterChange(),
              onAddFeeding: () => _addFeeding(),
              onAddWaterQualityTest: () => _addWaterQualityTest(),
              onAddNewCreature: () => _addNewCreature(),
              onAddNewEquipment: () => _addNewEquipment(),
              onAddCreatureStatusChange: () => _addCreatureStatusChange(),
              onAddEquipmentStatusChange: () => _addEquipmentStatusChange(),
            ),
            AlbumTabWidget(
              aquarium: homeAquarium,
              onPhotosChanged: () {
                _loadPrimaryPhoto();
                setState(() {});
              },
            ),
            RecordCard(
              records: _records,
              isLoading: _recordsLoading,
              onRecordTapped: _showRecordDetails,
              onRecordLongPressed: _showRecordActions,
            ),
          ],
        ),
      ),
    );
  }
}

// 鱼缸卡片（无圆角，接收 Aquarium 对象）
class AquariumCard extends StatelessWidget {
  final double cardHeight;
  final Aquarium aquarium;
  final double totalPrice;
  final int daysSinceSetup;
  final String? photoPath;

  const AquariumCard({
    Key? key,
    required this.cardHeight,
    required this.aquarium,
    required this.totalPrice,
    required this.daysSinceSetup,
    this.photoPath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final waterCapacity = aquarium.capacityLiter ?? 0.0;

    return Container(
      height: cardHeight,
      width: double.infinity,
      // margin: EdgeInsets.only(top: topPadding),
      decoration: BoxDecoration(color: StColor.white),
      child: Stack(
        fit: StackFit.expand,
        children: [
          // 主图（从鱼缸照片取第一张，没有则用默认图）
          if (photoPath != null)
            Image.file(
              File(photoPath!),
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) => Image.asset(
                R.aqTestMainImg,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => Container(
                  color: StColor.lightGray,
                  child: Center(
                    child: Icon(
                      Icons.image_not_supported,
                      color: StColor.halfGray,
                    ),
                  ),
                ),
              ),
            )
          else
            Image.asset(
              R.aqTestMainImg,
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) => Container(
                color: StColor.lightGray,
                child: Center(
                  child: Icon(
                    Icons.image_not_supported,
                    color: StColor.halfGray,
                  ),
                ),
              ),
            ),
          // 渐变遮罩（无圆角）
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    StColor.black.withOpacity(0.66),
                    StColor.black.withOpacity(0),
                    StColor.black.withOpacity(0),
                    StColor.black.withOpacity(0.66),
                  ],
                  stops: [0, 0.2, 0.8, 1],
                ),
              ),
            ),
          ),
          // 信息叠加
          Positioned(
            bottom: 12,
            left: 12,
            right: 12,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 4,
              children: [
                Row(
                  children: [
                    StText.small(
                      '总投入 ¥${totalPrice.toStringAsFixed(0)}',
                      style: const TextStyle(color: StColor.white),
                    ),
                    const SizedBox(width: 8),
                    StText.small(
                      '开缸 $daysSinceSetup 天',
                      style: const TextStyle(color: StColor.white),
                    ),
                  ],
                ),
                StText.small(
                  '水体 ${waterCapacity.toStringAsFixed(1)}L',
                  style: const TextStyle(color: StColor.white),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// 自定义 SliverPersistentHeaderDelegate（保持不变）
class _SliverTabBarDelegate extends SliverPersistentHeaderDelegate {
  final TabBar tabBar;
  final double height;

  _SliverTabBarDelegate(this.tabBar, this.height);

  @override
  double get minExtent => height;
  @override
  double get maxExtent => height;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Container(color: StColor.lightGray, child: tabBar);
  }

  @override
  bool shouldRebuild(_SliverTabBarDelegate oldDelegate) {
    return tabBar != oldDelegate.tabBar;
  }
}

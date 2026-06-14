// lib/pages/home_page.dart

import 'package:aquarium_diary/database/_isar.dart';
import 'package:aquarium_diary/database/enums.dart';
import 'package:aquarium_diary/database/models/aquarium.dart';
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
import 'package:aquarium_diary/pages/home/views/detail_tab_widget.dart';
import 'package:aquarium_diary/pages/home/views/record_card_view.dart';
import 'package:aquarium_diary/pages/views/aquarium_action_sheet.dart';
import 'package:aquarium_diary/r.dart';
import 'package:aquarium_diary/style/color.dart';
import 'package:aquarium_diary/style/text.dart';
import 'package:aquarium_diary/tools/eazy_push.dart';
import 'package:flutter/material.dart';
import 'package:isar_community/isar.dart';
import 'package:tapped/tapped.dart';

// 功能按钮组件
class FunctionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;
  final Color color;
  final Color iconColor;

  const FunctionButton({
    Key? key,
    required this.icon,
    required this.label,
    required this.onTap,
    required this.color,
    required this.iconColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: iconColor, size: 28),
            const SizedBox(height: 8),
            Text(
              label,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: StColor.darkGray,
              ),
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}

// 统计卡片组件
class StatCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final Color color;

  const StatCard({
    Key? key,
    required this.title,
    required this.value,
    required this.icon,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: color.withOpacity(0.2)),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: color.withOpacity(0.2),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Icon(icon, size: 20, color: color),
          ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              StText.small(title, style: TextStyle(color: StColor.gray)),
              StText.medium(
                value,
                style: TextStyle(color: color, fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// 快速操作按钮组件
class QuickAction extends StatelessWidget {
  final String label;
  final IconData icon;
  final Color color;
  final VoidCallback onTap;

  const QuickAction({
    Key? key,
    required this.label,
    required this.icon,
    required this.color,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Tapped(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: color.withOpacity(0.2)),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 20, color: color),
            const SizedBox(width: 8),
            StText.small(
              label,
              style: TextStyle(color: color, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}

// 信息行组件
class InfoRow extends StatelessWidget {
  final String label;
  final String value;

  const InfoRow({Key? key, required this.label, required this.value})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: StText.small(label, style: TextStyle(color: StColor.gray)),
          ),
          Expanded(
            flex: 2,
            child: StText.small(
              value,
              style: const TextStyle(
                color: StColor.darkGray,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController = TabController(length: 2, vsync: this);
  late ScrollController _scrollController;

  double get headerAspectRatio => 12 / 16;

  // 用于通知标题颜色变化的 ValueNotifier
  final ValueNotifier<Color> _titleColorNotifier = ValueNotifier(Colors.white);

  Aquarium? homeAquarium;

  // 记录相关状态
  List<Record> _records = [];
  bool _recordsLoading = true;

  loadHomePageAqua() async {
    final id = UserDefault.homePageAQ.value;
    if (id == null) return;
    homeAquarium = await isar.aquariums.get(id);
    setState(() {});
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

  Future<void> _refreshRecords() async {
    await _loadRecords();
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
            return NewCreatureFormPage(
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
            return NewEquipmentFormPage(
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

  void _showRecordActions(Record record) {
    // TODO: 实现记录操作菜单
    print('显示记录操作: ${record.name}');
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
      loadHomePageAqua();
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

  void _addNewCreature() {
    if (homeAquarium == null) return;
    NewCreatureFormPage.addNewCreature(
      context,
      aquariumId: homeAquarium!.id,
      creatureName: '新生物', // 默认生物名称
      isBottomSheet: true,
    );
  }

  void _addNewEquipment() {
    if (homeAquarium == null) return;
    NewEquipmentFormPage.addNewEquipment(
      context,
      aquariumId: homeAquarium!.id,
      equipmentName: '新设备', // 默认设备名称
      isBottomSheet: true,
    );
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

  const AquariumCard({
    Key? key,
    required this.cardHeight,
    required this.aquarium,
    required this.totalPrice,
    required this.daysSinceSetup,
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
          // 主图（无圆角）
          Image.asset(
            R.aqTestMainImg, // 替换为 aquarium.mainImage
            fit: BoxFit.cover,
            errorBuilder: (_, __, ___) => Container(
              color: StColor.lightGray,
              child: Center(
                child: Icon(Icons.image_not_supported, color: StColor.halfGray),
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

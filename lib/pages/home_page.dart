// lib/pages/home_page.dart

import 'package:aquarium_diary/database/_isar.dart';
import 'package:aquarium_diary/database/models/aquarium.dart';
import 'package:aquarium_diary/database/models/record.dart';
import 'package:aquarium_diary/global/userDefault.dart';
import 'package:aquarium_diary/pages/forms/aquarium_form_page.dart';
import 'package:aquarium_diary/pages/record_card.dart';
import 'package:aquarium_diary/pages/views/aquarium_action_sheet.dart';
import 'package:aquarium_diary/r.dart';
import 'package:aquarium_diary/style/color.dart';
import 'package:aquarium_diary/style/text.dart';
import 'package:flutter/material.dart';
import 'package:isar_community/isar.dart';
import 'package:left_scroll_actions/left_scroll_actions.dart';
import 'package:tapped/tapped.dart';

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
    // TODO: 实现记录详情显示
    print('显示记录详情: ${record.name}');
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

  // 构建详情tab
  Widget _buildDetailTab() {
    if (homeAquarium == null) {
      return const Center(child: Text('请先选择鱼缸'));
    }

    final aquarium = homeAquarium!;
    final waterCapacity = aquarium.capacityLiter ?? 0.0;
    final days = aquarium.daysSinceSetup;
    final startDate = aquarium.startDate;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 基本信息卡片
          Container(
            decoration: BoxDecoration(
              color: StColor.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                StText.medium(
                  '基本信息',
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    color: StColor.darkGray,
                  ),
                ),
                const SizedBox(height: 12),
                _buildInfoRow('鱼缸名称', aquarium.name),
                _buildInfoRow('鱼缸结构', aquarium.structure.label),
                if (startDate != null)
                  _buildInfoRow(
                    '开缸时间',
                    '${startDate.year}-${startDate.month}-${startDate.day}',
                  ),
                _buildInfoRow('开缸天数', '$days 天'),
                if (waterCapacity > 0)
                  _buildInfoRow('水体容量', '${waterCapacity.toStringAsFixed(1)}L'),
                if (aquarium.notes != null && aquarium.notes!.isNotEmpty)
                  _buildInfoRow('备注', aquarium.notes!),
              ],
            ),
          ),
          const SizedBox(height: 16),
          // 统计信息卡片
          Container(
            decoration: BoxDecoration(
              color: StColor.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                StText.medium(
                  '统计信息',
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    color: StColor.darkGray,
                  ),
                ),
                const SizedBox(height: 12),
                // 这里可以添加记录统计信息
                _buildStatCard(
                  '总记录数',
                  '0', // TODO: 从数据库获取
                  Icons.note_add,
                  Colors.blue,
                ),
                const SizedBox(height: 12),
                _buildStatCard(
                  '维护记录',
                  '0', // TODO: 从数据库获取
                  Icons.build,
                  Colors.green,
                ),
                const SizedBox(height: 12),
                _buildStatCard(
                  '水质测试',
                  '0', // TODO: 从数据库获取
                  Icons.science,
                  Colors.purple,
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          // 快速操作
          Container(
            decoration: BoxDecoration(
              color: StColor.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                StText.medium(
                  '快速操作',
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    color: StColor.darkGray,
                  ),
                ),
                const SizedBox(height: 12),
                Wrap(
                  spacing: 12,
                  runSpacing: 12,
                  children: [
                    _buildQuickAction(
                      '添加记录',
                      Icons.note_add,
                      StColor.primary,
                      () {
                        // TODO: 跳转到添加记录页面
                      },
                    ),
                    _buildQuickAction('水质测试', Icons.science, Colors.purple, () {
                      // TODO: 跳转到水质测试页面
                    }),
                    _buildQuickAction('维护记录', Icons.build, Colors.green, () {
                      // TODO: 跳转到维护页面
                    }),
                    _buildQuickAction('编辑鱼缸', Icons.edit, Colors.orange, () {
                      // TODO: 跳转到编辑鱼缸页面
                    }),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
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

  Widget _buildStatCard(
    String title,
    String value,
    IconData icon,
    Color color,
  ) {
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

  Widget _buildQuickAction(
    String label,
    IconData icon,
    Color color,
    VoidCallback onTap,
  ) {
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
                  indicatorWeight: 3,
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
            _buildDetailTab(),
            RecordCard(
              aquariumId: homeAquarium?.id,
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

// 以下列表组件保持不变（略）
// ...
// 通用列表项卡片
class ListItemCard extends StatelessWidget {
  final int id;
  final IconData icon;
  final String title;
  final String subtitle;
  final String? trailing;
  final Function? onTap;
  final Function? onRemove;

  const ListItemCard({
    Key? key,
    required this.icon,
    required this.title,
    required this.subtitle,
    this.trailing,
    required this.id,
    this.onTap,
    this.onRemove,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      child: CupertinoLeftScroll(
        key: ValueKey(id),
        closeTag: LeftScrollCloseTag('home_list'),
        onTap: () => onTap?.call(),
        opacityChange: true,
        buttons: [
          Tapped(
            onTap: onTap,
            child: Container(
              margin: EdgeInsets.all(4),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: StColor.error,
                borderRadius: BorderRadius.circular(6),
              ),
              child: Text('删除', style: TextStyle(color: Colors.white)),
            ),
          ),
          // LeftScrollItem(color: StColor.error, text: '删除', onTap: onRemove),
        ],
        child: Container(
          decoration: BoxDecoration(
            color: StColor.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.03),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: StColor.lightGray,
              child: Icon(icon, color: StColor.primary, size: 20),
            ),
            title: StText.medium(title),
            subtitle: StText.small(
              subtitle,
              style: const TextStyle(color: StColor.gray),
            ),
            trailing: trailing != null
                ? StText.medium(
                    trailing!,
                    style: const TextStyle(color: StColor.primary),
                  )
                : null,
          ),
        ),
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

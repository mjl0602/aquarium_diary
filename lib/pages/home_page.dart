// lib/pages/home_page.dart

import 'package:aquarium_diary/database/_isar.dart';
import 'package:aquarium_diary/database/enums.dart';
import 'package:aquarium_diary/database/models/aquarium.dart';
import 'package:aquarium_diary/database/models/creature.dart';
import 'package:aquarium_diary/database/models/equipment.dart';
import 'package:aquarium_diary/global/userDefault.dart';
import 'package:aquarium_diary/pages/debug/debugBtnsPage.dart';
import 'package:aquarium_diary/pages/forms/aquarium_form_page.dart';
import 'package:aquarium_diary/pages/forms/creature_form_page.dart';
import 'package:aquarium_diary/pages/views/aquarium_action_sheet.dart';
import 'package:aquarium_diary/r.dart';
import 'package:aquarium_diary/style/color.dart';
import 'package:aquarium_diary/style/text.dart';
import 'package:aquarium_diary/tools/eazyPush.dart';
import 'package:aquarium_diary/views/blankListHintView.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  List<Creature> creatureList = [];
  List<Equipment> equipmentList = [];

  loadHomePageAqua() async {
    final id = UserDefault.homePageAQ.value;
    if (id == null) return;
    homeAquarium = await isar.aquariums.get(id);
    creatureList = await isar.creatures
        .filter()
        .aquariumIdEqualTo(homeAquarium!.id)
        .findAll();
    equipmentList = await isar.equipments
        .filter()
        .aquariumIdEqualTo(homeAquarium!.id)
        .findAll();

    setState(() {});
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

  @override
  Widget build(BuildContext context) {
    if (homeAquarium == null) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            spacing: 20,
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
              actions: [
                Tapped(
                  onTap: () {
                    DebugBtnsPage().pushAsPage(context);
                  },
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    child: Icon(Icons.add, color: StColor.white),
                  ),
                ),
              ],
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
                    // Tab(text: '记录'),
                    Tab(text: '生物'),
                    Tab(text: '设备'),
                    Tab(text: '维护'),
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
            BlankListHintView(
              isBlank: creatureList.isEmpty,
              replacement: Container(
                margin: EdgeInsets.symmetric(horizontal: 32),
                child: Column(
                  spacing: 20,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    StText.small('后续可从右上角添加生物'),
                    Tapped(
                      onTap: () async {
                        final targetItem = await CreatureFormPage.add(
                          context,
                          homeAquarium!.id,
                        );
                        if (targetItem == null) return;
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
                            '+ 添加生物',
                            style: const TextStyle(color: StColor.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              child: ListView.builder(
                padding: const EdgeInsets.all(12),
                itemCount: creatureList.length,
                itemBuilder: (context, index) {
                  final creature = creatureList[index];
                  return ListItemCard(
                    icon: Icons.pets,
                    title: creature.nickname ?? creature.speciesName,
                    subtitle:
                        '状态: ${creature.statusType.label}  •  入缸 ${creature.daysSinceSetup}天',
                    trailing: '❤️',
                  );
                },
              ),
            ),
            EquipmentList(),
            // ConsumableList(),
            MaintenanceList(),
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
    // final topPadding = MediaQuery.of(context).padding.top + kToolbarHeight;
    // 将毫米转换为厘米显示
    final lengthCm = (aquarium.lengthMm ?? 0) / 10;
    final widthCm = (aquarium.widthMm ?? 0) / 10;
    final heightCm = (aquarium.heightMm ?? 0) / 10;
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
                  '${lengthCm.toStringAsFixed(1)}cm × ${widthCm.toStringAsFixed(1)}cm × ${heightCm.toStringAsFixed(1)}cm  •  水体 ${waterCapacity.toStringAsFixed(1)}L',
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
  final IconData icon;
  final String title;
  final String subtitle;
  final String? trailing;

  const ListItemCard({
    Key? key,
    required this.icon,
    required this.title,
    required this.subtitle,
    this.trailing,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
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
    );
  }
}

// 设备列表
class EquipmentList extends StatelessWidget {
  const EquipmentList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(12),
      itemCount: 6,
      itemBuilder: (context, index) {
        return const ListItemCard(
          icon: Icons.devices,
          title: '水泵',
          subtitle: '功率 25W  •  正常使用',
          trailing: '⚡',
        );
      },
    );
  }
}

// 耗材列表
class ConsumableList extends StatelessWidget {
  const ConsumableList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(12),
      itemCount: 5,
      itemBuilder: (context, index) {
        return const ListItemCard(
          icon: Icons.inventory,
          title: '鱼粮',
          subtitle: '剩余 200g  •  可用约30天',
          trailing: '🔄',
        );
      },
    );
  }
}

// 维护列表
class MaintenanceList extends StatelessWidget {
  const MaintenanceList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(12),
      itemCount: 7,
      itemBuilder: (context, index) {
        return const ListItemCard(
          icon: Icons.build,
          title: '换水',
          subtitle: '昨天 · 下次提醒 3天后',
          trailing: '⏰',
        );
      },
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

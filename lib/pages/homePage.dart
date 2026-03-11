// lib/pages/home_page.dart

import 'package:aquarium_diary/database/enums.dart';
import 'package:aquarium_diary/database/models/aquarium.dart';
import 'package:aquarium_diary/pages/debug/debugBtnsPage.dart';
import 'package:aquarium_diary/pages/views/aquarium_action_sheet.dart';
import 'package:aquarium_diary/style/color.dart';
import 'package:aquarium_diary/style/text.dart';
import 'package:aquarium_diary/tools/eazyPush.dart';
import 'package:flutter/material.dart';
import 'package:tapped/tapped.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  double get headerAspectRatio => 9 / 16;

  // 模拟鱼缸数据（实际应从数据库获取）
  final Aquarium demoAquarium = Aquarium(
    name: '海缸日记',
    structure: AquariumStructure.backFilter, // 假设有该值
    purchaseDate: DateTime(2025, 1, 15),
    lengthMm: 1200,
    widthMm: 600,
    heightMm: 500,
    capacityLiter: 360.0,
    isActive: true,
    createdAt: DateTime(2025, 1, 15),
    notes: '',
  );

  // 模拟总价格和开缸天数（实际应计算得出）
  final double totalPrice = 5280.0;
  late final int daysSinceSetup = DateTime.now()
      .difference(demoAquarium.createdAt)
      .inDays;

  Future<void> _showSelector() async {
    // 模拟鱼缸列表（实际从数据库获取）
    final List<Aquarium> aquariums = [
      demoAquarium,
      // 可以添加其他模拟鱼缸
    ];
    final selected = await showAquariumSelector(
      context: context,
      aquariums: aquariums,
      currentAquarium: demoAquarium,
    );
    if (selected != null) {
      setState(() {
        // 切换当前鱼缸
        // 这里需要更新 demoAquarium 和相关数据，实际项目中应重新加载数据
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final cardHeight = screenWidth * headerAspectRatio;
    final topPadding = MediaQuery.of(context).padding.top;
    final toolbarHeight = kToolbarHeight + topPadding;
    final expandedHeight = cardHeight + toolbarHeight;

    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              expandedHeight: expandedHeight,
              floating: false,
              pinned: true,
              centerTitle: false,
              title: Tapped(
                onTap: _showSelector,
                child: StText.big(
                  demoAquarium.name,
                  style: const TextStyle(
                    color: StColor.darkGray,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              actions: [
                Tapped(
                  onTap: () {
                    DebugBtnsPage().pushAsPage(context);
                  },
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Icon(Icons.more_vert, color: StColor.darkGray),
                  ),
                ),
              ],
              backgroundColor: StColor.lightGray,
              foregroundColor: StColor.darkGray,
              elevation: 0,
              flexibleSpace: FlexibleSpaceBar(
                background: AquariumCard(
                  cardHeight: cardHeight,
                  aquarium: demoAquarium,
                  totalPrice: totalPrice,
                  daysSinceSetup: daysSinceSetup,
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
                    Tab(text: '生物'),
                    Tab(text: '设备'),
                    Tab(text: '耗材'),
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
          children: const [
            CreatureList(),
            EquipmentList(),
            ConsumableList(),
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
    final topPadding = MediaQuery.of(context).padding.top + kToolbarHeight;
    // 将毫米转换为厘米显示
    final lengthCm = (aquarium.lengthMm ?? 0) / 10;
    final widthCm = (aquarium.widthMm ?? 0) / 10;
    final heightCm = (aquarium.heightMm ?? 0) / 10;
    final waterCapacity = aquarium.capacityLiter ?? 0.0;

    return Container(
      height: cardHeight,
      width: double.infinity,
      margin: EdgeInsets.only(top: topPadding),
      decoration: BoxDecoration(
        color: StColor.white,
        // boxShadow: [
        //   BoxShadow(
        //     color: Colors.black.withOpacity(0.05),
        //     blurRadius: 12,
        //     offset: const Offset(0, -4),
        //   ),
        // ],
      ),
      child: Stack(
        fit: StackFit.expand,
        children: [
          // 主图（无圆角）
          Image.network(
            'https://via.placeholder.com/400x400', // 替换为 aquarium.mainImage
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
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    StColor.black.withOpacity(0.5),
                    StColor.black.withOpacity(0),
                  ],
                  stops: [0, 0.3],
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

// 生物列表
class CreatureList extends StatelessWidget {
  const CreatureList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(12),
      itemCount: 8,
      itemBuilder: (context, index) {
        return const ListItemCard(
          icon: Icons.pets,
          title: '小丑鱼 ×2',
          subtitle: '状态: 活跃  •  入缸 45天',
          trailing: '❤️',
        );
      },
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

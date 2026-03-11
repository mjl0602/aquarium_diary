// lib/widgets/aquarium_selector.dart

import 'package:aquarium_diary/database/enums.dart';
import 'package:aquarium_diary/database/models/aquarium.dart';
import 'package:aquarium_diary/pages/forms/aquarium_form_page.dart';
import 'package:aquarium_diary/style/color.dart';
import 'package:aquarium_diary/style/text.dart';
import 'package:flutter/material.dart';
import 'package:tapped/tapped.dart';

/// 从顶部弹出的鱼缸选择器
class AquariumSelector extends StatelessWidget {
  final List<Aquarium> aquariums; // 所有鱼缸列表
  final Aquarium? currentAquarium; // 当前选中的鱼缸
  final ValueChanged<Aquarium> onSelect; // 选择鱼缸回调
  final VoidCallback onAdd; // 添加鱼缸回调

  const AquariumSelector({
    Key? key,
    required this.aquariums,
    required this.currentAquarium,
    required this.onSelect,
    required this.onAdd,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 计算最大高度（不超过屏幕高度的 80%）
    final mediaQuery = MediaQuery.of(context);
    final maxHeight = mediaQuery.size.height * 0.8;

    return Align(
      alignment: Alignment.topCenter, // 从顶部弹出
      child: Material(
        color: Colors.transparent,
        child: Container(
          width: mediaQuery.size.width,
          margin: EdgeInsets.only(
            top: mediaQuery.padding.top + kToolbarHeight, // 从标题栏下方开始
            left: 16,
            right: 16,
          ),
          constraints: BoxConstraints(maxHeight: maxHeight),
          decoration: BoxDecoration(
            color: StColor.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 20,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // 标题栏
              Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    StText.medium(
                      '选择鱼缸',
                      style: const TextStyle(
                        color: StColor.darkGray,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Tapped(
                      onTap: () => Navigator.pop(context),
                      child: const Icon(Icons.close, color: StColor.gray),
                    ),
                  ],
                ),
              ),
              // 鱼缸列表
              Flexible(
                child: ListView.separated(
                  shrinkWrap: true,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemCount: aquariums.length,
                  separatorBuilder: (_, __) => const Divider(height: 1),
                  itemBuilder: (context, index) {
                    final aquarium = aquariums[index];
                    final isSelected = currentAquarium?.id == aquarium.id;
                    return _buildAquariumItem(aquarium, isSelected, context);
                  },
                ),
              ),
              // 添加鱼缸按钮
              Padding(
                padding: const EdgeInsets.all(16),
                child: Tapped(
                  onTap: () {
                    Navigator.pop(context); // 关闭选择器
                    onAdd();
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
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAquariumItem(
    Aquarium aquarium,
    bool isSelected,
    BuildContext context,
  ) {
    return Tapped(
      onTap: () {
        onSelect(aquarium);
        Navigator.pop(context);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Row(
          children: [
            // 图标（可根据结构显示不同图标）
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: StColor.lightGray,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                _getStructureIcon(aquarium.structure),
                color: StColor.primary,
                size: 20,
              ),
            ),
            const SizedBox(width: 12),
            // 鱼缸信息
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  StText.medium(aquarium.name),
                  if (aquarium.capacityLiter != null)
                    StText.small(
                      '${aquarium.capacityLiter!.toStringAsFixed(1)}L',
                      style: const TextStyle(color: StColor.gray),
                    ),
                ],
              ),
            ),
            // 选中标记
            if (isSelected)
              Icon(Icons.check_circle, color: StColor.primary, size: 20)
            else
              const SizedBox(width: 20),
          ],
        ),
      ),
    );
  }

  // 根据鱼缸结构返回对应图标
  IconData _getStructureIcon(AquariumStructure structure) {
    switch (structure) {
      case AquariumStructure.bottomFilter:
        return Icons.water_drop;
      case AquariumStructure.backFilter:
        return Icons.view_agenda;
      case AquariumStructure.topFilter:
        return Icons.arrow_upward;
      case AquariumStructure.hangOn:
        return Icons.extension;
      case AquariumStructure.diy:
        return Icons.build;
      case AquariumStructure.bare:
        return Icons.crop_square;
    }
  }
}

/// 显示鱼缸选择器的便捷方法
Future<Aquarium?> showAquariumSelector({
  required BuildContext context,
  required List<Aquarium> aquariums,
  required Aquarium? currentAquarium,
}) {
  return showGeneralDialog<Aquarium>(
    context: context,
    pageBuilder: (context, animation, secondaryAnimation) {
      return AquariumSelector(
        aquariums: aquariums,
        currentAquarium: currentAquarium,
        onSelect: (selected) => Navigator.pop(context, selected),
        onAdd: () async {
          // 跳转到鱼缸表单页面，等待返回新鱼缸
          final newAquarium = await Navigator.push<Aquarium>(
            context,
            MaterialPageRoute(builder: (_) => AquariumFormPage()),
          );
          if (newAquarium != null) {
            // 这里不直接返回，因为需要刷新列表，交给调用方处理
            Navigator.pop(context, newAquarium);
          }
        },
      );
    },
    barrierDismissible: true,
    barrierLabel: 'Dismiss',
    transitionDuration: const Duration(milliseconds: 200),
    transitionBuilder: (context, animation, secondaryAnimation, child) {
      // 从顶部滑入动画
      final offsetAnimation = Tween<Offset>(
        begin: const Offset(0, -1),
        end: Offset.zero,
      ).animate(CurvedAnimation(parent: animation, curve: Curves.easeOut));
      return SlideTransition(position: offsetAnimation, child: child);
    },
  );
}

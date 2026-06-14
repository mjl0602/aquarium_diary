// lib/pages/home/views/detail_tab_widget.dart

import 'package:aquarium_diary/database/enums.dart';
import 'package:aquarium_diary/database/models/aquarium.dart';
import 'package:aquarium_diary/database/models/record.dart';
import 'package:aquarium_diary/style/color.dart';
import 'package:aquarium_diary/style/text.dart';
import 'package:flutter/material.dart';
import 'package:tapped/tapped.dart';

// 详情页独立组件
class DetailTabWidget extends StatefulWidget {
  final Aquarium? aquarium;
  final List<Record> creatures;
  final List<Record> equipment;
  final VoidCallback? onAddWaterChange;
  final VoidCallback? onAddFeeding;
  final VoidCallback? onAddWaterQualityTest;
  final VoidCallback? onAddNewCreature;
  final VoidCallback? onAddNewEquipment;
  final VoidCallback? onAddCreatureStatusChange;
  final VoidCallback? onAddEquipmentStatusChange;

  const DetailTabWidget({
    Key? key,
    this.aquarium,
    this.creatures = const [],
    this.equipment = const [],
    this.onAddWaterChange,
    this.onAddFeeding,
    this.onAddWaterQualityTest,
    this.onAddNewCreature,
    this.onAddNewEquipment,
    this.onAddCreatureStatusChange,
    this.onAddEquipmentStatusChange,
  }) : super(key: key);

  @override
  State<DetailTabWidget> createState() => _DetailTabWidgetState();
}

class _DetailTabWidgetState extends State<DetailTabWidget> {
  bool _showCreatures = true;

  @override
  Widget build(BuildContext context) {
    if (widget.aquarium == null) {
      return const Center(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              StText.big('请先选择鱼缸'),
              SizedBox(height: 8),
              StText.small('请先在左侧选择一个鱼缸'),
            ],
          ),
        ),
      );
    }

    return SingleChildScrollView(
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 卡片1: 切换生物列表/设备列表
          _buildToggleCard(),
          const SizedBox(height: 12),

          // 卡片2: 换水 + 水质测试 + 喂食
          _buildWaterCard(),
          const SizedBox(height: 12),

          // 卡片3: 新设备 + 新生物
          _buildNewItemCard(),
        ],
      ),
    );
  }

  Widget _buildToggleCard() {
    final items = _showCreatures ? widget.creatures : widget.equipment;
    final label = _showCreatures ? '生物' : '设备';

    return Container(
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
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 紧凑切换按钮
          Container(
            decoration: BoxDecoration(
              color: StColor.lightGray,
              borderRadius: BorderRadius.circular(20),
            ),
            padding: const EdgeInsets.all(2),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildTabOption('生物', true, null),
                const SizedBox(width: 2),
                _buildTabOption('设备', false, null),
              ],
            ),
          ),
          const SizedBox(height: 10),

          // 列表内容
          if (items.isEmpty)
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: StText.small(
                '暂无$label记录',
                style: const TextStyle(color: StColor.gray, fontSize: 12),
              ),
            )
          else
            ...List.generate(
              items.length > 3 ? 3 : items.length,
              (i) => _buildRecordItem(items[i]),
            ),

          // 查看更多
          if (items.length > 3)
            Tapped(
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.only(top: 6),
                child: Center(
                  child: StText.small(
                    '查看更多',
                    style: TextStyle(
                      color: StColor.primary,
                      fontSize: 11,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildTabOption(String label, bool isSelected, VoidCallback? onTap) {
    if (isSelected) {
      return Tapped(
        onTap: () => setState(() => _showCreatures = true),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
          decoration: BoxDecoration(
            color: StColor.primary,
            borderRadius: BorderRadius.circular(18),
          ),
          child: Text(
            label,
            style: const TextStyle(
              color: StColor.white,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      );
    }
    return Tapped(
      onTap: () => setState(() => _showCreatures = false),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
        child: Text(
          label,
          style: TextStyle(
            color: StColor.gray,
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  Widget _buildRecordItem(Record record) {
    final color = record.recordType == RecordType.creature
        ? Colors.blue
        : Colors.teal;
    final icon = record.recordType == RecordType.creature
        ? Icons.pets
        : Icons.settings;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Icon(icon, size: 14, color: color),
          ),
          const SizedBox(width: 8),
          StText.small(
            record.name,
            style: const TextStyle(color: StColor.darkGray, fontSize: 12),
          ),
        ],
      ),
    );
  }

  Widget _buildWaterCard() {
    return Container(
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
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          StText.small(
            '维护',
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              color: StColor.darkGray,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: _buildButton(
                  Icons.water_drop,
                  '换水',
                  Colors.blue,
                  widget.onAddWaterChange,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: _buildButton(
                  Icons.science,
                  '水质',
                  Colors.purple,
                  widget.onAddWaterQualityTest,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: _buildButton(
                  Icons.restaurant,
                  '喂食',
                  Colors.green,
                  widget.onAddFeeding,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildNewItemCard() {
    return Container(
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
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          StText.small(
            '新增',
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              color: StColor.darkGray,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: _buildButton(
                  Icons.settings,
                  '新设备',
                  Colors.cyan,
                  widget.onAddNewEquipment,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: _buildButton(
                  Icons.pets,
                  '新生物',
                  Colors.orange,
                  widget.onAddNewCreature,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildButton(
    IconData icon,
    String label,
    Color color,
    VoidCallback? onTap,
  ) {
    return Tapped(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          children: [
            Icon(icon, color: color, size: 24),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w500,
                color: color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// lib/pages/home/views/detail_tab_widget.dart

import 'package:aquarium_diary/database/models/aquarium.dart';
import 'package:aquarium_diary/database/models/record.dart';
import 'package:aquarium_diary/pages/home/views/creature_list_page.dart';
import 'package:aquarium_diary/pages/home/views/equipment_list_page.dart';
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
    final creatureCount = widget.creatures.length;
    final equipmentCount = widget.equipment.length;

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
      child: Row(
        children: [
          Expanded(
            child: Tapped(
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => CreatureListPage(
                    aquarium: widget.aquarium,
                    creatures: widget.creatures,
                  ),
                ),
              ),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 24),
                decoration: BoxDecoration(
                  color: Colors.blue.withOpacity(0.08),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    const Icon(Icons.pets, color: Colors.blue, size: 32),
                    const SizedBox(height: 8),
                    StText.small(
                      '$creatureCount个生物',
                      style: const TextStyle(
                        color: StColor.darkGray,
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Tapped(
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => EquipmentListPage(
                    aquarium: widget.aquarium,
                    equipment: widget.equipment,
                  ),
                ),
              ),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 24),
                decoration: BoxDecoration(
                  color: Colors.teal.withOpacity(0.08),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    const Icon(Icons.settings, color: Colors.teal, size: 32),
                    const SizedBox(height: 8),
                    StText.small(
                      '$equipmentCount个设备',
                      style: const TextStyle(
                        color: StColor.darkGray,
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ),
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

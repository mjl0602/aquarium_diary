import 'package:aquarium_diary/pages/forms/aquarium_form_page.dart';
import 'package:aquarium_diary/pages/forms/consumable_form_page.dart';
import 'package:aquarium_diary/style/text.dart';
import 'package:aquarium_diary/tools/eazyPush.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: StText.medium('临时主页')),
      body: ListView(
        children: [
          ElevatedButton(
            onPressed: () {
              AquariumFormPage().pushAsPage(context);
            },
            child: StText.medium('创建鱼缸'),
          ),
          ElevatedButton(
            onPressed: () {
              ConsumableFormPage().pushAsPage(context);
            },
            child: StText.medium('创建耗材'),
          ),
          // 创建鱼缸 Aquarium
          // 创建耗材 Consumable
          // 创建设备 Equipment
          // 创建生物 Creature
          // 创建生物状态变化 CreatureStatusChange
          // 创建维护记录 MaintenanceRecord
          // 创建周期计划 SchedulePlan
          // 创建图片 Photo
        ],
      ),
    );
  }
}

import 'package:aquarium_diary/pages/forms/aquarium_form_page.dart';
import 'package:aquarium_diary/pages/forms/consumable_form_page.dart';
import 'package:aquarium_diary/pages/forms/creature_change_form_page.dart';
import 'package:aquarium_diary/pages/forms/creature_form_page.dart';
import 'package:aquarium_diary/pages/forms/equipment_form_page.dart';
import 'package:aquarium_diary/pages/forms/maintenance_record_form_page.dart';
import 'package:aquarium_diary/pages/forms/schedule_plan_form_page.dart';
import 'package:aquarium_diary/style/text.dart';
import 'package:aquarium_diary/tools/eazyPush.dart';
import 'package:flutter/material.dart';

class DebugBtnsPage extends StatefulWidget {
  const DebugBtnsPage({super.key});

  @override
  State<DebugBtnsPage> createState() => _DebugBtnsPageState();
}

class _DebugBtnsPageState extends State<DebugBtnsPage> {
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
          ElevatedButton(
            onPressed: () {
              EquipmentFormPage().pushAsPage(context);
            },
            child: StText.medium('创建设备'),
          ),
          ElevatedButton(
            onPressed: () {
              CreatureFormPage().pushAsPage(context);
            },
            child: StText.medium('创建生物'),
          ),
          ElevatedButton(
            onPressed: () {
              CreatureStatusChangeFormPage().pushAsPage(context);
            },
            child: StText.medium('创建生物状态变化'),
          ),
          ElevatedButton(
            onPressed: () {
              MaintenanceRecordFormPage().pushAsPage(context);
            },
            child: StText.medium('创建维护记录'),
          ),
          ElevatedButton(
            onPressed: () {
              SchedulePlanFormPage().pushAsPage(context);
            },
            child: StText.medium('周期计划'),
          ),
        ],
      ),
    );
  }
}

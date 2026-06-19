// lib/pages/home/views/equipment_list_page.dart

import 'package:aquarium_diary/database/models/aquarium.dart';
import 'package:aquarium_diary/database/models/record.dart';
import 'package:aquarium_diary/style/text.dart';
import 'package:flutter/material.dart';

class EquipmentListPage extends StatelessWidget {
  final Aquarium? aquarium;
  final List<Record> equipment;

  const EquipmentListPage({Key? key, this.aquarium, this.equipment = const []})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: StText.big('${aquarium?.name ?? ''} - 设备列表')),
      body: Center(child: StText.big('设备列表 - 待完善')),
    );
  }
}

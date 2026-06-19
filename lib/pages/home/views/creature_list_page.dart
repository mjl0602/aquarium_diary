// lib/pages/home/views/creature_list_page.dart

import 'dart:io';

import 'package:aquarium_diary/database/_isar.dart';
import 'package:aquarium_diary/database/models/aquarium.dart';
import 'package:aquarium_diary/database/models/media.dart';
import 'package:aquarium_diary/database/models/record.dart';
import 'package:aquarium_diary/pages/camera/select_gallery.dart';
import 'package:aquarium_diary/pages/forms/creature_status_change_form_page.dart';
import 'package:aquarium_diary/style/color.dart';
import 'package:aquarium_diary/style/text.dart';
import 'package:flutter/material.dart';
import 'package:isar_community/isar.dart';
import 'package:oktoast/oktoast.dart';
import 'package:tapped/tapped.dart';

class CreatureListPage extends StatefulWidget {
  final Aquarium? aquarium;
  final List<Record> creatures;

  const CreatureListPage({Key? key, this.aquarium, this.creatures = const []})
    : super(key: key);

  @override
  State<CreatureListPage> createState() => _CreatureListPageState();
}

class _CreatureListPageState extends State<CreatureListPage> {
  List<Record> _creatures = [];
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    final aquariumId = widget.aquarium?.id;
    if (aquariumId == null) return;
    final list = await Record.getCreatures(aquariumId);
    setState(() {
      _creatures = list;
      _loading = false;
    });
  }

  /// 获取该生物的"身份ID"——用于关联记录和图片
  int _getIdentityId(Record record) {
    return record.sourceId ?? record.id;
  }

  Future<void> _showActions(Record record) async {
    final identityId = _getIdentityId(record);
    final action = await showModalBottomSheet<String>(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (ctx) => SafeArea(
        top: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Tapped(
              onTap: () => Navigator.pop(ctx, 'photo'),
              child: Container(
                width: double.infinity,
                color: StColor.white,
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: StText.normal('拍照'),
              ),
            ),
            Container(
              width: double.infinity,
              height: 1,
              color: StColor.lightGray,
            ),
            Tapped(
              onTap: () => Navigator.pop(ctx, 'status'),
              child: Container(
                width: double.infinity,
                color: StColor.white,
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: StText.normal('状态变化'),
              ),
            ),
            Container(
              width: double.infinity,
              height: 1,
              color: StColor.lightGray,
            ),
            Tapped(
              onTap: () => Navigator.pop(ctx, 'delete'),
              child: Container(
                width: double.infinity,
                color: StColor.white,
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: StText.normal(
                  '删除',
                  style: const TextStyle(color: StColor.coral),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              height: 10,
              color: StColor.lightGray,
            ),
            Tapped(
              onTap: () => Navigator.pop(ctx),
              child: Container(
                width: double.infinity,
                color: StColor.white,
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: StText.normal('取消'),
              ),
            ),
          ],
        ),
      ),
    );

    if (action == null) return;

    switch (action) {
      case 'photo':
        await _takePhoto(record, identityId);
        break;
      case 'status':
        await _addStatusChange(record, identityId);
        break;
      case 'delete':
        await _deleteCreature(record, identityId);
        break;
    }
  }

  Future<void> _takePhoto(Record record, int identityId) async {
    final file = await selectImg(context);
    if (file == null) return;

    try {
      final media = await Media.saveFromFile(
        file: file,
        refType: RefType.creature,
        refId: identityId,
        isPrimary: false,
      );
      await isar.writeTxn(() async {
        await isar.medias.put(media);
      });
      showToast('照片已保存');
    } catch (e) {
      showToast('拍照保存失败');
    }
  }

  Future<void> _addStatusChange(Record record, int identityId) async {
    final result = await CreatureStatusChangeFormPage.addCreatureStatusChange(
      context,
      aquariumId: widget.aquarium!.id,
      sourceId: identityId,
      creatureName: record.name.replaceFirst('新购生物: ', ''),
      statusChange: '',
      isBottomSheet: true,
    );
    if (result != null) {
      showToast('状态已记录');
      _load();
    }
  }

  Future<void> _deleteCreature(Record record, int identityId) async {
    final confirm = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('确认删除'),
        content: Text('确定要删除"${record.name}"及其所有关联记录和图片吗？'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: const Text('取消'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(ctx, true),
            child: const Text('删除', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
    if (confirm != true) return;

    try {
      // 删除所有关联记录（该 sourceId 的所有记录）
      final relatedRecords = await isar.records
          .filter()
          .sourceIdEqualTo(identityId)
          .findAll();
      await isar.writeTxn(() async {
        for (final r in relatedRecords) {
          await isar.records.delete(r.id);
        }
        await isar.records.delete(record.id);
      });

      // 删除关联的图片
      final relatedMedias = await isar.medias
          .filter()
          .refTypeEqualTo(RefType.creature)
          .refIdEqualTo(identityId)
          .findAll();
      for (final m in relatedMedias) {
        // 删除文件
        final file = File(m.filePath);
        if (file.existsSync()) file.deleteSync();
        if (m.thumbnailPath != null) {
          final thumb = File(m.thumbnailPath!);
          if (thumb.existsSync()) thumb.deleteSync();
        }
        await isar.writeTxn(() async {
          await isar.medias.delete(m.id);
        });
      }

      showToast('已删除');
      _load();
    } catch (e) {
      showToast('删除失败');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: StText.big('${widget.aquarium?.name ?? ''} - 生物列表'),
      ),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : _creatures.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.pets,
                    size: 64,
                    color: StColor.gray.withOpacity(0.4),
                  ),
                  const SizedBox(height: 12),
                  StText.small(
                    '暂无生物',
                    style: const TextStyle(color: StColor.gray),
                  ),
                ],
              ),
            )
          : ListView.separated(
              itemCount: _creatures.length,
              separatorBuilder: (_, __) =>
                  const Divider(height: 1, color: StColor.lightGray),
              padding: const EdgeInsets.only(top: 1),
              itemBuilder: (context, index) {
                final record = _creatures[index];
                return _buildItem(record);
              },
            ),
    );
  }

  Widget _buildItem(Record record) {
    return Tapped(
      onLongTap: () => _showActions(record),
      child: Container(
        color: StColor.white,
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 22),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.blue.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(Icons.pets, color: Colors.blue, size: 24),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  StText.small(
                    record.name,
                    style: const TextStyle(
                      color: StColor.darkGray,
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                  ),
                  if (record.description != null &&
                      record.description!.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.only(top: 2),
                      child: StText.small(
                        record.description!,
                        style: const TextStyle(fontSize: 12),
                      ),
                    ),
                  Padding(
                    padding: const EdgeInsets.only(top: 2),
                    child: StText.small(
                      _formatTime(record.recordTime),
                      style: const TextStyle(fontSize: 11),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _formatTime(DateTime dt) {
    return '${dt.month}/${dt.day} ${dt.hour}:${dt.minute.toString().padLeft(2, '0')}';
  }
}

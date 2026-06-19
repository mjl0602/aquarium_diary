// lib/tools/record_actions.dart

import 'package:aquarium_diary/database/models/record.dart';
import 'package:aquarium_diary/style/color.dart';
import 'package:aquarium_diary/style/text.dart';
import 'package:flutter/material.dart';
import 'package:tapped/tapped.dart';

/// 记录操作结果
enum RecordAction { edit, delete }

/// 记录操作BottomSheet
/// 功能：修改、删除
Future<RecordAction?> showRecordActions(
  BuildContext context, {
  required Record record,
}) {
  return showModalBottomSheet<RecordAction>(
    context: context,
    backgroundColor: Colors.transparent,
    builder: (ctx) => SafeArea(
      top: false,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // 修改
          Tapped(
            onTap: () => Navigator.pop(ctx, RecordAction.edit),
            child: Container(
              width: double.infinity,
              color: StColor.white,
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: StText.normal('修改'),
            ),
          ),
          Container(
            width: double.infinity,
            height: 1,
            color: StColor.lightGray,
          ),

          // 删除
          Tapped(
            onTap: () async {
              final confirm = await showDialog<bool>(
                context: ctx,
                builder: (dialogCtx) => AlertDialog(
                  title: const Text('确认删除'),
                  content: Text('确定要删除"${record.name}"吗？'),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(dialogCtx, false),
                      child: const Text('取消'),
                    ),
                    TextButton(
                      onPressed: () => Navigator.pop(dialogCtx, true),
                      child: const Text(
                        '删除',
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                  ],
                ),
              );
              if (confirm == true) {
                Navigator.pop(ctx, RecordAction.delete);
              }
            },
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

          // 取消
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
}

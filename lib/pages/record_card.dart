// lib/pages/record_card.dart

import 'package:aquarium_diary/database/enums.dart';
import 'package:aquarium_diary/database/models/record.dart';
import 'package:aquarium_diary/style/color.dart';
import 'package:aquarium_diary/style/text.dart';
import 'package:flutter/material.dart';

class RecordCard extends StatelessWidget {
  final int? aquariumId; // 可选的鱼缸ID，用于筛选记录
  final List<Record> records;
  final bool isLoading;
  final Function(Record) onRecordTapped;
  final Function(Record) onRecordLongPressed;

  const RecordCard({
    Key? key,
    this.aquariumId,
    required this.records,
    required this.isLoading,
    required this.onRecordTapped,
    required this.onRecordLongPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const Center(child: CircularProgressIndicator())
        : records.isEmpty
        ? Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.note_add,
                  size: 68,
                  color: StColor.gray.withOpacity(0.5),
                ),
                const SizedBox(height: 12),
                StText.small('暂无记录', style: TextStyle(color: StColor.gray)),
                const SizedBox(height: 4),
                StText.small(
                  '点击添加记录开始记录鱼缸操作',
                  style: TextStyle(color: StColor.gray.withOpacity(0.7)),
                ),
              ],
            ),
          )
        : ListView.separated(
            padding: const EdgeInsets.all(16),
            itemCount: records.length,
            separatorBuilder: (context, index) => const SizedBox(height: 8),
            itemBuilder: (context, index) {
              final record = records[index];
              return _buildRecordItem(record);
            },
          );
  }

  Widget _buildRecordItem(Record record) {
    return GestureDetector(
      onTap: () => onRecordTapped(record),
      onLongPress: () => onRecordLongPressed(record),
      child: Container(
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
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 标题行
            Row(
              children: [
                // 记录类型标签
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: _getRecordTypeColor(record.recordType),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: StText.small(
                    record.recordType.label,
                    style: const TextStyle(color: StColor.white),
                  ),
                ),
                const SizedBox(width: 8),
                // 操作类型标签
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: _getOperationTypeColor(record.operationType),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: StText.small(
                    record.operationType.label,
                    style: const TextStyle(color: StColor.white),
                  ),
                ),
                const Spacer(),
                // 时间
                StText.small(
                  _formatTime(record.recordTime),
                  style: TextStyle(color: StColor.gray),
                ),
              ],
            ),
            const SizedBox(height: 12),
            // 记录名称
            StText.medium(
              record.name,
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
            // 描述（如果有）
            if (record.description != null && record.description!.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: StText.small(
                  record.description!,
                  style: TextStyle(color: StColor.gray),
                ),
              ),
            // 数值（如果有）
            if (record.valueType != null && record.numericValue != null)
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Row(
                  children: [
                    StText.small('数值: ', style: TextStyle(color: StColor.gray)),
                    StText.small(
                      '${record.numericValue} ${record.valueType}',
                      style: TextStyle(
                        color: StColor.primary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            // 鱼缸ID（如果有）
            if (record.aquariumId != null)
              Padding(
                padding: const EdgeInsets.only(top: 4),
                child: StText.small(
                  '鱼缸ID: ${record.aquariumId}',
                  style: TextStyle(color: StColor.gray.withOpacity(0.7)),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Color _getRecordTypeColor(RecordType type) {
    switch (type) {
      case RecordType.aquarium:
        return Colors.blue;
      case RecordType.creature:
        return Colors.green;
      case RecordType.equipment:
        return Colors.orange;
      case RecordType.maintenance:
        return Colors.purple;
    }
  }

  Color _getOperationTypeColor(OperationType type) {
    switch (type) {
      case OperationType.create:
        return Colors.teal;
      case OperationType.sell:
        return Colors.red;
      case OperationType.statusChange:
        return Colors.amber;
    }
  }

  String _formatTime(DateTime time) {
    final now = DateTime.now();
    final difference = now.difference(time);

    if (difference.inDays > 365) {
      return '${difference.inDays ~/ 365}年前';
    } else if (difference.inDays > 30) {
      return '${difference.inDays ~/ 30}个月前';
    } else if (difference.inDays > 0) {
      return '${difference.inDays}天前';
    } else if (difference.inHours > 0) {
      return '${difference.inHours}小时前';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes}分钟前';
    } else {
      return '刚刚';
    }
  }
}

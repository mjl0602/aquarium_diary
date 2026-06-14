// lib/pages/home/views/record_card_view.dart

import 'package:aquarium_diary/database/enums.dart';
import 'package:aquarium_diary/database/models/record.dart';
import 'package:aquarium_diary/style/color.dart';
import 'package:aquarium_diary/style/text.dart';
import 'package:flutter/material.dart';

class RecordCard extends StatelessWidget {
  final List<Record> records;
  final bool isLoading;
  final Function(Record) onRecordTapped;
  final Function(Record) onRecordLongPressed;

  const RecordCard({
    Key? key,
    required this.records,
    required this.isLoading,
    required this.onRecordTapped,
    required this.onRecordLongPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (records.isEmpty) {
      return Center(
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
      );
    }

    // 按日期分组
    final grouped = <String, List<Record>>{};
    for (final r in records) {
      final key = _dateKey(r.recordTime);
      grouped.putIfAbsent(key, () => []).add(r);
    }

    final dates = grouped.keys.toList();

    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      itemCount: dates.length,
      itemBuilder: (context, di) {
        final date = dates[di];
        final dayRecords = grouped[date]!;
        return _buildDateGroup(date, dayRecords);
      },
    );
  }

  Widget _buildDateGroup(String dateLabel, List<Record> items) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 日期标题
          Padding(
            padding: const EdgeInsets.only(left: 4, bottom: 8),
            child: StText.small(
              dateLabel,
              style: TextStyle(
                color: StColor.gray,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          // 时间线列表
          ...List.generate(items.length, (i) {
            final record = items[i];
            final isFirst = i == 0;
            final isLast = i == items.length - 1;
            return _buildTimelineItem(record, isFirst, isLast);
          }),
        ],
      ),
    );
  }

  Widget _buildTimelineItem(Record record, bool isFirst, bool isLast) {
    final typeColor = _getRecordTypeColor(record.recordType);
    final opColor = _getOperationTypeColor(record.operationType);

    return GestureDetector(
      onTap: () => onRecordTapped(record),
      onLongPress: () => onRecordLongPressed(record),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 时间线：竖线 + 圆点
            SizedBox(
              width: 24,
              child: Column(
                children: [
                  // 顶部竖线
                  if (!isFirst)
                    Expanded(child: Container(width: 2, color: StColor.white))
                  else
                    const Expanded(child: SizedBox.shrink()),
                  // 圆点
                  Container(
                    width: 10,
                    height: 10,
                    decoration: BoxDecoration(
                      color: typeColor,
                      shape: BoxShape.circle,
                      border: Border.all(color: StColor.white, width: 2),
                    ),
                  ),
                  // 底部竖线
                  if (!isLast)
                    Expanded(child: Container(width: 2, color: StColor.white))
                  else
                    const Expanded(child: SizedBox.shrink()),
                ],
              ),
            ),
            const SizedBox(width: 8),
            // 内容区
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(bottom: 4),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: StColor.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.04),
                      blurRadius: 6,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // 第一行：操作标签 + 时间
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 6,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            color: opColor.withOpacity(0.15),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: StText.small(
                            record.operationType.label,
                            style: TextStyle(
                              color: opColor,
                              fontSize: 10,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        const SizedBox(width: 6),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 6,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            color: typeColor.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: StText.small(
                            record.recordType.label,
                            style: TextStyle(color: typeColor, fontSize: 10),
                          ),
                        ),
                        const Spacer(),
                        StText.small(
                          _formatShortTime(record.recordTime),
                          style: TextStyle(
                            color: StColor.halfGray,
                            fontSize: 10,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 6),
                    // 记录名称
                    StText.medium(
                      record.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                      ),
                    ),
                    // 描述
                    if (record.description != null &&
                        record.description!.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.only(top: 4),
                        child: StText.small(
                          record.description!,
                          style: TextStyle(color: StColor.gray, fontSize: 12),
                        ),
                      ),
                    // 数值
                    if (record.valueType != null && record.numericValue != null)
                      Padding(
                        padding: const EdgeInsets.only(top: 4),
                        child: StText.small(
                          '${record.numericValue} ${record.valueType}',
                          style: TextStyle(
                            color: StColor.primary,
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _dateKey(DateTime dt) {
    return '${dt.year}-${dt.month.toString().padLeft(2, '0')}-${dt.day.toString().padLeft(2, '0')}';
  }

  String _formatShortTime(DateTime time) {
    final now = DateTime.now();
    final diff = now.difference(time);

    if (diff.inMinutes < 60) {
      return '${diff.inMinutes}分钟前';
    } else if (diff.inHours < 24) {
      return '${diff.inHours}小时前';
    } else {
      return '${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}';
    }
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
}

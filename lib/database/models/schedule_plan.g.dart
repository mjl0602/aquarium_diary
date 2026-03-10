// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schedule_plan.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetSchedulePlanCollection on Isar {
  IsarCollection<SchedulePlan> get schedulePlans => this.collection();
}

const SchedulePlanSchema = CollectionSchema(
  name: r'SchedulePlan',
  id: 2805965557140317385,
  properties: {
    r'advanceReminderMinutes': PropertySchema(
      id: 0,
      name: r'advanceReminderMinutes',
      type: IsarType.long,
    ),
    r'aquariumId': PropertySchema(
      id: 1,
      name: r'aquariumId',
      type: IsarType.long,
    ),
    r'consumableId': PropertySchema(
      id: 2,
      name: r'consumableId',
      type: IsarType.long,
    ),
    r'createdAt': PropertySchema(
      id: 3,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'cycleDays': PropertySchema(
      id: 4,
      name: r'cycleDays',
      type: IsarType.long,
    ),
    r'cycleType': PropertySchema(
      id: 5,
      name: r'cycleType',
      type: IsarType.byte,
      enumMap: _SchedulePlancycleTypeEnumValueMap,
    ),
    r'estimatedDurationMinutes': PropertySchema(
      id: 6,
      name: r'estimatedDurationMinutes',
      type: IsarType.long,
    ),
    r'isEnabled': PropertySchema(
      id: 7,
      name: r'isEnabled',
      type: IsarType.bool,
    ),
    r'lastExecuteDate': PropertySchema(
      id: 8,
      name: r'lastExecuteDate',
      type: IsarType.dateTime,
    ),
    r'lastMaintenanceId': PropertySchema(
      id: 9,
      name: r'lastMaintenanceId',
      type: IsarType.long,
    ),
    r'name': PropertySchema(id: 10, name: r'name', type: IsarType.string),
    r'nextExecuteDate': PropertySchema(
      id: 11,
      name: r'nextExecuteDate',
      type: IsarType.dateTime,
    ),
    r'notes': PropertySchema(id: 12, name: r'notes', type: IsarType.string),
    r'operation': PropertySchema(
      id: 13,
      name: r'operation',
      type: IsarType.byte,
      enumMap: _SchedulePlanoperationEnumValueMap,
    ),
    r'reminderTime': PropertySchema(
      id: 14,
      name: r'reminderTime',
      type: IsarType.string,
    ),
  },

  estimateSize: _schedulePlanEstimateSize,
  serialize: _schedulePlanSerialize,
  deserialize: _schedulePlanDeserialize,
  deserializeProp: _schedulePlanDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},

  getId: _schedulePlanGetId,
  getLinks: _schedulePlanGetLinks,
  attach: _schedulePlanAttach,
  version: '3.3.0',
);

int _schedulePlanEstimateSize(
  SchedulePlan object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.name.length * 3;
  {
    final value = object.notes;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.reminderTime;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _schedulePlanSerialize(
  SchedulePlan object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.advanceReminderMinutes);
  writer.writeLong(offsets[1], object.aquariumId);
  writer.writeLong(offsets[2], object.consumableId);
  writer.writeDateTime(offsets[3], object.createdAt);
  writer.writeLong(offsets[4], object.cycleDays);
  writer.writeByte(offsets[5], object.cycleType.index);
  writer.writeLong(offsets[6], object.estimatedDurationMinutes);
  writer.writeBool(offsets[7], object.isEnabled);
  writer.writeDateTime(offsets[8], object.lastExecuteDate);
  writer.writeLong(offsets[9], object.lastMaintenanceId);
  writer.writeString(offsets[10], object.name);
  writer.writeDateTime(offsets[11], object.nextExecuteDate);
  writer.writeString(offsets[12], object.notes);
  writer.writeByte(offsets[13], object.operation.index);
  writer.writeString(offsets[14], object.reminderTime);
}

SchedulePlan _schedulePlanDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = SchedulePlan(
    advanceReminderMinutes: reader.readLongOrNull(offsets[0]) ?? 0,
    aquariumId: reader.readLongOrNull(offsets[1]),
    consumableId: reader.readLongOrNull(offsets[2]),
    createdAt: reader.readDateTime(offsets[3]),
    cycleDays: reader.readLongOrNull(offsets[4]),
    cycleType:
        _SchedulePlancycleTypeValueEnumMap[reader.readByteOrNull(offsets[5])] ??
        CycleType.daily,
    estimatedDurationMinutes: reader.readLongOrNull(offsets[6]),
    isEnabled: reader.readBoolOrNull(offsets[7]) ?? true,
    lastExecuteDate: reader.readDateTimeOrNull(offsets[8]),
    lastMaintenanceId: reader.readLongOrNull(offsets[9]),
    name: reader.readString(offsets[10]),
    nextExecuteDate: reader.readDateTimeOrNull(offsets[11]),
    notes: reader.readStringOrNull(offsets[12]),
    operation:
        _SchedulePlanoperationValueEnumMap[reader.readByteOrNull(
          offsets[13],
        )] ??
        ScheduleOperation.waterChange,
    reminderTime: reader.readStringOrNull(offsets[14]),
  );
  object.id = id;
  return object;
}

P _schedulePlanDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLongOrNull(offset) ?? 0) as P;
    case 1:
      return (reader.readLongOrNull(offset)) as P;
    case 2:
      return (reader.readLongOrNull(offset)) as P;
    case 3:
      return (reader.readDateTime(offset)) as P;
    case 4:
      return (reader.readLongOrNull(offset)) as P;
    case 5:
      return (_SchedulePlancycleTypeValueEnumMap[reader.readByteOrNull(
                offset,
              )] ??
              CycleType.daily)
          as P;
    case 6:
      return (reader.readLongOrNull(offset)) as P;
    case 7:
      return (reader.readBoolOrNull(offset) ?? true) as P;
    case 8:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 9:
      return (reader.readLongOrNull(offset)) as P;
    case 10:
      return (reader.readString(offset)) as P;
    case 11:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 12:
      return (reader.readStringOrNull(offset)) as P;
    case 13:
      return (_SchedulePlanoperationValueEnumMap[reader.readByteOrNull(
                offset,
              )] ??
              ScheduleOperation.waterChange)
          as P;
    case 14:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _SchedulePlancycleTypeEnumValueMap = {
  'daily': 0,
  'weekly': 1,
  'monthly': 2,
  'yearly': 3,
  'custom': 4,
};
const _SchedulePlancycleTypeValueEnumMap = {
  0: CycleType.daily,
  1: CycleType.weekly,
  2: CycleType.monthly,
  3: CycleType.yearly,
  4: CycleType.custom,
};
const _SchedulePlanoperationEnumValueMap = {
  'waterChange': 0,
  'waterTest': 1,
  'feeding': 2,
  'algaeClean': 3,
  'cottonChange': 4,
  'consumableChange': 5,
  'equipmentCheck': 6,
  'other': 7,
};
const _SchedulePlanoperationValueEnumMap = {
  0: ScheduleOperation.waterChange,
  1: ScheduleOperation.waterTest,
  2: ScheduleOperation.feeding,
  3: ScheduleOperation.algaeClean,
  4: ScheduleOperation.cottonChange,
  5: ScheduleOperation.consumableChange,
  6: ScheduleOperation.equipmentCheck,
  7: ScheduleOperation.other,
};

Id _schedulePlanGetId(SchedulePlan object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _schedulePlanGetLinks(SchedulePlan object) {
  return [];
}

void _schedulePlanAttach(
  IsarCollection<dynamic> col,
  Id id,
  SchedulePlan object,
) {
  object.id = id;
}

extension SchedulePlanQueryWhereSort
    on QueryBuilder<SchedulePlan, SchedulePlan, QWhere> {
  QueryBuilder<SchedulePlan, SchedulePlan, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension SchedulePlanQueryWhere
    on QueryBuilder<SchedulePlan, SchedulePlan, QWhereClause> {
  QueryBuilder<SchedulePlan, SchedulePlan, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(lower: id, upper: id));
    });
  }

  QueryBuilder<SchedulePlan, SchedulePlan, QAfterWhereClause> idNotEqualTo(
    Id id,
  ) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<SchedulePlan, SchedulePlan, QAfterWhereClause> idGreaterThan(
    Id id, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<SchedulePlan, SchedulePlan, QAfterWhereClause> idLessThan(
    Id id, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<SchedulePlan, SchedulePlan, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.between(
          lower: lowerId,
          includeLower: includeLower,
          upper: upperId,
          includeUpper: includeUpper,
        ),
      );
    });
  }
}

extension SchedulePlanQueryFilter
    on QueryBuilder<SchedulePlan, SchedulePlan, QFilterCondition> {
  QueryBuilder<SchedulePlan, SchedulePlan, QAfterFilterCondition>
  advanceReminderMinutesEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'advanceReminderMinutes',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<SchedulePlan, SchedulePlan, QAfterFilterCondition>
  advanceReminderMinutesGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'advanceReminderMinutes',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<SchedulePlan, SchedulePlan, QAfterFilterCondition>
  advanceReminderMinutesLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'advanceReminderMinutes',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<SchedulePlan, SchedulePlan, QAfterFilterCondition>
  advanceReminderMinutesBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'advanceReminderMinutes',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<SchedulePlan, SchedulePlan, QAfterFilterCondition>
  aquariumIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'aquariumId'),
      );
    });
  }

  QueryBuilder<SchedulePlan, SchedulePlan, QAfterFilterCondition>
  aquariumIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'aquariumId'),
      );
    });
  }

  QueryBuilder<SchedulePlan, SchedulePlan, QAfterFilterCondition>
  aquariumIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'aquariumId', value: value),
      );
    });
  }

  QueryBuilder<SchedulePlan, SchedulePlan, QAfterFilterCondition>
  aquariumIdGreaterThan(int? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'aquariumId',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<SchedulePlan, SchedulePlan, QAfterFilterCondition>
  aquariumIdLessThan(int? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'aquariumId',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<SchedulePlan, SchedulePlan, QAfterFilterCondition>
  aquariumIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'aquariumId',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<SchedulePlan, SchedulePlan, QAfterFilterCondition>
  consumableIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'consumableId'),
      );
    });
  }

  QueryBuilder<SchedulePlan, SchedulePlan, QAfterFilterCondition>
  consumableIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'consumableId'),
      );
    });
  }

  QueryBuilder<SchedulePlan, SchedulePlan, QAfterFilterCondition>
  consumableIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'consumableId', value: value),
      );
    });
  }

  QueryBuilder<SchedulePlan, SchedulePlan, QAfterFilterCondition>
  consumableIdGreaterThan(int? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'consumableId',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<SchedulePlan, SchedulePlan, QAfterFilterCondition>
  consumableIdLessThan(int? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'consumableId',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<SchedulePlan, SchedulePlan, QAfterFilterCondition>
  consumableIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'consumableId',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<SchedulePlan, SchedulePlan, QAfterFilterCondition>
  createdAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'createdAt', value: value),
      );
    });
  }

  QueryBuilder<SchedulePlan, SchedulePlan, QAfterFilterCondition>
  createdAtGreaterThan(DateTime value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'createdAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<SchedulePlan, SchedulePlan, QAfterFilterCondition>
  createdAtLessThan(DateTime value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'createdAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<SchedulePlan, SchedulePlan, QAfterFilterCondition>
  createdAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'createdAt',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<SchedulePlan, SchedulePlan, QAfterFilterCondition>
  cycleDaysIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'cycleDays'),
      );
    });
  }

  QueryBuilder<SchedulePlan, SchedulePlan, QAfterFilterCondition>
  cycleDaysIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'cycleDays'),
      );
    });
  }

  QueryBuilder<SchedulePlan, SchedulePlan, QAfterFilterCondition>
  cycleDaysEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'cycleDays', value: value),
      );
    });
  }

  QueryBuilder<SchedulePlan, SchedulePlan, QAfterFilterCondition>
  cycleDaysGreaterThan(int? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'cycleDays',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<SchedulePlan, SchedulePlan, QAfterFilterCondition>
  cycleDaysLessThan(int? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'cycleDays',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<SchedulePlan, SchedulePlan, QAfterFilterCondition>
  cycleDaysBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'cycleDays',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<SchedulePlan, SchedulePlan, QAfterFilterCondition>
  cycleTypeEqualTo(CycleType value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'cycleType', value: value),
      );
    });
  }

  QueryBuilder<SchedulePlan, SchedulePlan, QAfterFilterCondition>
  cycleTypeGreaterThan(CycleType value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'cycleType',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<SchedulePlan, SchedulePlan, QAfterFilterCondition>
  cycleTypeLessThan(CycleType value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'cycleType',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<SchedulePlan, SchedulePlan, QAfterFilterCondition>
  cycleTypeBetween(
    CycleType lower,
    CycleType upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'cycleType',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<SchedulePlan, SchedulePlan, QAfterFilterCondition>
  estimatedDurationMinutesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'estimatedDurationMinutes'),
      );
    });
  }

  QueryBuilder<SchedulePlan, SchedulePlan, QAfterFilterCondition>
  estimatedDurationMinutesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'estimatedDurationMinutes'),
      );
    });
  }

  QueryBuilder<SchedulePlan, SchedulePlan, QAfterFilterCondition>
  estimatedDurationMinutesEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'estimatedDurationMinutes',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<SchedulePlan, SchedulePlan, QAfterFilterCondition>
  estimatedDurationMinutesGreaterThan(int? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'estimatedDurationMinutes',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<SchedulePlan, SchedulePlan, QAfterFilterCondition>
  estimatedDurationMinutesLessThan(int? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'estimatedDurationMinutes',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<SchedulePlan, SchedulePlan, QAfterFilterCondition>
  estimatedDurationMinutesBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'estimatedDurationMinutes',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<SchedulePlan, SchedulePlan, QAfterFilterCondition> idEqualTo(
    Id value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'id', value: value),
      );
    });
  }

  QueryBuilder<SchedulePlan, SchedulePlan, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'id',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<SchedulePlan, SchedulePlan, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'id',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<SchedulePlan, SchedulePlan, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'id',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<SchedulePlan, SchedulePlan, QAfterFilterCondition>
  isEnabledEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'isEnabled', value: value),
      );
    });
  }

  QueryBuilder<SchedulePlan, SchedulePlan, QAfterFilterCondition>
  lastExecuteDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'lastExecuteDate'),
      );
    });
  }

  QueryBuilder<SchedulePlan, SchedulePlan, QAfterFilterCondition>
  lastExecuteDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'lastExecuteDate'),
      );
    });
  }

  QueryBuilder<SchedulePlan, SchedulePlan, QAfterFilterCondition>
  lastExecuteDateEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'lastExecuteDate', value: value),
      );
    });
  }

  QueryBuilder<SchedulePlan, SchedulePlan, QAfterFilterCondition>
  lastExecuteDateGreaterThan(DateTime? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'lastExecuteDate',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<SchedulePlan, SchedulePlan, QAfterFilterCondition>
  lastExecuteDateLessThan(DateTime? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'lastExecuteDate',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<SchedulePlan, SchedulePlan, QAfterFilterCondition>
  lastExecuteDateBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'lastExecuteDate',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<SchedulePlan, SchedulePlan, QAfterFilterCondition>
  lastMaintenanceIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'lastMaintenanceId'),
      );
    });
  }

  QueryBuilder<SchedulePlan, SchedulePlan, QAfterFilterCondition>
  lastMaintenanceIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'lastMaintenanceId'),
      );
    });
  }

  QueryBuilder<SchedulePlan, SchedulePlan, QAfterFilterCondition>
  lastMaintenanceIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'lastMaintenanceId', value: value),
      );
    });
  }

  QueryBuilder<SchedulePlan, SchedulePlan, QAfterFilterCondition>
  lastMaintenanceIdGreaterThan(int? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'lastMaintenanceId',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<SchedulePlan, SchedulePlan, QAfterFilterCondition>
  lastMaintenanceIdLessThan(int? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'lastMaintenanceId',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<SchedulePlan, SchedulePlan, QAfterFilterCondition>
  lastMaintenanceIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'lastMaintenanceId',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<SchedulePlan, SchedulePlan, QAfterFilterCondition> nameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'name',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SchedulePlan, SchedulePlan, QAfterFilterCondition>
  nameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'name',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SchedulePlan, SchedulePlan, QAfterFilterCondition> nameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'name',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SchedulePlan, SchedulePlan, QAfterFilterCondition> nameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'name',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SchedulePlan, SchedulePlan, QAfterFilterCondition>
  nameStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'name',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SchedulePlan, SchedulePlan, QAfterFilterCondition> nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'name',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SchedulePlan, SchedulePlan, QAfterFilterCondition> nameContains(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'name',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SchedulePlan, SchedulePlan, QAfterFilterCondition> nameMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'name',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SchedulePlan, SchedulePlan, QAfterFilterCondition>
  nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'name', value: ''),
      );
    });
  }

  QueryBuilder<SchedulePlan, SchedulePlan, QAfterFilterCondition>
  nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'name', value: ''),
      );
    });
  }

  QueryBuilder<SchedulePlan, SchedulePlan, QAfterFilterCondition>
  nextExecuteDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'nextExecuteDate'),
      );
    });
  }

  QueryBuilder<SchedulePlan, SchedulePlan, QAfterFilterCondition>
  nextExecuteDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'nextExecuteDate'),
      );
    });
  }

  QueryBuilder<SchedulePlan, SchedulePlan, QAfterFilterCondition>
  nextExecuteDateEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'nextExecuteDate', value: value),
      );
    });
  }

  QueryBuilder<SchedulePlan, SchedulePlan, QAfterFilterCondition>
  nextExecuteDateGreaterThan(DateTime? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'nextExecuteDate',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<SchedulePlan, SchedulePlan, QAfterFilterCondition>
  nextExecuteDateLessThan(DateTime? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'nextExecuteDate',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<SchedulePlan, SchedulePlan, QAfterFilterCondition>
  nextExecuteDateBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'nextExecuteDate',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<SchedulePlan, SchedulePlan, QAfterFilterCondition>
  notesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'notes'),
      );
    });
  }

  QueryBuilder<SchedulePlan, SchedulePlan, QAfterFilterCondition>
  notesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'notes'),
      );
    });
  }

  QueryBuilder<SchedulePlan, SchedulePlan, QAfterFilterCondition> notesEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'notes',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SchedulePlan, SchedulePlan, QAfterFilterCondition>
  notesGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'notes',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SchedulePlan, SchedulePlan, QAfterFilterCondition> notesLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'notes',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SchedulePlan, SchedulePlan, QAfterFilterCondition> notesBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'notes',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SchedulePlan, SchedulePlan, QAfterFilterCondition>
  notesStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'notes',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SchedulePlan, SchedulePlan, QAfterFilterCondition> notesEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'notes',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SchedulePlan, SchedulePlan, QAfterFilterCondition> notesContains(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'notes',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SchedulePlan, SchedulePlan, QAfterFilterCondition> notesMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'notes',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SchedulePlan, SchedulePlan, QAfterFilterCondition>
  notesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'notes', value: ''),
      );
    });
  }

  QueryBuilder<SchedulePlan, SchedulePlan, QAfterFilterCondition>
  notesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'notes', value: ''),
      );
    });
  }

  QueryBuilder<SchedulePlan, SchedulePlan, QAfterFilterCondition>
  operationEqualTo(ScheduleOperation value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'operation', value: value),
      );
    });
  }

  QueryBuilder<SchedulePlan, SchedulePlan, QAfterFilterCondition>
  operationGreaterThan(ScheduleOperation value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'operation',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<SchedulePlan, SchedulePlan, QAfterFilterCondition>
  operationLessThan(ScheduleOperation value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'operation',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<SchedulePlan, SchedulePlan, QAfterFilterCondition>
  operationBetween(
    ScheduleOperation lower,
    ScheduleOperation upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'operation',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<SchedulePlan, SchedulePlan, QAfterFilterCondition>
  reminderTimeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'reminderTime'),
      );
    });
  }

  QueryBuilder<SchedulePlan, SchedulePlan, QAfterFilterCondition>
  reminderTimeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'reminderTime'),
      );
    });
  }

  QueryBuilder<SchedulePlan, SchedulePlan, QAfterFilterCondition>
  reminderTimeEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'reminderTime',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SchedulePlan, SchedulePlan, QAfterFilterCondition>
  reminderTimeGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'reminderTime',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SchedulePlan, SchedulePlan, QAfterFilterCondition>
  reminderTimeLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'reminderTime',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SchedulePlan, SchedulePlan, QAfterFilterCondition>
  reminderTimeBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'reminderTime',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SchedulePlan, SchedulePlan, QAfterFilterCondition>
  reminderTimeStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'reminderTime',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SchedulePlan, SchedulePlan, QAfterFilterCondition>
  reminderTimeEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'reminderTime',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SchedulePlan, SchedulePlan, QAfterFilterCondition>
  reminderTimeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'reminderTime',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SchedulePlan, SchedulePlan, QAfterFilterCondition>
  reminderTimeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'reminderTime',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SchedulePlan, SchedulePlan, QAfterFilterCondition>
  reminderTimeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'reminderTime', value: ''),
      );
    });
  }

  QueryBuilder<SchedulePlan, SchedulePlan, QAfterFilterCondition>
  reminderTimeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'reminderTime', value: ''),
      );
    });
  }
}

extension SchedulePlanQueryObject
    on QueryBuilder<SchedulePlan, SchedulePlan, QFilterCondition> {}

extension SchedulePlanQueryLinks
    on QueryBuilder<SchedulePlan, SchedulePlan, QFilterCondition> {}

extension SchedulePlanQuerySortBy
    on QueryBuilder<SchedulePlan, SchedulePlan, QSortBy> {
  QueryBuilder<SchedulePlan, SchedulePlan, QAfterSortBy>
  sortByAdvanceReminderMinutes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'advanceReminderMinutes', Sort.asc);
    });
  }

  QueryBuilder<SchedulePlan, SchedulePlan, QAfterSortBy>
  sortByAdvanceReminderMinutesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'advanceReminderMinutes', Sort.desc);
    });
  }

  QueryBuilder<SchedulePlan, SchedulePlan, QAfterSortBy> sortByAquariumId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'aquariumId', Sort.asc);
    });
  }

  QueryBuilder<SchedulePlan, SchedulePlan, QAfterSortBy>
  sortByAquariumIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'aquariumId', Sort.desc);
    });
  }

  QueryBuilder<SchedulePlan, SchedulePlan, QAfterSortBy> sortByConsumableId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'consumableId', Sort.asc);
    });
  }

  QueryBuilder<SchedulePlan, SchedulePlan, QAfterSortBy>
  sortByConsumableIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'consumableId', Sort.desc);
    });
  }

  QueryBuilder<SchedulePlan, SchedulePlan, QAfterSortBy> sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<SchedulePlan, SchedulePlan, QAfterSortBy> sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<SchedulePlan, SchedulePlan, QAfterSortBy> sortByCycleDays() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cycleDays', Sort.asc);
    });
  }

  QueryBuilder<SchedulePlan, SchedulePlan, QAfterSortBy> sortByCycleDaysDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cycleDays', Sort.desc);
    });
  }

  QueryBuilder<SchedulePlan, SchedulePlan, QAfterSortBy> sortByCycleType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cycleType', Sort.asc);
    });
  }

  QueryBuilder<SchedulePlan, SchedulePlan, QAfterSortBy> sortByCycleTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cycleType', Sort.desc);
    });
  }

  QueryBuilder<SchedulePlan, SchedulePlan, QAfterSortBy>
  sortByEstimatedDurationMinutes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estimatedDurationMinutes', Sort.asc);
    });
  }

  QueryBuilder<SchedulePlan, SchedulePlan, QAfterSortBy>
  sortByEstimatedDurationMinutesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estimatedDurationMinutes', Sort.desc);
    });
  }

  QueryBuilder<SchedulePlan, SchedulePlan, QAfterSortBy> sortByIsEnabled() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isEnabled', Sort.asc);
    });
  }

  QueryBuilder<SchedulePlan, SchedulePlan, QAfterSortBy> sortByIsEnabledDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isEnabled', Sort.desc);
    });
  }

  QueryBuilder<SchedulePlan, SchedulePlan, QAfterSortBy>
  sortByLastExecuteDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastExecuteDate', Sort.asc);
    });
  }

  QueryBuilder<SchedulePlan, SchedulePlan, QAfterSortBy>
  sortByLastExecuteDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastExecuteDate', Sort.desc);
    });
  }

  QueryBuilder<SchedulePlan, SchedulePlan, QAfterSortBy>
  sortByLastMaintenanceId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastMaintenanceId', Sort.asc);
    });
  }

  QueryBuilder<SchedulePlan, SchedulePlan, QAfterSortBy>
  sortByLastMaintenanceIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastMaintenanceId', Sort.desc);
    });
  }

  QueryBuilder<SchedulePlan, SchedulePlan, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<SchedulePlan, SchedulePlan, QAfterSortBy> sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<SchedulePlan, SchedulePlan, QAfterSortBy>
  sortByNextExecuteDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nextExecuteDate', Sort.asc);
    });
  }

  QueryBuilder<SchedulePlan, SchedulePlan, QAfterSortBy>
  sortByNextExecuteDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nextExecuteDate', Sort.desc);
    });
  }

  QueryBuilder<SchedulePlan, SchedulePlan, QAfterSortBy> sortByNotes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.asc);
    });
  }

  QueryBuilder<SchedulePlan, SchedulePlan, QAfterSortBy> sortByNotesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.desc);
    });
  }

  QueryBuilder<SchedulePlan, SchedulePlan, QAfterSortBy> sortByOperation() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'operation', Sort.asc);
    });
  }

  QueryBuilder<SchedulePlan, SchedulePlan, QAfterSortBy> sortByOperationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'operation', Sort.desc);
    });
  }

  QueryBuilder<SchedulePlan, SchedulePlan, QAfterSortBy> sortByReminderTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reminderTime', Sort.asc);
    });
  }

  QueryBuilder<SchedulePlan, SchedulePlan, QAfterSortBy>
  sortByReminderTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reminderTime', Sort.desc);
    });
  }
}

extension SchedulePlanQuerySortThenBy
    on QueryBuilder<SchedulePlan, SchedulePlan, QSortThenBy> {
  QueryBuilder<SchedulePlan, SchedulePlan, QAfterSortBy>
  thenByAdvanceReminderMinutes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'advanceReminderMinutes', Sort.asc);
    });
  }

  QueryBuilder<SchedulePlan, SchedulePlan, QAfterSortBy>
  thenByAdvanceReminderMinutesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'advanceReminderMinutes', Sort.desc);
    });
  }

  QueryBuilder<SchedulePlan, SchedulePlan, QAfterSortBy> thenByAquariumId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'aquariumId', Sort.asc);
    });
  }

  QueryBuilder<SchedulePlan, SchedulePlan, QAfterSortBy>
  thenByAquariumIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'aquariumId', Sort.desc);
    });
  }

  QueryBuilder<SchedulePlan, SchedulePlan, QAfterSortBy> thenByConsumableId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'consumableId', Sort.asc);
    });
  }

  QueryBuilder<SchedulePlan, SchedulePlan, QAfterSortBy>
  thenByConsumableIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'consumableId', Sort.desc);
    });
  }

  QueryBuilder<SchedulePlan, SchedulePlan, QAfterSortBy> thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<SchedulePlan, SchedulePlan, QAfterSortBy> thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<SchedulePlan, SchedulePlan, QAfterSortBy> thenByCycleDays() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cycleDays', Sort.asc);
    });
  }

  QueryBuilder<SchedulePlan, SchedulePlan, QAfterSortBy> thenByCycleDaysDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cycleDays', Sort.desc);
    });
  }

  QueryBuilder<SchedulePlan, SchedulePlan, QAfterSortBy> thenByCycleType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cycleType', Sort.asc);
    });
  }

  QueryBuilder<SchedulePlan, SchedulePlan, QAfterSortBy> thenByCycleTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cycleType', Sort.desc);
    });
  }

  QueryBuilder<SchedulePlan, SchedulePlan, QAfterSortBy>
  thenByEstimatedDurationMinutes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estimatedDurationMinutes', Sort.asc);
    });
  }

  QueryBuilder<SchedulePlan, SchedulePlan, QAfterSortBy>
  thenByEstimatedDurationMinutesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estimatedDurationMinutes', Sort.desc);
    });
  }

  QueryBuilder<SchedulePlan, SchedulePlan, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<SchedulePlan, SchedulePlan, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<SchedulePlan, SchedulePlan, QAfterSortBy> thenByIsEnabled() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isEnabled', Sort.asc);
    });
  }

  QueryBuilder<SchedulePlan, SchedulePlan, QAfterSortBy> thenByIsEnabledDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isEnabled', Sort.desc);
    });
  }

  QueryBuilder<SchedulePlan, SchedulePlan, QAfterSortBy>
  thenByLastExecuteDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastExecuteDate', Sort.asc);
    });
  }

  QueryBuilder<SchedulePlan, SchedulePlan, QAfterSortBy>
  thenByLastExecuteDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastExecuteDate', Sort.desc);
    });
  }

  QueryBuilder<SchedulePlan, SchedulePlan, QAfterSortBy>
  thenByLastMaintenanceId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastMaintenanceId', Sort.asc);
    });
  }

  QueryBuilder<SchedulePlan, SchedulePlan, QAfterSortBy>
  thenByLastMaintenanceIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastMaintenanceId', Sort.desc);
    });
  }

  QueryBuilder<SchedulePlan, SchedulePlan, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<SchedulePlan, SchedulePlan, QAfterSortBy> thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<SchedulePlan, SchedulePlan, QAfterSortBy>
  thenByNextExecuteDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nextExecuteDate', Sort.asc);
    });
  }

  QueryBuilder<SchedulePlan, SchedulePlan, QAfterSortBy>
  thenByNextExecuteDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nextExecuteDate', Sort.desc);
    });
  }

  QueryBuilder<SchedulePlan, SchedulePlan, QAfterSortBy> thenByNotes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.asc);
    });
  }

  QueryBuilder<SchedulePlan, SchedulePlan, QAfterSortBy> thenByNotesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.desc);
    });
  }

  QueryBuilder<SchedulePlan, SchedulePlan, QAfterSortBy> thenByOperation() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'operation', Sort.asc);
    });
  }

  QueryBuilder<SchedulePlan, SchedulePlan, QAfterSortBy> thenByOperationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'operation', Sort.desc);
    });
  }

  QueryBuilder<SchedulePlan, SchedulePlan, QAfterSortBy> thenByReminderTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reminderTime', Sort.asc);
    });
  }

  QueryBuilder<SchedulePlan, SchedulePlan, QAfterSortBy>
  thenByReminderTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reminderTime', Sort.desc);
    });
  }
}

extension SchedulePlanQueryWhereDistinct
    on QueryBuilder<SchedulePlan, SchedulePlan, QDistinct> {
  QueryBuilder<SchedulePlan, SchedulePlan, QDistinct>
  distinctByAdvanceReminderMinutes() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'advanceReminderMinutes');
    });
  }

  QueryBuilder<SchedulePlan, SchedulePlan, QDistinct> distinctByAquariumId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'aquariumId');
    });
  }

  QueryBuilder<SchedulePlan, SchedulePlan, QDistinct> distinctByConsumableId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'consumableId');
    });
  }

  QueryBuilder<SchedulePlan, SchedulePlan, QDistinct> distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<SchedulePlan, SchedulePlan, QDistinct> distinctByCycleDays() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'cycleDays');
    });
  }

  QueryBuilder<SchedulePlan, SchedulePlan, QDistinct> distinctByCycleType() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'cycleType');
    });
  }

  QueryBuilder<SchedulePlan, SchedulePlan, QDistinct>
  distinctByEstimatedDurationMinutes() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'estimatedDurationMinutes');
    });
  }

  QueryBuilder<SchedulePlan, SchedulePlan, QDistinct> distinctByIsEnabled() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isEnabled');
    });
  }

  QueryBuilder<SchedulePlan, SchedulePlan, QDistinct>
  distinctByLastExecuteDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastExecuteDate');
    });
  }

  QueryBuilder<SchedulePlan, SchedulePlan, QDistinct>
  distinctByLastMaintenanceId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastMaintenanceId');
    });
  }

  QueryBuilder<SchedulePlan, SchedulePlan, QDistinct> distinctByName({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SchedulePlan, SchedulePlan, QDistinct>
  distinctByNextExecuteDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'nextExecuteDate');
    });
  }

  QueryBuilder<SchedulePlan, SchedulePlan, QDistinct> distinctByNotes({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'notes', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SchedulePlan, SchedulePlan, QDistinct> distinctByOperation() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'operation');
    });
  }

  QueryBuilder<SchedulePlan, SchedulePlan, QDistinct> distinctByReminderTime({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'reminderTime', caseSensitive: caseSensitive);
    });
  }
}

extension SchedulePlanQueryProperty
    on QueryBuilder<SchedulePlan, SchedulePlan, QQueryProperty> {
  QueryBuilder<SchedulePlan, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<SchedulePlan, int, QQueryOperations>
  advanceReminderMinutesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'advanceReminderMinutes');
    });
  }

  QueryBuilder<SchedulePlan, int?, QQueryOperations> aquariumIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'aquariumId');
    });
  }

  QueryBuilder<SchedulePlan, int?, QQueryOperations> consumableIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'consumableId');
    });
  }

  QueryBuilder<SchedulePlan, DateTime, QQueryOperations> createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<SchedulePlan, int?, QQueryOperations> cycleDaysProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'cycleDays');
    });
  }

  QueryBuilder<SchedulePlan, CycleType, QQueryOperations> cycleTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'cycleType');
    });
  }

  QueryBuilder<SchedulePlan, int?, QQueryOperations>
  estimatedDurationMinutesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'estimatedDurationMinutes');
    });
  }

  QueryBuilder<SchedulePlan, bool, QQueryOperations> isEnabledProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isEnabled');
    });
  }

  QueryBuilder<SchedulePlan, DateTime?, QQueryOperations>
  lastExecuteDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastExecuteDate');
    });
  }

  QueryBuilder<SchedulePlan, int?, QQueryOperations>
  lastMaintenanceIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastMaintenanceId');
    });
  }

  QueryBuilder<SchedulePlan, String, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<SchedulePlan, DateTime?, QQueryOperations>
  nextExecuteDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'nextExecuteDate');
    });
  }

  QueryBuilder<SchedulePlan, String?, QQueryOperations> notesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'notes');
    });
  }

  QueryBuilder<SchedulePlan, ScheduleOperation, QQueryOperations>
  operationProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'operation');
    });
  }

  QueryBuilder<SchedulePlan, String?, QQueryOperations> reminderTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'reminderTime');
    });
  }
}

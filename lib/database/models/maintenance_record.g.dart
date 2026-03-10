// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'maintenance_record.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetMaintenanceRecordCollection on Isar {
  IsarCollection<MaintenanceRecord> get maintenanceRecords => this.collection();
}

const MaintenanceRecordSchema = CollectionSchema(
  name: r'MaintenanceRecord',
  id: 8394037719530270343,
  properties: {
    r'aquariumId': PropertySchema(
      id: 0,
      name: r'aquariumId',
      type: IsarType.long,
    ),
    r'consumableAmount': PropertySchema(
      id: 1,
      name: r'consumableAmount',
      type: IsarType.double,
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
    r'isReminded': PropertySchema(
      id: 4,
      name: r'isReminded',
      type: IsarType.bool,
    ),
    r'nextReminderDate': PropertySchema(
      id: 5,
      name: r'nextReminderDate',
      type: IsarType.dateTime,
    ),
    r'notes': PropertySchema(id: 6, name: r'notes', type: IsarType.string),
    r'operation': PropertySchema(
      id: 7,
      name: r'operation',
      type: IsarType.byte,
      enumMap: _MaintenanceRecordoperationEnumValueMap,
    ),
    r'operationDate': PropertySchema(
      id: 8,
      name: r'operationDate',
      type: IsarType.dateTime,
    ),
  },

  estimateSize: _maintenanceRecordEstimateSize,
  serialize: _maintenanceRecordSerialize,
  deserialize: _maintenanceRecordDeserialize,
  deserializeProp: _maintenanceRecordDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},

  getId: _maintenanceRecordGetId,
  getLinks: _maintenanceRecordGetLinks,
  attach: _maintenanceRecordAttach,
  version: '3.3.0',
);

int _maintenanceRecordEstimateSize(
  MaintenanceRecord object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.notes;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _maintenanceRecordSerialize(
  MaintenanceRecord object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.aquariumId);
  writer.writeDouble(offsets[1], object.consumableAmount);
  writer.writeLong(offsets[2], object.consumableId);
  writer.writeDateTime(offsets[3], object.createdAt);
  writer.writeBool(offsets[4], object.isReminded);
  writer.writeDateTime(offsets[5], object.nextReminderDate);
  writer.writeString(offsets[6], object.notes);
  writer.writeByte(offsets[7], object.operation.index);
  writer.writeDateTime(offsets[8], object.operationDate);
}

MaintenanceRecord _maintenanceRecordDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = MaintenanceRecord(
    aquariumId: reader.readLong(offsets[0]),
    consumableAmount: reader.readDoubleOrNull(offsets[1]),
    consumableId: reader.readLongOrNull(offsets[2]),
    createdAt: reader.readDateTime(offsets[3]),
    isReminded: reader.readBoolOrNull(offsets[4]) ?? false,
    nextReminderDate: reader.readDateTimeOrNull(offsets[5]),
    notes: reader.readStringOrNull(offsets[6]),
    operation:
        _MaintenanceRecordoperationValueEnumMap[reader.readByteOrNull(
          offsets[7],
        )] ??
        MaintenanceOperation.setup,
    operationDate: reader.readDateTime(offsets[8]),
  );
  object.id = id;
  return object;
}

P _maintenanceRecordDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLong(offset)) as P;
    case 1:
      return (reader.readDoubleOrNull(offset)) as P;
    case 2:
      return (reader.readLongOrNull(offset)) as P;
    case 3:
      return (reader.readDateTime(offset)) as P;
    case 4:
      return (reader.readBoolOrNull(offset) ?? false) as P;
    case 5:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 6:
      return (reader.readStringOrNull(offset)) as P;
    case 7:
      return (_MaintenanceRecordoperationValueEnumMap[reader.readByteOrNull(
                offset,
              )] ??
              MaintenanceOperation.setup)
          as P;
    case 8:
      return (reader.readDateTime(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _MaintenanceRecordoperationEnumValueMap = {
  'setup': 0,
  'algaeBloom': 1,
  'feeding': 2,
  'algaeClean': 3,
  'waterChange': 4,
  'cottonChange': 5,
  'equipmentChange': 6,
  'waterTest': 7,
  'consumableChange': 8,
};
const _MaintenanceRecordoperationValueEnumMap = {
  0: MaintenanceOperation.setup,
  1: MaintenanceOperation.algaeBloom,
  2: MaintenanceOperation.feeding,
  3: MaintenanceOperation.algaeClean,
  4: MaintenanceOperation.waterChange,
  5: MaintenanceOperation.cottonChange,
  6: MaintenanceOperation.equipmentChange,
  7: MaintenanceOperation.waterTest,
  8: MaintenanceOperation.consumableChange,
};

Id _maintenanceRecordGetId(MaintenanceRecord object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _maintenanceRecordGetLinks(
  MaintenanceRecord object,
) {
  return [];
}

void _maintenanceRecordAttach(
  IsarCollection<dynamic> col,
  Id id,
  MaintenanceRecord object,
) {
  object.id = id;
}

extension MaintenanceRecordQueryWhereSort
    on QueryBuilder<MaintenanceRecord, MaintenanceRecord, QWhere> {
  QueryBuilder<MaintenanceRecord, MaintenanceRecord, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension MaintenanceRecordQueryWhere
    on QueryBuilder<MaintenanceRecord, MaintenanceRecord, QWhereClause> {
  QueryBuilder<MaintenanceRecord, MaintenanceRecord, QAfterWhereClause>
  idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(lower: id, upper: id));
    });
  }

  QueryBuilder<MaintenanceRecord, MaintenanceRecord, QAfterWhereClause>
  idNotEqualTo(Id id) {
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

  QueryBuilder<MaintenanceRecord, MaintenanceRecord, QAfterWhereClause>
  idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<MaintenanceRecord, MaintenanceRecord, QAfterWhereClause>
  idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<MaintenanceRecord, MaintenanceRecord, QAfterWhereClause>
  idBetween(
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

extension MaintenanceRecordQueryFilter
    on QueryBuilder<MaintenanceRecord, MaintenanceRecord, QFilterCondition> {
  QueryBuilder<MaintenanceRecord, MaintenanceRecord, QAfterFilterCondition>
  aquariumIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'aquariumId', value: value),
      );
    });
  }

  QueryBuilder<MaintenanceRecord, MaintenanceRecord, QAfterFilterCondition>
  aquariumIdGreaterThan(int value, {bool include = false}) {
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

  QueryBuilder<MaintenanceRecord, MaintenanceRecord, QAfterFilterCondition>
  aquariumIdLessThan(int value, {bool include = false}) {
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

  QueryBuilder<MaintenanceRecord, MaintenanceRecord, QAfterFilterCondition>
  aquariumIdBetween(
    int lower,
    int upper, {
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

  QueryBuilder<MaintenanceRecord, MaintenanceRecord, QAfterFilterCondition>
  consumableAmountIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'consumableAmount'),
      );
    });
  }

  QueryBuilder<MaintenanceRecord, MaintenanceRecord, QAfterFilterCondition>
  consumableAmountIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'consumableAmount'),
      );
    });
  }

  QueryBuilder<MaintenanceRecord, MaintenanceRecord, QAfterFilterCondition>
  consumableAmountEqualTo(double? value, {double epsilon = Query.epsilon}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'consumableAmount',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<MaintenanceRecord, MaintenanceRecord, QAfterFilterCondition>
  consumableAmountGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'consumableAmount',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<MaintenanceRecord, MaintenanceRecord, QAfterFilterCondition>
  consumableAmountLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'consumableAmount',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<MaintenanceRecord, MaintenanceRecord, QAfterFilterCondition>
  consumableAmountBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'consumableAmount',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<MaintenanceRecord, MaintenanceRecord, QAfterFilterCondition>
  consumableIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'consumableId'),
      );
    });
  }

  QueryBuilder<MaintenanceRecord, MaintenanceRecord, QAfterFilterCondition>
  consumableIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'consumableId'),
      );
    });
  }

  QueryBuilder<MaintenanceRecord, MaintenanceRecord, QAfterFilterCondition>
  consumableIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'consumableId', value: value),
      );
    });
  }

  QueryBuilder<MaintenanceRecord, MaintenanceRecord, QAfterFilterCondition>
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

  QueryBuilder<MaintenanceRecord, MaintenanceRecord, QAfterFilterCondition>
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

  QueryBuilder<MaintenanceRecord, MaintenanceRecord, QAfterFilterCondition>
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

  QueryBuilder<MaintenanceRecord, MaintenanceRecord, QAfterFilterCondition>
  createdAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'createdAt', value: value),
      );
    });
  }

  QueryBuilder<MaintenanceRecord, MaintenanceRecord, QAfterFilterCondition>
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

  QueryBuilder<MaintenanceRecord, MaintenanceRecord, QAfterFilterCondition>
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

  QueryBuilder<MaintenanceRecord, MaintenanceRecord, QAfterFilterCondition>
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

  QueryBuilder<MaintenanceRecord, MaintenanceRecord, QAfterFilterCondition>
  idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'id', value: value),
      );
    });
  }

  QueryBuilder<MaintenanceRecord, MaintenanceRecord, QAfterFilterCondition>
  idGreaterThan(Id value, {bool include = false}) {
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

  QueryBuilder<MaintenanceRecord, MaintenanceRecord, QAfterFilterCondition>
  idLessThan(Id value, {bool include = false}) {
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

  QueryBuilder<MaintenanceRecord, MaintenanceRecord, QAfterFilterCondition>
  idBetween(
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

  QueryBuilder<MaintenanceRecord, MaintenanceRecord, QAfterFilterCondition>
  isRemindedEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'isReminded', value: value),
      );
    });
  }

  QueryBuilder<MaintenanceRecord, MaintenanceRecord, QAfterFilterCondition>
  nextReminderDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'nextReminderDate'),
      );
    });
  }

  QueryBuilder<MaintenanceRecord, MaintenanceRecord, QAfterFilterCondition>
  nextReminderDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'nextReminderDate'),
      );
    });
  }

  QueryBuilder<MaintenanceRecord, MaintenanceRecord, QAfterFilterCondition>
  nextReminderDateEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'nextReminderDate', value: value),
      );
    });
  }

  QueryBuilder<MaintenanceRecord, MaintenanceRecord, QAfterFilterCondition>
  nextReminderDateGreaterThan(DateTime? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'nextReminderDate',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<MaintenanceRecord, MaintenanceRecord, QAfterFilterCondition>
  nextReminderDateLessThan(DateTime? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'nextReminderDate',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<MaintenanceRecord, MaintenanceRecord, QAfterFilterCondition>
  nextReminderDateBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'nextReminderDate',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<MaintenanceRecord, MaintenanceRecord, QAfterFilterCondition>
  notesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'notes'),
      );
    });
  }

  QueryBuilder<MaintenanceRecord, MaintenanceRecord, QAfterFilterCondition>
  notesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'notes'),
      );
    });
  }

  QueryBuilder<MaintenanceRecord, MaintenanceRecord, QAfterFilterCondition>
  notesEqualTo(String? value, {bool caseSensitive = true}) {
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

  QueryBuilder<MaintenanceRecord, MaintenanceRecord, QAfterFilterCondition>
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

  QueryBuilder<MaintenanceRecord, MaintenanceRecord, QAfterFilterCondition>
  notesLessThan(
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

  QueryBuilder<MaintenanceRecord, MaintenanceRecord, QAfterFilterCondition>
  notesBetween(
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

  QueryBuilder<MaintenanceRecord, MaintenanceRecord, QAfterFilterCondition>
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

  QueryBuilder<MaintenanceRecord, MaintenanceRecord, QAfterFilterCondition>
  notesEndsWith(String value, {bool caseSensitive = true}) {
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

  QueryBuilder<MaintenanceRecord, MaintenanceRecord, QAfterFilterCondition>
  notesContains(String value, {bool caseSensitive = true}) {
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

  QueryBuilder<MaintenanceRecord, MaintenanceRecord, QAfterFilterCondition>
  notesMatches(String pattern, {bool caseSensitive = true}) {
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

  QueryBuilder<MaintenanceRecord, MaintenanceRecord, QAfterFilterCondition>
  notesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'notes', value: ''),
      );
    });
  }

  QueryBuilder<MaintenanceRecord, MaintenanceRecord, QAfterFilterCondition>
  notesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'notes', value: ''),
      );
    });
  }

  QueryBuilder<MaintenanceRecord, MaintenanceRecord, QAfterFilterCondition>
  operationEqualTo(MaintenanceOperation value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'operation', value: value),
      );
    });
  }

  QueryBuilder<MaintenanceRecord, MaintenanceRecord, QAfterFilterCondition>
  operationGreaterThan(MaintenanceOperation value, {bool include = false}) {
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

  QueryBuilder<MaintenanceRecord, MaintenanceRecord, QAfterFilterCondition>
  operationLessThan(MaintenanceOperation value, {bool include = false}) {
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

  QueryBuilder<MaintenanceRecord, MaintenanceRecord, QAfterFilterCondition>
  operationBetween(
    MaintenanceOperation lower,
    MaintenanceOperation upper, {
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

  QueryBuilder<MaintenanceRecord, MaintenanceRecord, QAfterFilterCondition>
  operationDateEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'operationDate', value: value),
      );
    });
  }

  QueryBuilder<MaintenanceRecord, MaintenanceRecord, QAfterFilterCondition>
  operationDateGreaterThan(DateTime value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'operationDate',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<MaintenanceRecord, MaintenanceRecord, QAfterFilterCondition>
  operationDateLessThan(DateTime value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'operationDate',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<MaintenanceRecord, MaintenanceRecord, QAfterFilterCondition>
  operationDateBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'operationDate',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }
}

extension MaintenanceRecordQueryObject
    on QueryBuilder<MaintenanceRecord, MaintenanceRecord, QFilterCondition> {}

extension MaintenanceRecordQueryLinks
    on QueryBuilder<MaintenanceRecord, MaintenanceRecord, QFilterCondition> {}

extension MaintenanceRecordQuerySortBy
    on QueryBuilder<MaintenanceRecord, MaintenanceRecord, QSortBy> {
  QueryBuilder<MaintenanceRecord, MaintenanceRecord, QAfterSortBy>
  sortByAquariumId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'aquariumId', Sort.asc);
    });
  }

  QueryBuilder<MaintenanceRecord, MaintenanceRecord, QAfterSortBy>
  sortByAquariumIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'aquariumId', Sort.desc);
    });
  }

  QueryBuilder<MaintenanceRecord, MaintenanceRecord, QAfterSortBy>
  sortByConsumableAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'consumableAmount', Sort.asc);
    });
  }

  QueryBuilder<MaintenanceRecord, MaintenanceRecord, QAfterSortBy>
  sortByConsumableAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'consumableAmount', Sort.desc);
    });
  }

  QueryBuilder<MaintenanceRecord, MaintenanceRecord, QAfterSortBy>
  sortByConsumableId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'consumableId', Sort.asc);
    });
  }

  QueryBuilder<MaintenanceRecord, MaintenanceRecord, QAfterSortBy>
  sortByConsumableIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'consumableId', Sort.desc);
    });
  }

  QueryBuilder<MaintenanceRecord, MaintenanceRecord, QAfterSortBy>
  sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<MaintenanceRecord, MaintenanceRecord, QAfterSortBy>
  sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<MaintenanceRecord, MaintenanceRecord, QAfterSortBy>
  sortByIsReminded() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isReminded', Sort.asc);
    });
  }

  QueryBuilder<MaintenanceRecord, MaintenanceRecord, QAfterSortBy>
  sortByIsRemindedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isReminded', Sort.desc);
    });
  }

  QueryBuilder<MaintenanceRecord, MaintenanceRecord, QAfterSortBy>
  sortByNextReminderDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nextReminderDate', Sort.asc);
    });
  }

  QueryBuilder<MaintenanceRecord, MaintenanceRecord, QAfterSortBy>
  sortByNextReminderDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nextReminderDate', Sort.desc);
    });
  }

  QueryBuilder<MaintenanceRecord, MaintenanceRecord, QAfterSortBy>
  sortByNotes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.asc);
    });
  }

  QueryBuilder<MaintenanceRecord, MaintenanceRecord, QAfterSortBy>
  sortByNotesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.desc);
    });
  }

  QueryBuilder<MaintenanceRecord, MaintenanceRecord, QAfterSortBy>
  sortByOperation() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'operation', Sort.asc);
    });
  }

  QueryBuilder<MaintenanceRecord, MaintenanceRecord, QAfterSortBy>
  sortByOperationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'operation', Sort.desc);
    });
  }

  QueryBuilder<MaintenanceRecord, MaintenanceRecord, QAfterSortBy>
  sortByOperationDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'operationDate', Sort.asc);
    });
  }

  QueryBuilder<MaintenanceRecord, MaintenanceRecord, QAfterSortBy>
  sortByOperationDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'operationDate', Sort.desc);
    });
  }
}

extension MaintenanceRecordQuerySortThenBy
    on QueryBuilder<MaintenanceRecord, MaintenanceRecord, QSortThenBy> {
  QueryBuilder<MaintenanceRecord, MaintenanceRecord, QAfterSortBy>
  thenByAquariumId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'aquariumId', Sort.asc);
    });
  }

  QueryBuilder<MaintenanceRecord, MaintenanceRecord, QAfterSortBy>
  thenByAquariumIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'aquariumId', Sort.desc);
    });
  }

  QueryBuilder<MaintenanceRecord, MaintenanceRecord, QAfterSortBy>
  thenByConsumableAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'consumableAmount', Sort.asc);
    });
  }

  QueryBuilder<MaintenanceRecord, MaintenanceRecord, QAfterSortBy>
  thenByConsumableAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'consumableAmount', Sort.desc);
    });
  }

  QueryBuilder<MaintenanceRecord, MaintenanceRecord, QAfterSortBy>
  thenByConsumableId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'consumableId', Sort.asc);
    });
  }

  QueryBuilder<MaintenanceRecord, MaintenanceRecord, QAfterSortBy>
  thenByConsumableIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'consumableId', Sort.desc);
    });
  }

  QueryBuilder<MaintenanceRecord, MaintenanceRecord, QAfterSortBy>
  thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<MaintenanceRecord, MaintenanceRecord, QAfterSortBy>
  thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<MaintenanceRecord, MaintenanceRecord, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<MaintenanceRecord, MaintenanceRecord, QAfterSortBy>
  thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<MaintenanceRecord, MaintenanceRecord, QAfterSortBy>
  thenByIsReminded() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isReminded', Sort.asc);
    });
  }

  QueryBuilder<MaintenanceRecord, MaintenanceRecord, QAfterSortBy>
  thenByIsRemindedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isReminded', Sort.desc);
    });
  }

  QueryBuilder<MaintenanceRecord, MaintenanceRecord, QAfterSortBy>
  thenByNextReminderDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nextReminderDate', Sort.asc);
    });
  }

  QueryBuilder<MaintenanceRecord, MaintenanceRecord, QAfterSortBy>
  thenByNextReminderDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nextReminderDate', Sort.desc);
    });
  }

  QueryBuilder<MaintenanceRecord, MaintenanceRecord, QAfterSortBy>
  thenByNotes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.asc);
    });
  }

  QueryBuilder<MaintenanceRecord, MaintenanceRecord, QAfterSortBy>
  thenByNotesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.desc);
    });
  }

  QueryBuilder<MaintenanceRecord, MaintenanceRecord, QAfterSortBy>
  thenByOperation() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'operation', Sort.asc);
    });
  }

  QueryBuilder<MaintenanceRecord, MaintenanceRecord, QAfterSortBy>
  thenByOperationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'operation', Sort.desc);
    });
  }

  QueryBuilder<MaintenanceRecord, MaintenanceRecord, QAfterSortBy>
  thenByOperationDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'operationDate', Sort.asc);
    });
  }

  QueryBuilder<MaintenanceRecord, MaintenanceRecord, QAfterSortBy>
  thenByOperationDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'operationDate', Sort.desc);
    });
  }
}

extension MaintenanceRecordQueryWhereDistinct
    on QueryBuilder<MaintenanceRecord, MaintenanceRecord, QDistinct> {
  QueryBuilder<MaintenanceRecord, MaintenanceRecord, QDistinct>
  distinctByAquariumId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'aquariumId');
    });
  }

  QueryBuilder<MaintenanceRecord, MaintenanceRecord, QDistinct>
  distinctByConsumableAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'consumableAmount');
    });
  }

  QueryBuilder<MaintenanceRecord, MaintenanceRecord, QDistinct>
  distinctByConsumableId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'consumableId');
    });
  }

  QueryBuilder<MaintenanceRecord, MaintenanceRecord, QDistinct>
  distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<MaintenanceRecord, MaintenanceRecord, QDistinct>
  distinctByIsReminded() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isReminded');
    });
  }

  QueryBuilder<MaintenanceRecord, MaintenanceRecord, QDistinct>
  distinctByNextReminderDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'nextReminderDate');
    });
  }

  QueryBuilder<MaintenanceRecord, MaintenanceRecord, QDistinct>
  distinctByNotes({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'notes', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MaintenanceRecord, MaintenanceRecord, QDistinct>
  distinctByOperation() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'operation');
    });
  }

  QueryBuilder<MaintenanceRecord, MaintenanceRecord, QDistinct>
  distinctByOperationDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'operationDate');
    });
  }
}

extension MaintenanceRecordQueryProperty
    on QueryBuilder<MaintenanceRecord, MaintenanceRecord, QQueryProperty> {
  QueryBuilder<MaintenanceRecord, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<MaintenanceRecord, int, QQueryOperations> aquariumIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'aquariumId');
    });
  }

  QueryBuilder<MaintenanceRecord, double?, QQueryOperations>
  consumableAmountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'consumableAmount');
    });
  }

  QueryBuilder<MaintenanceRecord, int?, QQueryOperations>
  consumableIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'consumableId');
    });
  }

  QueryBuilder<MaintenanceRecord, DateTime, QQueryOperations>
  createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<MaintenanceRecord, bool, QQueryOperations> isRemindedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isReminded');
    });
  }

  QueryBuilder<MaintenanceRecord, DateTime?, QQueryOperations>
  nextReminderDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'nextReminderDate');
    });
  }

  QueryBuilder<MaintenanceRecord, String?, QQueryOperations> notesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'notes');
    });
  }

  QueryBuilder<MaintenanceRecord, MaintenanceOperation, QQueryOperations>
  operationProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'operation');
    });
  }

  QueryBuilder<MaintenanceRecord, DateTime, QQueryOperations>
  operationDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'operationDate');
    });
  }
}

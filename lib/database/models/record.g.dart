// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'record.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetRecordCollection on Isar {
  IsarCollection<Record> get records => this.collection();
}

const RecordSchema = CollectionSchema(
  name: r'Record',
  id: -5560585825827271694,
  properties: {
    r'aquariumId': PropertySchema(
      id: 0,
      name: r'aquariumId',
      type: IsarType.long,
    ),
    r'createdAt': PropertySchema(
      id: 1,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'description': PropertySchema(
      id: 2,
      name: r'description',
      type: IsarType.string,
    ),
    r'detailInfo': PropertySchema(
      id: 3,
      name: r'detailInfo',
      type: IsarType.string,
    ),
    r'iconPath': PropertySchema(
      id: 4,
      name: r'iconPath',
      type: IsarType.string,
    ),
    r'name': PropertySchema(id: 5, name: r'name', type: IsarType.string),
    r'notes': PropertySchema(id: 6, name: r'notes', type: IsarType.string),
    r'numericValue': PropertySchema(
      id: 7,
      name: r'numericValue',
      type: IsarType.double,
    ),
    r'operationType': PropertySchema(
      id: 8,
      name: r'operationType',
      type: IsarType.byte,
      enumMap: _RecordoperationTypeEnumValueMap,
    ),
    r'photoMediaIds': PropertySchema(
      id: 9,
      name: r'photoMediaIds',
      type: IsarType.longList,
    ),
    r'recordTime': PropertySchema(
      id: 10,
      name: r'recordTime',
      type: IsarType.dateTime,
    ),
    r'recordType': PropertySchema(
      id: 11,
      name: r'recordType',
      type: IsarType.byte,
      enumMap: _RecordrecordTypeEnumValueMap,
    ),
    r'sourceId': PropertySchema(id: 12, name: r'sourceId', type: IsarType.long),
    r'summary': PropertySchema(id: 13, name: r'summary', type: IsarType.string),
    r'valueType': PropertySchema(
      id: 14,
      name: r'valueType',
      type: IsarType.string,
    ),
  },

  estimateSize: _recordEstimateSize,
  serialize: _recordSerialize,
  deserialize: _recordDeserialize,
  deserializeProp: _recordDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},

  getId: _recordGetId,
  getLinks: _recordGetLinks,
  attach: _recordAttach,
  version: '3.3.0',
);

int _recordEstimateSize(
  Record object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.description;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.detailInfo.length * 3;
  {
    final value = object.iconPath;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.name.length * 3;
  {
    final value = object.notes;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.photoMediaIds;
    if (value != null) {
      bytesCount += 3 + value.length * 8;
    }
  }
  bytesCount += 3 + object.summary.length * 3;
  {
    final value = object.valueType;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _recordSerialize(
  Record object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.aquariumId);
  writer.writeDateTime(offsets[1], object.createdAt);
  writer.writeString(offsets[2], object.description);
  writer.writeString(offsets[3], object.detailInfo);
  writer.writeString(offsets[4], object.iconPath);
  writer.writeString(offsets[5], object.name);
  writer.writeString(offsets[6], object.notes);
  writer.writeDouble(offsets[7], object.numericValue);
  writer.writeByte(offsets[8], object.operationType.index);
  writer.writeLongList(offsets[9], object.photoMediaIds);
  writer.writeDateTime(offsets[10], object.recordTime);
  writer.writeByte(offsets[11], object.recordType.index);
  writer.writeLong(offsets[12], object.sourceId);
  writer.writeString(offsets[13], object.summary);
  writer.writeString(offsets[14], object.valueType);
}

Record _recordDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Record(
    aquariumId: reader.readLongOrNull(offsets[0]),
    createdAt: reader.readDateTime(offsets[1]),
    description: reader.readStringOrNull(offsets[2]),
    iconPath: reader.readStringOrNull(offsets[4]),
    name: reader.readString(offsets[5]),
    notes: reader.readStringOrNull(offsets[6]),
    numericValue: reader.readDoubleOrNull(offsets[7]),
    operationType:
        _RecordoperationTypeValueEnumMap[reader.readByteOrNull(offsets[8])] ??
        OperationType.create,
    photoMediaIds: reader.readLongList(offsets[9]),
    recordTime: reader.readDateTime(offsets[10]),
    recordType:
        _RecordrecordTypeValueEnumMap[reader.readByteOrNull(offsets[11])] ??
        RecordType.aquarium,
    sourceId: reader.readLongOrNull(offsets[12]),
    valueType: reader.readStringOrNull(offsets[14]),
  );
  object.id = id;
  return object;
}

P _recordDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLongOrNull(offset)) as P;
    case 1:
      return (reader.readDateTime(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader.readStringOrNull(offset)) as P;
    case 7:
      return (reader.readDoubleOrNull(offset)) as P;
    case 8:
      return (_RecordoperationTypeValueEnumMap[reader.readByteOrNull(offset)] ??
              OperationType.create)
          as P;
    case 9:
      return (reader.readLongList(offset)) as P;
    case 10:
      return (reader.readDateTime(offset)) as P;
    case 11:
      return (_RecordrecordTypeValueEnumMap[reader.readByteOrNull(offset)] ??
              RecordType.aquarium)
          as P;
    case 12:
      return (reader.readLongOrNull(offset)) as P;
    case 13:
      return (reader.readString(offset)) as P;
    case 14:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _RecordoperationTypeEnumValueMap = {
  'create': 0,
  'sell': 1,
  'statusChange': 2,
};
const _RecordoperationTypeValueEnumMap = {
  0: OperationType.create,
  1: OperationType.sell,
  2: OperationType.statusChange,
};
const _RecordrecordTypeEnumValueMap = {
  'aquarium': 0,
  'creature': 1,
  'equipment': 2,
  'maintenance': 3,
};
const _RecordrecordTypeValueEnumMap = {
  0: RecordType.aquarium,
  1: RecordType.creature,
  2: RecordType.equipment,
  3: RecordType.maintenance,
};

Id _recordGetId(Record object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _recordGetLinks(Record object) {
  return [];
}

void _recordAttach(IsarCollection<dynamic> col, Id id, Record object) {
  object.id = id;
}

extension RecordQueryWhereSort on QueryBuilder<Record, Record, QWhere> {
  QueryBuilder<Record, Record, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension RecordQueryWhere on QueryBuilder<Record, Record, QWhereClause> {
  QueryBuilder<Record, Record, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(lower: id, upper: id));
    });
  }

  QueryBuilder<Record, Record, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<Record, Record, QAfterWhereClause> idGreaterThan(
    Id id, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Record, Record, QAfterWhereClause> idLessThan(
    Id id, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Record, Record, QAfterWhereClause> idBetween(
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

extension RecordQueryFilter on QueryBuilder<Record, Record, QFilterCondition> {
  QueryBuilder<Record, Record, QAfterFilterCondition> aquariumIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'aquariumId'),
      );
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> aquariumIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'aquariumId'),
      );
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> aquariumIdEqualTo(
    int? value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'aquariumId', value: value),
      );
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> aquariumIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
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

  QueryBuilder<Record, Record, QAfterFilterCondition> aquariumIdLessThan(
    int? value, {
    bool include = false,
  }) {
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

  QueryBuilder<Record, Record, QAfterFilterCondition> aquariumIdBetween(
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

  QueryBuilder<Record, Record, QAfterFilterCondition> createdAtEqualTo(
    DateTime value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'createdAt', value: value),
      );
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> createdAtGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
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

  QueryBuilder<Record, Record, QAfterFilterCondition> createdAtLessThan(
    DateTime value, {
    bool include = false,
  }) {
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

  QueryBuilder<Record, Record, QAfterFilterCondition> createdAtBetween(
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

  QueryBuilder<Record, Record, QAfterFilterCondition> descriptionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'description'),
      );
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> descriptionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'description'),
      );
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> descriptionEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'description',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> descriptionGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'description',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> descriptionLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'description',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> descriptionBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'description',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> descriptionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'description',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> descriptionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'description',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> descriptionContains(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'description',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> descriptionMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'description',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> descriptionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'description', value: ''),
      );
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> descriptionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'description', value: ''),
      );
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> detailInfoEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'detailInfo',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> detailInfoGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'detailInfo',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> detailInfoLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'detailInfo',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> detailInfoBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'detailInfo',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> detailInfoStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'detailInfo',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> detailInfoEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'detailInfo',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> detailInfoContains(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'detailInfo',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> detailInfoMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'detailInfo',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> detailInfoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'detailInfo', value: ''),
      );
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> detailInfoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'detailInfo', value: ''),
      );
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> iconPathIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'iconPath'),
      );
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> iconPathIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'iconPath'),
      );
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> iconPathEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'iconPath',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> iconPathGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'iconPath',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> iconPathLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'iconPath',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> iconPathBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'iconPath',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> iconPathStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'iconPath',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> iconPathEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'iconPath',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> iconPathContains(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'iconPath',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> iconPathMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'iconPath',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> iconPathIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'iconPath', value: ''),
      );
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> iconPathIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'iconPath', value: ''),
      );
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'id', value: value),
      );
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Record, Record, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Record, Record, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Record, Record, QAfterFilterCondition> nameEqualTo(
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

  QueryBuilder<Record, Record, QAfterFilterCondition> nameGreaterThan(
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

  QueryBuilder<Record, Record, QAfterFilterCondition> nameLessThan(
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

  QueryBuilder<Record, Record, QAfterFilterCondition> nameBetween(
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

  QueryBuilder<Record, Record, QAfterFilterCondition> nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
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

  QueryBuilder<Record, Record, QAfterFilterCondition> nameEndsWith(
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

  QueryBuilder<Record, Record, QAfterFilterCondition> nameContains(
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

  QueryBuilder<Record, Record, QAfterFilterCondition> nameMatches(
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

  QueryBuilder<Record, Record, QAfterFilterCondition> nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'name', value: ''),
      );
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'name', value: ''),
      );
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> notesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'notes'),
      );
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> notesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'notes'),
      );
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> notesEqualTo(
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

  QueryBuilder<Record, Record, QAfterFilterCondition> notesGreaterThan(
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

  QueryBuilder<Record, Record, QAfterFilterCondition> notesLessThan(
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

  QueryBuilder<Record, Record, QAfterFilterCondition> notesBetween(
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

  QueryBuilder<Record, Record, QAfterFilterCondition> notesStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
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

  QueryBuilder<Record, Record, QAfterFilterCondition> notesEndsWith(
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

  QueryBuilder<Record, Record, QAfterFilterCondition> notesContains(
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

  QueryBuilder<Record, Record, QAfterFilterCondition> notesMatches(
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

  QueryBuilder<Record, Record, QAfterFilterCondition> notesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'notes', value: ''),
      );
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> notesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'notes', value: ''),
      );
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> numericValueIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'numericValue'),
      );
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> numericValueIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'numericValue'),
      );
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> numericValueEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'numericValue',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> numericValueGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'numericValue',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> numericValueLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'numericValue',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> numericValueBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'numericValue',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> operationTypeEqualTo(
    OperationType value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'operationType', value: value),
      );
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> operationTypeGreaterThan(
    OperationType value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'operationType',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> operationTypeLessThan(
    OperationType value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'operationType',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> operationTypeBetween(
    OperationType lower,
    OperationType upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'operationType',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> photoMediaIdsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'photoMediaIds'),
      );
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> photoMediaIdsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'photoMediaIds'),
      );
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition>
  photoMediaIdsElementEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'photoMediaIds', value: value),
      );
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition>
  photoMediaIdsElementGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'photoMediaIds',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition>
  photoMediaIdsElementLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'photoMediaIds',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition>
  photoMediaIdsElementBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'photoMediaIds',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition>
  photoMediaIdsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'photoMediaIds', length, true, length, true);
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> photoMediaIdsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'photoMediaIds', 0, true, 0, true);
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition>
  photoMediaIdsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'photoMediaIds', 0, false, 999999, true);
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition>
  photoMediaIdsLengthLessThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'photoMediaIds', 0, true, length, include);
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition>
  photoMediaIdsLengthGreaterThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'photoMediaIds', length, include, 999999, true);
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition>
  photoMediaIdsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'photoMediaIds',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> recordTimeEqualTo(
    DateTime value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'recordTime', value: value),
      );
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> recordTimeGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'recordTime',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> recordTimeLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'recordTime',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> recordTimeBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'recordTime',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> recordTypeEqualTo(
    RecordType value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'recordType', value: value),
      );
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> recordTypeGreaterThan(
    RecordType value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'recordType',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> recordTypeLessThan(
    RecordType value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'recordType',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> recordTypeBetween(
    RecordType lower,
    RecordType upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'recordType',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> sourceIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'sourceId'),
      );
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> sourceIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'sourceId'),
      );
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> sourceIdEqualTo(
    int? value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'sourceId', value: value),
      );
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> sourceIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'sourceId',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> sourceIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'sourceId',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> sourceIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'sourceId',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> summaryEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'summary',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> summaryGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'summary',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> summaryLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'summary',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> summaryBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'summary',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> summaryStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'summary',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> summaryEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'summary',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> summaryContains(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'summary',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> summaryMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'summary',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> summaryIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'summary', value: ''),
      );
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> summaryIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'summary', value: ''),
      );
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> valueTypeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'valueType'),
      );
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> valueTypeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'valueType'),
      );
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> valueTypeEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'valueType',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> valueTypeGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'valueType',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> valueTypeLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'valueType',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> valueTypeBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'valueType',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> valueTypeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'valueType',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> valueTypeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'valueType',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> valueTypeContains(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'valueType',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> valueTypeMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'valueType',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> valueTypeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'valueType', value: ''),
      );
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> valueTypeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'valueType', value: ''),
      );
    });
  }
}

extension RecordQueryObject on QueryBuilder<Record, Record, QFilterCondition> {}

extension RecordQueryLinks on QueryBuilder<Record, Record, QFilterCondition> {}

extension RecordQuerySortBy on QueryBuilder<Record, Record, QSortBy> {
  QueryBuilder<Record, Record, QAfterSortBy> sortByAquariumId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'aquariumId', Sort.asc);
    });
  }

  QueryBuilder<Record, Record, QAfterSortBy> sortByAquariumIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'aquariumId', Sort.desc);
    });
  }

  QueryBuilder<Record, Record, QAfterSortBy> sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<Record, Record, QAfterSortBy> sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<Record, Record, QAfterSortBy> sortByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<Record, Record, QAfterSortBy> sortByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<Record, Record, QAfterSortBy> sortByDetailInfo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'detailInfo', Sort.asc);
    });
  }

  QueryBuilder<Record, Record, QAfterSortBy> sortByDetailInfoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'detailInfo', Sort.desc);
    });
  }

  QueryBuilder<Record, Record, QAfterSortBy> sortByIconPath() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'iconPath', Sort.asc);
    });
  }

  QueryBuilder<Record, Record, QAfterSortBy> sortByIconPathDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'iconPath', Sort.desc);
    });
  }

  QueryBuilder<Record, Record, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<Record, Record, QAfterSortBy> sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<Record, Record, QAfterSortBy> sortByNotes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.asc);
    });
  }

  QueryBuilder<Record, Record, QAfterSortBy> sortByNotesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.desc);
    });
  }

  QueryBuilder<Record, Record, QAfterSortBy> sortByNumericValue() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'numericValue', Sort.asc);
    });
  }

  QueryBuilder<Record, Record, QAfterSortBy> sortByNumericValueDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'numericValue', Sort.desc);
    });
  }

  QueryBuilder<Record, Record, QAfterSortBy> sortByOperationType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'operationType', Sort.asc);
    });
  }

  QueryBuilder<Record, Record, QAfterSortBy> sortByOperationTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'operationType', Sort.desc);
    });
  }

  QueryBuilder<Record, Record, QAfterSortBy> sortByRecordTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recordTime', Sort.asc);
    });
  }

  QueryBuilder<Record, Record, QAfterSortBy> sortByRecordTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recordTime', Sort.desc);
    });
  }

  QueryBuilder<Record, Record, QAfterSortBy> sortByRecordType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recordType', Sort.asc);
    });
  }

  QueryBuilder<Record, Record, QAfterSortBy> sortByRecordTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recordType', Sort.desc);
    });
  }

  QueryBuilder<Record, Record, QAfterSortBy> sortBySourceId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sourceId', Sort.asc);
    });
  }

  QueryBuilder<Record, Record, QAfterSortBy> sortBySourceIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sourceId', Sort.desc);
    });
  }

  QueryBuilder<Record, Record, QAfterSortBy> sortBySummary() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'summary', Sort.asc);
    });
  }

  QueryBuilder<Record, Record, QAfterSortBy> sortBySummaryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'summary', Sort.desc);
    });
  }

  QueryBuilder<Record, Record, QAfterSortBy> sortByValueType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'valueType', Sort.asc);
    });
  }

  QueryBuilder<Record, Record, QAfterSortBy> sortByValueTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'valueType', Sort.desc);
    });
  }
}

extension RecordQuerySortThenBy on QueryBuilder<Record, Record, QSortThenBy> {
  QueryBuilder<Record, Record, QAfterSortBy> thenByAquariumId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'aquariumId', Sort.asc);
    });
  }

  QueryBuilder<Record, Record, QAfterSortBy> thenByAquariumIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'aquariumId', Sort.desc);
    });
  }

  QueryBuilder<Record, Record, QAfterSortBy> thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<Record, Record, QAfterSortBy> thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<Record, Record, QAfterSortBy> thenByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<Record, Record, QAfterSortBy> thenByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<Record, Record, QAfterSortBy> thenByDetailInfo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'detailInfo', Sort.asc);
    });
  }

  QueryBuilder<Record, Record, QAfterSortBy> thenByDetailInfoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'detailInfo', Sort.desc);
    });
  }

  QueryBuilder<Record, Record, QAfterSortBy> thenByIconPath() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'iconPath', Sort.asc);
    });
  }

  QueryBuilder<Record, Record, QAfterSortBy> thenByIconPathDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'iconPath', Sort.desc);
    });
  }

  QueryBuilder<Record, Record, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Record, Record, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Record, Record, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<Record, Record, QAfterSortBy> thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<Record, Record, QAfterSortBy> thenByNotes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.asc);
    });
  }

  QueryBuilder<Record, Record, QAfterSortBy> thenByNotesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.desc);
    });
  }

  QueryBuilder<Record, Record, QAfterSortBy> thenByNumericValue() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'numericValue', Sort.asc);
    });
  }

  QueryBuilder<Record, Record, QAfterSortBy> thenByNumericValueDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'numericValue', Sort.desc);
    });
  }

  QueryBuilder<Record, Record, QAfterSortBy> thenByOperationType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'operationType', Sort.asc);
    });
  }

  QueryBuilder<Record, Record, QAfterSortBy> thenByOperationTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'operationType', Sort.desc);
    });
  }

  QueryBuilder<Record, Record, QAfterSortBy> thenByRecordTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recordTime', Sort.asc);
    });
  }

  QueryBuilder<Record, Record, QAfterSortBy> thenByRecordTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recordTime', Sort.desc);
    });
  }

  QueryBuilder<Record, Record, QAfterSortBy> thenByRecordType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recordType', Sort.asc);
    });
  }

  QueryBuilder<Record, Record, QAfterSortBy> thenByRecordTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recordType', Sort.desc);
    });
  }

  QueryBuilder<Record, Record, QAfterSortBy> thenBySourceId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sourceId', Sort.asc);
    });
  }

  QueryBuilder<Record, Record, QAfterSortBy> thenBySourceIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sourceId', Sort.desc);
    });
  }

  QueryBuilder<Record, Record, QAfterSortBy> thenBySummary() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'summary', Sort.asc);
    });
  }

  QueryBuilder<Record, Record, QAfterSortBy> thenBySummaryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'summary', Sort.desc);
    });
  }

  QueryBuilder<Record, Record, QAfterSortBy> thenByValueType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'valueType', Sort.asc);
    });
  }

  QueryBuilder<Record, Record, QAfterSortBy> thenByValueTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'valueType', Sort.desc);
    });
  }
}

extension RecordQueryWhereDistinct on QueryBuilder<Record, Record, QDistinct> {
  QueryBuilder<Record, Record, QDistinct> distinctByAquariumId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'aquariumId');
    });
  }

  QueryBuilder<Record, Record, QDistinct> distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<Record, Record, QDistinct> distinctByDescription({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'description', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Record, Record, QDistinct> distinctByDetailInfo({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'detailInfo', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Record, Record, QDistinct> distinctByIconPath({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'iconPath', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Record, Record, QDistinct> distinctByName({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Record, Record, QDistinct> distinctByNotes({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'notes', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Record, Record, QDistinct> distinctByNumericValue() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'numericValue');
    });
  }

  QueryBuilder<Record, Record, QDistinct> distinctByOperationType() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'operationType');
    });
  }

  QueryBuilder<Record, Record, QDistinct> distinctByPhotoMediaIds() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'photoMediaIds');
    });
  }

  QueryBuilder<Record, Record, QDistinct> distinctByRecordTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'recordTime');
    });
  }

  QueryBuilder<Record, Record, QDistinct> distinctByRecordType() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'recordType');
    });
  }

  QueryBuilder<Record, Record, QDistinct> distinctBySourceId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'sourceId');
    });
  }

  QueryBuilder<Record, Record, QDistinct> distinctBySummary({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'summary', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Record, Record, QDistinct> distinctByValueType({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'valueType', caseSensitive: caseSensitive);
    });
  }
}

extension RecordQueryProperty on QueryBuilder<Record, Record, QQueryProperty> {
  QueryBuilder<Record, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Record, int?, QQueryOperations> aquariumIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'aquariumId');
    });
  }

  QueryBuilder<Record, DateTime, QQueryOperations> createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<Record, String?, QQueryOperations> descriptionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'description');
    });
  }

  QueryBuilder<Record, String, QQueryOperations> detailInfoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'detailInfo');
    });
  }

  QueryBuilder<Record, String?, QQueryOperations> iconPathProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'iconPath');
    });
  }

  QueryBuilder<Record, String, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<Record, String?, QQueryOperations> notesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'notes');
    });
  }

  QueryBuilder<Record, double?, QQueryOperations> numericValueProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'numericValue');
    });
  }

  QueryBuilder<Record, OperationType, QQueryOperations>
  operationTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'operationType');
    });
  }

  QueryBuilder<Record, List<int>?, QQueryOperations> photoMediaIdsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'photoMediaIds');
    });
  }

  QueryBuilder<Record, DateTime, QQueryOperations> recordTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'recordTime');
    });
  }

  QueryBuilder<Record, RecordType, QQueryOperations> recordTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'recordType');
    });
  }

  QueryBuilder<Record, int?, QQueryOperations> sourceIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'sourceId');
    });
  }

  QueryBuilder<Record, String, QQueryOperations> summaryProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'summary');
    });
  }

  QueryBuilder<Record, String?, QQueryOperations> valueTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'valueType');
    });
  }
}

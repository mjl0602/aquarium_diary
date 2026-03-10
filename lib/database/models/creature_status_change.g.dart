// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'creature_status_change.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetCreatureStatusChangeCollection on Isar {
  IsarCollection<CreatureStatusChange> get creatureStatusChanges =>
      this.collection();
}

const CreatureStatusChangeSchema = CollectionSchema(
  name: r'CreatureStatusChange',
  id: -6671122427707910344,
  properties: {
    r'changeDate': PropertySchema(
      id: 0,
      name: r'changeDate',
      type: IsarType.dateTime,
    ),
    r'createdAt': PropertySchema(
      id: 1,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'creatureId': PropertySchema(
      id: 2,
      name: r'creatureId',
      type: IsarType.long,
    ),
    r'description': PropertySchema(
      id: 3,
      name: r'description',
      type: IsarType.string,
    ),
    r'newStatus': PropertySchema(
      id: 4,
      name: r'newStatus',
      type: IsarType.byte,
      enumMap: _CreatureStatusChangenewStatusEnumValueMap,
    ),
    r'notes': PropertySchema(id: 5, name: r'notes', type: IsarType.string),
    r'previousStatus': PropertySchema(
      id: 6,
      name: r'previousStatus',
      type: IsarType.byte,
      enumMap: _CreatureStatusChangepreviousStatusEnumValueMap,
    ),
  },

  estimateSize: _creatureStatusChangeEstimateSize,
  serialize: _creatureStatusChangeSerialize,
  deserialize: _creatureStatusChangeDeserialize,
  deserializeProp: _creatureStatusChangeDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},

  getId: _creatureStatusChangeGetId,
  getLinks: _creatureStatusChangeGetLinks,
  attach: _creatureStatusChangeAttach,
  version: '3.3.0',
);

int _creatureStatusChangeEstimateSize(
  CreatureStatusChange object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.description.length * 3;
  {
    final value = object.notes;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _creatureStatusChangeSerialize(
  CreatureStatusChange object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.changeDate);
  writer.writeDateTime(offsets[1], object.createdAt);
  writer.writeLong(offsets[2], object.creatureId);
  writer.writeString(offsets[3], object.description);
  writer.writeByte(offsets[4], object.newStatus.index);
  writer.writeString(offsets[5], object.notes);
  writer.writeByte(offsets[6], object.previousStatus.index);
}

CreatureStatusChange _creatureStatusChangeDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = CreatureStatusChange(
    changeDate: reader.readDateTime(offsets[0]),
    createdAt: reader.readDateTime(offsets[1]),
    creatureId: reader.readLong(offsets[2]),
    description: reader.readString(offsets[3]),
    newStatus:
        _CreatureStatusChangenewStatusValueEnumMap[reader.readByteOrNull(
          offsets[4],
        )] ??
        CreatureStatus.ordered,
    notes: reader.readStringOrNull(offsets[5]),
    previousStatus:
        _CreatureStatusChangepreviousStatusValueEnumMap[reader.readByteOrNull(
          offsets[6],
        )] ??
        CreatureStatus.ordered,
  );
  object.id = id;
  return object;
}

P _creatureStatusChangeDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTime(offset)) as P;
    case 1:
      return (reader.readDateTime(offset)) as P;
    case 2:
      return (reader.readLong(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (_CreatureStatusChangenewStatusValueEnumMap[reader.readByteOrNull(
                offset,
              )] ??
              CreatureStatus.ordered)
          as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    case 6:
      return (_CreatureStatusChangepreviousStatusValueEnumMap[reader
                  .readByteOrNull(offset)] ??
              CreatureStatus.ordered)
          as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _CreatureStatusChangenewStatusEnumValueMap = {
  'ordered': 0,
  'alive': 1,
  'weak': 2,
  'dead': 3,
  'missing': 4,
  'sold': 5,
  'gifted': 6,
};
const _CreatureStatusChangenewStatusValueEnumMap = {
  0: CreatureStatus.ordered,
  1: CreatureStatus.alive,
  2: CreatureStatus.weak,
  3: CreatureStatus.dead,
  4: CreatureStatus.missing,
  5: CreatureStatus.sold,
  6: CreatureStatus.gifted,
};
const _CreatureStatusChangepreviousStatusEnumValueMap = {
  'ordered': 0,
  'alive': 1,
  'weak': 2,
  'dead': 3,
  'missing': 4,
  'sold': 5,
  'gifted': 6,
};
const _CreatureStatusChangepreviousStatusValueEnumMap = {
  0: CreatureStatus.ordered,
  1: CreatureStatus.alive,
  2: CreatureStatus.weak,
  3: CreatureStatus.dead,
  4: CreatureStatus.missing,
  5: CreatureStatus.sold,
  6: CreatureStatus.gifted,
};

Id _creatureStatusChangeGetId(CreatureStatusChange object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _creatureStatusChangeGetLinks(
  CreatureStatusChange object,
) {
  return [];
}

void _creatureStatusChangeAttach(
  IsarCollection<dynamic> col,
  Id id,
  CreatureStatusChange object,
) {
  object.id = id;
}

extension CreatureStatusChangeQueryWhereSort
    on QueryBuilder<CreatureStatusChange, CreatureStatusChange, QWhere> {
  QueryBuilder<CreatureStatusChange, CreatureStatusChange, QAfterWhere>
  anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension CreatureStatusChangeQueryWhere
    on QueryBuilder<CreatureStatusChange, CreatureStatusChange, QWhereClause> {
  QueryBuilder<CreatureStatusChange, CreatureStatusChange, QAfterWhereClause>
  idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(lower: id, upper: id));
    });
  }

  QueryBuilder<CreatureStatusChange, CreatureStatusChange, QAfterWhereClause>
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

  QueryBuilder<CreatureStatusChange, CreatureStatusChange, QAfterWhereClause>
  idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<CreatureStatusChange, CreatureStatusChange, QAfterWhereClause>
  idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<CreatureStatusChange, CreatureStatusChange, QAfterWhereClause>
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

extension CreatureStatusChangeQueryFilter
    on
        QueryBuilder<
          CreatureStatusChange,
          CreatureStatusChange,
          QFilterCondition
        > {
  QueryBuilder<
    CreatureStatusChange,
    CreatureStatusChange,
    QAfterFilterCondition
  >
  changeDateEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'changeDate', value: value),
      );
    });
  }

  QueryBuilder<
    CreatureStatusChange,
    CreatureStatusChange,
    QAfterFilterCondition
  >
  changeDateGreaterThan(DateTime value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'changeDate',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    CreatureStatusChange,
    CreatureStatusChange,
    QAfterFilterCondition
  >
  changeDateLessThan(DateTime value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'changeDate',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    CreatureStatusChange,
    CreatureStatusChange,
    QAfterFilterCondition
  >
  changeDateBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'changeDate',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<
    CreatureStatusChange,
    CreatureStatusChange,
    QAfterFilterCondition
  >
  createdAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'createdAt', value: value),
      );
    });
  }

  QueryBuilder<
    CreatureStatusChange,
    CreatureStatusChange,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    CreatureStatusChange,
    CreatureStatusChange,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    CreatureStatusChange,
    CreatureStatusChange,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    CreatureStatusChange,
    CreatureStatusChange,
    QAfterFilterCondition
  >
  creatureIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'creatureId', value: value),
      );
    });
  }

  QueryBuilder<
    CreatureStatusChange,
    CreatureStatusChange,
    QAfterFilterCondition
  >
  creatureIdGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'creatureId',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    CreatureStatusChange,
    CreatureStatusChange,
    QAfterFilterCondition
  >
  creatureIdLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'creatureId',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    CreatureStatusChange,
    CreatureStatusChange,
    QAfterFilterCondition
  >
  creatureIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'creatureId',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<
    CreatureStatusChange,
    CreatureStatusChange,
    QAfterFilterCondition
  >
  descriptionEqualTo(String value, {bool caseSensitive = true}) {
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

  QueryBuilder<
    CreatureStatusChange,
    CreatureStatusChange,
    QAfterFilterCondition
  >
  descriptionGreaterThan(
    String value, {
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

  QueryBuilder<
    CreatureStatusChange,
    CreatureStatusChange,
    QAfterFilterCondition
  >
  descriptionLessThan(
    String value, {
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

  QueryBuilder<
    CreatureStatusChange,
    CreatureStatusChange,
    QAfterFilterCondition
  >
  descriptionBetween(
    String lower,
    String upper, {
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

  QueryBuilder<
    CreatureStatusChange,
    CreatureStatusChange,
    QAfterFilterCondition
  >
  descriptionStartsWith(String value, {bool caseSensitive = true}) {
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

  QueryBuilder<
    CreatureStatusChange,
    CreatureStatusChange,
    QAfterFilterCondition
  >
  descriptionEndsWith(String value, {bool caseSensitive = true}) {
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

  QueryBuilder<
    CreatureStatusChange,
    CreatureStatusChange,
    QAfterFilterCondition
  >
  descriptionContains(String value, {bool caseSensitive = true}) {
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

  QueryBuilder<
    CreatureStatusChange,
    CreatureStatusChange,
    QAfterFilterCondition
  >
  descriptionMatches(String pattern, {bool caseSensitive = true}) {
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

  QueryBuilder<
    CreatureStatusChange,
    CreatureStatusChange,
    QAfterFilterCondition
  >
  descriptionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'description', value: ''),
      );
    });
  }

  QueryBuilder<
    CreatureStatusChange,
    CreatureStatusChange,
    QAfterFilterCondition
  >
  descriptionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'description', value: ''),
      );
    });
  }

  QueryBuilder<
    CreatureStatusChange,
    CreatureStatusChange,
    QAfterFilterCondition
  >
  idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'id', value: value),
      );
    });
  }

  QueryBuilder<
    CreatureStatusChange,
    CreatureStatusChange,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    CreatureStatusChange,
    CreatureStatusChange,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    CreatureStatusChange,
    CreatureStatusChange,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    CreatureStatusChange,
    CreatureStatusChange,
    QAfterFilterCondition
  >
  newStatusEqualTo(CreatureStatus value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'newStatus', value: value),
      );
    });
  }

  QueryBuilder<
    CreatureStatusChange,
    CreatureStatusChange,
    QAfterFilterCondition
  >
  newStatusGreaterThan(CreatureStatus value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'newStatus',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    CreatureStatusChange,
    CreatureStatusChange,
    QAfterFilterCondition
  >
  newStatusLessThan(CreatureStatus value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'newStatus',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    CreatureStatusChange,
    CreatureStatusChange,
    QAfterFilterCondition
  >
  newStatusBetween(
    CreatureStatus lower,
    CreatureStatus upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'newStatus',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<
    CreatureStatusChange,
    CreatureStatusChange,
    QAfterFilterCondition
  >
  notesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'notes'),
      );
    });
  }

  QueryBuilder<
    CreatureStatusChange,
    CreatureStatusChange,
    QAfterFilterCondition
  >
  notesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'notes'),
      );
    });
  }

  QueryBuilder<
    CreatureStatusChange,
    CreatureStatusChange,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    CreatureStatusChange,
    CreatureStatusChange,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    CreatureStatusChange,
    CreatureStatusChange,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    CreatureStatusChange,
    CreatureStatusChange,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    CreatureStatusChange,
    CreatureStatusChange,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    CreatureStatusChange,
    CreatureStatusChange,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    CreatureStatusChange,
    CreatureStatusChange,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    CreatureStatusChange,
    CreatureStatusChange,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    CreatureStatusChange,
    CreatureStatusChange,
    QAfterFilterCondition
  >
  notesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'notes', value: ''),
      );
    });
  }

  QueryBuilder<
    CreatureStatusChange,
    CreatureStatusChange,
    QAfterFilterCondition
  >
  notesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'notes', value: ''),
      );
    });
  }

  QueryBuilder<
    CreatureStatusChange,
    CreatureStatusChange,
    QAfterFilterCondition
  >
  previousStatusEqualTo(CreatureStatus value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'previousStatus', value: value),
      );
    });
  }

  QueryBuilder<
    CreatureStatusChange,
    CreatureStatusChange,
    QAfterFilterCondition
  >
  previousStatusGreaterThan(CreatureStatus value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'previousStatus',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    CreatureStatusChange,
    CreatureStatusChange,
    QAfterFilterCondition
  >
  previousStatusLessThan(CreatureStatus value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'previousStatus',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    CreatureStatusChange,
    CreatureStatusChange,
    QAfterFilterCondition
  >
  previousStatusBetween(
    CreatureStatus lower,
    CreatureStatus upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'previousStatus',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }
}

extension CreatureStatusChangeQueryObject
    on
        QueryBuilder<
          CreatureStatusChange,
          CreatureStatusChange,
          QFilterCondition
        > {}

extension CreatureStatusChangeQueryLinks
    on
        QueryBuilder<
          CreatureStatusChange,
          CreatureStatusChange,
          QFilterCondition
        > {}

extension CreatureStatusChangeQuerySortBy
    on QueryBuilder<CreatureStatusChange, CreatureStatusChange, QSortBy> {
  QueryBuilder<CreatureStatusChange, CreatureStatusChange, QAfterSortBy>
  sortByChangeDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'changeDate', Sort.asc);
    });
  }

  QueryBuilder<CreatureStatusChange, CreatureStatusChange, QAfterSortBy>
  sortByChangeDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'changeDate', Sort.desc);
    });
  }

  QueryBuilder<CreatureStatusChange, CreatureStatusChange, QAfterSortBy>
  sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<CreatureStatusChange, CreatureStatusChange, QAfterSortBy>
  sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<CreatureStatusChange, CreatureStatusChange, QAfterSortBy>
  sortByCreatureId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'creatureId', Sort.asc);
    });
  }

  QueryBuilder<CreatureStatusChange, CreatureStatusChange, QAfterSortBy>
  sortByCreatureIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'creatureId', Sort.desc);
    });
  }

  QueryBuilder<CreatureStatusChange, CreatureStatusChange, QAfterSortBy>
  sortByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<CreatureStatusChange, CreatureStatusChange, QAfterSortBy>
  sortByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<CreatureStatusChange, CreatureStatusChange, QAfterSortBy>
  sortByNewStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'newStatus', Sort.asc);
    });
  }

  QueryBuilder<CreatureStatusChange, CreatureStatusChange, QAfterSortBy>
  sortByNewStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'newStatus', Sort.desc);
    });
  }

  QueryBuilder<CreatureStatusChange, CreatureStatusChange, QAfterSortBy>
  sortByNotes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.asc);
    });
  }

  QueryBuilder<CreatureStatusChange, CreatureStatusChange, QAfterSortBy>
  sortByNotesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.desc);
    });
  }

  QueryBuilder<CreatureStatusChange, CreatureStatusChange, QAfterSortBy>
  sortByPreviousStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'previousStatus', Sort.asc);
    });
  }

  QueryBuilder<CreatureStatusChange, CreatureStatusChange, QAfterSortBy>
  sortByPreviousStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'previousStatus', Sort.desc);
    });
  }
}

extension CreatureStatusChangeQuerySortThenBy
    on QueryBuilder<CreatureStatusChange, CreatureStatusChange, QSortThenBy> {
  QueryBuilder<CreatureStatusChange, CreatureStatusChange, QAfterSortBy>
  thenByChangeDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'changeDate', Sort.asc);
    });
  }

  QueryBuilder<CreatureStatusChange, CreatureStatusChange, QAfterSortBy>
  thenByChangeDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'changeDate', Sort.desc);
    });
  }

  QueryBuilder<CreatureStatusChange, CreatureStatusChange, QAfterSortBy>
  thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<CreatureStatusChange, CreatureStatusChange, QAfterSortBy>
  thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<CreatureStatusChange, CreatureStatusChange, QAfterSortBy>
  thenByCreatureId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'creatureId', Sort.asc);
    });
  }

  QueryBuilder<CreatureStatusChange, CreatureStatusChange, QAfterSortBy>
  thenByCreatureIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'creatureId', Sort.desc);
    });
  }

  QueryBuilder<CreatureStatusChange, CreatureStatusChange, QAfterSortBy>
  thenByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<CreatureStatusChange, CreatureStatusChange, QAfterSortBy>
  thenByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<CreatureStatusChange, CreatureStatusChange, QAfterSortBy>
  thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<CreatureStatusChange, CreatureStatusChange, QAfterSortBy>
  thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<CreatureStatusChange, CreatureStatusChange, QAfterSortBy>
  thenByNewStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'newStatus', Sort.asc);
    });
  }

  QueryBuilder<CreatureStatusChange, CreatureStatusChange, QAfterSortBy>
  thenByNewStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'newStatus', Sort.desc);
    });
  }

  QueryBuilder<CreatureStatusChange, CreatureStatusChange, QAfterSortBy>
  thenByNotes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.asc);
    });
  }

  QueryBuilder<CreatureStatusChange, CreatureStatusChange, QAfterSortBy>
  thenByNotesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.desc);
    });
  }

  QueryBuilder<CreatureStatusChange, CreatureStatusChange, QAfterSortBy>
  thenByPreviousStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'previousStatus', Sort.asc);
    });
  }

  QueryBuilder<CreatureStatusChange, CreatureStatusChange, QAfterSortBy>
  thenByPreviousStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'previousStatus', Sort.desc);
    });
  }
}

extension CreatureStatusChangeQueryWhereDistinct
    on QueryBuilder<CreatureStatusChange, CreatureStatusChange, QDistinct> {
  QueryBuilder<CreatureStatusChange, CreatureStatusChange, QDistinct>
  distinctByChangeDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'changeDate');
    });
  }

  QueryBuilder<CreatureStatusChange, CreatureStatusChange, QDistinct>
  distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<CreatureStatusChange, CreatureStatusChange, QDistinct>
  distinctByCreatureId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'creatureId');
    });
  }

  QueryBuilder<CreatureStatusChange, CreatureStatusChange, QDistinct>
  distinctByDescription({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'description', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CreatureStatusChange, CreatureStatusChange, QDistinct>
  distinctByNewStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'newStatus');
    });
  }

  QueryBuilder<CreatureStatusChange, CreatureStatusChange, QDistinct>
  distinctByNotes({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'notes', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CreatureStatusChange, CreatureStatusChange, QDistinct>
  distinctByPreviousStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'previousStatus');
    });
  }
}

extension CreatureStatusChangeQueryProperty
    on
        QueryBuilder<
          CreatureStatusChange,
          CreatureStatusChange,
          QQueryProperty
        > {
  QueryBuilder<CreatureStatusChange, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<CreatureStatusChange, DateTime, QQueryOperations>
  changeDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'changeDate');
    });
  }

  QueryBuilder<CreatureStatusChange, DateTime, QQueryOperations>
  createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<CreatureStatusChange, int, QQueryOperations>
  creatureIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'creatureId');
    });
  }

  QueryBuilder<CreatureStatusChange, String, QQueryOperations>
  descriptionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'description');
    });
  }

  QueryBuilder<CreatureStatusChange, CreatureStatus, QQueryOperations>
  newStatusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'newStatus');
    });
  }

  QueryBuilder<CreatureStatusChange, String?, QQueryOperations>
  notesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'notes');
    });
  }

  QueryBuilder<CreatureStatusChange, CreatureStatus, QQueryOperations>
  previousStatusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'previousStatus');
    });
  }
}

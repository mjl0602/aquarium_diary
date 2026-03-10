// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'consumable.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetConsumableCollection on Isar {
  IsarCollection<Consumable> get consumables => this.collection();
}

const ConsumableSchema = CollectionSchema(
  name: r'Consumable',
  id: -4373283478240955020,
  properties: {
    r'aquariumId': PropertySchema(
      id: 0,
      name: r'aquariumId',
      type: IsarType.long,
    ),
    r'capacity': PropertySchema(
      id: 1,
      name: r'capacity',
      type: IsarType.double,
    ),
    r'createdAt': PropertySchema(
      id: 2,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'estimatedDays': PropertySchema(
      id: 3,
      name: r'estimatedDays',
      type: IsarType.long,
    ),
    r'estimatedUses': PropertySchema(
      id: 4,
      name: r'estimatedUses',
      type: IsarType.long,
    ),
    r'isEmpty': PropertySchema(id: 5, name: r'isEmpty', type: IsarType.bool),
    r'name': PropertySchema(id: 6, name: r'name', type: IsarType.string),
    r'notes': PropertySchema(id: 7, name: r'notes', type: IsarType.string),
    r'price': PropertySchema(id: 8, name: r'price', type: IsarType.double),
    r'purchaseDate': PropertySchema(
      id: 9,
      name: r'purchaseDate',
      type: IsarType.dateTime,
    ),
    r'type': PropertySchema(
      id: 10,
      name: r'type',
      type: IsarType.byte,
      enumMap: _ConsumabletypeEnumValueMap,
    ),
    r'unit': PropertySchema(id: 11, name: r'unit', type: IsarType.string),
    r'usedCount': PropertySchema(
      id: 12,
      name: r'usedCount',
      type: IsarType.long,
    ),
    r'usedDate': PropertySchema(
      id: 13,
      name: r'usedDate',
      type: IsarType.dateTime,
    ),
  },

  estimateSize: _consumableEstimateSize,
  serialize: _consumableSerialize,
  deserialize: _consumableDeserialize,
  deserializeProp: _consumableDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},

  getId: _consumableGetId,
  getLinks: _consumableGetLinks,
  attach: _consumableAttach,
  version: '3.3.0',
);

int _consumableEstimateSize(
  Consumable object,
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
    final value = object.unit;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _consumableSerialize(
  Consumable object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.aquariumId);
  writer.writeDouble(offsets[1], object.capacity);
  writer.writeDateTime(offsets[2], object.createdAt);
  writer.writeLong(offsets[3], object.estimatedDays);
  writer.writeLong(offsets[4], object.estimatedUses);
  writer.writeBool(offsets[5], object.isEmpty);
  writer.writeString(offsets[6], object.name);
  writer.writeString(offsets[7], object.notes);
  writer.writeDouble(offsets[8], object.price);
  writer.writeDateTime(offsets[9], object.purchaseDate);
  writer.writeByte(offsets[10], object.type.index);
  writer.writeString(offsets[11], object.unit);
  writer.writeLong(offsets[12], object.usedCount);
  writer.writeDateTime(offsets[13], object.usedDate);
}

Consumable _consumableDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Consumable(
    aquariumId: reader.readLongOrNull(offsets[0]),
    capacity: reader.readDoubleOrNull(offsets[1]),
    createdAt: reader.readDateTime(offsets[2]),
    estimatedDays: reader.readLongOrNull(offsets[3]),
    estimatedUses: reader.readLongOrNull(offsets[4]),
    isEmpty: reader.readBoolOrNull(offsets[5]) ?? false,
    name: reader.readString(offsets[6]),
    notes: reader.readStringOrNull(offsets[7]),
    price: reader.readDoubleOrNull(offsets[8]),
    purchaseDate: reader.readDateTimeOrNull(offsets[9]),
    type:
        _ConsumabletypeValueEnumMap[reader.readByteOrNull(offsets[10])] ??
        ConsumableType.fishFood,
    unit: reader.readStringOrNull(offsets[11]),
    usedCount: reader.readLongOrNull(offsets[12]) ?? 0,
    usedDate: reader.readDateTimeOrNull(offsets[13]),
  );
  object.id = id;
  return object;
}

P _consumableDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLongOrNull(offset)) as P;
    case 1:
      return (reader.readDoubleOrNull(offset)) as P;
    case 2:
      return (reader.readDateTime(offset)) as P;
    case 3:
      return (reader.readLongOrNull(offset)) as P;
    case 4:
      return (reader.readLongOrNull(offset)) as P;
    case 5:
      return (reader.readBoolOrNull(offset) ?? false) as P;
    case 6:
      return (reader.readString(offset)) as P;
    case 7:
      return (reader.readStringOrNull(offset)) as P;
    case 8:
      return (reader.readDoubleOrNull(offset)) as P;
    case 9:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 10:
      return (_ConsumabletypeValueEnumMap[reader.readByteOrNull(offset)] ??
              ConsumableType.fishFood)
          as P;
    case 11:
      return (reader.readStringOrNull(offset)) as P;
    case 12:
      return (reader.readLongOrNull(offset) ?? 0) as P;
    case 13:
      return (reader.readDateTimeOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _ConsumabletypeEnumValueMap = {
  'fishFood': 0,
  'filterCotton': 1,
  'reagent': 2,
  'seaSalt': 3,
  'other': 4,
};
const _ConsumabletypeValueEnumMap = {
  0: ConsumableType.fishFood,
  1: ConsumableType.filterCotton,
  2: ConsumableType.reagent,
  3: ConsumableType.seaSalt,
  4: ConsumableType.other,
};

Id _consumableGetId(Consumable object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _consumableGetLinks(Consumable object) {
  return [];
}

void _consumableAttach(IsarCollection<dynamic> col, Id id, Consumable object) {
  object.id = id;
}

extension ConsumableQueryWhereSort
    on QueryBuilder<Consumable, Consumable, QWhere> {
  QueryBuilder<Consumable, Consumable, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension ConsumableQueryWhere
    on QueryBuilder<Consumable, Consumable, QWhereClause> {
  QueryBuilder<Consumable, Consumable, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(lower: id, upper: id));
    });
  }

  QueryBuilder<Consumable, Consumable, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<Consumable, Consumable, QAfterWhereClause> idGreaterThan(
    Id id, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Consumable, Consumable, QAfterWhereClause> idLessThan(
    Id id, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Consumable, Consumable, QAfterWhereClause> idBetween(
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

extension ConsumableQueryFilter
    on QueryBuilder<Consumable, Consumable, QFilterCondition> {
  QueryBuilder<Consumable, Consumable, QAfterFilterCondition>
  aquariumIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'aquariumId'),
      );
    });
  }

  QueryBuilder<Consumable, Consumable, QAfterFilterCondition>
  aquariumIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'aquariumId'),
      );
    });
  }

  QueryBuilder<Consumable, Consumable, QAfterFilterCondition> aquariumIdEqualTo(
    int? value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'aquariumId', value: value),
      );
    });
  }

  QueryBuilder<Consumable, Consumable, QAfterFilterCondition>
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

  QueryBuilder<Consumable, Consumable, QAfterFilterCondition>
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

  QueryBuilder<Consumable, Consumable, QAfterFilterCondition> aquariumIdBetween(
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

  QueryBuilder<Consumable, Consumable, QAfterFilterCondition> capacityIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'capacity'),
      );
    });
  }

  QueryBuilder<Consumable, Consumable, QAfterFilterCondition>
  capacityIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'capacity'),
      );
    });
  }

  QueryBuilder<Consumable, Consumable, QAfterFilterCondition> capacityEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'capacity',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<Consumable, Consumable, QAfterFilterCondition>
  capacityGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'capacity',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<Consumable, Consumable, QAfterFilterCondition> capacityLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'capacity',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<Consumable, Consumable, QAfterFilterCondition> capacityBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'capacity',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<Consumable, Consumable, QAfterFilterCondition> createdAtEqualTo(
    DateTime value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'createdAt', value: value),
      );
    });
  }

  QueryBuilder<Consumable, Consumable, QAfterFilterCondition>
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

  QueryBuilder<Consumable, Consumable, QAfterFilterCondition> createdAtLessThan(
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

  QueryBuilder<Consumable, Consumable, QAfterFilterCondition> createdAtBetween(
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

  QueryBuilder<Consumable, Consumable, QAfterFilterCondition>
  estimatedDaysIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'estimatedDays'),
      );
    });
  }

  QueryBuilder<Consumable, Consumable, QAfterFilterCondition>
  estimatedDaysIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'estimatedDays'),
      );
    });
  }

  QueryBuilder<Consumable, Consumable, QAfterFilterCondition>
  estimatedDaysEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'estimatedDays', value: value),
      );
    });
  }

  QueryBuilder<Consumable, Consumable, QAfterFilterCondition>
  estimatedDaysGreaterThan(int? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'estimatedDays',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Consumable, Consumable, QAfterFilterCondition>
  estimatedDaysLessThan(int? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'estimatedDays',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Consumable, Consumable, QAfterFilterCondition>
  estimatedDaysBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'estimatedDays',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<Consumable, Consumable, QAfterFilterCondition>
  estimatedUsesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'estimatedUses'),
      );
    });
  }

  QueryBuilder<Consumable, Consumable, QAfterFilterCondition>
  estimatedUsesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'estimatedUses'),
      );
    });
  }

  QueryBuilder<Consumable, Consumable, QAfterFilterCondition>
  estimatedUsesEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'estimatedUses', value: value),
      );
    });
  }

  QueryBuilder<Consumable, Consumable, QAfterFilterCondition>
  estimatedUsesGreaterThan(int? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'estimatedUses',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Consumable, Consumable, QAfterFilterCondition>
  estimatedUsesLessThan(int? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'estimatedUses',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Consumable, Consumable, QAfterFilterCondition>
  estimatedUsesBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'estimatedUses',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<Consumable, Consumable, QAfterFilterCondition> idEqualTo(
    Id value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'id', value: value),
      );
    });
  }

  QueryBuilder<Consumable, Consumable, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Consumable, Consumable, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Consumable, Consumable, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Consumable, Consumable, QAfterFilterCondition> isEmptyEqualTo(
    bool value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'isEmpty', value: value),
      );
    });
  }

  QueryBuilder<Consumable, Consumable, QAfterFilterCondition> nameEqualTo(
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

  QueryBuilder<Consumable, Consumable, QAfterFilterCondition> nameGreaterThan(
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

  QueryBuilder<Consumable, Consumable, QAfterFilterCondition> nameLessThan(
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

  QueryBuilder<Consumable, Consumable, QAfterFilterCondition> nameBetween(
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

  QueryBuilder<Consumable, Consumable, QAfterFilterCondition> nameStartsWith(
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

  QueryBuilder<Consumable, Consumable, QAfterFilterCondition> nameEndsWith(
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

  QueryBuilder<Consumable, Consumable, QAfterFilterCondition> nameContains(
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

  QueryBuilder<Consumable, Consumable, QAfterFilterCondition> nameMatches(
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

  QueryBuilder<Consumable, Consumable, QAfterFilterCondition> nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'name', value: ''),
      );
    });
  }

  QueryBuilder<Consumable, Consumable, QAfterFilterCondition> nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'name', value: ''),
      );
    });
  }

  QueryBuilder<Consumable, Consumable, QAfterFilterCondition> notesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'notes'),
      );
    });
  }

  QueryBuilder<Consumable, Consumable, QAfterFilterCondition> notesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'notes'),
      );
    });
  }

  QueryBuilder<Consumable, Consumable, QAfterFilterCondition> notesEqualTo(
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

  QueryBuilder<Consumable, Consumable, QAfterFilterCondition> notesGreaterThan(
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

  QueryBuilder<Consumable, Consumable, QAfterFilterCondition> notesLessThan(
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

  QueryBuilder<Consumable, Consumable, QAfterFilterCondition> notesBetween(
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

  QueryBuilder<Consumable, Consumable, QAfterFilterCondition> notesStartsWith(
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

  QueryBuilder<Consumable, Consumable, QAfterFilterCondition> notesEndsWith(
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

  QueryBuilder<Consumable, Consumable, QAfterFilterCondition> notesContains(
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

  QueryBuilder<Consumable, Consumable, QAfterFilterCondition> notesMatches(
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

  QueryBuilder<Consumable, Consumable, QAfterFilterCondition> notesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'notes', value: ''),
      );
    });
  }

  QueryBuilder<Consumable, Consumable, QAfterFilterCondition>
  notesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'notes', value: ''),
      );
    });
  }

  QueryBuilder<Consumable, Consumable, QAfterFilterCondition> priceIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'price'),
      );
    });
  }

  QueryBuilder<Consumable, Consumable, QAfterFilterCondition> priceIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'price'),
      );
    });
  }

  QueryBuilder<Consumable, Consumable, QAfterFilterCondition> priceEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'price',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<Consumable, Consumable, QAfterFilterCondition> priceGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'price',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<Consumable, Consumable, QAfterFilterCondition> priceLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'price',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<Consumable, Consumable, QAfterFilterCondition> priceBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'price',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<Consumable, Consumable, QAfterFilterCondition>
  purchaseDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'purchaseDate'),
      );
    });
  }

  QueryBuilder<Consumable, Consumable, QAfterFilterCondition>
  purchaseDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'purchaseDate'),
      );
    });
  }

  QueryBuilder<Consumable, Consumable, QAfterFilterCondition>
  purchaseDateEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'purchaseDate', value: value),
      );
    });
  }

  QueryBuilder<Consumable, Consumable, QAfterFilterCondition>
  purchaseDateGreaterThan(DateTime? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'purchaseDate',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Consumable, Consumable, QAfterFilterCondition>
  purchaseDateLessThan(DateTime? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'purchaseDate',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Consumable, Consumable, QAfterFilterCondition>
  purchaseDateBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'purchaseDate',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<Consumable, Consumable, QAfterFilterCondition> typeEqualTo(
    ConsumableType value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'type', value: value),
      );
    });
  }

  QueryBuilder<Consumable, Consumable, QAfterFilterCondition> typeGreaterThan(
    ConsumableType value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'type',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Consumable, Consumable, QAfterFilterCondition> typeLessThan(
    ConsumableType value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'type',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Consumable, Consumable, QAfterFilterCondition> typeBetween(
    ConsumableType lower,
    ConsumableType upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'type',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<Consumable, Consumable, QAfterFilterCondition> unitIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'unit'),
      );
    });
  }

  QueryBuilder<Consumable, Consumable, QAfterFilterCondition> unitIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'unit'),
      );
    });
  }

  QueryBuilder<Consumable, Consumable, QAfterFilterCondition> unitEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'unit',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Consumable, Consumable, QAfterFilterCondition> unitGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'unit',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Consumable, Consumable, QAfterFilterCondition> unitLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'unit',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Consumable, Consumable, QAfterFilterCondition> unitBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'unit',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Consumable, Consumable, QAfterFilterCondition> unitStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'unit',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Consumable, Consumable, QAfterFilterCondition> unitEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'unit',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Consumable, Consumable, QAfterFilterCondition> unitContains(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'unit',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Consumable, Consumable, QAfterFilterCondition> unitMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'unit',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Consumable, Consumable, QAfterFilterCondition> unitIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'unit', value: ''),
      );
    });
  }

  QueryBuilder<Consumable, Consumable, QAfterFilterCondition> unitIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'unit', value: ''),
      );
    });
  }

  QueryBuilder<Consumable, Consumable, QAfterFilterCondition> usedCountEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'usedCount', value: value),
      );
    });
  }

  QueryBuilder<Consumable, Consumable, QAfterFilterCondition>
  usedCountGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'usedCount',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Consumable, Consumable, QAfterFilterCondition> usedCountLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'usedCount',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Consumable, Consumable, QAfterFilterCondition> usedCountBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'usedCount',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<Consumable, Consumable, QAfterFilterCondition> usedDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'usedDate'),
      );
    });
  }

  QueryBuilder<Consumable, Consumable, QAfterFilterCondition>
  usedDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'usedDate'),
      );
    });
  }

  QueryBuilder<Consumable, Consumable, QAfterFilterCondition> usedDateEqualTo(
    DateTime? value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'usedDate', value: value),
      );
    });
  }

  QueryBuilder<Consumable, Consumable, QAfterFilterCondition>
  usedDateGreaterThan(DateTime? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'usedDate',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Consumable, Consumable, QAfterFilterCondition> usedDateLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'usedDate',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Consumable, Consumable, QAfterFilterCondition> usedDateBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'usedDate',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }
}

extension ConsumableQueryObject
    on QueryBuilder<Consumable, Consumable, QFilterCondition> {}

extension ConsumableQueryLinks
    on QueryBuilder<Consumable, Consumable, QFilterCondition> {}

extension ConsumableQuerySortBy
    on QueryBuilder<Consumable, Consumable, QSortBy> {
  QueryBuilder<Consumable, Consumable, QAfterSortBy> sortByAquariumId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'aquariumId', Sort.asc);
    });
  }

  QueryBuilder<Consumable, Consumable, QAfterSortBy> sortByAquariumIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'aquariumId', Sort.desc);
    });
  }

  QueryBuilder<Consumable, Consumable, QAfterSortBy> sortByCapacity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'capacity', Sort.asc);
    });
  }

  QueryBuilder<Consumable, Consumable, QAfterSortBy> sortByCapacityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'capacity', Sort.desc);
    });
  }

  QueryBuilder<Consumable, Consumable, QAfterSortBy> sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<Consumable, Consumable, QAfterSortBy> sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<Consumable, Consumable, QAfterSortBy> sortByEstimatedDays() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estimatedDays', Sort.asc);
    });
  }

  QueryBuilder<Consumable, Consumable, QAfterSortBy> sortByEstimatedDaysDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estimatedDays', Sort.desc);
    });
  }

  QueryBuilder<Consumable, Consumable, QAfterSortBy> sortByEstimatedUses() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estimatedUses', Sort.asc);
    });
  }

  QueryBuilder<Consumable, Consumable, QAfterSortBy> sortByEstimatedUsesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estimatedUses', Sort.desc);
    });
  }

  QueryBuilder<Consumable, Consumable, QAfterSortBy> sortByIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isEmpty', Sort.asc);
    });
  }

  QueryBuilder<Consumable, Consumable, QAfterSortBy> sortByIsEmptyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isEmpty', Sort.desc);
    });
  }

  QueryBuilder<Consumable, Consumable, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<Consumable, Consumable, QAfterSortBy> sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<Consumable, Consumable, QAfterSortBy> sortByNotes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.asc);
    });
  }

  QueryBuilder<Consumable, Consumable, QAfterSortBy> sortByNotesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.desc);
    });
  }

  QueryBuilder<Consumable, Consumable, QAfterSortBy> sortByPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'price', Sort.asc);
    });
  }

  QueryBuilder<Consumable, Consumable, QAfterSortBy> sortByPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'price', Sort.desc);
    });
  }

  QueryBuilder<Consumable, Consumable, QAfterSortBy> sortByPurchaseDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'purchaseDate', Sort.asc);
    });
  }

  QueryBuilder<Consumable, Consumable, QAfterSortBy> sortByPurchaseDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'purchaseDate', Sort.desc);
    });
  }

  QueryBuilder<Consumable, Consumable, QAfterSortBy> sortByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.asc);
    });
  }

  QueryBuilder<Consumable, Consumable, QAfterSortBy> sortByTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.desc);
    });
  }

  QueryBuilder<Consumable, Consumable, QAfterSortBy> sortByUnit() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unit', Sort.asc);
    });
  }

  QueryBuilder<Consumable, Consumable, QAfterSortBy> sortByUnitDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unit', Sort.desc);
    });
  }

  QueryBuilder<Consumable, Consumable, QAfterSortBy> sortByUsedCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'usedCount', Sort.asc);
    });
  }

  QueryBuilder<Consumable, Consumable, QAfterSortBy> sortByUsedCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'usedCount', Sort.desc);
    });
  }

  QueryBuilder<Consumable, Consumable, QAfterSortBy> sortByUsedDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'usedDate', Sort.asc);
    });
  }

  QueryBuilder<Consumable, Consumable, QAfterSortBy> sortByUsedDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'usedDate', Sort.desc);
    });
  }
}

extension ConsumableQuerySortThenBy
    on QueryBuilder<Consumable, Consumable, QSortThenBy> {
  QueryBuilder<Consumable, Consumable, QAfterSortBy> thenByAquariumId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'aquariumId', Sort.asc);
    });
  }

  QueryBuilder<Consumable, Consumable, QAfterSortBy> thenByAquariumIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'aquariumId', Sort.desc);
    });
  }

  QueryBuilder<Consumable, Consumable, QAfterSortBy> thenByCapacity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'capacity', Sort.asc);
    });
  }

  QueryBuilder<Consumable, Consumable, QAfterSortBy> thenByCapacityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'capacity', Sort.desc);
    });
  }

  QueryBuilder<Consumable, Consumable, QAfterSortBy> thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<Consumable, Consumable, QAfterSortBy> thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<Consumable, Consumable, QAfterSortBy> thenByEstimatedDays() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estimatedDays', Sort.asc);
    });
  }

  QueryBuilder<Consumable, Consumable, QAfterSortBy> thenByEstimatedDaysDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estimatedDays', Sort.desc);
    });
  }

  QueryBuilder<Consumable, Consumable, QAfterSortBy> thenByEstimatedUses() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estimatedUses', Sort.asc);
    });
  }

  QueryBuilder<Consumable, Consumable, QAfterSortBy> thenByEstimatedUsesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estimatedUses', Sort.desc);
    });
  }

  QueryBuilder<Consumable, Consumable, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Consumable, Consumable, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Consumable, Consumable, QAfterSortBy> thenByIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isEmpty', Sort.asc);
    });
  }

  QueryBuilder<Consumable, Consumable, QAfterSortBy> thenByIsEmptyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isEmpty', Sort.desc);
    });
  }

  QueryBuilder<Consumable, Consumable, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<Consumable, Consumable, QAfterSortBy> thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<Consumable, Consumable, QAfterSortBy> thenByNotes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.asc);
    });
  }

  QueryBuilder<Consumable, Consumable, QAfterSortBy> thenByNotesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.desc);
    });
  }

  QueryBuilder<Consumable, Consumable, QAfterSortBy> thenByPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'price', Sort.asc);
    });
  }

  QueryBuilder<Consumable, Consumable, QAfterSortBy> thenByPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'price', Sort.desc);
    });
  }

  QueryBuilder<Consumable, Consumable, QAfterSortBy> thenByPurchaseDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'purchaseDate', Sort.asc);
    });
  }

  QueryBuilder<Consumable, Consumable, QAfterSortBy> thenByPurchaseDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'purchaseDate', Sort.desc);
    });
  }

  QueryBuilder<Consumable, Consumable, QAfterSortBy> thenByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.asc);
    });
  }

  QueryBuilder<Consumable, Consumable, QAfterSortBy> thenByTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.desc);
    });
  }

  QueryBuilder<Consumable, Consumable, QAfterSortBy> thenByUnit() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unit', Sort.asc);
    });
  }

  QueryBuilder<Consumable, Consumable, QAfterSortBy> thenByUnitDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unit', Sort.desc);
    });
  }

  QueryBuilder<Consumable, Consumable, QAfterSortBy> thenByUsedCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'usedCount', Sort.asc);
    });
  }

  QueryBuilder<Consumable, Consumable, QAfterSortBy> thenByUsedCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'usedCount', Sort.desc);
    });
  }

  QueryBuilder<Consumable, Consumable, QAfterSortBy> thenByUsedDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'usedDate', Sort.asc);
    });
  }

  QueryBuilder<Consumable, Consumable, QAfterSortBy> thenByUsedDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'usedDate', Sort.desc);
    });
  }
}

extension ConsumableQueryWhereDistinct
    on QueryBuilder<Consumable, Consumable, QDistinct> {
  QueryBuilder<Consumable, Consumable, QDistinct> distinctByAquariumId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'aquariumId');
    });
  }

  QueryBuilder<Consumable, Consumable, QDistinct> distinctByCapacity() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'capacity');
    });
  }

  QueryBuilder<Consumable, Consumable, QDistinct> distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<Consumable, Consumable, QDistinct> distinctByEstimatedDays() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'estimatedDays');
    });
  }

  QueryBuilder<Consumable, Consumable, QDistinct> distinctByEstimatedUses() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'estimatedUses');
    });
  }

  QueryBuilder<Consumable, Consumable, QDistinct> distinctByIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isEmpty');
    });
  }

  QueryBuilder<Consumable, Consumable, QDistinct> distinctByName({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Consumable, Consumable, QDistinct> distinctByNotes({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'notes', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Consumable, Consumable, QDistinct> distinctByPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'price');
    });
  }

  QueryBuilder<Consumable, Consumable, QDistinct> distinctByPurchaseDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'purchaseDate');
    });
  }

  QueryBuilder<Consumable, Consumable, QDistinct> distinctByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'type');
    });
  }

  QueryBuilder<Consumable, Consumable, QDistinct> distinctByUnit({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'unit', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Consumable, Consumable, QDistinct> distinctByUsedCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'usedCount');
    });
  }

  QueryBuilder<Consumable, Consumable, QDistinct> distinctByUsedDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'usedDate');
    });
  }
}

extension ConsumableQueryProperty
    on QueryBuilder<Consumable, Consumable, QQueryProperty> {
  QueryBuilder<Consumable, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Consumable, int?, QQueryOperations> aquariumIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'aquariumId');
    });
  }

  QueryBuilder<Consumable, double?, QQueryOperations> capacityProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'capacity');
    });
  }

  QueryBuilder<Consumable, DateTime, QQueryOperations> createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<Consumable, int?, QQueryOperations> estimatedDaysProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'estimatedDays');
    });
  }

  QueryBuilder<Consumable, int?, QQueryOperations> estimatedUsesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'estimatedUses');
    });
  }

  QueryBuilder<Consumable, bool, QQueryOperations> isEmptyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isEmpty');
    });
  }

  QueryBuilder<Consumable, String, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<Consumable, String?, QQueryOperations> notesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'notes');
    });
  }

  QueryBuilder<Consumable, double?, QQueryOperations> priceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'price');
    });
  }

  QueryBuilder<Consumable, DateTime?, QQueryOperations> purchaseDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'purchaseDate');
    });
  }

  QueryBuilder<Consumable, ConsumableType, QQueryOperations> typeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'type');
    });
  }

  QueryBuilder<Consumable, String?, QQueryOperations> unitProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'unit');
    });
  }

  QueryBuilder<Consumable, int, QQueryOperations> usedCountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'usedCount');
    });
  }

  QueryBuilder<Consumable, DateTime?, QQueryOperations> usedDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'usedDate');
    });
  }
}

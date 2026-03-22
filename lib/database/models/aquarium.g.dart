// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'aquarium.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetAquariumCollection on Isar {
  IsarCollection<Aquarium> get aquariums => this.collection();
}

const AquariumSchema = CollectionSchema(
  name: r'Aquarium',
  id: -1123249593868901372,
  properties: {
    r'capacityLiter': PropertySchema(
      id: 0,
      name: r'capacityLiter',
      type: IsarType.double,
    ),
    r'createdAt': PropertySchema(
      id: 1,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'heightMm': PropertySchema(id: 2, name: r'heightMm', type: IsarType.long),
    r'isActive': PropertySchema(id: 3, name: r'isActive', type: IsarType.bool),
    r'lengthMm': PropertySchema(id: 4, name: r'lengthMm', type: IsarType.long),
    r'name': PropertySchema(id: 5, name: r'name', type: IsarType.string),
    r'notes': PropertySchema(id: 6, name: r'notes', type: IsarType.string),
    r'startDate': PropertySchema(
      id: 7,
      name: r'startDate',
      type: IsarType.dateTime,
    ),
    r'structure': PropertySchema(
      id: 8,
      name: r'structure',
      type: IsarType.byte,
      enumMap: _AquariumstructureEnumValueMap,
    ),
    r'widthMm': PropertySchema(id: 9, name: r'widthMm', type: IsarType.long),
  },

  estimateSize: _aquariumEstimateSize,
  serialize: _aquariumSerialize,
  deserialize: _aquariumDeserialize,
  deserializeProp: _aquariumDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},

  getId: _aquariumGetId,
  getLinks: _aquariumGetLinks,
  attach: _aquariumAttach,
  version: '3.3.0',
);

int _aquariumEstimateSize(
  Aquarium object,
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
  return bytesCount;
}

void _aquariumSerialize(
  Aquarium object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDouble(offsets[0], object.capacityLiter);
  writer.writeDateTime(offsets[1], object.createdAt);
  writer.writeLong(offsets[2], object.heightMm);
  writer.writeBool(offsets[3], object.isActive);
  writer.writeLong(offsets[4], object.lengthMm);
  writer.writeString(offsets[5], object.name);
  writer.writeString(offsets[6], object.notes);
  writer.writeDateTime(offsets[7], object.startDate);
  writer.writeByte(offsets[8], object.structure.index);
  writer.writeLong(offsets[9], object.widthMm);
}

Aquarium _aquariumDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Aquarium(
    capacityLiter: reader.readDoubleOrNull(offsets[0]),
    createdAt: reader.readDateTime(offsets[1]),
    heightMm: reader.readLongOrNull(offsets[2]),
    isActive: reader.readBoolOrNull(offsets[3]) ?? true,
    lengthMm: reader.readLongOrNull(offsets[4]),
    name: reader.readString(offsets[5]),
    notes: reader.readStringOrNull(offsets[6]),
    startDate: reader.readDateTimeOrNull(offsets[7]),
    structure:
        _AquariumstructureValueEnumMap[reader.readByteOrNull(offsets[8])] ??
        AquariumStructure.bottomFilter,
    widthMm: reader.readLongOrNull(offsets[9]),
  );
  object.id = id;
  return object;
}

P _aquariumDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDoubleOrNull(offset)) as P;
    case 1:
      return (reader.readDateTime(offset)) as P;
    case 2:
      return (reader.readLongOrNull(offset)) as P;
    case 3:
      return (reader.readBoolOrNull(offset) ?? true) as P;
    case 4:
      return (reader.readLongOrNull(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader.readStringOrNull(offset)) as P;
    case 7:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 8:
      return (_AquariumstructureValueEnumMap[reader.readByteOrNull(offset)] ??
              AquariumStructure.bottomFilter)
          as P;
    case 9:
      return (reader.readLongOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _AquariumstructureEnumValueMap = {
  'bottomFilter': 0,
  'backFilter': 1,
  'topFilter': 2,
  'hangOn': 3,
  'diy': 4,
  'bare': 5,
};
const _AquariumstructureValueEnumMap = {
  0: AquariumStructure.bottomFilter,
  1: AquariumStructure.backFilter,
  2: AquariumStructure.topFilter,
  3: AquariumStructure.hangOn,
  4: AquariumStructure.diy,
  5: AquariumStructure.bare,
};

Id _aquariumGetId(Aquarium object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _aquariumGetLinks(Aquarium object) {
  return [];
}

void _aquariumAttach(IsarCollection<dynamic> col, Id id, Aquarium object) {
  object.id = id;
}

extension AquariumQueryWhereSort on QueryBuilder<Aquarium, Aquarium, QWhere> {
  QueryBuilder<Aquarium, Aquarium, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension AquariumQueryWhere on QueryBuilder<Aquarium, Aquarium, QWhereClause> {
  QueryBuilder<Aquarium, Aquarium, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(lower: id, upper: id));
    });
  }

  QueryBuilder<Aquarium, Aquarium, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<Aquarium, Aquarium, QAfterWhereClause> idGreaterThan(
    Id id, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Aquarium, Aquarium, QAfterWhereClause> idLessThan(
    Id id, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Aquarium, Aquarium, QAfterWhereClause> idBetween(
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

extension AquariumQueryFilter
    on QueryBuilder<Aquarium, Aquarium, QFilterCondition> {
  QueryBuilder<Aquarium, Aquarium, QAfterFilterCondition>
  capacityLiterIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'capacityLiter'),
      );
    });
  }

  QueryBuilder<Aquarium, Aquarium, QAfterFilterCondition>
  capacityLiterIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'capacityLiter'),
      );
    });
  }

  QueryBuilder<Aquarium, Aquarium, QAfterFilterCondition> capacityLiterEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'capacityLiter',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<Aquarium, Aquarium, QAfterFilterCondition>
  capacityLiterGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'capacityLiter',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<Aquarium, Aquarium, QAfterFilterCondition> capacityLiterLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'capacityLiter',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<Aquarium, Aquarium, QAfterFilterCondition> capacityLiterBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'capacityLiter',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<Aquarium, Aquarium, QAfterFilterCondition> createdAtEqualTo(
    DateTime value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'createdAt', value: value),
      );
    });
  }

  QueryBuilder<Aquarium, Aquarium, QAfterFilterCondition> createdAtGreaterThan(
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

  QueryBuilder<Aquarium, Aquarium, QAfterFilterCondition> createdAtLessThan(
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

  QueryBuilder<Aquarium, Aquarium, QAfterFilterCondition> createdAtBetween(
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

  QueryBuilder<Aquarium, Aquarium, QAfterFilterCondition> heightMmIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'heightMm'),
      );
    });
  }

  QueryBuilder<Aquarium, Aquarium, QAfterFilterCondition> heightMmIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'heightMm'),
      );
    });
  }

  QueryBuilder<Aquarium, Aquarium, QAfterFilterCondition> heightMmEqualTo(
    int? value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'heightMm', value: value),
      );
    });
  }

  QueryBuilder<Aquarium, Aquarium, QAfterFilterCondition> heightMmGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'heightMm',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Aquarium, Aquarium, QAfterFilterCondition> heightMmLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'heightMm',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Aquarium, Aquarium, QAfterFilterCondition> heightMmBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'heightMm',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<Aquarium, Aquarium, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'id', value: value),
      );
    });
  }

  QueryBuilder<Aquarium, Aquarium, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Aquarium, Aquarium, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Aquarium, Aquarium, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Aquarium, Aquarium, QAfterFilterCondition> isActiveEqualTo(
    bool value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'isActive', value: value),
      );
    });
  }

  QueryBuilder<Aquarium, Aquarium, QAfterFilterCondition> lengthMmIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'lengthMm'),
      );
    });
  }

  QueryBuilder<Aquarium, Aquarium, QAfterFilterCondition> lengthMmIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'lengthMm'),
      );
    });
  }

  QueryBuilder<Aquarium, Aquarium, QAfterFilterCondition> lengthMmEqualTo(
    int? value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'lengthMm', value: value),
      );
    });
  }

  QueryBuilder<Aquarium, Aquarium, QAfterFilterCondition> lengthMmGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'lengthMm',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Aquarium, Aquarium, QAfterFilterCondition> lengthMmLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'lengthMm',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Aquarium, Aquarium, QAfterFilterCondition> lengthMmBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'lengthMm',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<Aquarium, Aquarium, QAfterFilterCondition> nameEqualTo(
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

  QueryBuilder<Aquarium, Aquarium, QAfterFilterCondition> nameGreaterThan(
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

  QueryBuilder<Aquarium, Aquarium, QAfterFilterCondition> nameLessThan(
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

  QueryBuilder<Aquarium, Aquarium, QAfterFilterCondition> nameBetween(
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

  QueryBuilder<Aquarium, Aquarium, QAfterFilterCondition> nameStartsWith(
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

  QueryBuilder<Aquarium, Aquarium, QAfterFilterCondition> nameEndsWith(
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

  QueryBuilder<Aquarium, Aquarium, QAfterFilterCondition> nameContains(
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

  QueryBuilder<Aquarium, Aquarium, QAfterFilterCondition> nameMatches(
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

  QueryBuilder<Aquarium, Aquarium, QAfterFilterCondition> nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'name', value: ''),
      );
    });
  }

  QueryBuilder<Aquarium, Aquarium, QAfterFilterCondition> nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'name', value: ''),
      );
    });
  }

  QueryBuilder<Aquarium, Aquarium, QAfterFilterCondition> notesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'notes'),
      );
    });
  }

  QueryBuilder<Aquarium, Aquarium, QAfterFilterCondition> notesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'notes'),
      );
    });
  }

  QueryBuilder<Aquarium, Aquarium, QAfterFilterCondition> notesEqualTo(
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

  QueryBuilder<Aquarium, Aquarium, QAfterFilterCondition> notesGreaterThan(
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

  QueryBuilder<Aquarium, Aquarium, QAfterFilterCondition> notesLessThan(
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

  QueryBuilder<Aquarium, Aquarium, QAfterFilterCondition> notesBetween(
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

  QueryBuilder<Aquarium, Aquarium, QAfterFilterCondition> notesStartsWith(
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

  QueryBuilder<Aquarium, Aquarium, QAfterFilterCondition> notesEndsWith(
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

  QueryBuilder<Aquarium, Aquarium, QAfterFilterCondition> notesContains(
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

  QueryBuilder<Aquarium, Aquarium, QAfterFilterCondition> notesMatches(
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

  QueryBuilder<Aquarium, Aquarium, QAfterFilterCondition> notesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'notes', value: ''),
      );
    });
  }

  QueryBuilder<Aquarium, Aquarium, QAfterFilterCondition> notesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'notes', value: ''),
      );
    });
  }

  QueryBuilder<Aquarium, Aquarium, QAfterFilterCondition> startDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'startDate'),
      );
    });
  }

  QueryBuilder<Aquarium, Aquarium, QAfterFilterCondition> startDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'startDate'),
      );
    });
  }

  QueryBuilder<Aquarium, Aquarium, QAfterFilterCondition> startDateEqualTo(
    DateTime? value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'startDate', value: value),
      );
    });
  }

  QueryBuilder<Aquarium, Aquarium, QAfterFilterCondition> startDateGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'startDate',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Aquarium, Aquarium, QAfterFilterCondition> startDateLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'startDate',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Aquarium, Aquarium, QAfterFilterCondition> startDateBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'startDate',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<Aquarium, Aquarium, QAfterFilterCondition> structureEqualTo(
    AquariumStructure value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'structure', value: value),
      );
    });
  }

  QueryBuilder<Aquarium, Aquarium, QAfterFilterCondition> structureGreaterThan(
    AquariumStructure value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'structure',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Aquarium, Aquarium, QAfterFilterCondition> structureLessThan(
    AquariumStructure value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'structure',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Aquarium, Aquarium, QAfterFilterCondition> structureBetween(
    AquariumStructure lower,
    AquariumStructure upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'structure',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<Aquarium, Aquarium, QAfterFilterCondition> widthMmIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'widthMm'),
      );
    });
  }

  QueryBuilder<Aquarium, Aquarium, QAfterFilterCondition> widthMmIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'widthMm'),
      );
    });
  }

  QueryBuilder<Aquarium, Aquarium, QAfterFilterCondition> widthMmEqualTo(
    int? value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'widthMm', value: value),
      );
    });
  }

  QueryBuilder<Aquarium, Aquarium, QAfterFilterCondition> widthMmGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'widthMm',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Aquarium, Aquarium, QAfterFilterCondition> widthMmLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'widthMm',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Aquarium, Aquarium, QAfterFilterCondition> widthMmBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'widthMm',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }
}

extension AquariumQueryObject
    on QueryBuilder<Aquarium, Aquarium, QFilterCondition> {}

extension AquariumQueryLinks
    on QueryBuilder<Aquarium, Aquarium, QFilterCondition> {}

extension AquariumQuerySortBy on QueryBuilder<Aquarium, Aquarium, QSortBy> {
  QueryBuilder<Aquarium, Aquarium, QAfterSortBy> sortByCapacityLiter() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'capacityLiter', Sort.asc);
    });
  }

  QueryBuilder<Aquarium, Aquarium, QAfterSortBy> sortByCapacityLiterDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'capacityLiter', Sort.desc);
    });
  }

  QueryBuilder<Aquarium, Aquarium, QAfterSortBy> sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<Aquarium, Aquarium, QAfterSortBy> sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<Aquarium, Aquarium, QAfterSortBy> sortByHeightMm() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'heightMm', Sort.asc);
    });
  }

  QueryBuilder<Aquarium, Aquarium, QAfterSortBy> sortByHeightMmDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'heightMm', Sort.desc);
    });
  }

  QueryBuilder<Aquarium, Aquarium, QAfterSortBy> sortByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.asc);
    });
  }

  QueryBuilder<Aquarium, Aquarium, QAfterSortBy> sortByIsActiveDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.desc);
    });
  }

  QueryBuilder<Aquarium, Aquarium, QAfterSortBy> sortByLengthMm() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lengthMm', Sort.asc);
    });
  }

  QueryBuilder<Aquarium, Aquarium, QAfterSortBy> sortByLengthMmDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lengthMm', Sort.desc);
    });
  }

  QueryBuilder<Aquarium, Aquarium, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<Aquarium, Aquarium, QAfterSortBy> sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<Aquarium, Aquarium, QAfterSortBy> sortByNotes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.asc);
    });
  }

  QueryBuilder<Aquarium, Aquarium, QAfterSortBy> sortByNotesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.desc);
    });
  }

  QueryBuilder<Aquarium, Aquarium, QAfterSortBy> sortByStartDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startDate', Sort.asc);
    });
  }

  QueryBuilder<Aquarium, Aquarium, QAfterSortBy> sortByStartDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startDate', Sort.desc);
    });
  }

  QueryBuilder<Aquarium, Aquarium, QAfterSortBy> sortByStructure() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'structure', Sort.asc);
    });
  }

  QueryBuilder<Aquarium, Aquarium, QAfterSortBy> sortByStructureDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'structure', Sort.desc);
    });
  }

  QueryBuilder<Aquarium, Aquarium, QAfterSortBy> sortByWidthMm() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'widthMm', Sort.asc);
    });
  }

  QueryBuilder<Aquarium, Aquarium, QAfterSortBy> sortByWidthMmDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'widthMm', Sort.desc);
    });
  }
}

extension AquariumQuerySortThenBy
    on QueryBuilder<Aquarium, Aquarium, QSortThenBy> {
  QueryBuilder<Aquarium, Aquarium, QAfterSortBy> thenByCapacityLiter() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'capacityLiter', Sort.asc);
    });
  }

  QueryBuilder<Aquarium, Aquarium, QAfterSortBy> thenByCapacityLiterDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'capacityLiter', Sort.desc);
    });
  }

  QueryBuilder<Aquarium, Aquarium, QAfterSortBy> thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<Aquarium, Aquarium, QAfterSortBy> thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<Aquarium, Aquarium, QAfterSortBy> thenByHeightMm() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'heightMm', Sort.asc);
    });
  }

  QueryBuilder<Aquarium, Aquarium, QAfterSortBy> thenByHeightMmDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'heightMm', Sort.desc);
    });
  }

  QueryBuilder<Aquarium, Aquarium, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Aquarium, Aquarium, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Aquarium, Aquarium, QAfterSortBy> thenByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.asc);
    });
  }

  QueryBuilder<Aquarium, Aquarium, QAfterSortBy> thenByIsActiveDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.desc);
    });
  }

  QueryBuilder<Aquarium, Aquarium, QAfterSortBy> thenByLengthMm() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lengthMm', Sort.asc);
    });
  }

  QueryBuilder<Aquarium, Aquarium, QAfterSortBy> thenByLengthMmDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lengthMm', Sort.desc);
    });
  }

  QueryBuilder<Aquarium, Aquarium, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<Aquarium, Aquarium, QAfterSortBy> thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<Aquarium, Aquarium, QAfterSortBy> thenByNotes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.asc);
    });
  }

  QueryBuilder<Aquarium, Aquarium, QAfterSortBy> thenByNotesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.desc);
    });
  }

  QueryBuilder<Aquarium, Aquarium, QAfterSortBy> thenByStartDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startDate', Sort.asc);
    });
  }

  QueryBuilder<Aquarium, Aquarium, QAfterSortBy> thenByStartDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startDate', Sort.desc);
    });
  }

  QueryBuilder<Aquarium, Aquarium, QAfterSortBy> thenByStructure() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'structure', Sort.asc);
    });
  }

  QueryBuilder<Aquarium, Aquarium, QAfterSortBy> thenByStructureDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'structure', Sort.desc);
    });
  }

  QueryBuilder<Aquarium, Aquarium, QAfterSortBy> thenByWidthMm() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'widthMm', Sort.asc);
    });
  }

  QueryBuilder<Aquarium, Aquarium, QAfterSortBy> thenByWidthMmDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'widthMm', Sort.desc);
    });
  }
}

extension AquariumQueryWhereDistinct
    on QueryBuilder<Aquarium, Aquarium, QDistinct> {
  QueryBuilder<Aquarium, Aquarium, QDistinct> distinctByCapacityLiter() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'capacityLiter');
    });
  }

  QueryBuilder<Aquarium, Aquarium, QDistinct> distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<Aquarium, Aquarium, QDistinct> distinctByHeightMm() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'heightMm');
    });
  }

  QueryBuilder<Aquarium, Aquarium, QDistinct> distinctByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isActive');
    });
  }

  QueryBuilder<Aquarium, Aquarium, QDistinct> distinctByLengthMm() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lengthMm');
    });
  }

  QueryBuilder<Aquarium, Aquarium, QDistinct> distinctByName({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Aquarium, Aquarium, QDistinct> distinctByNotes({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'notes', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Aquarium, Aquarium, QDistinct> distinctByStartDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'startDate');
    });
  }

  QueryBuilder<Aquarium, Aquarium, QDistinct> distinctByStructure() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'structure');
    });
  }

  QueryBuilder<Aquarium, Aquarium, QDistinct> distinctByWidthMm() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'widthMm');
    });
  }
}

extension AquariumQueryProperty
    on QueryBuilder<Aquarium, Aquarium, QQueryProperty> {
  QueryBuilder<Aquarium, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Aquarium, double?, QQueryOperations> capacityLiterProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'capacityLiter');
    });
  }

  QueryBuilder<Aquarium, DateTime, QQueryOperations> createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<Aquarium, int?, QQueryOperations> heightMmProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'heightMm');
    });
  }

  QueryBuilder<Aquarium, bool, QQueryOperations> isActiveProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isActive');
    });
  }

  QueryBuilder<Aquarium, int?, QQueryOperations> lengthMmProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lengthMm');
    });
  }

  QueryBuilder<Aquarium, String, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<Aquarium, String?, QQueryOperations> notesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'notes');
    });
  }

  QueryBuilder<Aquarium, DateTime?, QQueryOperations> startDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'startDate');
    });
  }

  QueryBuilder<Aquarium, AquariumStructure, QQueryOperations>
  structureProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'structure');
    });
  }

  QueryBuilder<Aquarium, int?, QQueryOperations> widthMmProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'widthMm');
    });
  }
}

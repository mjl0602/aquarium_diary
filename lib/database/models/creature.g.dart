// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'creature.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetCreatureCollection on Isar {
  IsarCollection<Creature> get creatures => this.collection();
}

const CreatureSchema = CollectionSchema(
  name: r'Creature',
  id: 7416897988369794040,
  properties: {
    r'aggressiveness': PropertySchema(
      id: 0,
      name: r'aggressiveness',
      type: IsarType.byte,
      enumMap: _CreatureaggressivenessEnumValueMap,
    ),
    r'aquariumId': PropertySchema(
      id: 1,
      name: r'aquariumId',
      type: IsarType.long,
    ),
    r'category': PropertySchema(
      id: 2,
      name: r'category',
      type: IsarType.byte,
      enumMap: _CreaturecategoryEnumValueMap,
    ),
    r'coralCompatibility': PropertySchema(
      id: 3,
      name: r'coralCompatibility',
      type: IsarType.byte,
      enumMap: _CreaturecoralCompatibilityEnumValueMap,
    ),
    r'createdAt': PropertySchema(
      id: 4,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'entryDate': PropertySchema(
      id: 5,
      name: r'entryDate',
      type: IsarType.dateTime,
    ),
    r'isArchived': PropertySchema(
      id: 6,
      name: r'isArchived',
      type: IsarType.bool,
    ),
    r'isFavorite': PropertySchema(
      id: 7,
      name: r'isFavorite',
      type: IsarType.bool,
    ),
    r'mainMediaId': PropertySchema(
      id: 8,
      name: r'mainMediaId',
      type: IsarType.long,
    ),
    r'nickname': PropertySchema(
      id: 9,
      name: r'nickname',
      type: IsarType.string,
    ),
    r'notes': PropertySchema(id: 10, name: r'notes', type: IsarType.string),
    r'packagingCost': PropertySchema(
      id: 11,
      name: r'packagingCost',
      type: IsarType.double,
    ),
    r'price': PropertySchema(id: 12, name: r'price', type: IsarType.double),
    r'purchaseDate': PropertySchema(
      id: 13,
      name: r'purchaseDate',
      type: IsarType.dateTime,
    ),
    r'purchaseScreenshotId': PropertySchema(
      id: 14,
      name: r'purchaseScreenshotId',
      type: IsarType.long,
    ),
    r'quantity': PropertySchema(id: 15, name: r'quantity', type: IsarType.long),
    r'quarantineEndDate': PropertySchema(
      id: 16,
      name: r'quarantineEndDate',
      type: IsarType.dateTime,
    ),
    r'shippingCost': PropertySchema(
      id: 17,
      name: r'shippingCost',
      type: IsarType.double,
    ),
    r'sizeCm': PropertySchema(id: 18, name: r'sizeCm', type: IsarType.double),
    r'source': PropertySchema(id: 19, name: r'source', type: IsarType.string),
    r'speciesName': PropertySchema(
      id: 20,
      name: r'speciesName',
      type: IsarType.string,
    ),
    r'statusNote': PropertySchema(
      id: 21,
      name: r'statusNote',
      type: IsarType.string,
    ),
    r'statusType': PropertySchema(
      id: 22,
      name: r'statusType',
      type: IsarType.byte,
      enumMap: _CreaturestatusTypeEnumValueMap,
    ),
    r'tags': PropertySchema(id: 23, name: r'tags', type: IsarType.stringList),
    r'totalCost': PropertySchema(
      id: 24,
      name: r'totalCost',
      type: IsarType.double,
    ),
    r'updatedAt': PropertySchema(
      id: 25,
      name: r'updatedAt',
      type: IsarType.dateTime,
    ),
  },

  estimateSize: _creatureEstimateSize,
  serialize: _creatureSerialize,
  deserialize: _creatureDeserialize,
  deserializeProp: _creatureDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},

  getId: _creatureGetId,
  getLinks: _creatureGetLinks,
  attach: _creatureAttach,
  version: '3.3.0',
);

int _creatureEstimateSize(
  Creature object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.nickname;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.notes;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.source;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.speciesName.length * 3;
  {
    final value = object.statusNote;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.tags.length * 3;
  {
    for (var i = 0; i < object.tags.length; i++) {
      final value = object.tags[i];
      bytesCount += value.length * 3;
    }
  }
  return bytesCount;
}

void _creatureSerialize(
  Creature object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeByte(offsets[0], object.aggressiveness.index);
  writer.writeLong(offsets[1], object.aquariumId);
  writer.writeByte(offsets[2], object.category.index);
  writer.writeByte(offsets[3], object.coralCompatibility.index);
  writer.writeDateTime(offsets[4], object.createdAt);
  writer.writeDateTime(offsets[5], object.entryDate);
  writer.writeBool(offsets[6], object.isArchived);
  writer.writeBool(offsets[7], object.isFavorite);
  writer.writeLong(offsets[8], object.mainMediaId);
  writer.writeString(offsets[9], object.nickname);
  writer.writeString(offsets[10], object.notes);
  writer.writeDouble(offsets[11], object.packagingCost);
  writer.writeDouble(offsets[12], object.price);
  writer.writeDateTime(offsets[13], object.purchaseDate);
  writer.writeLong(offsets[14], object.purchaseScreenshotId);
  writer.writeLong(offsets[15], object.quantity);
  writer.writeDateTime(offsets[16], object.quarantineEndDate);
  writer.writeDouble(offsets[17], object.shippingCost);
  writer.writeDouble(offsets[18], object.sizeCm);
  writer.writeString(offsets[19], object.source);
  writer.writeString(offsets[20], object.speciesName);
  writer.writeString(offsets[21], object.statusNote);
  writer.writeByte(offsets[22], object.statusType.index);
  writer.writeStringList(offsets[23], object.tags);
  writer.writeDouble(offsets[24], object.totalCost);
  writer.writeDateTime(offsets[25], object.updatedAt);
}

Creature _creatureDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Creature(
    aggressiveness:
        _CreatureaggressivenessValueEnumMap[reader.readByteOrNull(
          offsets[0],
        )] ??
        Aggressiveness.peaceful,
    aquariumId: reader.readLongOrNull(offsets[1]),
    category:
        _CreaturecategoryValueEnumMap[reader.readByteOrNull(offsets[2])] ??
        CreatureCategory.fish,
    coralCompatibility:
        _CreaturecoralCompatibilityValueEnumMap[reader.readByteOrNull(
          offsets[3],
        )] ??
        CoralCompatibility.safe,
    createdAt: reader.readDateTime(offsets[4]),
    entryDate: reader.readDateTimeOrNull(offsets[5]),
    isArchived: reader.readBoolOrNull(offsets[6]) ?? false,
    isFavorite: reader.readBoolOrNull(offsets[7]) ?? false,
    mainMediaId: reader.readLongOrNull(offsets[8]),
    nickname: reader.readStringOrNull(offsets[9]),
    notes: reader.readStringOrNull(offsets[10]),
    packagingCost: reader.readDoubleOrNull(offsets[11]),
    price: reader.readDoubleOrNull(offsets[12]),
    purchaseDate: reader.readDateTimeOrNull(offsets[13]),
    purchaseScreenshotId: reader.readLongOrNull(offsets[14]),
    quantity: reader.readLongOrNull(offsets[15]) ?? 1,
    quarantineEndDate: reader.readDateTimeOrNull(offsets[16]),
    shippingCost: reader.readDoubleOrNull(offsets[17]),
    sizeCm: reader.readDoubleOrNull(offsets[18]),
    source: reader.readStringOrNull(offsets[19]),
    speciesName: reader.readString(offsets[20]),
    statusNote: reader.readStringOrNull(offsets[21]),
    statusType:
        _CreaturestatusTypeValueEnumMap[reader.readByteOrNull(offsets[22])] ??
        CreatureStatus.ordered,
    tags: reader.readStringList(offsets[23]) ?? const [],
    updatedAt: reader.readDateTime(offsets[25]),
  );
  object.id = id;
  return object;
}

P _creatureDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (_CreatureaggressivenessValueEnumMap[reader.readByteOrNull(
                offset,
              )] ??
              Aggressiveness.peaceful)
          as P;
    case 1:
      return (reader.readLongOrNull(offset)) as P;
    case 2:
      return (_CreaturecategoryValueEnumMap[reader.readByteOrNull(offset)] ??
              CreatureCategory.fish)
          as P;
    case 3:
      return (_CreaturecoralCompatibilityValueEnumMap[reader.readByteOrNull(
                offset,
              )] ??
              CoralCompatibility.safe)
          as P;
    case 4:
      return (reader.readDateTime(offset)) as P;
    case 5:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 6:
      return (reader.readBoolOrNull(offset) ?? false) as P;
    case 7:
      return (reader.readBoolOrNull(offset) ?? false) as P;
    case 8:
      return (reader.readLongOrNull(offset)) as P;
    case 9:
      return (reader.readStringOrNull(offset)) as P;
    case 10:
      return (reader.readStringOrNull(offset)) as P;
    case 11:
      return (reader.readDoubleOrNull(offset)) as P;
    case 12:
      return (reader.readDoubleOrNull(offset)) as P;
    case 13:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 14:
      return (reader.readLongOrNull(offset)) as P;
    case 15:
      return (reader.readLongOrNull(offset) ?? 1) as P;
    case 16:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 17:
      return (reader.readDoubleOrNull(offset)) as P;
    case 18:
      return (reader.readDoubleOrNull(offset)) as P;
    case 19:
      return (reader.readStringOrNull(offset)) as P;
    case 20:
      return (reader.readString(offset)) as P;
    case 21:
      return (reader.readStringOrNull(offset)) as P;
    case 22:
      return (_CreaturestatusTypeValueEnumMap[reader.readByteOrNull(offset)] ??
              CreatureStatus.ordered)
          as P;
    case 23:
      return (reader.readStringList(offset) ?? const []) as P;
    case 24:
      return (reader.readDoubleOrNull(offset)) as P;
    case 25:
      return (reader.readDateTime(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _CreatureaggressivenessEnumValueMap = {
  'peaceful': 0,
  'moderate': 1,
  'aggressive': 2,
  'veryAggressive': 3,
};
const _CreatureaggressivenessValueEnumMap = {
  0: Aggressiveness.peaceful,
  1: Aggressiveness.moderate,
  2: Aggressiveness.aggressive,
  3: Aggressiveness.veryAggressive,
};
const _CreaturecategoryEnumValueMap = {
  'fish': 0,
  'coral': 1,
  'shrimp': 2,
  'algae': 3,
  'snail': 4,
  'clam': 5,
  'anemone': 6,
  'starfish': 7,
  'urchin': 8,
  'seaCucumber': 9,
  'nudibranch': 10,
  'tubeWorm': 11,
  'other': 12,
};
const _CreaturecategoryValueEnumMap = {
  0: CreatureCategory.fish,
  1: CreatureCategory.coral,
  2: CreatureCategory.shrimp,
  3: CreatureCategory.algae,
  4: CreatureCategory.snail,
  5: CreatureCategory.clam,
  6: CreatureCategory.anemone,
  7: CreatureCategory.starfish,
  8: CreatureCategory.urchin,
  9: CreatureCategory.seaCucumber,
  10: CreatureCategory.nudibranch,
  11: CreatureCategory.tubeWorm,
  12: CreatureCategory.other,
};
const _CreaturecoralCompatibilityEnumValueMap = {
  'safe': 0,
  'caution': 1,
  'dangerous': 2,
};
const _CreaturecoralCompatibilityValueEnumMap = {
  0: CoralCompatibility.safe,
  1: CoralCompatibility.caution,
  2: CoralCompatibility.dangerous,
};
const _CreaturestatusTypeEnumValueMap = {
  'ordered': 0,
  'alive': 1,
  'weak': 2,
  'dead': 3,
  'missing': 4,
  'sold': 5,
  'gifted': 6,
};
const _CreaturestatusTypeValueEnumMap = {
  0: CreatureStatus.ordered,
  1: CreatureStatus.alive,
  2: CreatureStatus.weak,
  3: CreatureStatus.dead,
  4: CreatureStatus.missing,
  5: CreatureStatus.sold,
  6: CreatureStatus.gifted,
};

Id _creatureGetId(Creature object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _creatureGetLinks(Creature object) {
  return [];
}

void _creatureAttach(IsarCollection<dynamic> col, Id id, Creature object) {
  object.id = id;
}

extension CreatureQueryWhereSort on QueryBuilder<Creature, Creature, QWhere> {
  QueryBuilder<Creature, Creature, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension CreatureQueryWhere on QueryBuilder<Creature, Creature, QWhereClause> {
  QueryBuilder<Creature, Creature, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(lower: id, upper: id));
    });
  }

  QueryBuilder<Creature, Creature, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<Creature, Creature, QAfterWhereClause> idGreaterThan(
    Id id, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Creature, Creature, QAfterWhereClause> idLessThan(
    Id id, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Creature, Creature, QAfterWhereClause> idBetween(
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

extension CreatureQueryFilter
    on QueryBuilder<Creature, Creature, QFilterCondition> {
  QueryBuilder<Creature, Creature, QAfterFilterCondition> aggressivenessEqualTo(
    Aggressiveness value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'aggressiveness', value: value),
      );
    });
  }

  QueryBuilder<Creature, Creature, QAfterFilterCondition>
  aggressivenessGreaterThan(Aggressiveness value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'aggressiveness',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Creature, Creature, QAfterFilterCondition>
  aggressivenessLessThan(Aggressiveness value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'aggressiveness',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Creature, Creature, QAfterFilterCondition> aggressivenessBetween(
    Aggressiveness lower,
    Aggressiveness upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'aggressiveness',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<Creature, Creature, QAfterFilterCondition> aquariumIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'aquariumId'),
      );
    });
  }

  QueryBuilder<Creature, Creature, QAfterFilterCondition>
  aquariumIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'aquariumId'),
      );
    });
  }

  QueryBuilder<Creature, Creature, QAfterFilterCondition> aquariumIdEqualTo(
    int? value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'aquariumId', value: value),
      );
    });
  }

  QueryBuilder<Creature, Creature, QAfterFilterCondition> aquariumIdGreaterThan(
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

  QueryBuilder<Creature, Creature, QAfterFilterCondition> aquariumIdLessThan(
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

  QueryBuilder<Creature, Creature, QAfterFilterCondition> aquariumIdBetween(
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

  QueryBuilder<Creature, Creature, QAfterFilterCondition> categoryEqualTo(
    CreatureCategory value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'category', value: value),
      );
    });
  }

  QueryBuilder<Creature, Creature, QAfterFilterCondition> categoryGreaterThan(
    CreatureCategory value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'category',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Creature, Creature, QAfterFilterCondition> categoryLessThan(
    CreatureCategory value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'category',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Creature, Creature, QAfterFilterCondition> categoryBetween(
    CreatureCategory lower,
    CreatureCategory upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'category',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<Creature, Creature, QAfterFilterCondition>
  coralCompatibilityEqualTo(CoralCompatibility value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'coralCompatibility', value: value),
      );
    });
  }

  QueryBuilder<Creature, Creature, QAfterFilterCondition>
  coralCompatibilityGreaterThan(
    CoralCompatibility value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'coralCompatibility',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Creature, Creature, QAfterFilterCondition>
  coralCompatibilityLessThan(CoralCompatibility value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'coralCompatibility',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Creature, Creature, QAfterFilterCondition>
  coralCompatibilityBetween(
    CoralCompatibility lower,
    CoralCompatibility upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'coralCompatibility',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<Creature, Creature, QAfterFilterCondition> createdAtEqualTo(
    DateTime value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'createdAt', value: value),
      );
    });
  }

  QueryBuilder<Creature, Creature, QAfterFilterCondition> createdAtGreaterThan(
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

  QueryBuilder<Creature, Creature, QAfterFilterCondition> createdAtLessThan(
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

  QueryBuilder<Creature, Creature, QAfterFilterCondition> createdAtBetween(
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

  QueryBuilder<Creature, Creature, QAfterFilterCondition> entryDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'entryDate'),
      );
    });
  }

  QueryBuilder<Creature, Creature, QAfterFilterCondition> entryDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'entryDate'),
      );
    });
  }

  QueryBuilder<Creature, Creature, QAfterFilterCondition> entryDateEqualTo(
    DateTime? value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'entryDate', value: value),
      );
    });
  }

  QueryBuilder<Creature, Creature, QAfterFilterCondition> entryDateGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'entryDate',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Creature, Creature, QAfterFilterCondition> entryDateLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'entryDate',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Creature, Creature, QAfterFilterCondition> entryDateBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'entryDate',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<Creature, Creature, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'id', value: value),
      );
    });
  }

  QueryBuilder<Creature, Creature, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Creature, Creature, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Creature, Creature, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Creature, Creature, QAfterFilterCondition> isArchivedEqualTo(
    bool value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'isArchived', value: value),
      );
    });
  }

  QueryBuilder<Creature, Creature, QAfterFilterCondition> isFavoriteEqualTo(
    bool value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'isFavorite', value: value),
      );
    });
  }

  QueryBuilder<Creature, Creature, QAfterFilterCondition> mainMediaIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'mainMediaId'),
      );
    });
  }

  QueryBuilder<Creature, Creature, QAfterFilterCondition>
  mainMediaIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'mainMediaId'),
      );
    });
  }

  QueryBuilder<Creature, Creature, QAfterFilterCondition> mainMediaIdEqualTo(
    int? value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'mainMediaId', value: value),
      );
    });
  }

  QueryBuilder<Creature, Creature, QAfterFilterCondition>
  mainMediaIdGreaterThan(int? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'mainMediaId',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Creature, Creature, QAfterFilterCondition> mainMediaIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'mainMediaId',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Creature, Creature, QAfterFilterCondition> mainMediaIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'mainMediaId',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<Creature, Creature, QAfterFilterCondition> nicknameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'nickname'),
      );
    });
  }

  QueryBuilder<Creature, Creature, QAfterFilterCondition> nicknameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'nickname'),
      );
    });
  }

  QueryBuilder<Creature, Creature, QAfterFilterCondition> nicknameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'nickname',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Creature, Creature, QAfterFilterCondition> nicknameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'nickname',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Creature, Creature, QAfterFilterCondition> nicknameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'nickname',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Creature, Creature, QAfterFilterCondition> nicknameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'nickname',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Creature, Creature, QAfterFilterCondition> nicknameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'nickname',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Creature, Creature, QAfterFilterCondition> nicknameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'nickname',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Creature, Creature, QAfterFilterCondition> nicknameContains(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'nickname',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Creature, Creature, QAfterFilterCondition> nicknameMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'nickname',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Creature, Creature, QAfterFilterCondition> nicknameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'nickname', value: ''),
      );
    });
  }

  QueryBuilder<Creature, Creature, QAfterFilterCondition> nicknameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'nickname', value: ''),
      );
    });
  }

  QueryBuilder<Creature, Creature, QAfterFilterCondition> notesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'notes'),
      );
    });
  }

  QueryBuilder<Creature, Creature, QAfterFilterCondition> notesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'notes'),
      );
    });
  }

  QueryBuilder<Creature, Creature, QAfterFilterCondition> notesEqualTo(
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

  QueryBuilder<Creature, Creature, QAfterFilterCondition> notesGreaterThan(
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

  QueryBuilder<Creature, Creature, QAfterFilterCondition> notesLessThan(
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

  QueryBuilder<Creature, Creature, QAfterFilterCondition> notesBetween(
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

  QueryBuilder<Creature, Creature, QAfterFilterCondition> notesStartsWith(
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

  QueryBuilder<Creature, Creature, QAfterFilterCondition> notesEndsWith(
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

  QueryBuilder<Creature, Creature, QAfterFilterCondition> notesContains(
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

  QueryBuilder<Creature, Creature, QAfterFilterCondition> notesMatches(
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

  QueryBuilder<Creature, Creature, QAfterFilterCondition> notesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'notes', value: ''),
      );
    });
  }

  QueryBuilder<Creature, Creature, QAfterFilterCondition> notesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'notes', value: ''),
      );
    });
  }

  QueryBuilder<Creature, Creature, QAfterFilterCondition>
  packagingCostIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'packagingCost'),
      );
    });
  }

  QueryBuilder<Creature, Creature, QAfterFilterCondition>
  packagingCostIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'packagingCost'),
      );
    });
  }

  QueryBuilder<Creature, Creature, QAfterFilterCondition> packagingCostEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'packagingCost',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<Creature, Creature, QAfterFilterCondition>
  packagingCostGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'packagingCost',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<Creature, Creature, QAfterFilterCondition> packagingCostLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'packagingCost',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<Creature, Creature, QAfterFilterCondition> packagingCostBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'packagingCost',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<Creature, Creature, QAfterFilterCondition> priceIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'price'),
      );
    });
  }

  QueryBuilder<Creature, Creature, QAfterFilterCondition> priceIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'price'),
      );
    });
  }

  QueryBuilder<Creature, Creature, QAfterFilterCondition> priceEqualTo(
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

  QueryBuilder<Creature, Creature, QAfterFilterCondition> priceGreaterThan(
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

  QueryBuilder<Creature, Creature, QAfterFilterCondition> priceLessThan(
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

  QueryBuilder<Creature, Creature, QAfterFilterCondition> priceBetween(
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

  QueryBuilder<Creature, Creature, QAfterFilterCondition> purchaseDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'purchaseDate'),
      );
    });
  }

  QueryBuilder<Creature, Creature, QAfterFilterCondition>
  purchaseDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'purchaseDate'),
      );
    });
  }

  QueryBuilder<Creature, Creature, QAfterFilterCondition> purchaseDateEqualTo(
    DateTime? value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'purchaseDate', value: value),
      );
    });
  }

  QueryBuilder<Creature, Creature, QAfterFilterCondition>
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

  QueryBuilder<Creature, Creature, QAfterFilterCondition> purchaseDateLessThan(
    DateTime? value, {
    bool include = false,
  }) {
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

  QueryBuilder<Creature, Creature, QAfterFilterCondition> purchaseDateBetween(
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

  QueryBuilder<Creature, Creature, QAfterFilterCondition>
  purchaseScreenshotIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'purchaseScreenshotId'),
      );
    });
  }

  QueryBuilder<Creature, Creature, QAfterFilterCondition>
  purchaseScreenshotIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'purchaseScreenshotId'),
      );
    });
  }

  QueryBuilder<Creature, Creature, QAfterFilterCondition>
  purchaseScreenshotIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'purchaseScreenshotId',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Creature, Creature, QAfterFilterCondition>
  purchaseScreenshotIdGreaterThan(int? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'purchaseScreenshotId',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Creature, Creature, QAfterFilterCondition>
  purchaseScreenshotIdLessThan(int? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'purchaseScreenshotId',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Creature, Creature, QAfterFilterCondition>
  purchaseScreenshotIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'purchaseScreenshotId',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<Creature, Creature, QAfterFilterCondition> quantityEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'quantity', value: value),
      );
    });
  }

  QueryBuilder<Creature, Creature, QAfterFilterCondition> quantityGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'quantity',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Creature, Creature, QAfterFilterCondition> quantityLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'quantity',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Creature, Creature, QAfterFilterCondition> quantityBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'quantity',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<Creature, Creature, QAfterFilterCondition>
  quarantineEndDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'quarantineEndDate'),
      );
    });
  }

  QueryBuilder<Creature, Creature, QAfterFilterCondition>
  quarantineEndDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'quarantineEndDate'),
      );
    });
  }

  QueryBuilder<Creature, Creature, QAfterFilterCondition>
  quarantineEndDateEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'quarantineEndDate', value: value),
      );
    });
  }

  QueryBuilder<Creature, Creature, QAfterFilterCondition>
  quarantineEndDateGreaterThan(DateTime? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'quarantineEndDate',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Creature, Creature, QAfterFilterCondition>
  quarantineEndDateLessThan(DateTime? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'quarantineEndDate',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Creature, Creature, QAfterFilterCondition>
  quarantineEndDateBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'quarantineEndDate',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<Creature, Creature, QAfterFilterCondition> shippingCostIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'shippingCost'),
      );
    });
  }

  QueryBuilder<Creature, Creature, QAfterFilterCondition>
  shippingCostIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'shippingCost'),
      );
    });
  }

  QueryBuilder<Creature, Creature, QAfterFilterCondition> shippingCostEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'shippingCost',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<Creature, Creature, QAfterFilterCondition>
  shippingCostGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'shippingCost',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<Creature, Creature, QAfterFilterCondition> shippingCostLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'shippingCost',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<Creature, Creature, QAfterFilterCondition> shippingCostBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'shippingCost',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<Creature, Creature, QAfterFilterCondition> sizeCmIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'sizeCm'),
      );
    });
  }

  QueryBuilder<Creature, Creature, QAfterFilterCondition> sizeCmIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'sizeCm'),
      );
    });
  }

  QueryBuilder<Creature, Creature, QAfterFilterCondition> sizeCmEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'sizeCm',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<Creature, Creature, QAfterFilterCondition> sizeCmGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'sizeCm',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<Creature, Creature, QAfterFilterCondition> sizeCmLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'sizeCm',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<Creature, Creature, QAfterFilterCondition> sizeCmBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'sizeCm',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<Creature, Creature, QAfterFilterCondition> sourceIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'source'),
      );
    });
  }

  QueryBuilder<Creature, Creature, QAfterFilterCondition> sourceIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'source'),
      );
    });
  }

  QueryBuilder<Creature, Creature, QAfterFilterCondition> sourceEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'source',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Creature, Creature, QAfterFilterCondition> sourceGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'source',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Creature, Creature, QAfterFilterCondition> sourceLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'source',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Creature, Creature, QAfterFilterCondition> sourceBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'source',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Creature, Creature, QAfterFilterCondition> sourceStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'source',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Creature, Creature, QAfterFilterCondition> sourceEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'source',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Creature, Creature, QAfterFilterCondition> sourceContains(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'source',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Creature, Creature, QAfterFilterCondition> sourceMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'source',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Creature, Creature, QAfterFilterCondition> sourceIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'source', value: ''),
      );
    });
  }

  QueryBuilder<Creature, Creature, QAfterFilterCondition> sourceIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'source', value: ''),
      );
    });
  }

  QueryBuilder<Creature, Creature, QAfterFilterCondition> speciesNameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'speciesName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Creature, Creature, QAfterFilterCondition>
  speciesNameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'speciesName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Creature, Creature, QAfterFilterCondition> speciesNameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'speciesName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Creature, Creature, QAfterFilterCondition> speciesNameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'speciesName',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Creature, Creature, QAfterFilterCondition> speciesNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'speciesName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Creature, Creature, QAfterFilterCondition> speciesNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'speciesName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Creature, Creature, QAfterFilterCondition> speciesNameContains(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'speciesName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Creature, Creature, QAfterFilterCondition> speciesNameMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'speciesName',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Creature, Creature, QAfterFilterCondition> speciesNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'speciesName', value: ''),
      );
    });
  }

  QueryBuilder<Creature, Creature, QAfterFilterCondition>
  speciesNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'speciesName', value: ''),
      );
    });
  }

  QueryBuilder<Creature, Creature, QAfterFilterCondition> statusNoteIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'statusNote'),
      );
    });
  }

  QueryBuilder<Creature, Creature, QAfterFilterCondition>
  statusNoteIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'statusNote'),
      );
    });
  }

  QueryBuilder<Creature, Creature, QAfterFilterCondition> statusNoteEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'statusNote',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Creature, Creature, QAfterFilterCondition> statusNoteGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'statusNote',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Creature, Creature, QAfterFilterCondition> statusNoteLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'statusNote',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Creature, Creature, QAfterFilterCondition> statusNoteBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'statusNote',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Creature, Creature, QAfterFilterCondition> statusNoteStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'statusNote',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Creature, Creature, QAfterFilterCondition> statusNoteEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'statusNote',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Creature, Creature, QAfterFilterCondition> statusNoteContains(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'statusNote',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Creature, Creature, QAfterFilterCondition> statusNoteMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'statusNote',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Creature, Creature, QAfterFilterCondition> statusNoteIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'statusNote', value: ''),
      );
    });
  }

  QueryBuilder<Creature, Creature, QAfterFilterCondition>
  statusNoteIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'statusNote', value: ''),
      );
    });
  }

  QueryBuilder<Creature, Creature, QAfterFilterCondition> statusTypeEqualTo(
    CreatureStatus value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'statusType', value: value),
      );
    });
  }

  QueryBuilder<Creature, Creature, QAfterFilterCondition> statusTypeGreaterThan(
    CreatureStatus value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'statusType',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Creature, Creature, QAfterFilterCondition> statusTypeLessThan(
    CreatureStatus value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'statusType',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Creature, Creature, QAfterFilterCondition> statusTypeBetween(
    CreatureStatus lower,
    CreatureStatus upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'statusType',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<Creature, Creature, QAfterFilterCondition> tagsElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'tags',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Creature, Creature, QAfterFilterCondition>
  tagsElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'tags',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Creature, Creature, QAfterFilterCondition> tagsElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'tags',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Creature, Creature, QAfterFilterCondition> tagsElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'tags',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Creature, Creature, QAfterFilterCondition> tagsElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'tags',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Creature, Creature, QAfterFilterCondition> tagsElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'tags',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Creature, Creature, QAfterFilterCondition> tagsElementContains(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'tags',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Creature, Creature, QAfterFilterCondition> tagsElementMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'tags',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Creature, Creature, QAfterFilterCondition> tagsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'tags', value: ''),
      );
    });
  }

  QueryBuilder<Creature, Creature, QAfterFilterCondition>
  tagsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'tags', value: ''),
      );
    });
  }

  QueryBuilder<Creature, Creature, QAfterFilterCondition> tagsLengthEqualTo(
    int length,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'tags', length, true, length, true);
    });
  }

  QueryBuilder<Creature, Creature, QAfterFilterCondition> tagsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'tags', 0, true, 0, true);
    });
  }

  QueryBuilder<Creature, Creature, QAfterFilterCondition> tagsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'tags', 0, false, 999999, true);
    });
  }

  QueryBuilder<Creature, Creature, QAfterFilterCondition> tagsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'tags', 0, true, length, include);
    });
  }

  QueryBuilder<Creature, Creature, QAfterFilterCondition> tagsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'tags', length, include, 999999, true);
    });
  }

  QueryBuilder<Creature, Creature, QAfterFilterCondition> tagsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tags',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<Creature, Creature, QAfterFilterCondition> totalCostIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'totalCost'),
      );
    });
  }

  QueryBuilder<Creature, Creature, QAfterFilterCondition> totalCostIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'totalCost'),
      );
    });
  }

  QueryBuilder<Creature, Creature, QAfterFilterCondition> totalCostEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'totalCost',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<Creature, Creature, QAfterFilterCondition> totalCostGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'totalCost',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<Creature, Creature, QAfterFilterCondition> totalCostLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'totalCost',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<Creature, Creature, QAfterFilterCondition> totalCostBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'totalCost',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<Creature, Creature, QAfterFilterCondition> updatedAtEqualTo(
    DateTime value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'updatedAt', value: value),
      );
    });
  }

  QueryBuilder<Creature, Creature, QAfterFilterCondition> updatedAtGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'updatedAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Creature, Creature, QAfterFilterCondition> updatedAtLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'updatedAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Creature, Creature, QAfterFilterCondition> updatedAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'updatedAt',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }
}

extension CreatureQueryObject
    on QueryBuilder<Creature, Creature, QFilterCondition> {}

extension CreatureQueryLinks
    on QueryBuilder<Creature, Creature, QFilterCondition> {}

extension CreatureQuerySortBy on QueryBuilder<Creature, Creature, QSortBy> {
  QueryBuilder<Creature, Creature, QAfterSortBy> sortByAggressiveness() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'aggressiveness', Sort.asc);
    });
  }

  QueryBuilder<Creature, Creature, QAfterSortBy> sortByAggressivenessDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'aggressiveness', Sort.desc);
    });
  }

  QueryBuilder<Creature, Creature, QAfterSortBy> sortByAquariumId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'aquariumId', Sort.asc);
    });
  }

  QueryBuilder<Creature, Creature, QAfterSortBy> sortByAquariumIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'aquariumId', Sort.desc);
    });
  }

  QueryBuilder<Creature, Creature, QAfterSortBy> sortByCategory() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'category', Sort.asc);
    });
  }

  QueryBuilder<Creature, Creature, QAfterSortBy> sortByCategoryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'category', Sort.desc);
    });
  }

  QueryBuilder<Creature, Creature, QAfterSortBy> sortByCoralCompatibility() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'coralCompatibility', Sort.asc);
    });
  }

  QueryBuilder<Creature, Creature, QAfterSortBy>
  sortByCoralCompatibilityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'coralCompatibility', Sort.desc);
    });
  }

  QueryBuilder<Creature, Creature, QAfterSortBy> sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<Creature, Creature, QAfterSortBy> sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<Creature, Creature, QAfterSortBy> sortByEntryDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'entryDate', Sort.asc);
    });
  }

  QueryBuilder<Creature, Creature, QAfterSortBy> sortByEntryDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'entryDate', Sort.desc);
    });
  }

  QueryBuilder<Creature, Creature, QAfterSortBy> sortByIsArchived() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isArchived', Sort.asc);
    });
  }

  QueryBuilder<Creature, Creature, QAfterSortBy> sortByIsArchivedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isArchived', Sort.desc);
    });
  }

  QueryBuilder<Creature, Creature, QAfterSortBy> sortByIsFavorite() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isFavorite', Sort.asc);
    });
  }

  QueryBuilder<Creature, Creature, QAfterSortBy> sortByIsFavoriteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isFavorite', Sort.desc);
    });
  }

  QueryBuilder<Creature, Creature, QAfterSortBy> sortByMainMediaId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mainMediaId', Sort.asc);
    });
  }

  QueryBuilder<Creature, Creature, QAfterSortBy> sortByMainMediaIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mainMediaId', Sort.desc);
    });
  }

  QueryBuilder<Creature, Creature, QAfterSortBy> sortByNickname() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nickname', Sort.asc);
    });
  }

  QueryBuilder<Creature, Creature, QAfterSortBy> sortByNicknameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nickname', Sort.desc);
    });
  }

  QueryBuilder<Creature, Creature, QAfterSortBy> sortByNotes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.asc);
    });
  }

  QueryBuilder<Creature, Creature, QAfterSortBy> sortByNotesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.desc);
    });
  }

  QueryBuilder<Creature, Creature, QAfterSortBy> sortByPackagingCost() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'packagingCost', Sort.asc);
    });
  }

  QueryBuilder<Creature, Creature, QAfterSortBy> sortByPackagingCostDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'packagingCost', Sort.desc);
    });
  }

  QueryBuilder<Creature, Creature, QAfterSortBy> sortByPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'price', Sort.asc);
    });
  }

  QueryBuilder<Creature, Creature, QAfterSortBy> sortByPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'price', Sort.desc);
    });
  }

  QueryBuilder<Creature, Creature, QAfterSortBy> sortByPurchaseDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'purchaseDate', Sort.asc);
    });
  }

  QueryBuilder<Creature, Creature, QAfterSortBy> sortByPurchaseDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'purchaseDate', Sort.desc);
    });
  }

  QueryBuilder<Creature, Creature, QAfterSortBy> sortByPurchaseScreenshotId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'purchaseScreenshotId', Sort.asc);
    });
  }

  QueryBuilder<Creature, Creature, QAfterSortBy>
  sortByPurchaseScreenshotIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'purchaseScreenshotId', Sort.desc);
    });
  }

  QueryBuilder<Creature, Creature, QAfterSortBy> sortByQuantity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quantity', Sort.asc);
    });
  }

  QueryBuilder<Creature, Creature, QAfterSortBy> sortByQuantityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quantity', Sort.desc);
    });
  }

  QueryBuilder<Creature, Creature, QAfterSortBy> sortByQuarantineEndDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quarantineEndDate', Sort.asc);
    });
  }

  QueryBuilder<Creature, Creature, QAfterSortBy> sortByQuarantineEndDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quarantineEndDate', Sort.desc);
    });
  }

  QueryBuilder<Creature, Creature, QAfterSortBy> sortByShippingCost() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'shippingCost', Sort.asc);
    });
  }

  QueryBuilder<Creature, Creature, QAfterSortBy> sortByShippingCostDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'shippingCost', Sort.desc);
    });
  }

  QueryBuilder<Creature, Creature, QAfterSortBy> sortBySizeCm() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sizeCm', Sort.asc);
    });
  }

  QueryBuilder<Creature, Creature, QAfterSortBy> sortBySizeCmDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sizeCm', Sort.desc);
    });
  }

  QueryBuilder<Creature, Creature, QAfterSortBy> sortBySource() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'source', Sort.asc);
    });
  }

  QueryBuilder<Creature, Creature, QAfterSortBy> sortBySourceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'source', Sort.desc);
    });
  }

  QueryBuilder<Creature, Creature, QAfterSortBy> sortBySpeciesName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'speciesName', Sort.asc);
    });
  }

  QueryBuilder<Creature, Creature, QAfterSortBy> sortBySpeciesNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'speciesName', Sort.desc);
    });
  }

  QueryBuilder<Creature, Creature, QAfterSortBy> sortByStatusNote() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'statusNote', Sort.asc);
    });
  }

  QueryBuilder<Creature, Creature, QAfterSortBy> sortByStatusNoteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'statusNote', Sort.desc);
    });
  }

  QueryBuilder<Creature, Creature, QAfterSortBy> sortByStatusType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'statusType', Sort.asc);
    });
  }

  QueryBuilder<Creature, Creature, QAfterSortBy> sortByStatusTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'statusType', Sort.desc);
    });
  }

  QueryBuilder<Creature, Creature, QAfterSortBy> sortByTotalCost() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalCost', Sort.asc);
    });
  }

  QueryBuilder<Creature, Creature, QAfterSortBy> sortByTotalCostDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalCost', Sort.desc);
    });
  }

  QueryBuilder<Creature, Creature, QAfterSortBy> sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<Creature, Creature, QAfterSortBy> sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }
}

extension CreatureQuerySortThenBy
    on QueryBuilder<Creature, Creature, QSortThenBy> {
  QueryBuilder<Creature, Creature, QAfterSortBy> thenByAggressiveness() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'aggressiveness', Sort.asc);
    });
  }

  QueryBuilder<Creature, Creature, QAfterSortBy> thenByAggressivenessDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'aggressiveness', Sort.desc);
    });
  }

  QueryBuilder<Creature, Creature, QAfterSortBy> thenByAquariumId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'aquariumId', Sort.asc);
    });
  }

  QueryBuilder<Creature, Creature, QAfterSortBy> thenByAquariumIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'aquariumId', Sort.desc);
    });
  }

  QueryBuilder<Creature, Creature, QAfterSortBy> thenByCategory() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'category', Sort.asc);
    });
  }

  QueryBuilder<Creature, Creature, QAfterSortBy> thenByCategoryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'category', Sort.desc);
    });
  }

  QueryBuilder<Creature, Creature, QAfterSortBy> thenByCoralCompatibility() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'coralCompatibility', Sort.asc);
    });
  }

  QueryBuilder<Creature, Creature, QAfterSortBy>
  thenByCoralCompatibilityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'coralCompatibility', Sort.desc);
    });
  }

  QueryBuilder<Creature, Creature, QAfterSortBy> thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<Creature, Creature, QAfterSortBy> thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<Creature, Creature, QAfterSortBy> thenByEntryDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'entryDate', Sort.asc);
    });
  }

  QueryBuilder<Creature, Creature, QAfterSortBy> thenByEntryDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'entryDate', Sort.desc);
    });
  }

  QueryBuilder<Creature, Creature, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Creature, Creature, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Creature, Creature, QAfterSortBy> thenByIsArchived() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isArchived', Sort.asc);
    });
  }

  QueryBuilder<Creature, Creature, QAfterSortBy> thenByIsArchivedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isArchived', Sort.desc);
    });
  }

  QueryBuilder<Creature, Creature, QAfterSortBy> thenByIsFavorite() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isFavorite', Sort.asc);
    });
  }

  QueryBuilder<Creature, Creature, QAfterSortBy> thenByIsFavoriteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isFavorite', Sort.desc);
    });
  }

  QueryBuilder<Creature, Creature, QAfterSortBy> thenByMainMediaId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mainMediaId', Sort.asc);
    });
  }

  QueryBuilder<Creature, Creature, QAfterSortBy> thenByMainMediaIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mainMediaId', Sort.desc);
    });
  }

  QueryBuilder<Creature, Creature, QAfterSortBy> thenByNickname() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nickname', Sort.asc);
    });
  }

  QueryBuilder<Creature, Creature, QAfterSortBy> thenByNicknameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nickname', Sort.desc);
    });
  }

  QueryBuilder<Creature, Creature, QAfterSortBy> thenByNotes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.asc);
    });
  }

  QueryBuilder<Creature, Creature, QAfterSortBy> thenByNotesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.desc);
    });
  }

  QueryBuilder<Creature, Creature, QAfterSortBy> thenByPackagingCost() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'packagingCost', Sort.asc);
    });
  }

  QueryBuilder<Creature, Creature, QAfterSortBy> thenByPackagingCostDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'packagingCost', Sort.desc);
    });
  }

  QueryBuilder<Creature, Creature, QAfterSortBy> thenByPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'price', Sort.asc);
    });
  }

  QueryBuilder<Creature, Creature, QAfterSortBy> thenByPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'price', Sort.desc);
    });
  }

  QueryBuilder<Creature, Creature, QAfterSortBy> thenByPurchaseDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'purchaseDate', Sort.asc);
    });
  }

  QueryBuilder<Creature, Creature, QAfterSortBy> thenByPurchaseDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'purchaseDate', Sort.desc);
    });
  }

  QueryBuilder<Creature, Creature, QAfterSortBy> thenByPurchaseScreenshotId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'purchaseScreenshotId', Sort.asc);
    });
  }

  QueryBuilder<Creature, Creature, QAfterSortBy>
  thenByPurchaseScreenshotIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'purchaseScreenshotId', Sort.desc);
    });
  }

  QueryBuilder<Creature, Creature, QAfterSortBy> thenByQuantity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quantity', Sort.asc);
    });
  }

  QueryBuilder<Creature, Creature, QAfterSortBy> thenByQuantityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quantity', Sort.desc);
    });
  }

  QueryBuilder<Creature, Creature, QAfterSortBy> thenByQuarantineEndDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quarantineEndDate', Sort.asc);
    });
  }

  QueryBuilder<Creature, Creature, QAfterSortBy> thenByQuarantineEndDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quarantineEndDate', Sort.desc);
    });
  }

  QueryBuilder<Creature, Creature, QAfterSortBy> thenByShippingCost() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'shippingCost', Sort.asc);
    });
  }

  QueryBuilder<Creature, Creature, QAfterSortBy> thenByShippingCostDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'shippingCost', Sort.desc);
    });
  }

  QueryBuilder<Creature, Creature, QAfterSortBy> thenBySizeCm() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sizeCm', Sort.asc);
    });
  }

  QueryBuilder<Creature, Creature, QAfterSortBy> thenBySizeCmDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sizeCm', Sort.desc);
    });
  }

  QueryBuilder<Creature, Creature, QAfterSortBy> thenBySource() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'source', Sort.asc);
    });
  }

  QueryBuilder<Creature, Creature, QAfterSortBy> thenBySourceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'source', Sort.desc);
    });
  }

  QueryBuilder<Creature, Creature, QAfterSortBy> thenBySpeciesName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'speciesName', Sort.asc);
    });
  }

  QueryBuilder<Creature, Creature, QAfterSortBy> thenBySpeciesNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'speciesName', Sort.desc);
    });
  }

  QueryBuilder<Creature, Creature, QAfterSortBy> thenByStatusNote() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'statusNote', Sort.asc);
    });
  }

  QueryBuilder<Creature, Creature, QAfterSortBy> thenByStatusNoteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'statusNote', Sort.desc);
    });
  }

  QueryBuilder<Creature, Creature, QAfterSortBy> thenByStatusType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'statusType', Sort.asc);
    });
  }

  QueryBuilder<Creature, Creature, QAfterSortBy> thenByStatusTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'statusType', Sort.desc);
    });
  }

  QueryBuilder<Creature, Creature, QAfterSortBy> thenByTotalCost() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalCost', Sort.asc);
    });
  }

  QueryBuilder<Creature, Creature, QAfterSortBy> thenByTotalCostDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalCost', Sort.desc);
    });
  }

  QueryBuilder<Creature, Creature, QAfterSortBy> thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<Creature, Creature, QAfterSortBy> thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }
}

extension CreatureQueryWhereDistinct
    on QueryBuilder<Creature, Creature, QDistinct> {
  QueryBuilder<Creature, Creature, QDistinct> distinctByAggressiveness() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'aggressiveness');
    });
  }

  QueryBuilder<Creature, Creature, QDistinct> distinctByAquariumId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'aquariumId');
    });
  }

  QueryBuilder<Creature, Creature, QDistinct> distinctByCategory() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'category');
    });
  }

  QueryBuilder<Creature, Creature, QDistinct> distinctByCoralCompatibility() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'coralCompatibility');
    });
  }

  QueryBuilder<Creature, Creature, QDistinct> distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<Creature, Creature, QDistinct> distinctByEntryDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'entryDate');
    });
  }

  QueryBuilder<Creature, Creature, QDistinct> distinctByIsArchived() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isArchived');
    });
  }

  QueryBuilder<Creature, Creature, QDistinct> distinctByIsFavorite() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isFavorite');
    });
  }

  QueryBuilder<Creature, Creature, QDistinct> distinctByMainMediaId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'mainMediaId');
    });
  }

  QueryBuilder<Creature, Creature, QDistinct> distinctByNickname({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'nickname', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Creature, Creature, QDistinct> distinctByNotes({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'notes', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Creature, Creature, QDistinct> distinctByPackagingCost() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'packagingCost');
    });
  }

  QueryBuilder<Creature, Creature, QDistinct> distinctByPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'price');
    });
  }

  QueryBuilder<Creature, Creature, QDistinct> distinctByPurchaseDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'purchaseDate');
    });
  }

  QueryBuilder<Creature, Creature, QDistinct> distinctByPurchaseScreenshotId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'purchaseScreenshotId');
    });
  }

  QueryBuilder<Creature, Creature, QDistinct> distinctByQuantity() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'quantity');
    });
  }

  QueryBuilder<Creature, Creature, QDistinct> distinctByQuarantineEndDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'quarantineEndDate');
    });
  }

  QueryBuilder<Creature, Creature, QDistinct> distinctByShippingCost() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'shippingCost');
    });
  }

  QueryBuilder<Creature, Creature, QDistinct> distinctBySizeCm() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'sizeCm');
    });
  }

  QueryBuilder<Creature, Creature, QDistinct> distinctBySource({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'source', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Creature, Creature, QDistinct> distinctBySpeciesName({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'speciesName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Creature, Creature, QDistinct> distinctByStatusNote({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'statusNote', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Creature, Creature, QDistinct> distinctByStatusType() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'statusType');
    });
  }

  QueryBuilder<Creature, Creature, QDistinct> distinctByTags() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'tags');
    });
  }

  QueryBuilder<Creature, Creature, QDistinct> distinctByTotalCost() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalCost');
    });
  }

  QueryBuilder<Creature, Creature, QDistinct> distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }
}

extension CreatureQueryProperty
    on QueryBuilder<Creature, Creature, QQueryProperty> {
  QueryBuilder<Creature, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Creature, Aggressiveness, QQueryOperations>
  aggressivenessProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'aggressiveness');
    });
  }

  QueryBuilder<Creature, int?, QQueryOperations> aquariumIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'aquariumId');
    });
  }

  QueryBuilder<Creature, CreatureCategory, QQueryOperations>
  categoryProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'category');
    });
  }

  QueryBuilder<Creature, CoralCompatibility, QQueryOperations>
  coralCompatibilityProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'coralCompatibility');
    });
  }

  QueryBuilder<Creature, DateTime, QQueryOperations> createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<Creature, DateTime?, QQueryOperations> entryDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'entryDate');
    });
  }

  QueryBuilder<Creature, bool, QQueryOperations> isArchivedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isArchived');
    });
  }

  QueryBuilder<Creature, bool, QQueryOperations> isFavoriteProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isFavorite');
    });
  }

  QueryBuilder<Creature, int?, QQueryOperations> mainMediaIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'mainMediaId');
    });
  }

  QueryBuilder<Creature, String?, QQueryOperations> nicknameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'nickname');
    });
  }

  QueryBuilder<Creature, String?, QQueryOperations> notesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'notes');
    });
  }

  QueryBuilder<Creature, double?, QQueryOperations> packagingCostProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'packagingCost');
    });
  }

  QueryBuilder<Creature, double?, QQueryOperations> priceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'price');
    });
  }

  QueryBuilder<Creature, DateTime?, QQueryOperations> purchaseDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'purchaseDate');
    });
  }

  QueryBuilder<Creature, int?, QQueryOperations>
  purchaseScreenshotIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'purchaseScreenshotId');
    });
  }

  QueryBuilder<Creature, int, QQueryOperations> quantityProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'quantity');
    });
  }

  QueryBuilder<Creature, DateTime?, QQueryOperations>
  quarantineEndDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'quarantineEndDate');
    });
  }

  QueryBuilder<Creature, double?, QQueryOperations> shippingCostProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'shippingCost');
    });
  }

  QueryBuilder<Creature, double?, QQueryOperations> sizeCmProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'sizeCm');
    });
  }

  QueryBuilder<Creature, String?, QQueryOperations> sourceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'source');
    });
  }

  QueryBuilder<Creature, String, QQueryOperations> speciesNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'speciesName');
    });
  }

  QueryBuilder<Creature, String?, QQueryOperations> statusNoteProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'statusNote');
    });
  }

  QueryBuilder<Creature, CreatureStatus, QQueryOperations>
  statusTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'statusType');
    });
  }

  QueryBuilder<Creature, List<String>, QQueryOperations> tagsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'tags');
    });
  }

  QueryBuilder<Creature, double?, QQueryOperations> totalCostProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalCost');
    });
  }

  QueryBuilder<Creature, DateTime, QQueryOperations> updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }
}

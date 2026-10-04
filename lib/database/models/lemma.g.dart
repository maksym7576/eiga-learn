// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lemma.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetLemmaCollection on Isar {
  IsarCollection<Lemma> get lemmas => this.collection();
}

const LemmaSchema = CollectionSchema(
  name: r'Lemma',
  id: -6783406020870962605,
  properties: {
    r'antonymKeys': PropertySchema(
      id: 0,
      name: r'antonymKeys',
      type: IsarType.stringList,
    ),
    r'forms': PropertySchema(
      id: 1,
      name: r'forms',
      type: IsarType.objectList,

      target: r'LemmaForm',
    ),
    r'jlptLevel': PropertySchema(
      id: 2,
      name: r'jlptLevel',
      type: IsarType.string,
    ),
    r'key': PropertySchema(id: 3, name: r'key', type: IsarType.string),
    r'posTag': PropertySchema(id: 4, name: r'posTag', type: IsarType.string),
    r'sync': PropertySchema(
      id: 5,
      name: r'sync',
      type: IsarType.object,

      target: r'SyncMeta',
    ),
    r'synonymKeys': PropertySchema(
      id: 6,
      name: r'synonymKeys',
      type: IsarType.stringList,
    ),
    r'versions': PropertySchema(
      id: 7,
      name: r'versions',
      type: IsarType.objectList,

      target: r'ReadingItem',
    ),
  },

  estimateSize: _lemmaEstimateSize,
  serialize: _lemmaSerialize,
  deserialize: _lemmaDeserialize,
  deserializeProp: _lemmaDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {
    r'ReadingItem': ReadingItemSchema,
    r'LemmaForm': LemmaFormSchema,
    r'SyncMeta': SyncMetaSchema,
  },

  getId: _lemmaGetId,
  getLinks: _lemmaGetLinks,
  attach: _lemmaAttach,
  version: '3.3.2',
);

int _lemmaEstimateSize(
  Lemma object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.antonymKeys.length * 3;
  {
    for (var i = 0; i < object.antonymKeys.length; i++) {
      final value = object.antonymKeys[i];
      bytesCount += value.length * 3;
    }
  }
  bytesCount += 3 + object.forms.length * 3;
  {
    final offsets = allOffsets[LemmaForm]!;
    for (var i = 0; i < object.forms.length; i++) {
      final value = object.forms[i];
      bytesCount += LemmaFormSchema.estimateSize(value, offsets, allOffsets);
    }
  }
  {
    final value = object.jlptLevel;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.key.length * 3;
  {
    final value = object.posTag;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount +=
      3 +
      SyncMetaSchema.estimateSize(
        object.sync,
        allOffsets[SyncMeta]!,
        allOffsets,
      );
  bytesCount += 3 + object.synonymKeys.length * 3;
  {
    for (var i = 0; i < object.synonymKeys.length; i++) {
      final value = object.synonymKeys[i];
      bytesCount += value.length * 3;
    }
  }
  bytesCount += 3 + object.versions.length * 3;
  {
    final offsets = allOffsets[ReadingItem]!;
    for (var i = 0; i < object.versions.length; i++) {
      final value = object.versions[i];
      bytesCount += ReadingItemSchema.estimateSize(value, offsets, allOffsets);
    }
  }
  return bytesCount;
}

void _lemmaSerialize(
  Lemma object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeStringList(offsets[0], object.antonymKeys);
  writer.writeObjectList<LemmaForm>(
    offsets[1],
    allOffsets,
    LemmaFormSchema.serialize,
    object.forms,
  );
  writer.writeString(offsets[2], object.jlptLevel);
  writer.writeString(offsets[3], object.key);
  writer.writeString(offsets[4], object.posTag);
  writer.writeObject<SyncMeta>(
    offsets[5],
    allOffsets,
    SyncMetaSchema.serialize,
    object.sync,
  );
  writer.writeStringList(offsets[6], object.synonymKeys);
  writer.writeObjectList<ReadingItem>(
    offsets[7],
    allOffsets,
    ReadingItemSchema.serialize,
    object.versions,
  );
}

Lemma _lemmaDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Lemma();
  object.antonymKeys = reader.readStringList(offsets[0]) ?? [];
  object.forms =
      reader.readObjectList<LemmaForm>(
        offsets[1],
        LemmaFormSchema.deserialize,
        allOffsets,
        LemmaForm(),
      ) ??
      [];
  object.id = id;
  object.jlptLevel = reader.readStringOrNull(offsets[2]);
  object.key = reader.readString(offsets[3]);
  object.posTag = reader.readStringOrNull(offsets[4]);
  object.sync =
      reader.readObjectOrNull<SyncMeta>(
        offsets[5],
        SyncMetaSchema.deserialize,
        allOffsets,
      ) ??
      SyncMeta();
  object.synonymKeys = reader.readStringList(offsets[6]) ?? [];
  object.versions =
      reader.readObjectList<ReadingItem>(
        offsets[7],
        ReadingItemSchema.deserialize,
        allOffsets,
        ReadingItem(),
      ) ??
      [];
  return object;
}

P _lemmaDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringList(offset) ?? []) as P;
    case 1:
      return (reader.readObjectList<LemmaForm>(
                offset,
                LemmaFormSchema.deserialize,
                allOffsets,
                LemmaForm(),
              ) ??
              [])
          as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readObjectOrNull<SyncMeta>(
                offset,
                SyncMetaSchema.deserialize,
                allOffsets,
              ) ??
              SyncMeta())
          as P;
    case 6:
      return (reader.readStringList(offset) ?? []) as P;
    case 7:
      return (reader.readObjectList<ReadingItem>(
                offset,
                ReadingItemSchema.deserialize,
                allOffsets,
                ReadingItem(),
              ) ??
              [])
          as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _lemmaGetId(Lemma object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _lemmaGetLinks(Lemma object) {
  return [];
}

void _lemmaAttach(IsarCollection<dynamic> col, Id id, Lemma object) {
  object.id = id;
}

extension LemmaQueryWhereSort on QueryBuilder<Lemma, Lemma, QWhere> {
  QueryBuilder<Lemma, Lemma, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension LemmaQueryWhere on QueryBuilder<Lemma, Lemma, QWhereClause> {
  QueryBuilder<Lemma, Lemma, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(lower: id, upper: id));
    });
  }

  QueryBuilder<Lemma, Lemma, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<Lemma, Lemma, QAfterWhereClause> idGreaterThan(
    Id id, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Lemma, Lemma, QAfterWhereClause> idLessThan(
    Id id, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Lemma, Lemma, QAfterWhereClause> idBetween(
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

extension LemmaQueryFilter on QueryBuilder<Lemma, Lemma, QFilterCondition> {
  QueryBuilder<Lemma, Lemma, QAfterFilterCondition> antonymKeysElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'antonymKeys',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Lemma, Lemma, QAfterFilterCondition>
  antonymKeysElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'antonymKeys',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Lemma, Lemma, QAfterFilterCondition> antonymKeysElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'antonymKeys',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Lemma, Lemma, QAfterFilterCondition> antonymKeysElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'antonymKeys',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Lemma, Lemma, QAfterFilterCondition>
  antonymKeysElementStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'antonymKeys',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Lemma, Lemma, QAfterFilterCondition> antonymKeysElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'antonymKeys',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Lemma, Lemma, QAfterFilterCondition> antonymKeysElementContains(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'antonymKeys',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Lemma, Lemma, QAfterFilterCondition> antonymKeysElementMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'antonymKeys',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Lemma, Lemma, QAfterFilterCondition>
  antonymKeysElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'antonymKeys', value: ''),
      );
    });
  }

  QueryBuilder<Lemma, Lemma, QAfterFilterCondition>
  antonymKeysElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'antonymKeys', value: ''),
      );
    });
  }

  QueryBuilder<Lemma, Lemma, QAfterFilterCondition> antonymKeysLengthEqualTo(
    int length,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'antonymKeys', length, true, length, true);
    });
  }

  QueryBuilder<Lemma, Lemma, QAfterFilterCondition> antonymKeysIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'antonymKeys', 0, true, 0, true);
    });
  }

  QueryBuilder<Lemma, Lemma, QAfterFilterCondition> antonymKeysIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'antonymKeys', 0, false, 999999, true);
    });
  }

  QueryBuilder<Lemma, Lemma, QAfterFilterCondition> antonymKeysLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'antonymKeys', 0, true, length, include);
    });
  }

  QueryBuilder<Lemma, Lemma, QAfterFilterCondition>
  antonymKeysLengthGreaterThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'antonymKeys', length, include, 999999, true);
    });
  }

  QueryBuilder<Lemma, Lemma, QAfterFilterCondition> antonymKeysLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'antonymKeys',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<Lemma, Lemma, QAfterFilterCondition> formsLengthEqualTo(
    int length,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'forms', length, true, length, true);
    });
  }

  QueryBuilder<Lemma, Lemma, QAfterFilterCondition> formsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'forms', 0, true, 0, true);
    });
  }

  QueryBuilder<Lemma, Lemma, QAfterFilterCondition> formsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'forms', 0, false, 999999, true);
    });
  }

  QueryBuilder<Lemma, Lemma, QAfterFilterCondition> formsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'forms', 0, true, length, include);
    });
  }

  QueryBuilder<Lemma, Lemma, QAfterFilterCondition> formsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'forms', length, include, 999999, true);
    });
  }

  QueryBuilder<Lemma, Lemma, QAfterFilterCondition> formsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'forms',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<Lemma, Lemma, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'id', value: value),
      );
    });
  }

  QueryBuilder<Lemma, Lemma, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Lemma, Lemma, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Lemma, Lemma, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Lemma, Lemma, QAfterFilterCondition> jlptLevelIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'jlptLevel'),
      );
    });
  }

  QueryBuilder<Lemma, Lemma, QAfterFilterCondition> jlptLevelIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'jlptLevel'),
      );
    });
  }

  QueryBuilder<Lemma, Lemma, QAfterFilterCondition> jlptLevelEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'jlptLevel',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Lemma, Lemma, QAfterFilterCondition> jlptLevelGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'jlptLevel',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Lemma, Lemma, QAfterFilterCondition> jlptLevelLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'jlptLevel',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Lemma, Lemma, QAfterFilterCondition> jlptLevelBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'jlptLevel',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Lemma, Lemma, QAfterFilterCondition> jlptLevelStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'jlptLevel',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Lemma, Lemma, QAfterFilterCondition> jlptLevelEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'jlptLevel',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Lemma, Lemma, QAfterFilterCondition> jlptLevelContains(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'jlptLevel',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Lemma, Lemma, QAfterFilterCondition> jlptLevelMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'jlptLevel',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Lemma, Lemma, QAfterFilterCondition> jlptLevelIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'jlptLevel', value: ''),
      );
    });
  }

  QueryBuilder<Lemma, Lemma, QAfterFilterCondition> jlptLevelIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'jlptLevel', value: ''),
      );
    });
  }

  QueryBuilder<Lemma, Lemma, QAfterFilterCondition> keyEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'key',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Lemma, Lemma, QAfterFilterCondition> keyGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'key',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Lemma, Lemma, QAfterFilterCondition> keyLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'key',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Lemma, Lemma, QAfterFilterCondition> keyBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'key',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Lemma, Lemma, QAfterFilterCondition> keyStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'key',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Lemma, Lemma, QAfterFilterCondition> keyEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'key',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Lemma, Lemma, QAfterFilterCondition> keyContains(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'key',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Lemma, Lemma, QAfterFilterCondition> keyMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'key',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Lemma, Lemma, QAfterFilterCondition> keyIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'key', value: ''),
      );
    });
  }

  QueryBuilder<Lemma, Lemma, QAfterFilterCondition> keyIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'key', value: ''),
      );
    });
  }

  QueryBuilder<Lemma, Lemma, QAfterFilterCondition> posTagIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'posTag'),
      );
    });
  }

  QueryBuilder<Lemma, Lemma, QAfterFilterCondition> posTagIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'posTag'),
      );
    });
  }

  QueryBuilder<Lemma, Lemma, QAfterFilterCondition> posTagEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'posTag',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Lemma, Lemma, QAfterFilterCondition> posTagGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'posTag',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Lemma, Lemma, QAfterFilterCondition> posTagLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'posTag',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Lemma, Lemma, QAfterFilterCondition> posTagBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'posTag',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Lemma, Lemma, QAfterFilterCondition> posTagStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'posTag',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Lemma, Lemma, QAfterFilterCondition> posTagEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'posTag',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Lemma, Lemma, QAfterFilterCondition> posTagContains(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'posTag',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Lemma, Lemma, QAfterFilterCondition> posTagMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'posTag',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Lemma, Lemma, QAfterFilterCondition> posTagIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'posTag', value: ''),
      );
    });
  }

  QueryBuilder<Lemma, Lemma, QAfterFilterCondition> posTagIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'posTag', value: ''),
      );
    });
  }

  QueryBuilder<Lemma, Lemma, QAfterFilterCondition> synonymKeysElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'synonymKeys',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Lemma, Lemma, QAfterFilterCondition>
  synonymKeysElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'synonymKeys',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Lemma, Lemma, QAfterFilterCondition> synonymKeysElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'synonymKeys',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Lemma, Lemma, QAfterFilterCondition> synonymKeysElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'synonymKeys',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Lemma, Lemma, QAfterFilterCondition>
  synonymKeysElementStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'synonymKeys',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Lemma, Lemma, QAfterFilterCondition> synonymKeysElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'synonymKeys',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Lemma, Lemma, QAfterFilterCondition> synonymKeysElementContains(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'synonymKeys',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Lemma, Lemma, QAfterFilterCondition> synonymKeysElementMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'synonymKeys',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Lemma, Lemma, QAfterFilterCondition>
  synonymKeysElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'synonymKeys', value: ''),
      );
    });
  }

  QueryBuilder<Lemma, Lemma, QAfterFilterCondition>
  synonymKeysElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'synonymKeys', value: ''),
      );
    });
  }

  QueryBuilder<Lemma, Lemma, QAfterFilterCondition> synonymKeysLengthEqualTo(
    int length,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'synonymKeys', length, true, length, true);
    });
  }

  QueryBuilder<Lemma, Lemma, QAfterFilterCondition> synonymKeysIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'synonymKeys', 0, true, 0, true);
    });
  }

  QueryBuilder<Lemma, Lemma, QAfterFilterCondition> synonymKeysIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'synonymKeys', 0, false, 999999, true);
    });
  }

  QueryBuilder<Lemma, Lemma, QAfterFilterCondition> synonymKeysLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'synonymKeys', 0, true, length, include);
    });
  }

  QueryBuilder<Lemma, Lemma, QAfterFilterCondition>
  synonymKeysLengthGreaterThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'synonymKeys', length, include, 999999, true);
    });
  }

  QueryBuilder<Lemma, Lemma, QAfterFilterCondition> synonymKeysLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'synonymKeys',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<Lemma, Lemma, QAfterFilterCondition> versionsLengthEqualTo(
    int length,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'versions', length, true, length, true);
    });
  }

  QueryBuilder<Lemma, Lemma, QAfterFilterCondition> versionsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'versions', 0, true, 0, true);
    });
  }

  QueryBuilder<Lemma, Lemma, QAfterFilterCondition> versionsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'versions', 0, false, 999999, true);
    });
  }

  QueryBuilder<Lemma, Lemma, QAfterFilterCondition> versionsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'versions', 0, true, length, include);
    });
  }

  QueryBuilder<Lemma, Lemma, QAfterFilterCondition> versionsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'versions', length, include, 999999, true);
    });
  }

  QueryBuilder<Lemma, Lemma, QAfterFilterCondition> versionsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'versions',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }
}

extension LemmaQueryObject on QueryBuilder<Lemma, Lemma, QFilterCondition> {
  QueryBuilder<Lemma, Lemma, QAfterFilterCondition> formsElement(
    FilterQuery<LemmaForm> q,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'forms');
    });
  }

  QueryBuilder<Lemma, Lemma, QAfterFilterCondition> sync(
    FilterQuery<SyncMeta> q,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'sync');
    });
  }

  QueryBuilder<Lemma, Lemma, QAfterFilterCondition> versionsElement(
    FilterQuery<ReadingItem> q,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'versions');
    });
  }
}

extension LemmaQueryLinks on QueryBuilder<Lemma, Lemma, QFilterCondition> {}

extension LemmaQuerySortBy on QueryBuilder<Lemma, Lemma, QSortBy> {
  QueryBuilder<Lemma, Lemma, QAfterSortBy> sortByJlptLevel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'jlptLevel', Sort.asc);
    });
  }

  QueryBuilder<Lemma, Lemma, QAfterSortBy> sortByJlptLevelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'jlptLevel', Sort.desc);
    });
  }

  QueryBuilder<Lemma, Lemma, QAfterSortBy> sortByKey() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'key', Sort.asc);
    });
  }

  QueryBuilder<Lemma, Lemma, QAfterSortBy> sortByKeyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'key', Sort.desc);
    });
  }

  QueryBuilder<Lemma, Lemma, QAfterSortBy> sortByPosTag() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'posTag', Sort.asc);
    });
  }

  QueryBuilder<Lemma, Lemma, QAfterSortBy> sortByPosTagDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'posTag', Sort.desc);
    });
  }
}

extension LemmaQuerySortThenBy on QueryBuilder<Lemma, Lemma, QSortThenBy> {
  QueryBuilder<Lemma, Lemma, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Lemma, Lemma, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Lemma, Lemma, QAfterSortBy> thenByJlptLevel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'jlptLevel', Sort.asc);
    });
  }

  QueryBuilder<Lemma, Lemma, QAfterSortBy> thenByJlptLevelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'jlptLevel', Sort.desc);
    });
  }

  QueryBuilder<Lemma, Lemma, QAfterSortBy> thenByKey() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'key', Sort.asc);
    });
  }

  QueryBuilder<Lemma, Lemma, QAfterSortBy> thenByKeyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'key', Sort.desc);
    });
  }

  QueryBuilder<Lemma, Lemma, QAfterSortBy> thenByPosTag() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'posTag', Sort.asc);
    });
  }

  QueryBuilder<Lemma, Lemma, QAfterSortBy> thenByPosTagDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'posTag', Sort.desc);
    });
  }
}

extension LemmaQueryWhereDistinct on QueryBuilder<Lemma, Lemma, QDistinct> {
  QueryBuilder<Lemma, Lemma, QDistinct> distinctByAntonymKeys() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'antonymKeys');
    });
  }

  QueryBuilder<Lemma, Lemma, QDistinct> distinctByJlptLevel({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'jlptLevel', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Lemma, Lemma, QDistinct> distinctByKey({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'key', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Lemma, Lemma, QDistinct> distinctByPosTag({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'posTag', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Lemma, Lemma, QDistinct> distinctBySynonymKeys() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'synonymKeys');
    });
  }
}

extension LemmaQueryProperty on QueryBuilder<Lemma, Lemma, QQueryProperty> {
  QueryBuilder<Lemma, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Lemma, List<String>, QQueryOperations> antonymKeysProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'antonymKeys');
    });
  }

  QueryBuilder<Lemma, List<LemmaForm>, QQueryOperations> formsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'forms');
    });
  }

  QueryBuilder<Lemma, String?, QQueryOperations> jlptLevelProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'jlptLevel');
    });
  }

  QueryBuilder<Lemma, String, QQueryOperations> keyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'key');
    });
  }

  QueryBuilder<Lemma, String?, QQueryOperations> posTagProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'posTag');
    });
  }

  QueryBuilder<Lemma, SyncMeta, QQueryOperations> syncProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'sync');
    });
  }

  QueryBuilder<Lemma, List<String>, QQueryOperations> synonymKeysProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'synonymKeys');
    });
  }

  QueryBuilder<Lemma, List<ReadingItem>, QQueryOperations> versionsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'versions');
    });
  }
}

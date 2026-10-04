// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'phrase.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetPhraseCollection on Isar {
  IsarCollection<Phrase> get phrases => this.collection();
}

const PhraseSchema = CollectionSchema(
  name: r'Phrase',
  id: -3655984391187093744,
  properties: {
    r'endTime': PropertySchema(id: 0, name: r'endTime', type: IsarType.long),
    r'groups': PropertySchema(
      id: 1,
      name: r'groups',
      type: IsarType.objectList,

      target: r'AlignGroup',
    ),
    r'lemmaKeys': PropertySchema(
      id: 2,
      name: r'lemmaKeys',
      type: IsarType.stringList,
    ),
    r'originalVersions': PropertySchema(
      id: 3,
      name: r'originalVersions',
      type: IsarType.objectList,

      target: r'ReadingItem',
    ),
    r'patterns': PropertySchema(
      id: 4,
      name: r'patterns',
      type: IsarType.objectList,

      target: r'GrammarPattern',
    ),
    r'phraseOrder': PropertySchema(
      id: 5,
      name: r'phraseOrder',
      type: IsarType.long,
    ),
    r'sourceTokens': PropertySchema(
      id: 6,
      name: r'sourceTokens',
      type: IsarType.objectList,

      target: r'SourceToken',
    ),
    r'stages': PropertySchema(
      id: 7,
      name: r'stages',
      type: IsarType.objectList,

      target: r'StageEntry',
    ),
    r'startTime': PropertySchema(
      id: 8,
      name: r'startTime',
      type: IsarType.long,
    ),
    r'sync': PropertySchema(
      id: 9,
      name: r'sync',
      type: IsarType.object,

      target: r'SyncMeta',
    ),
    r'targetTokens': PropertySchema(
      id: 10,
      name: r'targetTokens',
      type: IsarType.objectList,

      target: r'TargetToken',
    ),
    r'translatedPhrase': PropertySchema(
      id: 11,
      name: r'translatedPhrase',
      type: IsarType.string,
    ),
    r'videoId': PropertySchema(id: 12, name: r'videoId', type: IsarType.long),
  },

  estimateSize: _phraseEstimateSize,
  serialize: _phraseSerialize,
  deserialize: _phraseDeserialize,
  deserializeProp: _phraseDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {
    r'ReadingItem': ReadingItemSchema,
    r'StageEntry': StageEntrySchema,
    r'SourceToken': SourceTokenSchema,
    r'TargetToken': TargetTokenSchema,
    r'AlignGroup': AlignGroupSchema,
    r'GrammarPattern': GrammarPatternSchema,
    r'SyncMeta': SyncMetaSchema,
  },

  getId: _phraseGetId,
  getLinks: _phraseGetLinks,
  attach: _phraseAttach,
  version: '3.3.2',
);

int _phraseEstimateSize(
  Phrase object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.groups.length * 3;
  {
    final offsets = allOffsets[AlignGroup]!;
    for (var i = 0; i < object.groups.length; i++) {
      final value = object.groups[i];
      bytesCount += AlignGroupSchema.estimateSize(value, offsets, allOffsets);
    }
  }
  bytesCount += 3 + object.lemmaKeys.length * 3;
  {
    for (var i = 0; i < object.lemmaKeys.length; i++) {
      final value = object.lemmaKeys[i];
      bytesCount += value.length * 3;
    }
  }
  bytesCount += 3 + object.originalVersions.length * 3;
  {
    final offsets = allOffsets[ReadingItem]!;
    for (var i = 0; i < object.originalVersions.length; i++) {
      final value = object.originalVersions[i];
      bytesCount += ReadingItemSchema.estimateSize(value, offsets, allOffsets);
    }
  }
  bytesCount += 3 + object.patterns.length * 3;
  {
    final offsets = allOffsets[GrammarPattern]!;
    for (var i = 0; i < object.patterns.length; i++) {
      final value = object.patterns[i];
      bytesCount += GrammarPatternSchema.estimateSize(
        value,
        offsets,
        allOffsets,
      );
    }
  }
  bytesCount += 3 + object.sourceTokens.length * 3;
  {
    final offsets = allOffsets[SourceToken]!;
    for (var i = 0; i < object.sourceTokens.length; i++) {
      final value = object.sourceTokens[i];
      bytesCount += SourceTokenSchema.estimateSize(value, offsets, allOffsets);
    }
  }
  bytesCount += 3 + object.stages.length * 3;
  {
    final offsets = allOffsets[StageEntry]!;
    for (var i = 0; i < object.stages.length; i++) {
      final value = object.stages[i];
      bytesCount += StageEntrySchema.estimateSize(value, offsets, allOffsets);
    }
  }
  bytesCount +=
      3 +
      SyncMetaSchema.estimateSize(
        object.sync,
        allOffsets[SyncMeta]!,
        allOffsets,
      );
  bytesCount += 3 + object.targetTokens.length * 3;
  {
    final offsets = allOffsets[TargetToken]!;
    for (var i = 0; i < object.targetTokens.length; i++) {
      final value = object.targetTokens[i];
      bytesCount += TargetTokenSchema.estimateSize(value, offsets, allOffsets);
    }
  }
  {
    final value = object.translatedPhrase;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _phraseSerialize(
  Phrase object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.endTime);
  writer.writeObjectList<AlignGroup>(
    offsets[1],
    allOffsets,
    AlignGroupSchema.serialize,
    object.groups,
  );
  writer.writeStringList(offsets[2], object.lemmaKeys);
  writer.writeObjectList<ReadingItem>(
    offsets[3],
    allOffsets,
    ReadingItemSchema.serialize,
    object.originalVersions,
  );
  writer.writeObjectList<GrammarPattern>(
    offsets[4],
    allOffsets,
    GrammarPatternSchema.serialize,
    object.patterns,
  );
  writer.writeLong(offsets[5], object.phraseOrder);
  writer.writeObjectList<SourceToken>(
    offsets[6],
    allOffsets,
    SourceTokenSchema.serialize,
    object.sourceTokens,
  );
  writer.writeObjectList<StageEntry>(
    offsets[7],
    allOffsets,
    StageEntrySchema.serialize,
    object.stages,
  );
  writer.writeLong(offsets[8], object.startTime);
  writer.writeObject<SyncMeta>(
    offsets[9],
    allOffsets,
    SyncMetaSchema.serialize,
    object.sync,
  );
  writer.writeObjectList<TargetToken>(
    offsets[10],
    allOffsets,
    TargetTokenSchema.serialize,
    object.targetTokens,
  );
  writer.writeString(offsets[11], object.translatedPhrase);
  writer.writeLong(offsets[12], object.videoId);
}

Phrase _phraseDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Phrase();
  object.endTime = reader.readLong(offsets[0]);
  object.groups =
      reader.readObjectList<AlignGroup>(
        offsets[1],
        AlignGroupSchema.deserialize,
        allOffsets,
        AlignGroup(),
      ) ??
      [];
  object.id = id;
  object.lemmaKeys = reader.readStringList(offsets[2]) ?? [];
  object.originalVersions =
      reader.readObjectList<ReadingItem>(
        offsets[3],
        ReadingItemSchema.deserialize,
        allOffsets,
        ReadingItem(),
      ) ??
      [];
  object.patterns =
      reader.readObjectList<GrammarPattern>(
        offsets[4],
        GrammarPatternSchema.deserialize,
        allOffsets,
        GrammarPattern(),
      ) ??
      [];
  object.phraseOrder = reader.readLong(offsets[5]);
  object.sourceTokens =
      reader.readObjectList<SourceToken>(
        offsets[6],
        SourceTokenSchema.deserialize,
        allOffsets,
        SourceToken(),
      ) ??
      [];
  object.stages =
      reader.readObjectList<StageEntry>(
        offsets[7],
        StageEntrySchema.deserialize,
        allOffsets,
        StageEntry(),
      ) ??
      [];
  object.startTime = reader.readLong(offsets[8]);
  object.sync =
      reader.readObjectOrNull<SyncMeta>(
        offsets[9],
        SyncMetaSchema.deserialize,
        allOffsets,
      ) ??
      SyncMeta();
  object.targetTokens =
      reader.readObjectList<TargetToken>(
        offsets[10],
        TargetTokenSchema.deserialize,
        allOffsets,
        TargetToken(),
      ) ??
      [];
  object.translatedPhrase = reader.readStringOrNull(offsets[11]);
  object.videoId = reader.readLong(offsets[12]);
  return object;
}

P _phraseDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLong(offset)) as P;
    case 1:
      return (reader.readObjectList<AlignGroup>(
                offset,
                AlignGroupSchema.deserialize,
                allOffsets,
                AlignGroup(),
              ) ??
              [])
          as P;
    case 2:
      return (reader.readStringList(offset) ?? []) as P;
    case 3:
      return (reader.readObjectList<ReadingItem>(
                offset,
                ReadingItemSchema.deserialize,
                allOffsets,
                ReadingItem(),
              ) ??
              [])
          as P;
    case 4:
      return (reader.readObjectList<GrammarPattern>(
                offset,
                GrammarPatternSchema.deserialize,
                allOffsets,
                GrammarPattern(),
              ) ??
              [])
          as P;
    case 5:
      return (reader.readLong(offset)) as P;
    case 6:
      return (reader.readObjectList<SourceToken>(
                offset,
                SourceTokenSchema.deserialize,
                allOffsets,
                SourceToken(),
              ) ??
              [])
          as P;
    case 7:
      return (reader.readObjectList<StageEntry>(
                offset,
                StageEntrySchema.deserialize,
                allOffsets,
                StageEntry(),
              ) ??
              [])
          as P;
    case 8:
      return (reader.readLong(offset)) as P;
    case 9:
      return (reader.readObjectOrNull<SyncMeta>(
                offset,
                SyncMetaSchema.deserialize,
                allOffsets,
              ) ??
              SyncMeta())
          as P;
    case 10:
      return (reader.readObjectList<TargetToken>(
                offset,
                TargetTokenSchema.deserialize,
                allOffsets,
                TargetToken(),
              ) ??
              [])
          as P;
    case 11:
      return (reader.readStringOrNull(offset)) as P;
    case 12:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _phraseGetId(Phrase object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _phraseGetLinks(Phrase object) {
  return [];
}

void _phraseAttach(IsarCollection<dynamic> col, Id id, Phrase object) {
  object.id = id;
}

extension PhraseQueryWhereSort on QueryBuilder<Phrase, Phrase, QWhere> {
  QueryBuilder<Phrase, Phrase, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension PhraseQueryWhere on QueryBuilder<Phrase, Phrase, QWhereClause> {
  QueryBuilder<Phrase, Phrase, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(lower: id, upper: id));
    });
  }

  QueryBuilder<Phrase, Phrase, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<Phrase, Phrase, QAfterWhereClause> idGreaterThan(
    Id id, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Phrase, Phrase, QAfterWhereClause> idLessThan(
    Id id, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Phrase, Phrase, QAfterWhereClause> idBetween(
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

extension PhraseQueryFilter on QueryBuilder<Phrase, Phrase, QFilterCondition> {
  QueryBuilder<Phrase, Phrase, QAfterFilterCondition> endTimeEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'endTime', value: value),
      );
    });
  }

  QueryBuilder<Phrase, Phrase, QAfterFilterCondition> endTimeGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'endTime',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Phrase, Phrase, QAfterFilterCondition> endTimeLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'endTime',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Phrase, Phrase, QAfterFilterCondition> endTimeBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'endTime',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<Phrase, Phrase, QAfterFilterCondition> groupsLengthEqualTo(
    int length,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'groups', length, true, length, true);
    });
  }

  QueryBuilder<Phrase, Phrase, QAfterFilterCondition> groupsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'groups', 0, true, 0, true);
    });
  }

  QueryBuilder<Phrase, Phrase, QAfterFilterCondition> groupsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'groups', 0, false, 999999, true);
    });
  }

  QueryBuilder<Phrase, Phrase, QAfterFilterCondition> groupsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'groups', 0, true, length, include);
    });
  }

  QueryBuilder<Phrase, Phrase, QAfterFilterCondition> groupsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'groups', length, include, 999999, true);
    });
  }

  QueryBuilder<Phrase, Phrase, QAfterFilterCondition> groupsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'groups',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<Phrase, Phrase, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'id', value: value),
      );
    });
  }

  QueryBuilder<Phrase, Phrase, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Phrase, Phrase, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Phrase, Phrase, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Phrase, Phrase, QAfterFilterCondition> lemmaKeysElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'lemmaKeys',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Phrase, Phrase, QAfterFilterCondition>
  lemmaKeysElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'lemmaKeys',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Phrase, Phrase, QAfterFilterCondition> lemmaKeysElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'lemmaKeys',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Phrase, Phrase, QAfterFilterCondition> lemmaKeysElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'lemmaKeys',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Phrase, Phrase, QAfterFilterCondition>
  lemmaKeysElementStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'lemmaKeys',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Phrase, Phrase, QAfterFilterCondition> lemmaKeysElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'lemmaKeys',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Phrase, Phrase, QAfterFilterCondition> lemmaKeysElementContains(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'lemmaKeys',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Phrase, Phrase, QAfterFilterCondition> lemmaKeysElementMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'lemmaKeys',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Phrase, Phrase, QAfterFilterCondition>
  lemmaKeysElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'lemmaKeys', value: ''),
      );
    });
  }

  QueryBuilder<Phrase, Phrase, QAfterFilterCondition>
  lemmaKeysElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'lemmaKeys', value: ''),
      );
    });
  }

  QueryBuilder<Phrase, Phrase, QAfterFilterCondition> lemmaKeysLengthEqualTo(
    int length,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'lemmaKeys', length, true, length, true);
    });
  }

  QueryBuilder<Phrase, Phrase, QAfterFilterCondition> lemmaKeysIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'lemmaKeys', 0, true, 0, true);
    });
  }

  QueryBuilder<Phrase, Phrase, QAfterFilterCondition> lemmaKeysIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'lemmaKeys', 0, false, 999999, true);
    });
  }

  QueryBuilder<Phrase, Phrase, QAfterFilterCondition> lemmaKeysLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'lemmaKeys', 0, true, length, include);
    });
  }

  QueryBuilder<Phrase, Phrase, QAfterFilterCondition>
  lemmaKeysLengthGreaterThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'lemmaKeys', length, include, 999999, true);
    });
  }

  QueryBuilder<Phrase, Phrase, QAfterFilterCondition> lemmaKeysLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'lemmaKeys',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<Phrase, Phrase, QAfterFilterCondition>
  originalVersionsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'originalVersions', length, true, length, true);
    });
  }

  QueryBuilder<Phrase, Phrase, QAfterFilterCondition>
  originalVersionsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'originalVersions', 0, true, 0, true);
    });
  }

  QueryBuilder<Phrase, Phrase, QAfterFilterCondition>
  originalVersionsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'originalVersions', 0, false, 999999, true);
    });
  }

  QueryBuilder<Phrase, Phrase, QAfterFilterCondition>
  originalVersionsLengthLessThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'originalVersions', 0, true, length, include);
    });
  }

  QueryBuilder<Phrase, Phrase, QAfterFilterCondition>
  originalVersionsLengthGreaterThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'originalVersions',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Phrase, Phrase, QAfterFilterCondition>
  originalVersionsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'originalVersions',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<Phrase, Phrase, QAfterFilterCondition> patternsLengthEqualTo(
    int length,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'patterns', length, true, length, true);
    });
  }

  QueryBuilder<Phrase, Phrase, QAfterFilterCondition> patternsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'patterns', 0, true, 0, true);
    });
  }

  QueryBuilder<Phrase, Phrase, QAfterFilterCondition> patternsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'patterns', 0, false, 999999, true);
    });
  }

  QueryBuilder<Phrase, Phrase, QAfterFilterCondition> patternsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'patterns', 0, true, length, include);
    });
  }

  QueryBuilder<Phrase, Phrase, QAfterFilterCondition> patternsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'patterns', length, include, 999999, true);
    });
  }

  QueryBuilder<Phrase, Phrase, QAfterFilterCondition> patternsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'patterns',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<Phrase, Phrase, QAfterFilterCondition> phraseOrderEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'phraseOrder', value: value),
      );
    });
  }

  QueryBuilder<Phrase, Phrase, QAfterFilterCondition> phraseOrderGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'phraseOrder',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Phrase, Phrase, QAfterFilterCondition> phraseOrderLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'phraseOrder',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Phrase, Phrase, QAfterFilterCondition> phraseOrderBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'phraseOrder',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<Phrase, Phrase, QAfterFilterCondition> sourceTokensLengthEqualTo(
    int length,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'sourceTokens', length, true, length, true);
    });
  }

  QueryBuilder<Phrase, Phrase, QAfterFilterCondition> sourceTokensIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'sourceTokens', 0, true, 0, true);
    });
  }

  QueryBuilder<Phrase, Phrase, QAfterFilterCondition> sourceTokensIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'sourceTokens', 0, false, 999999, true);
    });
  }

  QueryBuilder<Phrase, Phrase, QAfterFilterCondition>
  sourceTokensLengthLessThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'sourceTokens', 0, true, length, include);
    });
  }

  QueryBuilder<Phrase, Phrase, QAfterFilterCondition>
  sourceTokensLengthGreaterThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'sourceTokens', length, include, 999999, true);
    });
  }

  QueryBuilder<Phrase, Phrase, QAfterFilterCondition> sourceTokensLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'sourceTokens',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<Phrase, Phrase, QAfterFilterCondition> stagesLengthEqualTo(
    int length,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'stages', length, true, length, true);
    });
  }

  QueryBuilder<Phrase, Phrase, QAfterFilterCondition> stagesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'stages', 0, true, 0, true);
    });
  }

  QueryBuilder<Phrase, Phrase, QAfterFilterCondition> stagesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'stages', 0, false, 999999, true);
    });
  }

  QueryBuilder<Phrase, Phrase, QAfterFilterCondition> stagesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'stages', 0, true, length, include);
    });
  }

  QueryBuilder<Phrase, Phrase, QAfterFilterCondition> stagesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'stages', length, include, 999999, true);
    });
  }

  QueryBuilder<Phrase, Phrase, QAfterFilterCondition> stagesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'stages',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<Phrase, Phrase, QAfterFilterCondition> startTimeEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'startTime', value: value),
      );
    });
  }

  QueryBuilder<Phrase, Phrase, QAfterFilterCondition> startTimeGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'startTime',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Phrase, Phrase, QAfterFilterCondition> startTimeLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'startTime',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Phrase, Phrase, QAfterFilterCondition> startTimeBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'startTime',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<Phrase, Phrase, QAfterFilterCondition> targetTokensLengthEqualTo(
    int length,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'targetTokens', length, true, length, true);
    });
  }

  QueryBuilder<Phrase, Phrase, QAfterFilterCondition> targetTokensIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'targetTokens', 0, true, 0, true);
    });
  }

  QueryBuilder<Phrase, Phrase, QAfterFilterCondition> targetTokensIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'targetTokens', 0, false, 999999, true);
    });
  }

  QueryBuilder<Phrase, Phrase, QAfterFilterCondition>
  targetTokensLengthLessThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'targetTokens', 0, true, length, include);
    });
  }

  QueryBuilder<Phrase, Phrase, QAfterFilterCondition>
  targetTokensLengthGreaterThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'targetTokens', length, include, 999999, true);
    });
  }

  QueryBuilder<Phrase, Phrase, QAfterFilterCondition> targetTokensLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'targetTokens',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<Phrase, Phrase, QAfterFilterCondition> translatedPhraseIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'translatedPhrase'),
      );
    });
  }

  QueryBuilder<Phrase, Phrase, QAfterFilterCondition>
  translatedPhraseIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'translatedPhrase'),
      );
    });
  }

  QueryBuilder<Phrase, Phrase, QAfterFilterCondition> translatedPhraseEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'translatedPhrase',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Phrase, Phrase, QAfterFilterCondition>
  translatedPhraseGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'translatedPhrase',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Phrase, Phrase, QAfterFilterCondition> translatedPhraseLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'translatedPhrase',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Phrase, Phrase, QAfterFilterCondition> translatedPhraseBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'translatedPhrase',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Phrase, Phrase, QAfterFilterCondition>
  translatedPhraseStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'translatedPhrase',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Phrase, Phrase, QAfterFilterCondition> translatedPhraseEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'translatedPhrase',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Phrase, Phrase, QAfterFilterCondition> translatedPhraseContains(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'translatedPhrase',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Phrase, Phrase, QAfterFilterCondition> translatedPhraseMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'translatedPhrase',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Phrase, Phrase, QAfterFilterCondition>
  translatedPhraseIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'translatedPhrase', value: ''),
      );
    });
  }

  QueryBuilder<Phrase, Phrase, QAfterFilterCondition>
  translatedPhraseIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'translatedPhrase', value: ''),
      );
    });
  }

  QueryBuilder<Phrase, Phrase, QAfterFilterCondition> videoIdEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'videoId', value: value),
      );
    });
  }

  QueryBuilder<Phrase, Phrase, QAfterFilterCondition> videoIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'videoId',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Phrase, Phrase, QAfterFilterCondition> videoIdLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'videoId',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Phrase, Phrase, QAfterFilterCondition> videoIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'videoId',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }
}

extension PhraseQueryObject on QueryBuilder<Phrase, Phrase, QFilterCondition> {
  QueryBuilder<Phrase, Phrase, QAfterFilterCondition> groupsElement(
    FilterQuery<AlignGroup> q,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'groups');
    });
  }

  QueryBuilder<Phrase, Phrase, QAfterFilterCondition> originalVersionsElement(
    FilterQuery<ReadingItem> q,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'originalVersions');
    });
  }

  QueryBuilder<Phrase, Phrase, QAfterFilterCondition> patternsElement(
    FilterQuery<GrammarPattern> q,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'patterns');
    });
  }

  QueryBuilder<Phrase, Phrase, QAfterFilterCondition> sourceTokensElement(
    FilterQuery<SourceToken> q,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'sourceTokens');
    });
  }

  QueryBuilder<Phrase, Phrase, QAfterFilterCondition> stagesElement(
    FilterQuery<StageEntry> q,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'stages');
    });
  }

  QueryBuilder<Phrase, Phrase, QAfterFilterCondition> sync(
    FilterQuery<SyncMeta> q,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'sync');
    });
  }

  QueryBuilder<Phrase, Phrase, QAfterFilterCondition> targetTokensElement(
    FilterQuery<TargetToken> q,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'targetTokens');
    });
  }
}

extension PhraseQueryLinks on QueryBuilder<Phrase, Phrase, QFilterCondition> {}

extension PhraseQuerySortBy on QueryBuilder<Phrase, Phrase, QSortBy> {
  QueryBuilder<Phrase, Phrase, QAfterSortBy> sortByEndTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endTime', Sort.asc);
    });
  }

  QueryBuilder<Phrase, Phrase, QAfterSortBy> sortByEndTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endTime', Sort.desc);
    });
  }

  QueryBuilder<Phrase, Phrase, QAfterSortBy> sortByPhraseOrder() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'phraseOrder', Sort.asc);
    });
  }

  QueryBuilder<Phrase, Phrase, QAfterSortBy> sortByPhraseOrderDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'phraseOrder', Sort.desc);
    });
  }

  QueryBuilder<Phrase, Phrase, QAfterSortBy> sortByStartTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startTime', Sort.asc);
    });
  }

  QueryBuilder<Phrase, Phrase, QAfterSortBy> sortByStartTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startTime', Sort.desc);
    });
  }

  QueryBuilder<Phrase, Phrase, QAfterSortBy> sortByTranslatedPhrase() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'translatedPhrase', Sort.asc);
    });
  }

  QueryBuilder<Phrase, Phrase, QAfterSortBy> sortByTranslatedPhraseDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'translatedPhrase', Sort.desc);
    });
  }

  QueryBuilder<Phrase, Phrase, QAfterSortBy> sortByVideoId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'videoId', Sort.asc);
    });
  }

  QueryBuilder<Phrase, Phrase, QAfterSortBy> sortByVideoIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'videoId', Sort.desc);
    });
  }
}

extension PhraseQuerySortThenBy on QueryBuilder<Phrase, Phrase, QSortThenBy> {
  QueryBuilder<Phrase, Phrase, QAfterSortBy> thenByEndTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endTime', Sort.asc);
    });
  }

  QueryBuilder<Phrase, Phrase, QAfterSortBy> thenByEndTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endTime', Sort.desc);
    });
  }

  QueryBuilder<Phrase, Phrase, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Phrase, Phrase, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Phrase, Phrase, QAfterSortBy> thenByPhraseOrder() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'phraseOrder', Sort.asc);
    });
  }

  QueryBuilder<Phrase, Phrase, QAfterSortBy> thenByPhraseOrderDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'phraseOrder', Sort.desc);
    });
  }

  QueryBuilder<Phrase, Phrase, QAfterSortBy> thenByStartTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startTime', Sort.asc);
    });
  }

  QueryBuilder<Phrase, Phrase, QAfterSortBy> thenByStartTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startTime', Sort.desc);
    });
  }

  QueryBuilder<Phrase, Phrase, QAfterSortBy> thenByTranslatedPhrase() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'translatedPhrase', Sort.asc);
    });
  }

  QueryBuilder<Phrase, Phrase, QAfterSortBy> thenByTranslatedPhraseDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'translatedPhrase', Sort.desc);
    });
  }

  QueryBuilder<Phrase, Phrase, QAfterSortBy> thenByVideoId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'videoId', Sort.asc);
    });
  }

  QueryBuilder<Phrase, Phrase, QAfterSortBy> thenByVideoIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'videoId', Sort.desc);
    });
  }
}

extension PhraseQueryWhereDistinct on QueryBuilder<Phrase, Phrase, QDistinct> {
  QueryBuilder<Phrase, Phrase, QDistinct> distinctByEndTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'endTime');
    });
  }

  QueryBuilder<Phrase, Phrase, QDistinct> distinctByLemmaKeys() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lemmaKeys');
    });
  }

  QueryBuilder<Phrase, Phrase, QDistinct> distinctByPhraseOrder() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'phraseOrder');
    });
  }

  QueryBuilder<Phrase, Phrase, QDistinct> distinctByStartTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'startTime');
    });
  }

  QueryBuilder<Phrase, Phrase, QDistinct> distinctByTranslatedPhrase({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(
        r'translatedPhrase',
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<Phrase, Phrase, QDistinct> distinctByVideoId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'videoId');
    });
  }
}

extension PhraseQueryProperty on QueryBuilder<Phrase, Phrase, QQueryProperty> {
  QueryBuilder<Phrase, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Phrase, int, QQueryOperations> endTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'endTime');
    });
  }

  QueryBuilder<Phrase, List<AlignGroup>, QQueryOperations> groupsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'groups');
    });
  }

  QueryBuilder<Phrase, List<String>, QQueryOperations> lemmaKeysProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lemmaKeys');
    });
  }

  QueryBuilder<Phrase, List<ReadingItem>, QQueryOperations>
  originalVersionsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'originalVersions');
    });
  }

  QueryBuilder<Phrase, List<GrammarPattern>, QQueryOperations>
  patternsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'patterns');
    });
  }

  QueryBuilder<Phrase, int, QQueryOperations> phraseOrderProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'phraseOrder');
    });
  }

  QueryBuilder<Phrase, List<SourceToken>, QQueryOperations>
  sourceTokensProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'sourceTokens');
    });
  }

  QueryBuilder<Phrase, List<StageEntry>, QQueryOperations> stagesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'stages');
    });
  }

  QueryBuilder<Phrase, int, QQueryOperations> startTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'startTime');
    });
  }

  QueryBuilder<Phrase, SyncMeta, QQueryOperations> syncProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'sync');
    });
  }

  QueryBuilder<Phrase, List<TargetToken>, QQueryOperations>
  targetTokensProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'targetTokens');
    });
  }

  QueryBuilder<Phrase, String?, QQueryOperations> translatedPhraseProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'translatedPhrase');
    });
  }

  QueryBuilder<Phrase, int, QQueryOperations> videoIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'videoId');
    });
  }
}

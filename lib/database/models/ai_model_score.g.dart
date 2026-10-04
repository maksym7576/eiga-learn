// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_model_score.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetAiModelScoreCollection on Isar {
  IsarCollection<AiModelScore> get aiModelScores => this.collection();
}

const AiModelScoreSchema = CollectionSchema(
  name: r'AiModelScore',
  id: 7444514959358312902,
  properties: {
    r'algorithmVersion': PropertySchema(
      id: 0,
      name: r'algorithmVersion',
      type: IsarType.long,
    ),
    r'components': PropertySchema(
      id: 1,
      name: r'components',
      type: IsarType.object,

      target: r'ScoreComponents',
    ),
    r'computedAt': PropertySchema(
      id: 2,
      name: r'computedAt',
      type: IsarType.dateTime,
    ),
    r'history': PropertySchema(
      id: 3,
      name: r'history',
      type: IsarType.objectList,

      target: r'ScoreHistoryEntry',
    ),
    r'key': PropertySchema(id: 4, name: r'key', type: IsarType.string),
    r'modelName': PropertySchema(
      id: 5,
      name: r'modelName',
      type: IsarType.string,
    ),
    r'sampleSize': PropertySchema(
      id: 6,
      name: r'sampleSize',
      type: IsarType.long,
    ),
    r'score': PropertySchema(id: 7, name: r'score', type: IsarType.double),
    r'step': PropertySchema(id: 8, name: r'step', type: IsarType.string),
    r'windowDays': PropertySchema(
      id: 9,
      name: r'windowDays',
      type: IsarType.long,
    ),
  },

  estimateSize: _aiModelScoreEstimateSize,
  serialize: _aiModelScoreSerialize,
  deserialize: _aiModelScoreDeserialize,
  deserializeProp: _aiModelScoreDeserializeProp,
  idName: r'id',
  indexes: {
    r'key': IndexSchema(
      id: -4906094122524121629,
      name: r'key',
      unique: true,
      replace: true,
      properties: [
        IndexPropertySchema(
          name: r'key',
          type: IndexType.hash,
          caseSensitive: true,
        ),
      ],
    ),
  },
  links: {},
  embeddedSchemas: {
    r'ScoreComponents': ScoreComponentsSchema,
    r'ScoreHistoryEntry': ScoreHistoryEntrySchema,
  },

  getId: _aiModelScoreGetId,
  getLinks: _aiModelScoreGetLinks,
  attach: _aiModelScoreAttach,
  version: '3.3.2',
);

int _aiModelScoreEstimateSize(
  AiModelScore object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount +=
      3 +
      ScoreComponentsSchema.estimateSize(
        object.components,
        allOffsets[ScoreComponents]!,
        allOffsets,
      );
  bytesCount += 3 + object.history.length * 3;
  {
    final offsets = allOffsets[ScoreHistoryEntry]!;
    for (var i = 0; i < object.history.length; i++) {
      final value = object.history[i];
      bytesCount += ScoreHistoryEntrySchema.estimateSize(
        value,
        offsets,
        allOffsets,
      );
    }
  }
  bytesCount += 3 + object.key.length * 3;
  bytesCount += 3 + object.modelName.length * 3;
  bytesCount += 3 + object.step.length * 3;
  return bytesCount;
}

void _aiModelScoreSerialize(
  AiModelScore object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.algorithmVersion);
  writer.writeObject<ScoreComponents>(
    offsets[1],
    allOffsets,
    ScoreComponentsSchema.serialize,
    object.components,
  );
  writer.writeDateTime(offsets[2], object.computedAt);
  writer.writeObjectList<ScoreHistoryEntry>(
    offsets[3],
    allOffsets,
    ScoreHistoryEntrySchema.serialize,
    object.history,
  );
  writer.writeString(offsets[4], object.key);
  writer.writeString(offsets[5], object.modelName);
  writer.writeLong(offsets[6], object.sampleSize);
  writer.writeDouble(offsets[7], object.score);
  writer.writeString(offsets[8], object.step);
  writer.writeLong(offsets[9], object.windowDays);
}

AiModelScore _aiModelScoreDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = AiModelScore();
  object.algorithmVersion = reader.readLong(offsets[0]);
  object.components =
      reader.readObjectOrNull<ScoreComponents>(
        offsets[1],
        ScoreComponentsSchema.deserialize,
        allOffsets,
      ) ??
      ScoreComponents();
  object.computedAt = reader.readDateTime(offsets[2]);
  object.history =
      reader.readObjectList<ScoreHistoryEntry>(
        offsets[3],
        ScoreHistoryEntrySchema.deserialize,
        allOffsets,
        ScoreHistoryEntry(),
      ) ??
      [];
  object.id = id;
  object.key = reader.readString(offsets[4]);
  object.modelName = reader.readString(offsets[5]);
  object.sampleSize = reader.readLong(offsets[6]);
  object.score = reader.readDouble(offsets[7]);
  object.step = reader.readString(offsets[8]);
  object.windowDays = reader.readLongOrNull(offsets[9]);
  return object;
}

P _aiModelScoreDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLong(offset)) as P;
    case 1:
      return (reader.readObjectOrNull<ScoreComponents>(
                offset,
                ScoreComponentsSchema.deserialize,
                allOffsets,
              ) ??
              ScoreComponents())
          as P;
    case 2:
      return (reader.readDateTime(offset)) as P;
    case 3:
      return (reader.readObjectList<ScoreHistoryEntry>(
                offset,
                ScoreHistoryEntrySchema.deserialize,
                allOffsets,
                ScoreHistoryEntry(),
              ) ??
              [])
          as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader.readLong(offset)) as P;
    case 7:
      return (reader.readDouble(offset)) as P;
    case 8:
      return (reader.readString(offset)) as P;
    case 9:
      return (reader.readLongOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _aiModelScoreGetId(AiModelScore object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _aiModelScoreGetLinks(AiModelScore object) {
  return [];
}

void _aiModelScoreAttach(
  IsarCollection<dynamic> col,
  Id id,
  AiModelScore object,
) {
  object.id = id;
}

extension AiModelScoreByIndex on IsarCollection<AiModelScore> {
  Future<AiModelScore?> getByKey(String key) {
    return getByIndex(r'key', [key]);
  }

  AiModelScore? getByKeySync(String key) {
    return getByIndexSync(r'key', [key]);
  }

  Future<bool> deleteByKey(String key) {
    return deleteByIndex(r'key', [key]);
  }

  bool deleteByKeySync(String key) {
    return deleteByIndexSync(r'key', [key]);
  }

  Future<List<AiModelScore?>> getAllByKey(List<String> keyValues) {
    final values = keyValues.map((e) => [e]).toList();
    return getAllByIndex(r'key', values);
  }

  List<AiModelScore?> getAllByKeySync(List<String> keyValues) {
    final values = keyValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'key', values);
  }

  Future<int> deleteAllByKey(List<String> keyValues) {
    final values = keyValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'key', values);
  }

  int deleteAllByKeySync(List<String> keyValues) {
    final values = keyValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'key', values);
  }

  Future<Id> putByKey(AiModelScore object) {
    return putByIndex(r'key', object);
  }

  Id putByKeySync(AiModelScore object, {bool saveLinks = true}) {
    return putByIndexSync(r'key', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByKey(List<AiModelScore> objects) {
    return putAllByIndex(r'key', objects);
  }

  List<Id> putAllByKeySync(
    List<AiModelScore> objects, {
    bool saveLinks = true,
  }) {
    return putAllByIndexSync(r'key', objects, saveLinks: saveLinks);
  }
}

extension AiModelScoreQueryWhereSort
    on QueryBuilder<AiModelScore, AiModelScore, QWhere> {
  QueryBuilder<AiModelScore, AiModelScore, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension AiModelScoreQueryWhere
    on QueryBuilder<AiModelScore, AiModelScore, QWhereClause> {
  QueryBuilder<AiModelScore, AiModelScore, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(lower: id, upper: id));
    });
  }

  QueryBuilder<AiModelScore, AiModelScore, QAfterWhereClause> idNotEqualTo(
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

  QueryBuilder<AiModelScore, AiModelScore, QAfterWhereClause> idGreaterThan(
    Id id, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<AiModelScore, AiModelScore, QAfterWhereClause> idLessThan(
    Id id, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<AiModelScore, AiModelScore, QAfterWhereClause> idBetween(
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

  QueryBuilder<AiModelScore, AiModelScore, QAfterWhereClause> keyEqualTo(
    String key,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'key', value: [key]),
      );
    });
  }

  QueryBuilder<AiModelScore, AiModelScore, QAfterWhereClause> keyNotEqualTo(
    String key,
  ) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'key',
                lower: [],
                upper: [key],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'key',
                lower: [key],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'key',
                lower: [key],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'key',
                lower: [],
                upper: [key],
                includeUpper: false,
              ),
            );
      }
    });
  }
}

extension AiModelScoreQueryFilter
    on QueryBuilder<AiModelScore, AiModelScore, QFilterCondition> {
  QueryBuilder<AiModelScore, AiModelScore, QAfterFilterCondition>
  algorithmVersionEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'algorithmVersion', value: value),
      );
    });
  }

  QueryBuilder<AiModelScore, AiModelScore, QAfterFilterCondition>
  algorithmVersionGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'algorithmVersion',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<AiModelScore, AiModelScore, QAfterFilterCondition>
  algorithmVersionLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'algorithmVersion',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<AiModelScore, AiModelScore, QAfterFilterCondition>
  algorithmVersionBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'algorithmVersion',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<AiModelScore, AiModelScore, QAfterFilterCondition>
  computedAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'computedAt', value: value),
      );
    });
  }

  QueryBuilder<AiModelScore, AiModelScore, QAfterFilterCondition>
  computedAtGreaterThan(DateTime value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'computedAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<AiModelScore, AiModelScore, QAfterFilterCondition>
  computedAtLessThan(DateTime value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'computedAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<AiModelScore, AiModelScore, QAfterFilterCondition>
  computedAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'computedAt',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<AiModelScore, AiModelScore, QAfterFilterCondition>
  historyLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'history', length, true, length, true);
    });
  }

  QueryBuilder<AiModelScore, AiModelScore, QAfterFilterCondition>
  historyIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'history', 0, true, 0, true);
    });
  }

  QueryBuilder<AiModelScore, AiModelScore, QAfterFilterCondition>
  historyIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'history', 0, false, 999999, true);
    });
  }

  QueryBuilder<AiModelScore, AiModelScore, QAfterFilterCondition>
  historyLengthLessThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'history', 0, true, length, include);
    });
  }

  QueryBuilder<AiModelScore, AiModelScore, QAfterFilterCondition>
  historyLengthGreaterThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'history', length, include, 999999, true);
    });
  }

  QueryBuilder<AiModelScore, AiModelScore, QAfterFilterCondition>
  historyLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'history',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<AiModelScore, AiModelScore, QAfterFilterCondition> idEqualTo(
    Id value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'id', value: value),
      );
    });
  }

  QueryBuilder<AiModelScore, AiModelScore, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<AiModelScore, AiModelScore, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<AiModelScore, AiModelScore, QAfterFilterCondition> idBetween(
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

  QueryBuilder<AiModelScore, AiModelScore, QAfterFilterCondition> keyEqualTo(
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

  QueryBuilder<AiModelScore, AiModelScore, QAfterFilterCondition>
  keyGreaterThan(
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

  QueryBuilder<AiModelScore, AiModelScore, QAfterFilterCondition> keyLessThan(
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

  QueryBuilder<AiModelScore, AiModelScore, QAfterFilterCondition> keyBetween(
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

  QueryBuilder<AiModelScore, AiModelScore, QAfterFilterCondition> keyStartsWith(
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

  QueryBuilder<AiModelScore, AiModelScore, QAfterFilterCondition> keyEndsWith(
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

  QueryBuilder<AiModelScore, AiModelScore, QAfterFilterCondition> keyContains(
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

  QueryBuilder<AiModelScore, AiModelScore, QAfterFilterCondition> keyMatches(
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

  QueryBuilder<AiModelScore, AiModelScore, QAfterFilterCondition> keyIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'key', value: ''),
      );
    });
  }

  QueryBuilder<AiModelScore, AiModelScore, QAfterFilterCondition>
  keyIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'key', value: ''),
      );
    });
  }

  QueryBuilder<AiModelScore, AiModelScore, QAfterFilterCondition>
  modelNameEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'modelName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AiModelScore, AiModelScore, QAfterFilterCondition>
  modelNameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'modelName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AiModelScore, AiModelScore, QAfterFilterCondition>
  modelNameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'modelName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AiModelScore, AiModelScore, QAfterFilterCondition>
  modelNameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'modelName',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AiModelScore, AiModelScore, QAfterFilterCondition>
  modelNameStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'modelName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AiModelScore, AiModelScore, QAfterFilterCondition>
  modelNameEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'modelName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AiModelScore, AiModelScore, QAfterFilterCondition>
  modelNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'modelName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AiModelScore, AiModelScore, QAfterFilterCondition>
  modelNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'modelName',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AiModelScore, AiModelScore, QAfterFilterCondition>
  modelNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'modelName', value: ''),
      );
    });
  }

  QueryBuilder<AiModelScore, AiModelScore, QAfterFilterCondition>
  modelNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'modelName', value: ''),
      );
    });
  }

  QueryBuilder<AiModelScore, AiModelScore, QAfterFilterCondition>
  sampleSizeEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'sampleSize', value: value),
      );
    });
  }

  QueryBuilder<AiModelScore, AiModelScore, QAfterFilterCondition>
  sampleSizeGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'sampleSize',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<AiModelScore, AiModelScore, QAfterFilterCondition>
  sampleSizeLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'sampleSize',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<AiModelScore, AiModelScore, QAfterFilterCondition>
  sampleSizeBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'sampleSize',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<AiModelScore, AiModelScore, QAfterFilterCondition> scoreEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'score',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<AiModelScore, AiModelScore, QAfterFilterCondition>
  scoreGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'score',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<AiModelScore, AiModelScore, QAfterFilterCondition> scoreLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'score',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<AiModelScore, AiModelScore, QAfterFilterCondition> scoreBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'score',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<AiModelScore, AiModelScore, QAfterFilterCondition> stepEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'step',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AiModelScore, AiModelScore, QAfterFilterCondition>
  stepGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'step',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AiModelScore, AiModelScore, QAfterFilterCondition> stepLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'step',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AiModelScore, AiModelScore, QAfterFilterCondition> stepBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'step',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AiModelScore, AiModelScore, QAfterFilterCondition>
  stepStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'step',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AiModelScore, AiModelScore, QAfterFilterCondition> stepEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'step',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AiModelScore, AiModelScore, QAfterFilterCondition> stepContains(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'step',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AiModelScore, AiModelScore, QAfterFilterCondition> stepMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'step',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AiModelScore, AiModelScore, QAfterFilterCondition>
  stepIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'step', value: ''),
      );
    });
  }

  QueryBuilder<AiModelScore, AiModelScore, QAfterFilterCondition>
  stepIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'step', value: ''),
      );
    });
  }

  QueryBuilder<AiModelScore, AiModelScore, QAfterFilterCondition>
  windowDaysIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'windowDays'),
      );
    });
  }

  QueryBuilder<AiModelScore, AiModelScore, QAfterFilterCondition>
  windowDaysIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'windowDays'),
      );
    });
  }

  QueryBuilder<AiModelScore, AiModelScore, QAfterFilterCondition>
  windowDaysEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'windowDays', value: value),
      );
    });
  }

  QueryBuilder<AiModelScore, AiModelScore, QAfterFilterCondition>
  windowDaysGreaterThan(int? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'windowDays',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<AiModelScore, AiModelScore, QAfterFilterCondition>
  windowDaysLessThan(int? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'windowDays',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<AiModelScore, AiModelScore, QAfterFilterCondition>
  windowDaysBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'windowDays',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }
}

extension AiModelScoreQueryObject
    on QueryBuilder<AiModelScore, AiModelScore, QFilterCondition> {
  QueryBuilder<AiModelScore, AiModelScore, QAfterFilterCondition> components(
    FilterQuery<ScoreComponents> q,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'components');
    });
  }

  QueryBuilder<AiModelScore, AiModelScore, QAfterFilterCondition>
  historyElement(FilterQuery<ScoreHistoryEntry> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'history');
    });
  }
}

extension AiModelScoreQueryLinks
    on QueryBuilder<AiModelScore, AiModelScore, QFilterCondition> {}

extension AiModelScoreQuerySortBy
    on QueryBuilder<AiModelScore, AiModelScore, QSortBy> {
  QueryBuilder<AiModelScore, AiModelScore, QAfterSortBy>
  sortByAlgorithmVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'algorithmVersion', Sort.asc);
    });
  }

  QueryBuilder<AiModelScore, AiModelScore, QAfterSortBy>
  sortByAlgorithmVersionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'algorithmVersion', Sort.desc);
    });
  }

  QueryBuilder<AiModelScore, AiModelScore, QAfterSortBy> sortByComputedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'computedAt', Sort.asc);
    });
  }

  QueryBuilder<AiModelScore, AiModelScore, QAfterSortBy>
  sortByComputedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'computedAt', Sort.desc);
    });
  }

  QueryBuilder<AiModelScore, AiModelScore, QAfterSortBy> sortByKey() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'key', Sort.asc);
    });
  }

  QueryBuilder<AiModelScore, AiModelScore, QAfterSortBy> sortByKeyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'key', Sort.desc);
    });
  }

  QueryBuilder<AiModelScore, AiModelScore, QAfterSortBy> sortByModelName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'modelName', Sort.asc);
    });
  }

  QueryBuilder<AiModelScore, AiModelScore, QAfterSortBy> sortByModelNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'modelName', Sort.desc);
    });
  }

  QueryBuilder<AiModelScore, AiModelScore, QAfterSortBy> sortBySampleSize() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sampleSize', Sort.asc);
    });
  }

  QueryBuilder<AiModelScore, AiModelScore, QAfterSortBy>
  sortBySampleSizeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sampleSize', Sort.desc);
    });
  }

  QueryBuilder<AiModelScore, AiModelScore, QAfterSortBy> sortByScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'score', Sort.asc);
    });
  }

  QueryBuilder<AiModelScore, AiModelScore, QAfterSortBy> sortByScoreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'score', Sort.desc);
    });
  }

  QueryBuilder<AiModelScore, AiModelScore, QAfterSortBy> sortByStep() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'step', Sort.asc);
    });
  }

  QueryBuilder<AiModelScore, AiModelScore, QAfterSortBy> sortByStepDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'step', Sort.desc);
    });
  }

  QueryBuilder<AiModelScore, AiModelScore, QAfterSortBy> sortByWindowDays() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'windowDays', Sort.asc);
    });
  }

  QueryBuilder<AiModelScore, AiModelScore, QAfterSortBy>
  sortByWindowDaysDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'windowDays', Sort.desc);
    });
  }
}

extension AiModelScoreQuerySortThenBy
    on QueryBuilder<AiModelScore, AiModelScore, QSortThenBy> {
  QueryBuilder<AiModelScore, AiModelScore, QAfterSortBy>
  thenByAlgorithmVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'algorithmVersion', Sort.asc);
    });
  }

  QueryBuilder<AiModelScore, AiModelScore, QAfterSortBy>
  thenByAlgorithmVersionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'algorithmVersion', Sort.desc);
    });
  }

  QueryBuilder<AiModelScore, AiModelScore, QAfterSortBy> thenByComputedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'computedAt', Sort.asc);
    });
  }

  QueryBuilder<AiModelScore, AiModelScore, QAfterSortBy>
  thenByComputedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'computedAt', Sort.desc);
    });
  }

  QueryBuilder<AiModelScore, AiModelScore, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<AiModelScore, AiModelScore, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<AiModelScore, AiModelScore, QAfterSortBy> thenByKey() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'key', Sort.asc);
    });
  }

  QueryBuilder<AiModelScore, AiModelScore, QAfterSortBy> thenByKeyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'key', Sort.desc);
    });
  }

  QueryBuilder<AiModelScore, AiModelScore, QAfterSortBy> thenByModelName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'modelName', Sort.asc);
    });
  }

  QueryBuilder<AiModelScore, AiModelScore, QAfterSortBy> thenByModelNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'modelName', Sort.desc);
    });
  }

  QueryBuilder<AiModelScore, AiModelScore, QAfterSortBy> thenBySampleSize() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sampleSize', Sort.asc);
    });
  }

  QueryBuilder<AiModelScore, AiModelScore, QAfterSortBy>
  thenBySampleSizeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sampleSize', Sort.desc);
    });
  }

  QueryBuilder<AiModelScore, AiModelScore, QAfterSortBy> thenByScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'score', Sort.asc);
    });
  }

  QueryBuilder<AiModelScore, AiModelScore, QAfterSortBy> thenByScoreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'score', Sort.desc);
    });
  }

  QueryBuilder<AiModelScore, AiModelScore, QAfterSortBy> thenByStep() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'step', Sort.asc);
    });
  }

  QueryBuilder<AiModelScore, AiModelScore, QAfterSortBy> thenByStepDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'step', Sort.desc);
    });
  }

  QueryBuilder<AiModelScore, AiModelScore, QAfterSortBy> thenByWindowDays() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'windowDays', Sort.asc);
    });
  }

  QueryBuilder<AiModelScore, AiModelScore, QAfterSortBy>
  thenByWindowDaysDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'windowDays', Sort.desc);
    });
  }
}

extension AiModelScoreQueryWhereDistinct
    on QueryBuilder<AiModelScore, AiModelScore, QDistinct> {
  QueryBuilder<AiModelScore, AiModelScore, QDistinct>
  distinctByAlgorithmVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'algorithmVersion');
    });
  }

  QueryBuilder<AiModelScore, AiModelScore, QDistinct> distinctByComputedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'computedAt');
    });
  }

  QueryBuilder<AiModelScore, AiModelScore, QDistinct> distinctByKey({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'key', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<AiModelScore, AiModelScore, QDistinct> distinctByModelName({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'modelName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<AiModelScore, AiModelScore, QDistinct> distinctBySampleSize() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'sampleSize');
    });
  }

  QueryBuilder<AiModelScore, AiModelScore, QDistinct> distinctByScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'score');
    });
  }

  QueryBuilder<AiModelScore, AiModelScore, QDistinct> distinctByStep({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'step', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<AiModelScore, AiModelScore, QDistinct> distinctByWindowDays() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'windowDays');
    });
  }
}

extension AiModelScoreQueryProperty
    on QueryBuilder<AiModelScore, AiModelScore, QQueryProperty> {
  QueryBuilder<AiModelScore, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<AiModelScore, int, QQueryOperations> algorithmVersionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'algorithmVersion');
    });
  }

  QueryBuilder<AiModelScore, ScoreComponents, QQueryOperations>
  componentsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'components');
    });
  }

  QueryBuilder<AiModelScore, DateTime, QQueryOperations> computedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'computedAt');
    });
  }

  QueryBuilder<AiModelScore, List<ScoreHistoryEntry>, QQueryOperations>
  historyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'history');
    });
  }

  QueryBuilder<AiModelScore, String, QQueryOperations> keyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'key');
    });
  }

  QueryBuilder<AiModelScore, String, QQueryOperations> modelNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'modelName');
    });
  }

  QueryBuilder<AiModelScore, int, QQueryOperations> sampleSizeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'sampleSize');
    });
  }

  QueryBuilder<AiModelScore, double, QQueryOperations> scoreProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'score');
    });
  }

  QueryBuilder<AiModelScore, String, QQueryOperations> stepProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'step');
    });
  }

  QueryBuilder<AiModelScore, int?, QQueryOperations> windowDaysProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'windowDays');
    });
  }
}

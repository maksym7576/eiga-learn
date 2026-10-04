// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_model_daily_stat.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetAiModelDailyStatCollection on Isar {
  IsarCollection<AiModelDailyStat> get aiModelDailyStats => this.collection();
}

const AiModelDailyStatSchema = CollectionSchema(
  name: r'AiModelDailyStat',
  id: -4072189050925815975,
  properties: {
    r'avgDurationMs': PropertySchema(
      id: 0,
      name: r'avgDurationMs',
      type: IsarType.long,
    ),
    r'cost': PropertySchema(id: 1, name: r'cost', type: IsarType.double),
    r'date': PropertySchema(id: 2, name: r'date', type: IsarType.string),
    r'errorCount': PropertySchema(
      id: 3,
      name: r'errorCount',
      type: IsarType.long,
    ),
    r'errorsByType': PropertySchema(
      id: 4,
      name: r'errorsByType',
      type: IsarType.objectList,

      target: r'ErrorCount',
    ),
    r'key': PropertySchema(id: 5, name: r'key', type: IsarType.string),
    r'maxDurationMs': PropertySchema(
      id: 6,
      name: r'maxDurationMs',
      type: IsarType.long,
    ),
    r'modelName': PropertySchema(
      id: 7,
      name: r'modelName',
      type: IsarType.string,
    ),
    r'partialCount': PropertySchema(
      id: 8,
      name: r'partialCount',
      type: IsarType.long,
    ),
    r'phrasesAccepted': PropertySchema(
      id: 9,
      name: r'phrasesAccepted',
      type: IsarType.long,
    ),
    r'phrasesRequested': PropertySchema(
      id: 10,
      name: r'phrasesRequested',
      type: IsarType.long,
    ),
    r'quotaExhaustedAt': PropertySchema(
      id: 11,
      name: r'quotaExhaustedAt',
      type: IsarType.dateTime,
    ),
    r'requests': PropertySchema(id: 12, name: r'requests', type: IsarType.long),
    r'step': PropertySchema(id: 13, name: r'step', type: IsarType.string),
    r'successCount': PropertySchema(
      id: 14,
      name: r'successCount',
      type: IsarType.long,
    ),
    r'tokensIn': PropertySchema(id: 15, name: r'tokensIn', type: IsarType.long),
    r'tokensOut': PropertySchema(
      id: 16,
      name: r'tokensOut',
      type: IsarType.long,
    ),
  },

  estimateSize: _aiModelDailyStatEstimateSize,
  serialize: _aiModelDailyStatSerialize,
  deserialize: _aiModelDailyStatDeserialize,
  deserializeProp: _aiModelDailyStatDeserializeProp,
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
  embeddedSchemas: {r'ErrorCount': ErrorCountSchema},

  getId: _aiModelDailyStatGetId,
  getLinks: _aiModelDailyStatGetLinks,
  attach: _aiModelDailyStatAttach,
  version: '3.3.2',
);

int _aiModelDailyStatEstimateSize(
  AiModelDailyStat object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.date.length * 3;
  bytesCount += 3 + object.errorsByType.length * 3;
  {
    final offsets = allOffsets[ErrorCount]!;
    for (var i = 0; i < object.errorsByType.length; i++) {
      final value = object.errorsByType[i];
      bytesCount += ErrorCountSchema.estimateSize(value, offsets, allOffsets);
    }
  }
  bytesCount += 3 + object.key.length * 3;
  bytesCount += 3 + object.modelName.length * 3;
  bytesCount += 3 + object.step.length * 3;
  return bytesCount;
}

void _aiModelDailyStatSerialize(
  AiModelDailyStat object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.avgDurationMs);
  writer.writeDouble(offsets[1], object.cost);
  writer.writeString(offsets[2], object.date);
  writer.writeLong(offsets[3], object.errorCount);
  writer.writeObjectList<ErrorCount>(
    offsets[4],
    allOffsets,
    ErrorCountSchema.serialize,
    object.errorsByType,
  );
  writer.writeString(offsets[5], object.key);
  writer.writeLong(offsets[6], object.maxDurationMs);
  writer.writeString(offsets[7], object.modelName);
  writer.writeLong(offsets[8], object.partialCount);
  writer.writeLong(offsets[9], object.phrasesAccepted);
  writer.writeLong(offsets[10], object.phrasesRequested);
  writer.writeDateTime(offsets[11], object.quotaExhaustedAt);
  writer.writeLong(offsets[12], object.requests);
  writer.writeString(offsets[13], object.step);
  writer.writeLong(offsets[14], object.successCount);
  writer.writeLong(offsets[15], object.tokensIn);
  writer.writeLong(offsets[16], object.tokensOut);
}

AiModelDailyStat _aiModelDailyStatDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = AiModelDailyStat();
  object.avgDurationMs = reader.readLongOrNull(offsets[0]);
  object.cost = reader.readDouble(offsets[1]);
  object.date = reader.readString(offsets[2]);
  object.errorCount = reader.readLong(offsets[3]);
  object.errorsByType =
      reader.readObjectList<ErrorCount>(
        offsets[4],
        ErrorCountSchema.deserialize,
        allOffsets,
        ErrorCount(),
      ) ??
      [];
  object.id = id;
  object.key = reader.readString(offsets[5]);
  object.maxDurationMs = reader.readLongOrNull(offsets[6]);
  object.modelName = reader.readString(offsets[7]);
  object.partialCount = reader.readLong(offsets[8]);
  object.phrasesAccepted = reader.readLong(offsets[9]);
  object.phrasesRequested = reader.readLong(offsets[10]);
  object.quotaExhaustedAt = reader.readDateTimeOrNull(offsets[11]);
  object.requests = reader.readLong(offsets[12]);
  object.step = reader.readString(offsets[13]);
  object.successCount = reader.readLong(offsets[14]);
  object.tokensIn = reader.readLong(offsets[15]);
  object.tokensOut = reader.readLong(offsets[16]);
  return object;
}

P _aiModelDailyStatDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLongOrNull(offset)) as P;
    case 1:
      return (reader.readDouble(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readLong(offset)) as P;
    case 4:
      return (reader.readObjectList<ErrorCount>(
                offset,
                ErrorCountSchema.deserialize,
                allOffsets,
                ErrorCount(),
              ) ??
              [])
          as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader.readLongOrNull(offset)) as P;
    case 7:
      return (reader.readString(offset)) as P;
    case 8:
      return (reader.readLong(offset)) as P;
    case 9:
      return (reader.readLong(offset)) as P;
    case 10:
      return (reader.readLong(offset)) as P;
    case 11:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 12:
      return (reader.readLong(offset)) as P;
    case 13:
      return (reader.readString(offset)) as P;
    case 14:
      return (reader.readLong(offset)) as P;
    case 15:
      return (reader.readLong(offset)) as P;
    case 16:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _aiModelDailyStatGetId(AiModelDailyStat object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _aiModelDailyStatGetLinks(AiModelDailyStat object) {
  return [];
}

void _aiModelDailyStatAttach(
  IsarCollection<dynamic> col,
  Id id,
  AiModelDailyStat object,
) {
  object.id = id;
}

extension AiModelDailyStatByIndex on IsarCollection<AiModelDailyStat> {
  Future<AiModelDailyStat?> getByKey(String key) {
    return getByIndex(r'key', [key]);
  }

  AiModelDailyStat? getByKeySync(String key) {
    return getByIndexSync(r'key', [key]);
  }

  Future<bool> deleteByKey(String key) {
    return deleteByIndex(r'key', [key]);
  }

  bool deleteByKeySync(String key) {
    return deleteByIndexSync(r'key', [key]);
  }

  Future<List<AiModelDailyStat?>> getAllByKey(List<String> keyValues) {
    final values = keyValues.map((e) => [e]).toList();
    return getAllByIndex(r'key', values);
  }

  List<AiModelDailyStat?> getAllByKeySync(List<String> keyValues) {
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

  Future<Id> putByKey(AiModelDailyStat object) {
    return putByIndex(r'key', object);
  }

  Id putByKeySync(AiModelDailyStat object, {bool saveLinks = true}) {
    return putByIndexSync(r'key', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByKey(List<AiModelDailyStat> objects) {
    return putAllByIndex(r'key', objects);
  }

  List<Id> putAllByKeySync(
    List<AiModelDailyStat> objects, {
    bool saveLinks = true,
  }) {
    return putAllByIndexSync(r'key', objects, saveLinks: saveLinks);
  }
}

extension AiModelDailyStatQueryWhereSort
    on QueryBuilder<AiModelDailyStat, AiModelDailyStat, QWhere> {
  QueryBuilder<AiModelDailyStat, AiModelDailyStat, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension AiModelDailyStatQueryWhere
    on QueryBuilder<AiModelDailyStat, AiModelDailyStat, QWhereClause> {
  QueryBuilder<AiModelDailyStat, AiModelDailyStat, QAfterWhereClause> idEqualTo(
    Id id,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(lower: id, upper: id));
    });
  }

  QueryBuilder<AiModelDailyStat, AiModelDailyStat, QAfterWhereClause>
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

  QueryBuilder<AiModelDailyStat, AiModelDailyStat, QAfterWhereClause>
  idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<AiModelDailyStat, AiModelDailyStat, QAfterWhereClause>
  idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<AiModelDailyStat, AiModelDailyStat, QAfterWhereClause> idBetween(
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

  QueryBuilder<AiModelDailyStat, AiModelDailyStat, QAfterWhereClause>
  keyEqualTo(String key) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'key', value: [key]),
      );
    });
  }

  QueryBuilder<AiModelDailyStat, AiModelDailyStat, QAfterWhereClause>
  keyNotEqualTo(String key) {
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

extension AiModelDailyStatQueryFilter
    on QueryBuilder<AiModelDailyStat, AiModelDailyStat, QFilterCondition> {
  QueryBuilder<AiModelDailyStat, AiModelDailyStat, QAfterFilterCondition>
  avgDurationMsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'avgDurationMs'),
      );
    });
  }

  QueryBuilder<AiModelDailyStat, AiModelDailyStat, QAfterFilterCondition>
  avgDurationMsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'avgDurationMs'),
      );
    });
  }

  QueryBuilder<AiModelDailyStat, AiModelDailyStat, QAfterFilterCondition>
  avgDurationMsEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'avgDurationMs', value: value),
      );
    });
  }

  QueryBuilder<AiModelDailyStat, AiModelDailyStat, QAfterFilterCondition>
  avgDurationMsGreaterThan(int? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'avgDurationMs',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<AiModelDailyStat, AiModelDailyStat, QAfterFilterCondition>
  avgDurationMsLessThan(int? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'avgDurationMs',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<AiModelDailyStat, AiModelDailyStat, QAfterFilterCondition>
  avgDurationMsBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'avgDurationMs',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<AiModelDailyStat, AiModelDailyStat, QAfterFilterCondition>
  costEqualTo(double value, {double epsilon = Query.epsilon}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'cost',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<AiModelDailyStat, AiModelDailyStat, QAfterFilterCondition>
  costGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'cost',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<AiModelDailyStat, AiModelDailyStat, QAfterFilterCondition>
  costLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'cost',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<AiModelDailyStat, AiModelDailyStat, QAfterFilterCondition>
  costBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'cost',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<AiModelDailyStat, AiModelDailyStat, QAfterFilterCondition>
  dateEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'date',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AiModelDailyStat, AiModelDailyStat, QAfterFilterCondition>
  dateGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'date',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AiModelDailyStat, AiModelDailyStat, QAfterFilterCondition>
  dateLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'date',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AiModelDailyStat, AiModelDailyStat, QAfterFilterCondition>
  dateBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'date',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AiModelDailyStat, AiModelDailyStat, QAfterFilterCondition>
  dateStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'date',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AiModelDailyStat, AiModelDailyStat, QAfterFilterCondition>
  dateEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'date',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AiModelDailyStat, AiModelDailyStat, QAfterFilterCondition>
  dateContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'date',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AiModelDailyStat, AiModelDailyStat, QAfterFilterCondition>
  dateMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'date',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AiModelDailyStat, AiModelDailyStat, QAfterFilterCondition>
  dateIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'date', value: ''),
      );
    });
  }

  QueryBuilder<AiModelDailyStat, AiModelDailyStat, QAfterFilterCondition>
  dateIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'date', value: ''),
      );
    });
  }

  QueryBuilder<AiModelDailyStat, AiModelDailyStat, QAfterFilterCondition>
  errorCountEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'errorCount', value: value),
      );
    });
  }

  QueryBuilder<AiModelDailyStat, AiModelDailyStat, QAfterFilterCondition>
  errorCountGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'errorCount',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<AiModelDailyStat, AiModelDailyStat, QAfterFilterCondition>
  errorCountLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'errorCount',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<AiModelDailyStat, AiModelDailyStat, QAfterFilterCondition>
  errorCountBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'errorCount',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<AiModelDailyStat, AiModelDailyStat, QAfterFilterCondition>
  errorsByTypeLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'errorsByType', length, true, length, true);
    });
  }

  QueryBuilder<AiModelDailyStat, AiModelDailyStat, QAfterFilterCondition>
  errorsByTypeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'errorsByType', 0, true, 0, true);
    });
  }

  QueryBuilder<AiModelDailyStat, AiModelDailyStat, QAfterFilterCondition>
  errorsByTypeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'errorsByType', 0, false, 999999, true);
    });
  }

  QueryBuilder<AiModelDailyStat, AiModelDailyStat, QAfterFilterCondition>
  errorsByTypeLengthLessThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'errorsByType', 0, true, length, include);
    });
  }

  QueryBuilder<AiModelDailyStat, AiModelDailyStat, QAfterFilterCondition>
  errorsByTypeLengthGreaterThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'errorsByType', length, include, 999999, true);
    });
  }

  QueryBuilder<AiModelDailyStat, AiModelDailyStat, QAfterFilterCondition>
  errorsByTypeLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'errorsByType',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<AiModelDailyStat, AiModelDailyStat, QAfterFilterCondition>
  idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'id', value: value),
      );
    });
  }

  QueryBuilder<AiModelDailyStat, AiModelDailyStat, QAfterFilterCondition>
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

  QueryBuilder<AiModelDailyStat, AiModelDailyStat, QAfterFilterCondition>
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

  QueryBuilder<AiModelDailyStat, AiModelDailyStat, QAfterFilterCondition>
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

  QueryBuilder<AiModelDailyStat, AiModelDailyStat, QAfterFilterCondition>
  keyEqualTo(String value, {bool caseSensitive = true}) {
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

  QueryBuilder<AiModelDailyStat, AiModelDailyStat, QAfterFilterCondition>
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

  QueryBuilder<AiModelDailyStat, AiModelDailyStat, QAfterFilterCondition>
  keyLessThan(String value, {bool include = false, bool caseSensitive = true}) {
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

  QueryBuilder<AiModelDailyStat, AiModelDailyStat, QAfterFilterCondition>
  keyBetween(
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

  QueryBuilder<AiModelDailyStat, AiModelDailyStat, QAfterFilterCondition>
  keyStartsWith(String value, {bool caseSensitive = true}) {
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

  QueryBuilder<AiModelDailyStat, AiModelDailyStat, QAfterFilterCondition>
  keyEndsWith(String value, {bool caseSensitive = true}) {
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

  QueryBuilder<AiModelDailyStat, AiModelDailyStat, QAfterFilterCondition>
  keyContains(String value, {bool caseSensitive = true}) {
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

  QueryBuilder<AiModelDailyStat, AiModelDailyStat, QAfterFilterCondition>
  keyMatches(String pattern, {bool caseSensitive = true}) {
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

  QueryBuilder<AiModelDailyStat, AiModelDailyStat, QAfterFilterCondition>
  keyIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'key', value: ''),
      );
    });
  }

  QueryBuilder<AiModelDailyStat, AiModelDailyStat, QAfterFilterCondition>
  keyIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'key', value: ''),
      );
    });
  }

  QueryBuilder<AiModelDailyStat, AiModelDailyStat, QAfterFilterCondition>
  maxDurationMsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'maxDurationMs'),
      );
    });
  }

  QueryBuilder<AiModelDailyStat, AiModelDailyStat, QAfterFilterCondition>
  maxDurationMsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'maxDurationMs'),
      );
    });
  }

  QueryBuilder<AiModelDailyStat, AiModelDailyStat, QAfterFilterCondition>
  maxDurationMsEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'maxDurationMs', value: value),
      );
    });
  }

  QueryBuilder<AiModelDailyStat, AiModelDailyStat, QAfterFilterCondition>
  maxDurationMsGreaterThan(int? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'maxDurationMs',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<AiModelDailyStat, AiModelDailyStat, QAfterFilterCondition>
  maxDurationMsLessThan(int? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'maxDurationMs',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<AiModelDailyStat, AiModelDailyStat, QAfterFilterCondition>
  maxDurationMsBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'maxDurationMs',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<AiModelDailyStat, AiModelDailyStat, QAfterFilterCondition>
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

  QueryBuilder<AiModelDailyStat, AiModelDailyStat, QAfterFilterCondition>
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

  QueryBuilder<AiModelDailyStat, AiModelDailyStat, QAfterFilterCondition>
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

  QueryBuilder<AiModelDailyStat, AiModelDailyStat, QAfterFilterCondition>
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

  QueryBuilder<AiModelDailyStat, AiModelDailyStat, QAfterFilterCondition>
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

  QueryBuilder<AiModelDailyStat, AiModelDailyStat, QAfterFilterCondition>
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

  QueryBuilder<AiModelDailyStat, AiModelDailyStat, QAfterFilterCondition>
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

  QueryBuilder<AiModelDailyStat, AiModelDailyStat, QAfterFilterCondition>
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

  QueryBuilder<AiModelDailyStat, AiModelDailyStat, QAfterFilterCondition>
  modelNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'modelName', value: ''),
      );
    });
  }

  QueryBuilder<AiModelDailyStat, AiModelDailyStat, QAfterFilterCondition>
  modelNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'modelName', value: ''),
      );
    });
  }

  QueryBuilder<AiModelDailyStat, AiModelDailyStat, QAfterFilterCondition>
  partialCountEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'partialCount', value: value),
      );
    });
  }

  QueryBuilder<AiModelDailyStat, AiModelDailyStat, QAfterFilterCondition>
  partialCountGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'partialCount',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<AiModelDailyStat, AiModelDailyStat, QAfterFilterCondition>
  partialCountLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'partialCount',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<AiModelDailyStat, AiModelDailyStat, QAfterFilterCondition>
  partialCountBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'partialCount',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<AiModelDailyStat, AiModelDailyStat, QAfterFilterCondition>
  phrasesAcceptedEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'phrasesAccepted', value: value),
      );
    });
  }

  QueryBuilder<AiModelDailyStat, AiModelDailyStat, QAfterFilterCondition>
  phrasesAcceptedGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'phrasesAccepted',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<AiModelDailyStat, AiModelDailyStat, QAfterFilterCondition>
  phrasesAcceptedLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'phrasesAccepted',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<AiModelDailyStat, AiModelDailyStat, QAfterFilterCondition>
  phrasesAcceptedBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'phrasesAccepted',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<AiModelDailyStat, AiModelDailyStat, QAfterFilterCondition>
  phrasesRequestedEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'phrasesRequested', value: value),
      );
    });
  }

  QueryBuilder<AiModelDailyStat, AiModelDailyStat, QAfterFilterCondition>
  phrasesRequestedGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'phrasesRequested',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<AiModelDailyStat, AiModelDailyStat, QAfterFilterCondition>
  phrasesRequestedLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'phrasesRequested',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<AiModelDailyStat, AiModelDailyStat, QAfterFilterCondition>
  phrasesRequestedBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'phrasesRequested',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<AiModelDailyStat, AiModelDailyStat, QAfterFilterCondition>
  quotaExhaustedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'quotaExhaustedAt'),
      );
    });
  }

  QueryBuilder<AiModelDailyStat, AiModelDailyStat, QAfterFilterCondition>
  quotaExhaustedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'quotaExhaustedAt'),
      );
    });
  }

  QueryBuilder<AiModelDailyStat, AiModelDailyStat, QAfterFilterCondition>
  quotaExhaustedAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'quotaExhaustedAt', value: value),
      );
    });
  }

  QueryBuilder<AiModelDailyStat, AiModelDailyStat, QAfterFilterCondition>
  quotaExhaustedAtGreaterThan(DateTime? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'quotaExhaustedAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<AiModelDailyStat, AiModelDailyStat, QAfterFilterCondition>
  quotaExhaustedAtLessThan(DateTime? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'quotaExhaustedAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<AiModelDailyStat, AiModelDailyStat, QAfterFilterCondition>
  quotaExhaustedAtBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'quotaExhaustedAt',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<AiModelDailyStat, AiModelDailyStat, QAfterFilterCondition>
  requestsEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'requests', value: value),
      );
    });
  }

  QueryBuilder<AiModelDailyStat, AiModelDailyStat, QAfterFilterCondition>
  requestsGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'requests',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<AiModelDailyStat, AiModelDailyStat, QAfterFilterCondition>
  requestsLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'requests',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<AiModelDailyStat, AiModelDailyStat, QAfterFilterCondition>
  requestsBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'requests',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<AiModelDailyStat, AiModelDailyStat, QAfterFilterCondition>
  stepEqualTo(String value, {bool caseSensitive = true}) {
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

  QueryBuilder<AiModelDailyStat, AiModelDailyStat, QAfterFilterCondition>
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

  QueryBuilder<AiModelDailyStat, AiModelDailyStat, QAfterFilterCondition>
  stepLessThan(
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

  QueryBuilder<AiModelDailyStat, AiModelDailyStat, QAfterFilterCondition>
  stepBetween(
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

  QueryBuilder<AiModelDailyStat, AiModelDailyStat, QAfterFilterCondition>
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

  QueryBuilder<AiModelDailyStat, AiModelDailyStat, QAfterFilterCondition>
  stepEndsWith(String value, {bool caseSensitive = true}) {
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

  QueryBuilder<AiModelDailyStat, AiModelDailyStat, QAfterFilterCondition>
  stepContains(String value, {bool caseSensitive = true}) {
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

  QueryBuilder<AiModelDailyStat, AiModelDailyStat, QAfterFilterCondition>
  stepMatches(String pattern, {bool caseSensitive = true}) {
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

  QueryBuilder<AiModelDailyStat, AiModelDailyStat, QAfterFilterCondition>
  stepIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'step', value: ''),
      );
    });
  }

  QueryBuilder<AiModelDailyStat, AiModelDailyStat, QAfterFilterCondition>
  stepIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'step', value: ''),
      );
    });
  }

  QueryBuilder<AiModelDailyStat, AiModelDailyStat, QAfterFilterCondition>
  successCountEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'successCount', value: value),
      );
    });
  }

  QueryBuilder<AiModelDailyStat, AiModelDailyStat, QAfterFilterCondition>
  successCountGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'successCount',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<AiModelDailyStat, AiModelDailyStat, QAfterFilterCondition>
  successCountLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'successCount',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<AiModelDailyStat, AiModelDailyStat, QAfterFilterCondition>
  successCountBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'successCount',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<AiModelDailyStat, AiModelDailyStat, QAfterFilterCondition>
  tokensInEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'tokensIn', value: value),
      );
    });
  }

  QueryBuilder<AiModelDailyStat, AiModelDailyStat, QAfterFilterCondition>
  tokensInGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'tokensIn',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<AiModelDailyStat, AiModelDailyStat, QAfterFilterCondition>
  tokensInLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'tokensIn',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<AiModelDailyStat, AiModelDailyStat, QAfterFilterCondition>
  tokensInBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'tokensIn',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<AiModelDailyStat, AiModelDailyStat, QAfterFilterCondition>
  tokensOutEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'tokensOut', value: value),
      );
    });
  }

  QueryBuilder<AiModelDailyStat, AiModelDailyStat, QAfterFilterCondition>
  tokensOutGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'tokensOut',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<AiModelDailyStat, AiModelDailyStat, QAfterFilterCondition>
  tokensOutLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'tokensOut',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<AiModelDailyStat, AiModelDailyStat, QAfterFilterCondition>
  tokensOutBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'tokensOut',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }
}

extension AiModelDailyStatQueryObject
    on QueryBuilder<AiModelDailyStat, AiModelDailyStat, QFilterCondition> {
  QueryBuilder<AiModelDailyStat, AiModelDailyStat, QAfterFilterCondition>
  errorsByTypeElement(FilterQuery<ErrorCount> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'errorsByType');
    });
  }
}

extension AiModelDailyStatQueryLinks
    on QueryBuilder<AiModelDailyStat, AiModelDailyStat, QFilterCondition> {}

extension AiModelDailyStatQuerySortBy
    on QueryBuilder<AiModelDailyStat, AiModelDailyStat, QSortBy> {
  QueryBuilder<AiModelDailyStat, AiModelDailyStat, QAfterSortBy>
  sortByAvgDurationMs() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'avgDurationMs', Sort.asc);
    });
  }

  QueryBuilder<AiModelDailyStat, AiModelDailyStat, QAfterSortBy>
  sortByAvgDurationMsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'avgDurationMs', Sort.desc);
    });
  }

  QueryBuilder<AiModelDailyStat, AiModelDailyStat, QAfterSortBy> sortByCost() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cost', Sort.asc);
    });
  }

  QueryBuilder<AiModelDailyStat, AiModelDailyStat, QAfterSortBy>
  sortByCostDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cost', Sort.desc);
    });
  }

  QueryBuilder<AiModelDailyStat, AiModelDailyStat, QAfterSortBy> sortByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.asc);
    });
  }

  QueryBuilder<AiModelDailyStat, AiModelDailyStat, QAfterSortBy>
  sortByDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.desc);
    });
  }

  QueryBuilder<AiModelDailyStat, AiModelDailyStat, QAfterSortBy>
  sortByErrorCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'errorCount', Sort.asc);
    });
  }

  QueryBuilder<AiModelDailyStat, AiModelDailyStat, QAfterSortBy>
  sortByErrorCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'errorCount', Sort.desc);
    });
  }

  QueryBuilder<AiModelDailyStat, AiModelDailyStat, QAfterSortBy> sortByKey() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'key', Sort.asc);
    });
  }

  QueryBuilder<AiModelDailyStat, AiModelDailyStat, QAfterSortBy>
  sortByKeyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'key', Sort.desc);
    });
  }

  QueryBuilder<AiModelDailyStat, AiModelDailyStat, QAfterSortBy>
  sortByMaxDurationMs() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxDurationMs', Sort.asc);
    });
  }

  QueryBuilder<AiModelDailyStat, AiModelDailyStat, QAfterSortBy>
  sortByMaxDurationMsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxDurationMs', Sort.desc);
    });
  }

  QueryBuilder<AiModelDailyStat, AiModelDailyStat, QAfterSortBy>
  sortByModelName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'modelName', Sort.asc);
    });
  }

  QueryBuilder<AiModelDailyStat, AiModelDailyStat, QAfterSortBy>
  sortByModelNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'modelName', Sort.desc);
    });
  }

  QueryBuilder<AiModelDailyStat, AiModelDailyStat, QAfterSortBy>
  sortByPartialCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'partialCount', Sort.asc);
    });
  }

  QueryBuilder<AiModelDailyStat, AiModelDailyStat, QAfterSortBy>
  sortByPartialCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'partialCount', Sort.desc);
    });
  }

  QueryBuilder<AiModelDailyStat, AiModelDailyStat, QAfterSortBy>
  sortByPhrasesAccepted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'phrasesAccepted', Sort.asc);
    });
  }

  QueryBuilder<AiModelDailyStat, AiModelDailyStat, QAfterSortBy>
  sortByPhrasesAcceptedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'phrasesAccepted', Sort.desc);
    });
  }

  QueryBuilder<AiModelDailyStat, AiModelDailyStat, QAfterSortBy>
  sortByPhrasesRequested() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'phrasesRequested', Sort.asc);
    });
  }

  QueryBuilder<AiModelDailyStat, AiModelDailyStat, QAfterSortBy>
  sortByPhrasesRequestedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'phrasesRequested', Sort.desc);
    });
  }

  QueryBuilder<AiModelDailyStat, AiModelDailyStat, QAfterSortBy>
  sortByQuotaExhaustedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quotaExhaustedAt', Sort.asc);
    });
  }

  QueryBuilder<AiModelDailyStat, AiModelDailyStat, QAfterSortBy>
  sortByQuotaExhaustedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quotaExhaustedAt', Sort.desc);
    });
  }

  QueryBuilder<AiModelDailyStat, AiModelDailyStat, QAfterSortBy>
  sortByRequests() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'requests', Sort.asc);
    });
  }

  QueryBuilder<AiModelDailyStat, AiModelDailyStat, QAfterSortBy>
  sortByRequestsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'requests', Sort.desc);
    });
  }

  QueryBuilder<AiModelDailyStat, AiModelDailyStat, QAfterSortBy> sortByStep() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'step', Sort.asc);
    });
  }

  QueryBuilder<AiModelDailyStat, AiModelDailyStat, QAfterSortBy>
  sortByStepDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'step', Sort.desc);
    });
  }

  QueryBuilder<AiModelDailyStat, AiModelDailyStat, QAfterSortBy>
  sortBySuccessCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'successCount', Sort.asc);
    });
  }

  QueryBuilder<AiModelDailyStat, AiModelDailyStat, QAfterSortBy>
  sortBySuccessCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'successCount', Sort.desc);
    });
  }

  QueryBuilder<AiModelDailyStat, AiModelDailyStat, QAfterSortBy>
  sortByTokensIn() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tokensIn', Sort.asc);
    });
  }

  QueryBuilder<AiModelDailyStat, AiModelDailyStat, QAfterSortBy>
  sortByTokensInDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tokensIn', Sort.desc);
    });
  }

  QueryBuilder<AiModelDailyStat, AiModelDailyStat, QAfterSortBy>
  sortByTokensOut() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tokensOut', Sort.asc);
    });
  }

  QueryBuilder<AiModelDailyStat, AiModelDailyStat, QAfterSortBy>
  sortByTokensOutDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tokensOut', Sort.desc);
    });
  }
}

extension AiModelDailyStatQuerySortThenBy
    on QueryBuilder<AiModelDailyStat, AiModelDailyStat, QSortThenBy> {
  QueryBuilder<AiModelDailyStat, AiModelDailyStat, QAfterSortBy>
  thenByAvgDurationMs() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'avgDurationMs', Sort.asc);
    });
  }

  QueryBuilder<AiModelDailyStat, AiModelDailyStat, QAfterSortBy>
  thenByAvgDurationMsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'avgDurationMs', Sort.desc);
    });
  }

  QueryBuilder<AiModelDailyStat, AiModelDailyStat, QAfterSortBy> thenByCost() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cost', Sort.asc);
    });
  }

  QueryBuilder<AiModelDailyStat, AiModelDailyStat, QAfterSortBy>
  thenByCostDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cost', Sort.desc);
    });
  }

  QueryBuilder<AiModelDailyStat, AiModelDailyStat, QAfterSortBy> thenByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.asc);
    });
  }

  QueryBuilder<AiModelDailyStat, AiModelDailyStat, QAfterSortBy>
  thenByDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.desc);
    });
  }

  QueryBuilder<AiModelDailyStat, AiModelDailyStat, QAfterSortBy>
  thenByErrorCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'errorCount', Sort.asc);
    });
  }

  QueryBuilder<AiModelDailyStat, AiModelDailyStat, QAfterSortBy>
  thenByErrorCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'errorCount', Sort.desc);
    });
  }

  QueryBuilder<AiModelDailyStat, AiModelDailyStat, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<AiModelDailyStat, AiModelDailyStat, QAfterSortBy>
  thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<AiModelDailyStat, AiModelDailyStat, QAfterSortBy> thenByKey() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'key', Sort.asc);
    });
  }

  QueryBuilder<AiModelDailyStat, AiModelDailyStat, QAfterSortBy>
  thenByKeyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'key', Sort.desc);
    });
  }

  QueryBuilder<AiModelDailyStat, AiModelDailyStat, QAfterSortBy>
  thenByMaxDurationMs() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxDurationMs', Sort.asc);
    });
  }

  QueryBuilder<AiModelDailyStat, AiModelDailyStat, QAfterSortBy>
  thenByMaxDurationMsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxDurationMs', Sort.desc);
    });
  }

  QueryBuilder<AiModelDailyStat, AiModelDailyStat, QAfterSortBy>
  thenByModelName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'modelName', Sort.asc);
    });
  }

  QueryBuilder<AiModelDailyStat, AiModelDailyStat, QAfterSortBy>
  thenByModelNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'modelName', Sort.desc);
    });
  }

  QueryBuilder<AiModelDailyStat, AiModelDailyStat, QAfterSortBy>
  thenByPartialCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'partialCount', Sort.asc);
    });
  }

  QueryBuilder<AiModelDailyStat, AiModelDailyStat, QAfterSortBy>
  thenByPartialCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'partialCount', Sort.desc);
    });
  }

  QueryBuilder<AiModelDailyStat, AiModelDailyStat, QAfterSortBy>
  thenByPhrasesAccepted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'phrasesAccepted', Sort.asc);
    });
  }

  QueryBuilder<AiModelDailyStat, AiModelDailyStat, QAfterSortBy>
  thenByPhrasesAcceptedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'phrasesAccepted', Sort.desc);
    });
  }

  QueryBuilder<AiModelDailyStat, AiModelDailyStat, QAfterSortBy>
  thenByPhrasesRequested() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'phrasesRequested', Sort.asc);
    });
  }

  QueryBuilder<AiModelDailyStat, AiModelDailyStat, QAfterSortBy>
  thenByPhrasesRequestedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'phrasesRequested', Sort.desc);
    });
  }

  QueryBuilder<AiModelDailyStat, AiModelDailyStat, QAfterSortBy>
  thenByQuotaExhaustedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quotaExhaustedAt', Sort.asc);
    });
  }

  QueryBuilder<AiModelDailyStat, AiModelDailyStat, QAfterSortBy>
  thenByQuotaExhaustedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quotaExhaustedAt', Sort.desc);
    });
  }

  QueryBuilder<AiModelDailyStat, AiModelDailyStat, QAfterSortBy>
  thenByRequests() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'requests', Sort.asc);
    });
  }

  QueryBuilder<AiModelDailyStat, AiModelDailyStat, QAfterSortBy>
  thenByRequestsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'requests', Sort.desc);
    });
  }

  QueryBuilder<AiModelDailyStat, AiModelDailyStat, QAfterSortBy> thenByStep() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'step', Sort.asc);
    });
  }

  QueryBuilder<AiModelDailyStat, AiModelDailyStat, QAfterSortBy>
  thenByStepDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'step', Sort.desc);
    });
  }

  QueryBuilder<AiModelDailyStat, AiModelDailyStat, QAfterSortBy>
  thenBySuccessCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'successCount', Sort.asc);
    });
  }

  QueryBuilder<AiModelDailyStat, AiModelDailyStat, QAfterSortBy>
  thenBySuccessCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'successCount', Sort.desc);
    });
  }

  QueryBuilder<AiModelDailyStat, AiModelDailyStat, QAfterSortBy>
  thenByTokensIn() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tokensIn', Sort.asc);
    });
  }

  QueryBuilder<AiModelDailyStat, AiModelDailyStat, QAfterSortBy>
  thenByTokensInDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tokensIn', Sort.desc);
    });
  }

  QueryBuilder<AiModelDailyStat, AiModelDailyStat, QAfterSortBy>
  thenByTokensOut() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tokensOut', Sort.asc);
    });
  }

  QueryBuilder<AiModelDailyStat, AiModelDailyStat, QAfterSortBy>
  thenByTokensOutDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tokensOut', Sort.desc);
    });
  }
}

extension AiModelDailyStatQueryWhereDistinct
    on QueryBuilder<AiModelDailyStat, AiModelDailyStat, QDistinct> {
  QueryBuilder<AiModelDailyStat, AiModelDailyStat, QDistinct>
  distinctByAvgDurationMs() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'avgDurationMs');
    });
  }

  QueryBuilder<AiModelDailyStat, AiModelDailyStat, QDistinct> distinctByCost() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'cost');
    });
  }

  QueryBuilder<AiModelDailyStat, AiModelDailyStat, QDistinct> distinctByDate({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'date', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<AiModelDailyStat, AiModelDailyStat, QDistinct>
  distinctByErrorCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'errorCount');
    });
  }

  QueryBuilder<AiModelDailyStat, AiModelDailyStat, QDistinct> distinctByKey({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'key', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<AiModelDailyStat, AiModelDailyStat, QDistinct>
  distinctByMaxDurationMs() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'maxDurationMs');
    });
  }

  QueryBuilder<AiModelDailyStat, AiModelDailyStat, QDistinct>
  distinctByModelName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'modelName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<AiModelDailyStat, AiModelDailyStat, QDistinct>
  distinctByPartialCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'partialCount');
    });
  }

  QueryBuilder<AiModelDailyStat, AiModelDailyStat, QDistinct>
  distinctByPhrasesAccepted() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'phrasesAccepted');
    });
  }

  QueryBuilder<AiModelDailyStat, AiModelDailyStat, QDistinct>
  distinctByPhrasesRequested() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'phrasesRequested');
    });
  }

  QueryBuilder<AiModelDailyStat, AiModelDailyStat, QDistinct>
  distinctByQuotaExhaustedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'quotaExhaustedAt');
    });
  }

  QueryBuilder<AiModelDailyStat, AiModelDailyStat, QDistinct>
  distinctByRequests() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'requests');
    });
  }

  QueryBuilder<AiModelDailyStat, AiModelDailyStat, QDistinct> distinctByStep({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'step', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<AiModelDailyStat, AiModelDailyStat, QDistinct>
  distinctBySuccessCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'successCount');
    });
  }

  QueryBuilder<AiModelDailyStat, AiModelDailyStat, QDistinct>
  distinctByTokensIn() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'tokensIn');
    });
  }

  QueryBuilder<AiModelDailyStat, AiModelDailyStat, QDistinct>
  distinctByTokensOut() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'tokensOut');
    });
  }
}

extension AiModelDailyStatQueryProperty
    on QueryBuilder<AiModelDailyStat, AiModelDailyStat, QQueryProperty> {
  QueryBuilder<AiModelDailyStat, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<AiModelDailyStat, int?, QQueryOperations>
  avgDurationMsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'avgDurationMs');
    });
  }

  QueryBuilder<AiModelDailyStat, double, QQueryOperations> costProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'cost');
    });
  }

  QueryBuilder<AiModelDailyStat, String, QQueryOperations> dateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'date');
    });
  }

  QueryBuilder<AiModelDailyStat, int, QQueryOperations> errorCountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'errorCount');
    });
  }

  QueryBuilder<AiModelDailyStat, List<ErrorCount>, QQueryOperations>
  errorsByTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'errorsByType');
    });
  }

  QueryBuilder<AiModelDailyStat, String, QQueryOperations> keyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'key');
    });
  }

  QueryBuilder<AiModelDailyStat, int?, QQueryOperations>
  maxDurationMsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'maxDurationMs');
    });
  }

  QueryBuilder<AiModelDailyStat, String, QQueryOperations> modelNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'modelName');
    });
  }

  QueryBuilder<AiModelDailyStat, int, QQueryOperations> partialCountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'partialCount');
    });
  }

  QueryBuilder<AiModelDailyStat, int, QQueryOperations>
  phrasesAcceptedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'phrasesAccepted');
    });
  }

  QueryBuilder<AiModelDailyStat, int, QQueryOperations>
  phrasesRequestedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'phrasesRequested');
    });
  }

  QueryBuilder<AiModelDailyStat, DateTime?, QQueryOperations>
  quotaExhaustedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'quotaExhaustedAt');
    });
  }

  QueryBuilder<AiModelDailyStat, int, QQueryOperations> requestsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'requests');
    });
  }

  QueryBuilder<AiModelDailyStat, String, QQueryOperations> stepProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'step');
    });
  }

  QueryBuilder<AiModelDailyStat, int, QQueryOperations> successCountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'successCount');
    });
  }

  QueryBuilder<AiModelDailyStat, int, QQueryOperations> tokensInProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'tokensIn');
    });
  }

  QueryBuilder<AiModelDailyStat, int, QQueryOperations> tokensOutProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'tokensOut');
    });
  }
}

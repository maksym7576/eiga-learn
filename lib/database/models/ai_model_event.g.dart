// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_model_event.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetAiModelEventCollection on Isar {
  IsarCollection<AiModelEvent> get aiModelEvents => this.collection();
}

const AiModelEventSchema = CollectionSchema(
  name: r'AiModelEvent',
  id: -8692083302606141055,
  properties: {
    r'durationMs': PropertySchema(
      id: 0,
      name: r'durationMs',
      type: IsarType.long,
    ),
    r'errorType': PropertySchema(
      id: 1,
      name: r'errorType',
      type: IsarType.string,
    ),
    r'httpCode': PropertySchema(id: 2, name: r'httpCode', type: IsarType.long),
    r'jobId': PropertySchema(id: 3, name: r'jobId', type: IsarType.long),
    r'message': PropertySchema(id: 4, name: r'message', type: IsarType.string),
    r'modelName': PropertySchema(
      id: 5,
      name: r'modelName',
      type: IsarType.string,
    ),
    r'phrasesAccepted': PropertySchema(
      id: 6,
      name: r'phrasesAccepted',
      type: IsarType.long,
    ),
    r'phrasesRequested': PropertySchema(
      id: 7,
      name: r'phrasesRequested',
      type: IsarType.long,
    ),
    r'result': PropertySchema(id: 8, name: r'result', type: IsarType.string),
    r'step': PropertySchema(id: 9, name: r'step', type: IsarType.string),
    r'timestamp': PropertySchema(
      id: 10,
      name: r'timestamp',
      type: IsarType.dateTime,
    ),
    r'tokensIn': PropertySchema(id: 11, name: r'tokensIn', type: IsarType.long),
    r'tokensOut': PropertySchema(
      id: 12,
      name: r'tokensOut',
      type: IsarType.long,
    ),
  },

  estimateSize: _aiModelEventEstimateSize,
  serialize: _aiModelEventSerialize,
  deserialize: _aiModelEventDeserialize,
  deserializeProp: _aiModelEventDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},

  getId: _aiModelEventGetId,
  getLinks: _aiModelEventGetLinks,
  attach: _aiModelEventAttach,
  version: '3.3.2',
);

int _aiModelEventEstimateSize(
  AiModelEvent object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.errorType;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.message;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.modelName.length * 3;
  bytesCount += 3 + object.result.length * 3;
  bytesCount += 3 + object.step.length * 3;
  return bytesCount;
}

void _aiModelEventSerialize(
  AiModelEvent object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.durationMs);
  writer.writeString(offsets[1], object.errorType);
  writer.writeLong(offsets[2], object.httpCode);
  writer.writeLong(offsets[3], object.jobId);
  writer.writeString(offsets[4], object.message);
  writer.writeString(offsets[5], object.modelName);
  writer.writeLong(offsets[6], object.phrasesAccepted);
  writer.writeLong(offsets[7], object.phrasesRequested);
  writer.writeString(offsets[8], object.result);
  writer.writeString(offsets[9], object.step);
  writer.writeDateTime(offsets[10], object.timestamp);
  writer.writeLong(offsets[11], object.tokensIn);
  writer.writeLong(offsets[12], object.tokensOut);
}

AiModelEvent _aiModelEventDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = AiModelEvent();
  object.durationMs = reader.readLongOrNull(offsets[0]);
  object.errorType = reader.readStringOrNull(offsets[1]);
  object.httpCode = reader.readLongOrNull(offsets[2]);
  object.id = id;
  object.jobId = reader.readLongOrNull(offsets[3]);
  object.message = reader.readStringOrNull(offsets[4]);
  object.modelName = reader.readString(offsets[5]);
  object.phrasesAccepted = reader.readLongOrNull(offsets[6]);
  object.phrasesRequested = reader.readLongOrNull(offsets[7]);
  object.result = reader.readString(offsets[8]);
  object.step = reader.readString(offsets[9]);
  object.timestamp = reader.readDateTime(offsets[10]);
  object.tokensIn = reader.readLongOrNull(offsets[11]);
  object.tokensOut = reader.readLongOrNull(offsets[12]);
  return object;
}

P _aiModelEventDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLongOrNull(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readLongOrNull(offset)) as P;
    case 3:
      return (reader.readLongOrNull(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader.readLongOrNull(offset)) as P;
    case 7:
      return (reader.readLongOrNull(offset)) as P;
    case 8:
      return (reader.readString(offset)) as P;
    case 9:
      return (reader.readString(offset)) as P;
    case 10:
      return (reader.readDateTime(offset)) as P;
    case 11:
      return (reader.readLongOrNull(offset)) as P;
    case 12:
      return (reader.readLongOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _aiModelEventGetId(AiModelEvent object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _aiModelEventGetLinks(AiModelEvent object) {
  return [];
}

void _aiModelEventAttach(
  IsarCollection<dynamic> col,
  Id id,
  AiModelEvent object,
) {
  object.id = id;
}

extension AiModelEventQueryWhereSort
    on QueryBuilder<AiModelEvent, AiModelEvent, QWhere> {
  QueryBuilder<AiModelEvent, AiModelEvent, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension AiModelEventQueryWhere
    on QueryBuilder<AiModelEvent, AiModelEvent, QWhereClause> {
  QueryBuilder<AiModelEvent, AiModelEvent, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(lower: id, upper: id));
    });
  }

  QueryBuilder<AiModelEvent, AiModelEvent, QAfterWhereClause> idNotEqualTo(
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

  QueryBuilder<AiModelEvent, AiModelEvent, QAfterWhereClause> idGreaterThan(
    Id id, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<AiModelEvent, AiModelEvent, QAfterWhereClause> idLessThan(
    Id id, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<AiModelEvent, AiModelEvent, QAfterWhereClause> idBetween(
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

extension AiModelEventQueryFilter
    on QueryBuilder<AiModelEvent, AiModelEvent, QFilterCondition> {
  QueryBuilder<AiModelEvent, AiModelEvent, QAfterFilterCondition>
  durationMsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'durationMs'),
      );
    });
  }

  QueryBuilder<AiModelEvent, AiModelEvent, QAfterFilterCondition>
  durationMsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'durationMs'),
      );
    });
  }

  QueryBuilder<AiModelEvent, AiModelEvent, QAfterFilterCondition>
  durationMsEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'durationMs', value: value),
      );
    });
  }

  QueryBuilder<AiModelEvent, AiModelEvent, QAfterFilterCondition>
  durationMsGreaterThan(int? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'durationMs',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<AiModelEvent, AiModelEvent, QAfterFilterCondition>
  durationMsLessThan(int? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'durationMs',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<AiModelEvent, AiModelEvent, QAfterFilterCondition>
  durationMsBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'durationMs',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<AiModelEvent, AiModelEvent, QAfterFilterCondition>
  errorTypeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'errorType'),
      );
    });
  }

  QueryBuilder<AiModelEvent, AiModelEvent, QAfterFilterCondition>
  errorTypeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'errorType'),
      );
    });
  }

  QueryBuilder<AiModelEvent, AiModelEvent, QAfterFilterCondition>
  errorTypeEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'errorType',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AiModelEvent, AiModelEvent, QAfterFilterCondition>
  errorTypeGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'errorType',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AiModelEvent, AiModelEvent, QAfterFilterCondition>
  errorTypeLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'errorType',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AiModelEvent, AiModelEvent, QAfterFilterCondition>
  errorTypeBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'errorType',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AiModelEvent, AiModelEvent, QAfterFilterCondition>
  errorTypeStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'errorType',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AiModelEvent, AiModelEvent, QAfterFilterCondition>
  errorTypeEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'errorType',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AiModelEvent, AiModelEvent, QAfterFilterCondition>
  errorTypeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'errorType',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AiModelEvent, AiModelEvent, QAfterFilterCondition>
  errorTypeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'errorType',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AiModelEvent, AiModelEvent, QAfterFilterCondition>
  errorTypeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'errorType', value: ''),
      );
    });
  }

  QueryBuilder<AiModelEvent, AiModelEvent, QAfterFilterCondition>
  errorTypeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'errorType', value: ''),
      );
    });
  }

  QueryBuilder<AiModelEvent, AiModelEvent, QAfterFilterCondition>
  httpCodeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'httpCode'),
      );
    });
  }

  QueryBuilder<AiModelEvent, AiModelEvent, QAfterFilterCondition>
  httpCodeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'httpCode'),
      );
    });
  }

  QueryBuilder<AiModelEvent, AiModelEvent, QAfterFilterCondition>
  httpCodeEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'httpCode', value: value),
      );
    });
  }

  QueryBuilder<AiModelEvent, AiModelEvent, QAfterFilterCondition>
  httpCodeGreaterThan(int? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'httpCode',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<AiModelEvent, AiModelEvent, QAfterFilterCondition>
  httpCodeLessThan(int? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'httpCode',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<AiModelEvent, AiModelEvent, QAfterFilterCondition>
  httpCodeBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'httpCode',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<AiModelEvent, AiModelEvent, QAfterFilterCondition> idEqualTo(
    Id value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'id', value: value),
      );
    });
  }

  QueryBuilder<AiModelEvent, AiModelEvent, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<AiModelEvent, AiModelEvent, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<AiModelEvent, AiModelEvent, QAfterFilterCondition> idBetween(
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

  QueryBuilder<AiModelEvent, AiModelEvent, QAfterFilterCondition>
  jobIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'jobId'),
      );
    });
  }

  QueryBuilder<AiModelEvent, AiModelEvent, QAfterFilterCondition>
  jobIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'jobId'),
      );
    });
  }

  QueryBuilder<AiModelEvent, AiModelEvent, QAfterFilterCondition> jobIdEqualTo(
    int? value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'jobId', value: value),
      );
    });
  }

  QueryBuilder<AiModelEvent, AiModelEvent, QAfterFilterCondition>
  jobIdGreaterThan(int? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'jobId',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<AiModelEvent, AiModelEvent, QAfterFilterCondition> jobIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'jobId',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<AiModelEvent, AiModelEvent, QAfterFilterCondition> jobIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'jobId',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<AiModelEvent, AiModelEvent, QAfterFilterCondition>
  messageIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'message'),
      );
    });
  }

  QueryBuilder<AiModelEvent, AiModelEvent, QAfterFilterCondition>
  messageIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'message'),
      );
    });
  }

  QueryBuilder<AiModelEvent, AiModelEvent, QAfterFilterCondition>
  messageEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'message',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AiModelEvent, AiModelEvent, QAfterFilterCondition>
  messageGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'message',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AiModelEvent, AiModelEvent, QAfterFilterCondition>
  messageLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'message',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AiModelEvent, AiModelEvent, QAfterFilterCondition>
  messageBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'message',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AiModelEvent, AiModelEvent, QAfterFilterCondition>
  messageStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'message',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AiModelEvent, AiModelEvent, QAfterFilterCondition>
  messageEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'message',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AiModelEvent, AiModelEvent, QAfterFilterCondition>
  messageContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'message',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AiModelEvent, AiModelEvent, QAfterFilterCondition>
  messageMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'message',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AiModelEvent, AiModelEvent, QAfterFilterCondition>
  messageIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'message', value: ''),
      );
    });
  }

  QueryBuilder<AiModelEvent, AiModelEvent, QAfterFilterCondition>
  messageIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'message', value: ''),
      );
    });
  }

  QueryBuilder<AiModelEvent, AiModelEvent, QAfterFilterCondition>
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

  QueryBuilder<AiModelEvent, AiModelEvent, QAfterFilterCondition>
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

  QueryBuilder<AiModelEvent, AiModelEvent, QAfterFilterCondition>
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

  QueryBuilder<AiModelEvent, AiModelEvent, QAfterFilterCondition>
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

  QueryBuilder<AiModelEvent, AiModelEvent, QAfterFilterCondition>
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

  QueryBuilder<AiModelEvent, AiModelEvent, QAfterFilterCondition>
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

  QueryBuilder<AiModelEvent, AiModelEvent, QAfterFilterCondition>
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

  QueryBuilder<AiModelEvent, AiModelEvent, QAfterFilterCondition>
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

  QueryBuilder<AiModelEvent, AiModelEvent, QAfterFilterCondition>
  modelNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'modelName', value: ''),
      );
    });
  }

  QueryBuilder<AiModelEvent, AiModelEvent, QAfterFilterCondition>
  modelNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'modelName', value: ''),
      );
    });
  }

  QueryBuilder<AiModelEvent, AiModelEvent, QAfterFilterCondition>
  phrasesAcceptedIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'phrasesAccepted'),
      );
    });
  }

  QueryBuilder<AiModelEvent, AiModelEvent, QAfterFilterCondition>
  phrasesAcceptedIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'phrasesAccepted'),
      );
    });
  }

  QueryBuilder<AiModelEvent, AiModelEvent, QAfterFilterCondition>
  phrasesAcceptedEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'phrasesAccepted', value: value),
      );
    });
  }

  QueryBuilder<AiModelEvent, AiModelEvent, QAfterFilterCondition>
  phrasesAcceptedGreaterThan(int? value, {bool include = false}) {
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

  QueryBuilder<AiModelEvent, AiModelEvent, QAfterFilterCondition>
  phrasesAcceptedLessThan(int? value, {bool include = false}) {
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

  QueryBuilder<AiModelEvent, AiModelEvent, QAfterFilterCondition>
  phrasesAcceptedBetween(
    int? lower,
    int? upper, {
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

  QueryBuilder<AiModelEvent, AiModelEvent, QAfterFilterCondition>
  phrasesRequestedIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'phrasesRequested'),
      );
    });
  }

  QueryBuilder<AiModelEvent, AiModelEvent, QAfterFilterCondition>
  phrasesRequestedIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'phrasesRequested'),
      );
    });
  }

  QueryBuilder<AiModelEvent, AiModelEvent, QAfterFilterCondition>
  phrasesRequestedEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'phrasesRequested', value: value),
      );
    });
  }

  QueryBuilder<AiModelEvent, AiModelEvent, QAfterFilterCondition>
  phrasesRequestedGreaterThan(int? value, {bool include = false}) {
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

  QueryBuilder<AiModelEvent, AiModelEvent, QAfterFilterCondition>
  phrasesRequestedLessThan(int? value, {bool include = false}) {
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

  QueryBuilder<AiModelEvent, AiModelEvent, QAfterFilterCondition>
  phrasesRequestedBetween(
    int? lower,
    int? upper, {
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

  QueryBuilder<AiModelEvent, AiModelEvent, QAfterFilterCondition> resultEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'result',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AiModelEvent, AiModelEvent, QAfterFilterCondition>
  resultGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'result',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AiModelEvent, AiModelEvent, QAfterFilterCondition>
  resultLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'result',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AiModelEvent, AiModelEvent, QAfterFilterCondition> resultBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'result',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AiModelEvent, AiModelEvent, QAfterFilterCondition>
  resultStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'result',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AiModelEvent, AiModelEvent, QAfterFilterCondition>
  resultEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'result',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AiModelEvent, AiModelEvent, QAfterFilterCondition>
  resultContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'result',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AiModelEvent, AiModelEvent, QAfterFilterCondition> resultMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'result',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AiModelEvent, AiModelEvent, QAfterFilterCondition>
  resultIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'result', value: ''),
      );
    });
  }

  QueryBuilder<AiModelEvent, AiModelEvent, QAfterFilterCondition>
  resultIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'result', value: ''),
      );
    });
  }

  QueryBuilder<AiModelEvent, AiModelEvent, QAfterFilterCondition> stepEqualTo(
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

  QueryBuilder<AiModelEvent, AiModelEvent, QAfterFilterCondition>
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

  QueryBuilder<AiModelEvent, AiModelEvent, QAfterFilterCondition> stepLessThan(
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

  QueryBuilder<AiModelEvent, AiModelEvent, QAfterFilterCondition> stepBetween(
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

  QueryBuilder<AiModelEvent, AiModelEvent, QAfterFilterCondition>
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

  QueryBuilder<AiModelEvent, AiModelEvent, QAfterFilterCondition> stepEndsWith(
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

  QueryBuilder<AiModelEvent, AiModelEvent, QAfterFilterCondition> stepContains(
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

  QueryBuilder<AiModelEvent, AiModelEvent, QAfterFilterCondition> stepMatches(
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

  QueryBuilder<AiModelEvent, AiModelEvent, QAfterFilterCondition>
  stepIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'step', value: ''),
      );
    });
  }

  QueryBuilder<AiModelEvent, AiModelEvent, QAfterFilterCondition>
  stepIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'step', value: ''),
      );
    });
  }

  QueryBuilder<AiModelEvent, AiModelEvent, QAfterFilterCondition>
  timestampEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'timestamp', value: value),
      );
    });
  }

  QueryBuilder<AiModelEvent, AiModelEvent, QAfterFilterCondition>
  timestampGreaterThan(DateTime value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'timestamp',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<AiModelEvent, AiModelEvent, QAfterFilterCondition>
  timestampLessThan(DateTime value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'timestamp',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<AiModelEvent, AiModelEvent, QAfterFilterCondition>
  timestampBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'timestamp',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<AiModelEvent, AiModelEvent, QAfterFilterCondition>
  tokensInIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'tokensIn'),
      );
    });
  }

  QueryBuilder<AiModelEvent, AiModelEvent, QAfterFilterCondition>
  tokensInIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'tokensIn'),
      );
    });
  }

  QueryBuilder<AiModelEvent, AiModelEvent, QAfterFilterCondition>
  tokensInEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'tokensIn', value: value),
      );
    });
  }

  QueryBuilder<AiModelEvent, AiModelEvent, QAfterFilterCondition>
  tokensInGreaterThan(int? value, {bool include = false}) {
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

  QueryBuilder<AiModelEvent, AiModelEvent, QAfterFilterCondition>
  tokensInLessThan(int? value, {bool include = false}) {
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

  QueryBuilder<AiModelEvent, AiModelEvent, QAfterFilterCondition>
  tokensInBetween(
    int? lower,
    int? upper, {
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

  QueryBuilder<AiModelEvent, AiModelEvent, QAfterFilterCondition>
  tokensOutIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'tokensOut'),
      );
    });
  }

  QueryBuilder<AiModelEvent, AiModelEvent, QAfterFilterCondition>
  tokensOutIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'tokensOut'),
      );
    });
  }

  QueryBuilder<AiModelEvent, AiModelEvent, QAfterFilterCondition>
  tokensOutEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'tokensOut', value: value),
      );
    });
  }

  QueryBuilder<AiModelEvent, AiModelEvent, QAfterFilterCondition>
  tokensOutGreaterThan(int? value, {bool include = false}) {
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

  QueryBuilder<AiModelEvent, AiModelEvent, QAfterFilterCondition>
  tokensOutLessThan(int? value, {bool include = false}) {
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

  QueryBuilder<AiModelEvent, AiModelEvent, QAfterFilterCondition>
  tokensOutBetween(
    int? lower,
    int? upper, {
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

extension AiModelEventQueryObject
    on QueryBuilder<AiModelEvent, AiModelEvent, QFilterCondition> {}

extension AiModelEventQueryLinks
    on QueryBuilder<AiModelEvent, AiModelEvent, QFilterCondition> {}

extension AiModelEventQuerySortBy
    on QueryBuilder<AiModelEvent, AiModelEvent, QSortBy> {
  QueryBuilder<AiModelEvent, AiModelEvent, QAfterSortBy> sortByDurationMs() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'durationMs', Sort.asc);
    });
  }

  QueryBuilder<AiModelEvent, AiModelEvent, QAfterSortBy>
  sortByDurationMsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'durationMs', Sort.desc);
    });
  }

  QueryBuilder<AiModelEvent, AiModelEvent, QAfterSortBy> sortByErrorType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'errorType', Sort.asc);
    });
  }

  QueryBuilder<AiModelEvent, AiModelEvent, QAfterSortBy> sortByErrorTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'errorType', Sort.desc);
    });
  }

  QueryBuilder<AiModelEvent, AiModelEvent, QAfterSortBy> sortByHttpCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'httpCode', Sort.asc);
    });
  }

  QueryBuilder<AiModelEvent, AiModelEvent, QAfterSortBy> sortByHttpCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'httpCode', Sort.desc);
    });
  }

  QueryBuilder<AiModelEvent, AiModelEvent, QAfterSortBy> sortByJobId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'jobId', Sort.asc);
    });
  }

  QueryBuilder<AiModelEvent, AiModelEvent, QAfterSortBy> sortByJobIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'jobId', Sort.desc);
    });
  }

  QueryBuilder<AiModelEvent, AiModelEvent, QAfterSortBy> sortByMessage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'message', Sort.asc);
    });
  }

  QueryBuilder<AiModelEvent, AiModelEvent, QAfterSortBy> sortByMessageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'message', Sort.desc);
    });
  }

  QueryBuilder<AiModelEvent, AiModelEvent, QAfterSortBy> sortByModelName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'modelName', Sort.asc);
    });
  }

  QueryBuilder<AiModelEvent, AiModelEvent, QAfterSortBy> sortByModelNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'modelName', Sort.desc);
    });
  }

  QueryBuilder<AiModelEvent, AiModelEvent, QAfterSortBy>
  sortByPhrasesAccepted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'phrasesAccepted', Sort.asc);
    });
  }

  QueryBuilder<AiModelEvent, AiModelEvent, QAfterSortBy>
  sortByPhrasesAcceptedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'phrasesAccepted', Sort.desc);
    });
  }

  QueryBuilder<AiModelEvent, AiModelEvent, QAfterSortBy>
  sortByPhrasesRequested() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'phrasesRequested', Sort.asc);
    });
  }

  QueryBuilder<AiModelEvent, AiModelEvent, QAfterSortBy>
  sortByPhrasesRequestedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'phrasesRequested', Sort.desc);
    });
  }

  QueryBuilder<AiModelEvent, AiModelEvent, QAfterSortBy> sortByResult() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'result', Sort.asc);
    });
  }

  QueryBuilder<AiModelEvent, AiModelEvent, QAfterSortBy> sortByResultDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'result', Sort.desc);
    });
  }

  QueryBuilder<AiModelEvent, AiModelEvent, QAfterSortBy> sortByStep() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'step', Sort.asc);
    });
  }

  QueryBuilder<AiModelEvent, AiModelEvent, QAfterSortBy> sortByStepDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'step', Sort.desc);
    });
  }

  QueryBuilder<AiModelEvent, AiModelEvent, QAfterSortBy> sortByTimestamp() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timestamp', Sort.asc);
    });
  }

  QueryBuilder<AiModelEvent, AiModelEvent, QAfterSortBy> sortByTimestampDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timestamp', Sort.desc);
    });
  }

  QueryBuilder<AiModelEvent, AiModelEvent, QAfterSortBy> sortByTokensIn() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tokensIn', Sort.asc);
    });
  }

  QueryBuilder<AiModelEvent, AiModelEvent, QAfterSortBy> sortByTokensInDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tokensIn', Sort.desc);
    });
  }

  QueryBuilder<AiModelEvent, AiModelEvent, QAfterSortBy> sortByTokensOut() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tokensOut', Sort.asc);
    });
  }

  QueryBuilder<AiModelEvent, AiModelEvent, QAfterSortBy> sortByTokensOutDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tokensOut', Sort.desc);
    });
  }
}

extension AiModelEventQuerySortThenBy
    on QueryBuilder<AiModelEvent, AiModelEvent, QSortThenBy> {
  QueryBuilder<AiModelEvent, AiModelEvent, QAfterSortBy> thenByDurationMs() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'durationMs', Sort.asc);
    });
  }

  QueryBuilder<AiModelEvent, AiModelEvent, QAfterSortBy>
  thenByDurationMsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'durationMs', Sort.desc);
    });
  }

  QueryBuilder<AiModelEvent, AiModelEvent, QAfterSortBy> thenByErrorType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'errorType', Sort.asc);
    });
  }

  QueryBuilder<AiModelEvent, AiModelEvent, QAfterSortBy> thenByErrorTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'errorType', Sort.desc);
    });
  }

  QueryBuilder<AiModelEvent, AiModelEvent, QAfterSortBy> thenByHttpCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'httpCode', Sort.asc);
    });
  }

  QueryBuilder<AiModelEvent, AiModelEvent, QAfterSortBy> thenByHttpCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'httpCode', Sort.desc);
    });
  }

  QueryBuilder<AiModelEvent, AiModelEvent, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<AiModelEvent, AiModelEvent, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<AiModelEvent, AiModelEvent, QAfterSortBy> thenByJobId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'jobId', Sort.asc);
    });
  }

  QueryBuilder<AiModelEvent, AiModelEvent, QAfterSortBy> thenByJobIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'jobId', Sort.desc);
    });
  }

  QueryBuilder<AiModelEvent, AiModelEvent, QAfterSortBy> thenByMessage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'message', Sort.asc);
    });
  }

  QueryBuilder<AiModelEvent, AiModelEvent, QAfterSortBy> thenByMessageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'message', Sort.desc);
    });
  }

  QueryBuilder<AiModelEvent, AiModelEvent, QAfterSortBy> thenByModelName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'modelName', Sort.asc);
    });
  }

  QueryBuilder<AiModelEvent, AiModelEvent, QAfterSortBy> thenByModelNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'modelName', Sort.desc);
    });
  }

  QueryBuilder<AiModelEvent, AiModelEvent, QAfterSortBy>
  thenByPhrasesAccepted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'phrasesAccepted', Sort.asc);
    });
  }

  QueryBuilder<AiModelEvent, AiModelEvent, QAfterSortBy>
  thenByPhrasesAcceptedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'phrasesAccepted', Sort.desc);
    });
  }

  QueryBuilder<AiModelEvent, AiModelEvent, QAfterSortBy>
  thenByPhrasesRequested() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'phrasesRequested', Sort.asc);
    });
  }

  QueryBuilder<AiModelEvent, AiModelEvent, QAfterSortBy>
  thenByPhrasesRequestedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'phrasesRequested', Sort.desc);
    });
  }

  QueryBuilder<AiModelEvent, AiModelEvent, QAfterSortBy> thenByResult() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'result', Sort.asc);
    });
  }

  QueryBuilder<AiModelEvent, AiModelEvent, QAfterSortBy> thenByResultDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'result', Sort.desc);
    });
  }

  QueryBuilder<AiModelEvent, AiModelEvent, QAfterSortBy> thenByStep() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'step', Sort.asc);
    });
  }

  QueryBuilder<AiModelEvent, AiModelEvent, QAfterSortBy> thenByStepDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'step', Sort.desc);
    });
  }

  QueryBuilder<AiModelEvent, AiModelEvent, QAfterSortBy> thenByTimestamp() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timestamp', Sort.asc);
    });
  }

  QueryBuilder<AiModelEvent, AiModelEvent, QAfterSortBy> thenByTimestampDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timestamp', Sort.desc);
    });
  }

  QueryBuilder<AiModelEvent, AiModelEvent, QAfterSortBy> thenByTokensIn() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tokensIn', Sort.asc);
    });
  }

  QueryBuilder<AiModelEvent, AiModelEvent, QAfterSortBy> thenByTokensInDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tokensIn', Sort.desc);
    });
  }

  QueryBuilder<AiModelEvent, AiModelEvent, QAfterSortBy> thenByTokensOut() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tokensOut', Sort.asc);
    });
  }

  QueryBuilder<AiModelEvent, AiModelEvent, QAfterSortBy> thenByTokensOutDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tokensOut', Sort.desc);
    });
  }
}

extension AiModelEventQueryWhereDistinct
    on QueryBuilder<AiModelEvent, AiModelEvent, QDistinct> {
  QueryBuilder<AiModelEvent, AiModelEvent, QDistinct> distinctByDurationMs() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'durationMs');
    });
  }

  QueryBuilder<AiModelEvent, AiModelEvent, QDistinct> distinctByErrorType({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'errorType', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<AiModelEvent, AiModelEvent, QDistinct> distinctByHttpCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'httpCode');
    });
  }

  QueryBuilder<AiModelEvent, AiModelEvent, QDistinct> distinctByJobId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'jobId');
    });
  }

  QueryBuilder<AiModelEvent, AiModelEvent, QDistinct> distinctByMessage({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'message', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<AiModelEvent, AiModelEvent, QDistinct> distinctByModelName({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'modelName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<AiModelEvent, AiModelEvent, QDistinct>
  distinctByPhrasesAccepted() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'phrasesAccepted');
    });
  }

  QueryBuilder<AiModelEvent, AiModelEvent, QDistinct>
  distinctByPhrasesRequested() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'phrasesRequested');
    });
  }

  QueryBuilder<AiModelEvent, AiModelEvent, QDistinct> distinctByResult({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'result', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<AiModelEvent, AiModelEvent, QDistinct> distinctByStep({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'step', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<AiModelEvent, AiModelEvent, QDistinct> distinctByTimestamp() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'timestamp');
    });
  }

  QueryBuilder<AiModelEvent, AiModelEvent, QDistinct> distinctByTokensIn() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'tokensIn');
    });
  }

  QueryBuilder<AiModelEvent, AiModelEvent, QDistinct> distinctByTokensOut() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'tokensOut');
    });
  }
}

extension AiModelEventQueryProperty
    on QueryBuilder<AiModelEvent, AiModelEvent, QQueryProperty> {
  QueryBuilder<AiModelEvent, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<AiModelEvent, int?, QQueryOperations> durationMsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'durationMs');
    });
  }

  QueryBuilder<AiModelEvent, String?, QQueryOperations> errorTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'errorType');
    });
  }

  QueryBuilder<AiModelEvent, int?, QQueryOperations> httpCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'httpCode');
    });
  }

  QueryBuilder<AiModelEvent, int?, QQueryOperations> jobIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'jobId');
    });
  }

  QueryBuilder<AiModelEvent, String?, QQueryOperations> messageProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'message');
    });
  }

  QueryBuilder<AiModelEvent, String, QQueryOperations> modelNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'modelName');
    });
  }

  QueryBuilder<AiModelEvent, int?, QQueryOperations> phrasesAcceptedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'phrasesAccepted');
    });
  }

  QueryBuilder<AiModelEvent, int?, QQueryOperations>
  phrasesRequestedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'phrasesRequested');
    });
  }

  QueryBuilder<AiModelEvent, String, QQueryOperations> resultProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'result');
    });
  }

  QueryBuilder<AiModelEvent, String, QQueryOperations> stepProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'step');
    });
  }

  QueryBuilder<AiModelEvent, DateTime, QQueryOperations> timestampProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'timestamp');
    });
  }

  QueryBuilder<AiModelEvent, int?, QQueryOperations> tokensInProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'tokensIn');
    });
  }

  QueryBuilder<AiModelEvent, int?, QQueryOperations> tokensOutProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'tokensOut');
    });
  }
}

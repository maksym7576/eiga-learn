// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model_capabilities.dart';

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const ModelCapabilitiesSchema = Schema(
  name: r'ModelCapabilities',
  id: 6690754611885651301,
  properties: {
    r'contextWindow': PropertySchema(
      id: 0,
      name: r'contextWindow',
      type: IsarType.long,
    ),
    r'defaultDailyLimit': PropertySchema(
      id: 1,
      name: r'defaultDailyLimit',
      type: IsarType.long,
    ),
    r'defaultLimit': PropertySchema(
      id: 2,
      name: r'defaultLimit',
      type: IsarType.long,
    ),
    r'defaultPhrasesPerRequest': PropertySchema(
      id: 3,
      name: r'defaultPhrasesPerRequest',
      type: IsarType.long,
    ),
    r'defaultStreaming': PropertySchema(
      id: 4,
      name: r'defaultStreaming',
      type: IsarType.bool,
    ),
    r'inputPricePerMTok': PropertySchema(
      id: 5,
      name: r'inputPricePerMTok',
      type: IsarType.double,
    ),
    r'maxOutputTokens': PropertySchema(
      id: 6,
      name: r'maxOutputTokens',
      type: IsarType.long,
    ),
    r'outputPricePerMTok': PropertySchema(
      id: 7,
      name: r'outputPricePerMTok',
      type: IsarType.double,
    ),
    r'quality': PropertySchema(id: 8, name: r'quality', type: IsarType.long),
    r'speed': PropertySchema(id: 9, name: r'speed', type: IsarType.long),
    r'supportedInputs': PropertySchema(
      id: 10,
      name: r'supportedInputs',
      type: IsarType.stringList,
    ),
    r'supportedSteps': PropertySchema(
      id: 11,
      name: r'supportedSteps',
      type: IsarType.stringList,
    ),
    r'supportsJsonMode': PropertySchema(
      id: 12,
      name: r'supportsJsonMode',
      type: IsarType.bool,
    ),
    r'supportsStreaming': PropertySchema(
      id: 13,
      name: r'supportsStreaming',
      type: IsarType.bool,
    ),
    r'supportsSystemPrompt': PropertySchema(
      id: 14,
      name: r'supportsSystemPrompt',
      type: IsarType.bool,
    ),
    r'tpmLimit': PropertySchema(id: 15, name: r'tpmLimit', type: IsarType.long),
  },

  estimateSize: _modelCapabilitiesEstimateSize,
  serialize: _modelCapabilitiesSerialize,
  deserialize: _modelCapabilitiesDeserialize,
  deserializeProp: _modelCapabilitiesDeserializeProp,
);

int _modelCapabilitiesEstimateSize(
  ModelCapabilities object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.supportedInputs.length * 3;
  {
    for (var i = 0; i < object.supportedInputs.length; i++) {
      final value = object.supportedInputs[i];
      bytesCount += value.length * 3;
    }
  }
  bytesCount += 3 + object.supportedSteps.length * 3;
  {
    for (var i = 0; i < object.supportedSteps.length; i++) {
      final value = object.supportedSteps[i];
      bytesCount += value.length * 3;
    }
  }
  return bytesCount;
}

void _modelCapabilitiesSerialize(
  ModelCapabilities object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.contextWindow);
  writer.writeLong(offsets[1], object.defaultDailyLimit);
  writer.writeLong(offsets[2], object.defaultLimit);
  writer.writeLong(offsets[3], object.defaultPhrasesPerRequest);
  writer.writeBool(offsets[4], object.defaultStreaming);
  writer.writeDouble(offsets[5], object.inputPricePerMTok);
  writer.writeLong(offsets[6], object.maxOutputTokens);
  writer.writeDouble(offsets[7], object.outputPricePerMTok);
  writer.writeLong(offsets[8], object.quality);
  writer.writeLong(offsets[9], object.speed);
  writer.writeStringList(offsets[10], object.supportedInputs);
  writer.writeStringList(offsets[11], object.supportedSteps);
  writer.writeBool(offsets[12], object.supportsJsonMode);
  writer.writeBool(offsets[13], object.supportsStreaming);
  writer.writeBool(offsets[14], object.supportsSystemPrompt);
  writer.writeLong(offsets[15], object.tpmLimit);
}

ModelCapabilities _modelCapabilitiesDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ModelCapabilities();
  object.contextWindow = reader.readLongOrNull(offsets[0]);
  object.defaultDailyLimit = reader.readLongOrNull(offsets[1]);
  object.defaultLimit = reader.readLongOrNull(offsets[2]);
  object.defaultPhrasesPerRequest = reader.readLongOrNull(offsets[3]);
  object.defaultStreaming = reader.readBoolOrNull(offsets[4]);
  object.inputPricePerMTok = reader.readDoubleOrNull(offsets[5]);
  object.maxOutputTokens = reader.readLongOrNull(offsets[6]);
  object.outputPricePerMTok = reader.readDoubleOrNull(offsets[7]);
  object.quality = reader.readLongOrNull(offsets[8]);
  object.speed = reader.readLongOrNull(offsets[9]);
  object.supportedInputs = reader.readStringList(offsets[10]) ?? [];
  object.supportedSteps = reader.readStringList(offsets[11]) ?? [];
  object.supportsJsonMode = reader.readBool(offsets[12]);
  object.supportsStreaming = reader.readBool(offsets[13]);
  object.supportsSystemPrompt = reader.readBool(offsets[14]);
  object.tpmLimit = reader.readLongOrNull(offsets[15]);
  return object;
}

P _modelCapabilitiesDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLongOrNull(offset)) as P;
    case 1:
      return (reader.readLongOrNull(offset)) as P;
    case 2:
      return (reader.readLongOrNull(offset)) as P;
    case 3:
      return (reader.readLongOrNull(offset)) as P;
    case 4:
      return (reader.readBoolOrNull(offset)) as P;
    case 5:
      return (reader.readDoubleOrNull(offset)) as P;
    case 6:
      return (reader.readLongOrNull(offset)) as P;
    case 7:
      return (reader.readDoubleOrNull(offset)) as P;
    case 8:
      return (reader.readLongOrNull(offset)) as P;
    case 9:
      return (reader.readLongOrNull(offset)) as P;
    case 10:
      return (reader.readStringList(offset) ?? []) as P;
    case 11:
      return (reader.readStringList(offset) ?? []) as P;
    case 12:
      return (reader.readBool(offset)) as P;
    case 13:
      return (reader.readBool(offset)) as P;
    case 14:
      return (reader.readBool(offset)) as P;
    case 15:
      return (reader.readLongOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension ModelCapabilitiesQueryFilter
    on QueryBuilder<ModelCapabilities, ModelCapabilities, QFilterCondition> {
  QueryBuilder<ModelCapabilities, ModelCapabilities, QAfterFilterCondition>
  contextWindowIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'contextWindow'),
      );
    });
  }

  QueryBuilder<ModelCapabilities, ModelCapabilities, QAfterFilterCondition>
  contextWindowIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'contextWindow'),
      );
    });
  }

  QueryBuilder<ModelCapabilities, ModelCapabilities, QAfterFilterCondition>
  contextWindowEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'contextWindow', value: value),
      );
    });
  }

  QueryBuilder<ModelCapabilities, ModelCapabilities, QAfterFilterCondition>
  contextWindowGreaterThan(int? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'contextWindow',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<ModelCapabilities, ModelCapabilities, QAfterFilterCondition>
  contextWindowLessThan(int? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'contextWindow',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<ModelCapabilities, ModelCapabilities, QAfterFilterCondition>
  contextWindowBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'contextWindow',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<ModelCapabilities, ModelCapabilities, QAfterFilterCondition>
  defaultDailyLimitIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'defaultDailyLimit'),
      );
    });
  }

  QueryBuilder<ModelCapabilities, ModelCapabilities, QAfterFilterCondition>
  defaultDailyLimitIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'defaultDailyLimit'),
      );
    });
  }

  QueryBuilder<ModelCapabilities, ModelCapabilities, QAfterFilterCondition>
  defaultDailyLimitEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'defaultDailyLimit', value: value),
      );
    });
  }

  QueryBuilder<ModelCapabilities, ModelCapabilities, QAfterFilterCondition>
  defaultDailyLimitGreaterThan(int? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'defaultDailyLimit',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<ModelCapabilities, ModelCapabilities, QAfterFilterCondition>
  defaultDailyLimitLessThan(int? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'defaultDailyLimit',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<ModelCapabilities, ModelCapabilities, QAfterFilterCondition>
  defaultDailyLimitBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'defaultDailyLimit',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<ModelCapabilities, ModelCapabilities, QAfterFilterCondition>
  defaultLimitIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'defaultLimit'),
      );
    });
  }

  QueryBuilder<ModelCapabilities, ModelCapabilities, QAfterFilterCondition>
  defaultLimitIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'defaultLimit'),
      );
    });
  }

  QueryBuilder<ModelCapabilities, ModelCapabilities, QAfterFilterCondition>
  defaultLimitEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'defaultLimit', value: value),
      );
    });
  }

  QueryBuilder<ModelCapabilities, ModelCapabilities, QAfterFilterCondition>
  defaultLimitGreaterThan(int? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'defaultLimit',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<ModelCapabilities, ModelCapabilities, QAfterFilterCondition>
  defaultLimitLessThan(int? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'defaultLimit',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<ModelCapabilities, ModelCapabilities, QAfterFilterCondition>
  defaultLimitBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'defaultLimit',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<ModelCapabilities, ModelCapabilities, QAfterFilterCondition>
  defaultPhrasesPerRequestIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'defaultPhrasesPerRequest'),
      );
    });
  }

  QueryBuilder<ModelCapabilities, ModelCapabilities, QAfterFilterCondition>
  defaultPhrasesPerRequestIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'defaultPhrasesPerRequest'),
      );
    });
  }

  QueryBuilder<ModelCapabilities, ModelCapabilities, QAfterFilterCondition>
  defaultPhrasesPerRequestEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'defaultPhrasesPerRequest',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<ModelCapabilities, ModelCapabilities, QAfterFilterCondition>
  defaultPhrasesPerRequestGreaterThan(int? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'defaultPhrasesPerRequest',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<ModelCapabilities, ModelCapabilities, QAfterFilterCondition>
  defaultPhrasesPerRequestLessThan(int? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'defaultPhrasesPerRequest',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<ModelCapabilities, ModelCapabilities, QAfterFilterCondition>
  defaultPhrasesPerRequestBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'defaultPhrasesPerRequest',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<ModelCapabilities, ModelCapabilities, QAfterFilterCondition>
  defaultStreamingIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'defaultStreaming'),
      );
    });
  }

  QueryBuilder<ModelCapabilities, ModelCapabilities, QAfterFilterCondition>
  defaultStreamingIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'defaultStreaming'),
      );
    });
  }

  QueryBuilder<ModelCapabilities, ModelCapabilities, QAfterFilterCondition>
  defaultStreamingEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'defaultStreaming', value: value),
      );
    });
  }

  QueryBuilder<ModelCapabilities, ModelCapabilities, QAfterFilterCondition>
  inputPricePerMTokIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'inputPricePerMTok'),
      );
    });
  }

  QueryBuilder<ModelCapabilities, ModelCapabilities, QAfterFilterCondition>
  inputPricePerMTokIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'inputPricePerMTok'),
      );
    });
  }

  QueryBuilder<ModelCapabilities, ModelCapabilities, QAfterFilterCondition>
  inputPricePerMTokEqualTo(double? value, {double epsilon = Query.epsilon}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'inputPricePerMTok',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<ModelCapabilities, ModelCapabilities, QAfterFilterCondition>
  inputPricePerMTokGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'inputPricePerMTok',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<ModelCapabilities, ModelCapabilities, QAfterFilterCondition>
  inputPricePerMTokLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'inputPricePerMTok',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<ModelCapabilities, ModelCapabilities, QAfterFilterCondition>
  inputPricePerMTokBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'inputPricePerMTok',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<ModelCapabilities, ModelCapabilities, QAfterFilterCondition>
  maxOutputTokensIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'maxOutputTokens'),
      );
    });
  }

  QueryBuilder<ModelCapabilities, ModelCapabilities, QAfterFilterCondition>
  maxOutputTokensIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'maxOutputTokens'),
      );
    });
  }

  QueryBuilder<ModelCapabilities, ModelCapabilities, QAfterFilterCondition>
  maxOutputTokensEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'maxOutputTokens', value: value),
      );
    });
  }

  QueryBuilder<ModelCapabilities, ModelCapabilities, QAfterFilterCondition>
  maxOutputTokensGreaterThan(int? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'maxOutputTokens',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<ModelCapabilities, ModelCapabilities, QAfterFilterCondition>
  maxOutputTokensLessThan(int? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'maxOutputTokens',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<ModelCapabilities, ModelCapabilities, QAfterFilterCondition>
  maxOutputTokensBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'maxOutputTokens',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<ModelCapabilities, ModelCapabilities, QAfterFilterCondition>
  outputPricePerMTokIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'outputPricePerMTok'),
      );
    });
  }

  QueryBuilder<ModelCapabilities, ModelCapabilities, QAfterFilterCondition>
  outputPricePerMTokIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'outputPricePerMTok'),
      );
    });
  }

  QueryBuilder<ModelCapabilities, ModelCapabilities, QAfterFilterCondition>
  outputPricePerMTokEqualTo(double? value, {double epsilon = Query.epsilon}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'outputPricePerMTok',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<ModelCapabilities, ModelCapabilities, QAfterFilterCondition>
  outputPricePerMTokGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'outputPricePerMTok',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<ModelCapabilities, ModelCapabilities, QAfterFilterCondition>
  outputPricePerMTokLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'outputPricePerMTok',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<ModelCapabilities, ModelCapabilities, QAfterFilterCondition>
  outputPricePerMTokBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'outputPricePerMTok',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<ModelCapabilities, ModelCapabilities, QAfterFilterCondition>
  qualityIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'quality'),
      );
    });
  }

  QueryBuilder<ModelCapabilities, ModelCapabilities, QAfterFilterCondition>
  qualityIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'quality'),
      );
    });
  }

  QueryBuilder<ModelCapabilities, ModelCapabilities, QAfterFilterCondition>
  qualityEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'quality', value: value),
      );
    });
  }

  QueryBuilder<ModelCapabilities, ModelCapabilities, QAfterFilterCondition>
  qualityGreaterThan(int? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'quality',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<ModelCapabilities, ModelCapabilities, QAfterFilterCondition>
  qualityLessThan(int? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'quality',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<ModelCapabilities, ModelCapabilities, QAfterFilterCondition>
  qualityBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'quality',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<ModelCapabilities, ModelCapabilities, QAfterFilterCondition>
  speedIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'speed'),
      );
    });
  }

  QueryBuilder<ModelCapabilities, ModelCapabilities, QAfterFilterCondition>
  speedIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'speed'),
      );
    });
  }

  QueryBuilder<ModelCapabilities, ModelCapabilities, QAfterFilterCondition>
  speedEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'speed', value: value),
      );
    });
  }

  QueryBuilder<ModelCapabilities, ModelCapabilities, QAfterFilterCondition>
  speedGreaterThan(int? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'speed',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<ModelCapabilities, ModelCapabilities, QAfterFilterCondition>
  speedLessThan(int? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'speed',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<ModelCapabilities, ModelCapabilities, QAfterFilterCondition>
  speedBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'speed',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<ModelCapabilities, ModelCapabilities, QAfterFilterCondition>
  supportedInputsElementEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'supportedInputs',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ModelCapabilities, ModelCapabilities, QAfterFilterCondition>
  supportedInputsElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'supportedInputs',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ModelCapabilities, ModelCapabilities, QAfterFilterCondition>
  supportedInputsElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'supportedInputs',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ModelCapabilities, ModelCapabilities, QAfterFilterCondition>
  supportedInputsElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'supportedInputs',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ModelCapabilities, ModelCapabilities, QAfterFilterCondition>
  supportedInputsElementStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'supportedInputs',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ModelCapabilities, ModelCapabilities, QAfterFilterCondition>
  supportedInputsElementEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'supportedInputs',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ModelCapabilities, ModelCapabilities, QAfterFilterCondition>
  supportedInputsElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'supportedInputs',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ModelCapabilities, ModelCapabilities, QAfterFilterCondition>
  supportedInputsElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'supportedInputs',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ModelCapabilities, ModelCapabilities, QAfterFilterCondition>
  supportedInputsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'supportedInputs', value: ''),
      );
    });
  }

  QueryBuilder<ModelCapabilities, ModelCapabilities, QAfterFilterCondition>
  supportedInputsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'supportedInputs', value: ''),
      );
    });
  }

  QueryBuilder<ModelCapabilities, ModelCapabilities, QAfterFilterCondition>
  supportedInputsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'supportedInputs', length, true, length, true);
    });
  }

  QueryBuilder<ModelCapabilities, ModelCapabilities, QAfterFilterCondition>
  supportedInputsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'supportedInputs', 0, true, 0, true);
    });
  }

  QueryBuilder<ModelCapabilities, ModelCapabilities, QAfterFilterCondition>
  supportedInputsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'supportedInputs', 0, false, 999999, true);
    });
  }

  QueryBuilder<ModelCapabilities, ModelCapabilities, QAfterFilterCondition>
  supportedInputsLengthLessThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'supportedInputs', 0, true, length, include);
    });
  }

  QueryBuilder<ModelCapabilities, ModelCapabilities, QAfterFilterCondition>
  supportedInputsLengthGreaterThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'supportedInputs',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<ModelCapabilities, ModelCapabilities, QAfterFilterCondition>
  supportedInputsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'supportedInputs',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<ModelCapabilities, ModelCapabilities, QAfterFilterCondition>
  supportedStepsElementEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'supportedSteps',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ModelCapabilities, ModelCapabilities, QAfterFilterCondition>
  supportedStepsElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'supportedSteps',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ModelCapabilities, ModelCapabilities, QAfterFilterCondition>
  supportedStepsElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'supportedSteps',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ModelCapabilities, ModelCapabilities, QAfterFilterCondition>
  supportedStepsElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'supportedSteps',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ModelCapabilities, ModelCapabilities, QAfterFilterCondition>
  supportedStepsElementStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'supportedSteps',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ModelCapabilities, ModelCapabilities, QAfterFilterCondition>
  supportedStepsElementEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'supportedSteps',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ModelCapabilities, ModelCapabilities, QAfterFilterCondition>
  supportedStepsElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'supportedSteps',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ModelCapabilities, ModelCapabilities, QAfterFilterCondition>
  supportedStepsElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'supportedSteps',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ModelCapabilities, ModelCapabilities, QAfterFilterCondition>
  supportedStepsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'supportedSteps', value: ''),
      );
    });
  }

  QueryBuilder<ModelCapabilities, ModelCapabilities, QAfterFilterCondition>
  supportedStepsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'supportedSteps', value: ''),
      );
    });
  }

  QueryBuilder<ModelCapabilities, ModelCapabilities, QAfterFilterCondition>
  supportedStepsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'supportedSteps', length, true, length, true);
    });
  }

  QueryBuilder<ModelCapabilities, ModelCapabilities, QAfterFilterCondition>
  supportedStepsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'supportedSteps', 0, true, 0, true);
    });
  }

  QueryBuilder<ModelCapabilities, ModelCapabilities, QAfterFilterCondition>
  supportedStepsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'supportedSteps', 0, false, 999999, true);
    });
  }

  QueryBuilder<ModelCapabilities, ModelCapabilities, QAfterFilterCondition>
  supportedStepsLengthLessThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'supportedSteps', 0, true, length, include);
    });
  }

  QueryBuilder<ModelCapabilities, ModelCapabilities, QAfterFilterCondition>
  supportedStepsLengthGreaterThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'supportedSteps', length, include, 999999, true);
    });
  }

  QueryBuilder<ModelCapabilities, ModelCapabilities, QAfterFilterCondition>
  supportedStepsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'supportedSteps',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<ModelCapabilities, ModelCapabilities, QAfterFilterCondition>
  supportsJsonModeEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'supportsJsonMode', value: value),
      );
    });
  }

  QueryBuilder<ModelCapabilities, ModelCapabilities, QAfterFilterCondition>
  supportsStreamingEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'supportsStreaming', value: value),
      );
    });
  }

  QueryBuilder<ModelCapabilities, ModelCapabilities, QAfterFilterCondition>
  supportsSystemPromptEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'supportsSystemPrompt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<ModelCapabilities, ModelCapabilities, QAfterFilterCondition>
  tpmLimitIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'tpmLimit'),
      );
    });
  }

  QueryBuilder<ModelCapabilities, ModelCapabilities, QAfterFilterCondition>
  tpmLimitIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'tpmLimit'),
      );
    });
  }

  QueryBuilder<ModelCapabilities, ModelCapabilities, QAfterFilterCondition>
  tpmLimitEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'tpmLimit', value: value),
      );
    });
  }

  QueryBuilder<ModelCapabilities, ModelCapabilities, QAfterFilterCondition>
  tpmLimitGreaterThan(int? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'tpmLimit',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<ModelCapabilities, ModelCapabilities, QAfterFilterCondition>
  tpmLimitLessThan(int? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'tpmLimit',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<ModelCapabilities, ModelCapabilities, QAfterFilterCondition>
  tpmLimitBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'tpmLimit',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }
}

extension ModelCapabilitiesQueryObject
    on QueryBuilder<ModelCapabilities, ModelCapabilities, QFilterCondition> {}

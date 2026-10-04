// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model_settings.dart';

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const ModelSettingsSchema = Schema(
  name: r'ModelSettings',
  id: -8178393047227522364,
  properties: {
    r'overrideDailyLimit': PropertySchema(
      id: 0,
      name: r'overrideDailyLimit',
      type: IsarType.long,
    ),
    r'overrideLimit': PropertySchema(
      id: 1,
      name: r'overrideLimit',
      type: IsarType.long,
    ),
    r'overridePhrasesPerRequest': PropertySchema(
      id: 2,
      name: r'overridePhrasesPerRequest',
      type: IsarType.long,
    ),
    r'overrideStreaming': PropertySchema(
      id: 3,
      name: r'overrideStreaming',
      type: IsarType.bool,
    ),
  },

  estimateSize: _modelSettingsEstimateSize,
  serialize: _modelSettingsSerialize,
  deserialize: _modelSettingsDeserialize,
  deserializeProp: _modelSettingsDeserializeProp,
);

int _modelSettingsEstimateSize(
  ModelSettings object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _modelSettingsSerialize(
  ModelSettings object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.overrideDailyLimit);
  writer.writeLong(offsets[1], object.overrideLimit);
  writer.writeLong(offsets[2], object.overridePhrasesPerRequest);
  writer.writeBool(offsets[3], object.overrideStreaming);
}

ModelSettings _modelSettingsDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ModelSettings();
  object.overrideDailyLimit = reader.readLongOrNull(offsets[0]);
  object.overrideLimit = reader.readLongOrNull(offsets[1]);
  object.overridePhrasesPerRequest = reader.readLongOrNull(offsets[2]);
  object.overrideStreaming = reader.readBoolOrNull(offsets[3]);
  return object;
}

P _modelSettingsDeserializeProp<P>(
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
      return (reader.readBoolOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension ModelSettingsQueryFilter
    on QueryBuilder<ModelSettings, ModelSettings, QFilterCondition> {
  QueryBuilder<ModelSettings, ModelSettings, QAfterFilterCondition>
  overrideDailyLimitIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'overrideDailyLimit'),
      );
    });
  }

  QueryBuilder<ModelSettings, ModelSettings, QAfterFilterCondition>
  overrideDailyLimitIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'overrideDailyLimit'),
      );
    });
  }

  QueryBuilder<ModelSettings, ModelSettings, QAfterFilterCondition>
  overrideDailyLimitEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'overrideDailyLimit', value: value),
      );
    });
  }

  QueryBuilder<ModelSettings, ModelSettings, QAfterFilterCondition>
  overrideDailyLimitGreaterThan(int? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'overrideDailyLimit',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<ModelSettings, ModelSettings, QAfterFilterCondition>
  overrideDailyLimitLessThan(int? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'overrideDailyLimit',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<ModelSettings, ModelSettings, QAfterFilterCondition>
  overrideDailyLimitBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'overrideDailyLimit',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<ModelSettings, ModelSettings, QAfterFilterCondition>
  overrideLimitIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'overrideLimit'),
      );
    });
  }

  QueryBuilder<ModelSettings, ModelSettings, QAfterFilterCondition>
  overrideLimitIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'overrideLimit'),
      );
    });
  }

  QueryBuilder<ModelSettings, ModelSettings, QAfterFilterCondition>
  overrideLimitEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'overrideLimit', value: value),
      );
    });
  }

  QueryBuilder<ModelSettings, ModelSettings, QAfterFilterCondition>
  overrideLimitGreaterThan(int? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'overrideLimit',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<ModelSettings, ModelSettings, QAfterFilterCondition>
  overrideLimitLessThan(int? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'overrideLimit',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<ModelSettings, ModelSettings, QAfterFilterCondition>
  overrideLimitBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'overrideLimit',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<ModelSettings, ModelSettings, QAfterFilterCondition>
  overridePhrasesPerRequestIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'overridePhrasesPerRequest'),
      );
    });
  }

  QueryBuilder<ModelSettings, ModelSettings, QAfterFilterCondition>
  overridePhrasesPerRequestIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'overridePhrasesPerRequest'),
      );
    });
  }

  QueryBuilder<ModelSettings, ModelSettings, QAfterFilterCondition>
  overridePhrasesPerRequestEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'overridePhrasesPerRequest',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<ModelSettings, ModelSettings, QAfterFilterCondition>
  overridePhrasesPerRequestGreaterThan(int? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'overridePhrasesPerRequest',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<ModelSettings, ModelSettings, QAfterFilterCondition>
  overridePhrasesPerRequestLessThan(int? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'overridePhrasesPerRequest',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<ModelSettings, ModelSettings, QAfterFilterCondition>
  overridePhrasesPerRequestBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'overridePhrasesPerRequest',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<ModelSettings, ModelSettings, QAfterFilterCondition>
  overrideStreamingIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'overrideStreaming'),
      );
    });
  }

  QueryBuilder<ModelSettings, ModelSettings, QAfterFilterCondition>
  overrideStreamingIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'overrideStreaming'),
      );
    });
  }

  QueryBuilder<ModelSettings, ModelSettings, QAfterFilterCondition>
  overrideStreamingEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'overrideStreaming', value: value),
      );
    });
  }
}

extension ModelSettingsQueryObject
    on QueryBuilder<ModelSettings, ModelSettings, QFilterCondition> {}

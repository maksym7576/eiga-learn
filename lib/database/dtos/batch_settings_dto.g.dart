// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'batch_settings_dto.dart';

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const BatchSettingsDtoSchema = Schema(
  name: r'BatchSettingsDto',
  id: -1132756726597362634,
  properties: {
    r'audioChunkDurationMinutes': PropertySchema(
      id: 0,
      name: r'audioChunkDurationMinutes',
      type: IsarType.long,
    ),
    r'autoTranslateOnImport': PropertySchema(
      id: 1,
      name: r'autoTranslateOnImport',
      type: IsarType.bool,
    ),
    r'batchSizeGrammarRole': PropertySchema(
      id: 2,
      name: r'batchSizeGrammarRole',
      type: IsarType.long,
    ),
    r'batchSizeMorphemes': PropertySchema(
      id: 3,
      name: r'batchSizeMorphemes',
      type: IsarType.long,
    ),
    r'batchSizeTokenize': PropertySchema(
      id: 4,
      name: r'batchSizeTokenize',
      type: IsarType.long,
    ),
    r'batchSizeTranslate': PropertySchema(
      id: 5,
      name: r'batchSizeTranslate',
      type: IsarType.long,
    ),
    r'numberOfPhrases': PropertySchema(
      id: 6,
      name: r'numberOfPhrases',
      type: IsarType.long,
    ),
    r'transcriptionOverlapSeconds': PropertySchema(
      id: 7,
      name: r'transcriptionOverlapSeconds',
      type: IsarType.long,
    ),
  },

  estimateSize: _batchSettingsDtoEstimateSize,
  serialize: _batchSettingsDtoSerialize,
  deserialize: _batchSettingsDtoDeserialize,
  deserializeProp: _batchSettingsDtoDeserializeProp,
);

int _batchSettingsDtoEstimateSize(
  BatchSettingsDto object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _batchSettingsDtoSerialize(
  BatchSettingsDto object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.audioChunkDurationMinutes);
  writer.writeBool(offsets[1], object.autoTranslateOnImport);
  writer.writeLong(offsets[2], object.batchSizeGrammarRole);
  writer.writeLong(offsets[3], object.batchSizeMorphemes);
  writer.writeLong(offsets[4], object.batchSizeTokenize);
  writer.writeLong(offsets[5], object.batchSizeTranslate);
  writer.writeLong(offsets[6], object.numberOfPhrases);
  writer.writeLong(offsets[7], object.transcriptionOverlapSeconds);
}

BatchSettingsDto _batchSettingsDtoDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = BatchSettingsDto();
  object.audioChunkDurationMinutes = reader.readLong(offsets[0]);
  object.autoTranslateOnImport = reader.readBool(offsets[1]);
  object.batchSizeGrammarRole = reader.readLong(offsets[2]);
  object.batchSizeMorphemes = reader.readLong(offsets[3]);
  object.batchSizeTokenize = reader.readLong(offsets[4]);
  object.batchSizeTranslate = reader.readLong(offsets[5]);
  object.numberOfPhrases = reader.readLong(offsets[6]);
  object.transcriptionOverlapSeconds = reader.readLong(offsets[7]);
  return object;
}

P _batchSettingsDtoDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLong(offset)) as P;
    case 1:
      return (reader.readBool(offset)) as P;
    case 2:
      return (reader.readLong(offset)) as P;
    case 3:
      return (reader.readLong(offset)) as P;
    case 4:
      return (reader.readLong(offset)) as P;
    case 5:
      return (reader.readLong(offset)) as P;
    case 6:
      return (reader.readLong(offset)) as P;
    case 7:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension BatchSettingsDtoQueryFilter
    on QueryBuilder<BatchSettingsDto, BatchSettingsDto, QFilterCondition> {
  QueryBuilder<BatchSettingsDto, BatchSettingsDto, QAfterFilterCondition>
  audioChunkDurationMinutesEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'audioChunkDurationMinutes',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<BatchSettingsDto, BatchSettingsDto, QAfterFilterCondition>
  audioChunkDurationMinutesGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'audioChunkDurationMinutes',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<BatchSettingsDto, BatchSettingsDto, QAfterFilterCondition>
  audioChunkDurationMinutesLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'audioChunkDurationMinutes',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<BatchSettingsDto, BatchSettingsDto, QAfterFilterCondition>
  audioChunkDurationMinutesBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'audioChunkDurationMinutes',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<BatchSettingsDto, BatchSettingsDto, QAfterFilterCondition>
  autoTranslateOnImportEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'autoTranslateOnImport',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<BatchSettingsDto, BatchSettingsDto, QAfterFilterCondition>
  batchSizeGrammarRoleEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'batchSizeGrammarRole',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<BatchSettingsDto, BatchSettingsDto, QAfterFilterCondition>
  batchSizeGrammarRoleGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'batchSizeGrammarRole',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<BatchSettingsDto, BatchSettingsDto, QAfterFilterCondition>
  batchSizeGrammarRoleLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'batchSizeGrammarRole',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<BatchSettingsDto, BatchSettingsDto, QAfterFilterCondition>
  batchSizeGrammarRoleBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'batchSizeGrammarRole',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<BatchSettingsDto, BatchSettingsDto, QAfterFilterCondition>
  batchSizeMorphemesEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'batchSizeMorphemes', value: value),
      );
    });
  }

  QueryBuilder<BatchSettingsDto, BatchSettingsDto, QAfterFilterCondition>
  batchSizeMorphemesGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'batchSizeMorphemes',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<BatchSettingsDto, BatchSettingsDto, QAfterFilterCondition>
  batchSizeMorphemesLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'batchSizeMorphemes',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<BatchSettingsDto, BatchSettingsDto, QAfterFilterCondition>
  batchSizeMorphemesBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'batchSizeMorphemes',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<BatchSettingsDto, BatchSettingsDto, QAfterFilterCondition>
  batchSizeTokenizeEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'batchSizeTokenize', value: value),
      );
    });
  }

  QueryBuilder<BatchSettingsDto, BatchSettingsDto, QAfterFilterCondition>
  batchSizeTokenizeGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'batchSizeTokenize',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<BatchSettingsDto, BatchSettingsDto, QAfterFilterCondition>
  batchSizeTokenizeLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'batchSizeTokenize',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<BatchSettingsDto, BatchSettingsDto, QAfterFilterCondition>
  batchSizeTokenizeBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'batchSizeTokenize',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<BatchSettingsDto, BatchSettingsDto, QAfterFilterCondition>
  batchSizeTranslateEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'batchSizeTranslate', value: value),
      );
    });
  }

  QueryBuilder<BatchSettingsDto, BatchSettingsDto, QAfterFilterCondition>
  batchSizeTranslateGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'batchSizeTranslate',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<BatchSettingsDto, BatchSettingsDto, QAfterFilterCondition>
  batchSizeTranslateLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'batchSizeTranslate',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<BatchSettingsDto, BatchSettingsDto, QAfterFilterCondition>
  batchSizeTranslateBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'batchSizeTranslate',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<BatchSettingsDto, BatchSettingsDto, QAfterFilterCondition>
  numberOfPhrasesEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'numberOfPhrases', value: value),
      );
    });
  }

  QueryBuilder<BatchSettingsDto, BatchSettingsDto, QAfterFilterCondition>
  numberOfPhrasesGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'numberOfPhrases',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<BatchSettingsDto, BatchSettingsDto, QAfterFilterCondition>
  numberOfPhrasesLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'numberOfPhrases',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<BatchSettingsDto, BatchSettingsDto, QAfterFilterCondition>
  numberOfPhrasesBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'numberOfPhrases',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<BatchSettingsDto, BatchSettingsDto, QAfterFilterCondition>
  transcriptionOverlapSecondsEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'transcriptionOverlapSeconds',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<BatchSettingsDto, BatchSettingsDto, QAfterFilterCondition>
  transcriptionOverlapSecondsGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'transcriptionOverlapSeconds',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<BatchSettingsDto, BatchSettingsDto, QAfterFilterCondition>
  transcriptionOverlapSecondsLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'transcriptionOverlapSeconds',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<BatchSettingsDto, BatchSettingsDto, QAfterFilterCondition>
  transcriptionOverlapSecondsBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'transcriptionOverlapSeconds',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }
}

extension BatchSettingsDtoQueryObject
    on QueryBuilder<BatchSettingsDto, BatchSettingsDto, QFilterCondition> {}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subtitle_processing_config_dto.dart';

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const SubtitleProcessingConfigDtoSchema = Schema(
  name: r'SubtitleProcessingConfigDto',
  id: 3741964455916350103,
  properties: {
    r'isSupported': PropertySchema(
      id: 0,
      name: r'isSupported',
      type: IsarType.bool,
    ),
    r'readingLabels': PropertySchema(
      id: 1,
      name: r'readingLabels',
      type: IsarType.stringList,
    ),
    r'readingOptions': PropertySchema(
      id: 2,
      name: r'readingOptions',
      type: IsarType.stringList,
    ),
    r'removeAllSpaces': PropertySchema(
      id: 3,
      name: r'removeAllSpaces',
      type: IsarType.bool,
    ),
    r'spacingOptions': PropertySchema(
      id: 4,
      name: r'spacingOptions',
      type: IsarType.stringList,
    ),
    r'tokenizeWithAi': PropertySchema(
      id: 5,
      name: r'tokenizeWithAi',
      type: IsarType.bool,
    ),
  },

  estimateSize: _subtitleProcessingConfigDtoEstimateSize,
  serialize: _subtitleProcessingConfigDtoSerialize,
  deserialize: _subtitleProcessingConfigDtoDeserialize,
  deserializeProp: _subtitleProcessingConfigDtoDeserializeProp,
);

int _subtitleProcessingConfigDtoEstimateSize(
  SubtitleProcessingConfigDto object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.readingLabels.length * 3;
  {
    for (var i = 0; i < object.readingLabels.length; i++) {
      final value = object.readingLabels[i];
      bytesCount += value.length * 3;
    }
  }
  bytesCount += 3 + object.readingOptions.length * 3;
  {
    for (var i = 0; i < object.readingOptions.length; i++) {
      final value = object.readingOptions[i];
      bytesCount += value.length * 3;
    }
  }
  bytesCount += 3 + object.spacingOptions.length * 3;
  {
    for (var i = 0; i < object.spacingOptions.length; i++) {
      final value = object.spacingOptions[i];
      bytesCount += value.length * 3;
    }
  }
  return bytesCount;
}

void _subtitleProcessingConfigDtoSerialize(
  SubtitleProcessingConfigDto object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeBool(offsets[0], object.isSupported);
  writer.writeStringList(offsets[1], object.readingLabels);
  writer.writeStringList(offsets[2], object.readingOptions);
  writer.writeBool(offsets[3], object.removeAllSpaces);
  writer.writeStringList(offsets[4], object.spacingOptions);
  writer.writeBool(offsets[5], object.tokenizeWithAi);
}

SubtitleProcessingConfigDto _subtitleProcessingConfigDtoDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = SubtitleProcessingConfigDto();
  object.isSupported = reader.readBool(offsets[0]);
  object.readingLabels = reader.readStringList(offsets[1]) ?? [];
  object.readingOptions = reader.readStringList(offsets[2]) ?? [];
  object.removeAllSpaces = reader.readBool(offsets[3]);
  object.spacingOptions = reader.readStringList(offsets[4]) ?? [];
  object.tokenizeWithAi = reader.readBool(offsets[5]);
  return object;
}

P _subtitleProcessingConfigDtoDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readBool(offset)) as P;
    case 1:
      return (reader.readStringList(offset) ?? []) as P;
    case 2:
      return (reader.readStringList(offset) ?? []) as P;
    case 3:
      return (reader.readBool(offset)) as P;
    case 4:
      return (reader.readStringList(offset) ?? []) as P;
    case 5:
      return (reader.readBool(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension SubtitleProcessingConfigDtoQueryFilter
    on
        QueryBuilder<
          SubtitleProcessingConfigDto,
          SubtitleProcessingConfigDto,
          QFilterCondition
        > {
  QueryBuilder<
    SubtitleProcessingConfigDto,
    SubtitleProcessingConfigDto,
    QAfterFilterCondition
  >
  isSupportedEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'isSupported', value: value),
      );
    });
  }

  QueryBuilder<
    SubtitleProcessingConfigDto,
    SubtitleProcessingConfigDto,
    QAfterFilterCondition
  >
  readingLabelsElementEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'readingLabels',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    SubtitleProcessingConfigDto,
    SubtitleProcessingConfigDto,
    QAfterFilterCondition
  >
  readingLabelsElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'readingLabels',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    SubtitleProcessingConfigDto,
    SubtitleProcessingConfigDto,
    QAfterFilterCondition
  >
  readingLabelsElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'readingLabels',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    SubtitleProcessingConfigDto,
    SubtitleProcessingConfigDto,
    QAfterFilterCondition
  >
  readingLabelsElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'readingLabels',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    SubtitleProcessingConfigDto,
    SubtitleProcessingConfigDto,
    QAfterFilterCondition
  >
  readingLabelsElementStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'readingLabels',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    SubtitleProcessingConfigDto,
    SubtitleProcessingConfigDto,
    QAfterFilterCondition
  >
  readingLabelsElementEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'readingLabels',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    SubtitleProcessingConfigDto,
    SubtitleProcessingConfigDto,
    QAfterFilterCondition
  >
  readingLabelsElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'readingLabels',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    SubtitleProcessingConfigDto,
    SubtitleProcessingConfigDto,
    QAfterFilterCondition
  >
  readingLabelsElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'readingLabels',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    SubtitleProcessingConfigDto,
    SubtitleProcessingConfigDto,
    QAfterFilterCondition
  >
  readingLabelsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'readingLabels', value: ''),
      );
    });
  }

  QueryBuilder<
    SubtitleProcessingConfigDto,
    SubtitleProcessingConfigDto,
    QAfterFilterCondition
  >
  readingLabelsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'readingLabels', value: ''),
      );
    });
  }

  QueryBuilder<
    SubtitleProcessingConfigDto,
    SubtitleProcessingConfigDto,
    QAfterFilterCondition
  >
  readingLabelsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'readingLabels', length, true, length, true);
    });
  }

  QueryBuilder<
    SubtitleProcessingConfigDto,
    SubtitleProcessingConfigDto,
    QAfterFilterCondition
  >
  readingLabelsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'readingLabels', 0, true, 0, true);
    });
  }

  QueryBuilder<
    SubtitleProcessingConfigDto,
    SubtitleProcessingConfigDto,
    QAfterFilterCondition
  >
  readingLabelsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'readingLabels', 0, false, 999999, true);
    });
  }

  QueryBuilder<
    SubtitleProcessingConfigDto,
    SubtitleProcessingConfigDto,
    QAfterFilterCondition
  >
  readingLabelsLengthLessThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'readingLabels', 0, true, length, include);
    });
  }

  QueryBuilder<
    SubtitleProcessingConfigDto,
    SubtitleProcessingConfigDto,
    QAfterFilterCondition
  >
  readingLabelsLengthGreaterThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'readingLabels', length, include, 999999, true);
    });
  }

  QueryBuilder<
    SubtitleProcessingConfigDto,
    SubtitleProcessingConfigDto,
    QAfterFilterCondition
  >
  readingLabelsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'readingLabels',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<
    SubtitleProcessingConfigDto,
    SubtitleProcessingConfigDto,
    QAfterFilterCondition
  >
  readingOptionsElementEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'readingOptions',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    SubtitleProcessingConfigDto,
    SubtitleProcessingConfigDto,
    QAfterFilterCondition
  >
  readingOptionsElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'readingOptions',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    SubtitleProcessingConfigDto,
    SubtitleProcessingConfigDto,
    QAfterFilterCondition
  >
  readingOptionsElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'readingOptions',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    SubtitleProcessingConfigDto,
    SubtitleProcessingConfigDto,
    QAfterFilterCondition
  >
  readingOptionsElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'readingOptions',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    SubtitleProcessingConfigDto,
    SubtitleProcessingConfigDto,
    QAfterFilterCondition
  >
  readingOptionsElementStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'readingOptions',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    SubtitleProcessingConfigDto,
    SubtitleProcessingConfigDto,
    QAfterFilterCondition
  >
  readingOptionsElementEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'readingOptions',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    SubtitleProcessingConfigDto,
    SubtitleProcessingConfigDto,
    QAfterFilterCondition
  >
  readingOptionsElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'readingOptions',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    SubtitleProcessingConfigDto,
    SubtitleProcessingConfigDto,
    QAfterFilterCondition
  >
  readingOptionsElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'readingOptions',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    SubtitleProcessingConfigDto,
    SubtitleProcessingConfigDto,
    QAfterFilterCondition
  >
  readingOptionsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'readingOptions', value: ''),
      );
    });
  }

  QueryBuilder<
    SubtitleProcessingConfigDto,
    SubtitleProcessingConfigDto,
    QAfterFilterCondition
  >
  readingOptionsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'readingOptions', value: ''),
      );
    });
  }

  QueryBuilder<
    SubtitleProcessingConfigDto,
    SubtitleProcessingConfigDto,
    QAfterFilterCondition
  >
  readingOptionsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'readingOptions', length, true, length, true);
    });
  }

  QueryBuilder<
    SubtitleProcessingConfigDto,
    SubtitleProcessingConfigDto,
    QAfterFilterCondition
  >
  readingOptionsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'readingOptions', 0, true, 0, true);
    });
  }

  QueryBuilder<
    SubtitleProcessingConfigDto,
    SubtitleProcessingConfigDto,
    QAfterFilterCondition
  >
  readingOptionsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'readingOptions', 0, false, 999999, true);
    });
  }

  QueryBuilder<
    SubtitleProcessingConfigDto,
    SubtitleProcessingConfigDto,
    QAfterFilterCondition
  >
  readingOptionsLengthLessThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'readingOptions', 0, true, length, include);
    });
  }

  QueryBuilder<
    SubtitleProcessingConfigDto,
    SubtitleProcessingConfigDto,
    QAfterFilterCondition
  >
  readingOptionsLengthGreaterThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'readingOptions', length, include, 999999, true);
    });
  }

  QueryBuilder<
    SubtitleProcessingConfigDto,
    SubtitleProcessingConfigDto,
    QAfterFilterCondition
  >
  readingOptionsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'readingOptions',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<
    SubtitleProcessingConfigDto,
    SubtitleProcessingConfigDto,
    QAfterFilterCondition
  >
  removeAllSpacesEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'removeAllSpaces', value: value),
      );
    });
  }

  QueryBuilder<
    SubtitleProcessingConfigDto,
    SubtitleProcessingConfigDto,
    QAfterFilterCondition
  >
  spacingOptionsElementEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'spacingOptions',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    SubtitleProcessingConfigDto,
    SubtitleProcessingConfigDto,
    QAfterFilterCondition
  >
  spacingOptionsElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'spacingOptions',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    SubtitleProcessingConfigDto,
    SubtitleProcessingConfigDto,
    QAfterFilterCondition
  >
  spacingOptionsElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'spacingOptions',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    SubtitleProcessingConfigDto,
    SubtitleProcessingConfigDto,
    QAfterFilterCondition
  >
  spacingOptionsElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'spacingOptions',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    SubtitleProcessingConfigDto,
    SubtitleProcessingConfigDto,
    QAfterFilterCondition
  >
  spacingOptionsElementStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'spacingOptions',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    SubtitleProcessingConfigDto,
    SubtitleProcessingConfigDto,
    QAfterFilterCondition
  >
  spacingOptionsElementEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'spacingOptions',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    SubtitleProcessingConfigDto,
    SubtitleProcessingConfigDto,
    QAfterFilterCondition
  >
  spacingOptionsElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'spacingOptions',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    SubtitleProcessingConfigDto,
    SubtitleProcessingConfigDto,
    QAfterFilterCondition
  >
  spacingOptionsElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'spacingOptions',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    SubtitleProcessingConfigDto,
    SubtitleProcessingConfigDto,
    QAfterFilterCondition
  >
  spacingOptionsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'spacingOptions', value: ''),
      );
    });
  }

  QueryBuilder<
    SubtitleProcessingConfigDto,
    SubtitleProcessingConfigDto,
    QAfterFilterCondition
  >
  spacingOptionsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'spacingOptions', value: ''),
      );
    });
  }

  QueryBuilder<
    SubtitleProcessingConfigDto,
    SubtitleProcessingConfigDto,
    QAfterFilterCondition
  >
  spacingOptionsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'spacingOptions', length, true, length, true);
    });
  }

  QueryBuilder<
    SubtitleProcessingConfigDto,
    SubtitleProcessingConfigDto,
    QAfterFilterCondition
  >
  spacingOptionsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'spacingOptions', 0, true, 0, true);
    });
  }

  QueryBuilder<
    SubtitleProcessingConfigDto,
    SubtitleProcessingConfigDto,
    QAfterFilterCondition
  >
  spacingOptionsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'spacingOptions', 0, false, 999999, true);
    });
  }

  QueryBuilder<
    SubtitleProcessingConfigDto,
    SubtitleProcessingConfigDto,
    QAfterFilterCondition
  >
  spacingOptionsLengthLessThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'spacingOptions', 0, true, length, include);
    });
  }

  QueryBuilder<
    SubtitleProcessingConfigDto,
    SubtitleProcessingConfigDto,
    QAfterFilterCondition
  >
  spacingOptionsLengthGreaterThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'spacingOptions', length, include, 999999, true);
    });
  }

  QueryBuilder<
    SubtitleProcessingConfigDto,
    SubtitleProcessingConfigDto,
    QAfterFilterCondition
  >
  spacingOptionsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'spacingOptions',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<
    SubtitleProcessingConfigDto,
    SubtitleProcessingConfigDto,
    QAfterFilterCondition
  >
  tokenizeWithAiEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'tokenizeWithAi', value: value),
      );
    });
  }
}

extension SubtitleProcessingConfigDtoQueryObject
    on
        QueryBuilder<
          SubtitleProcessingConfigDto,
          SubtitleProcessingConfigDto,
          QFilterCondition
        > {}

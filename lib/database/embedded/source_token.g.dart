// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'source_token.dart';

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const SourceTokenSchema = Schema(
  name: r'SourceToken',
  id: 3681728974343149326,
  properties: {
    r'grammarCode': PropertySchema(
      id: 0,
      name: r'grammarCode',
      type: IsarType.string,
    ),
    r'isPunct': PropertySchema(id: 1, name: r'isPunct', type: IsarType.bool),
    r'lemmaKey': PropertySchema(
      id: 2,
      name: r'lemmaKey',
      type: IsarType.string,
    ),
    r'meaning': PropertySchema(id: 3, name: r'meaning', type: IsarType.string),
    r'pos': PropertySchema(id: 4, name: r'pos', type: IsarType.long),
    r'posTag': PropertySchema(id: 5, name: r'posTag', type: IsarType.string),
    r'role': PropertySchema(id: 6, name: r'role', type: IsarType.string),
    r'versions': PropertySchema(
      id: 7,
      name: r'versions',
      type: IsarType.objectList,

      target: r'ReadingItem',
    ),
    r'wordId': PropertySchema(id: 8, name: r'wordId', type: IsarType.string),
  },

  estimateSize: _sourceTokenEstimateSize,
  serialize: _sourceTokenSerialize,
  deserialize: _sourceTokenDeserialize,
  deserializeProp: _sourceTokenDeserializeProp,
);

int _sourceTokenEstimateSize(
  SourceToken object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.grammarCode;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.lemmaKey;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.meaning;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.posTag;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.role;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
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
  {
    final value = object.wordId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _sourceTokenSerialize(
  SourceToken object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.grammarCode);
  writer.writeBool(offsets[1], object.isPunct);
  writer.writeString(offsets[2], object.lemmaKey);
  writer.writeString(offsets[3], object.meaning);
  writer.writeLong(offsets[4], object.pos);
  writer.writeString(offsets[5], object.posTag);
  writer.writeString(offsets[6], object.role);
  writer.writeObjectList<ReadingItem>(
    offsets[7],
    allOffsets,
    ReadingItemSchema.serialize,
    object.versions,
  );
  writer.writeString(offsets[8], object.wordId);
}

SourceToken _sourceTokenDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = SourceToken();
  object.grammarCode = reader.readStringOrNull(offsets[0]);
  object.isPunct = reader.readBool(offsets[1]);
  object.lemmaKey = reader.readStringOrNull(offsets[2]);
  object.meaning = reader.readStringOrNull(offsets[3]);
  object.pos = reader.readLongOrNull(offsets[4]);
  object.posTag = reader.readStringOrNull(offsets[5]);
  object.role = reader.readStringOrNull(offsets[6]);
  object.versions =
      reader.readObjectList<ReadingItem>(
        offsets[7],
        ReadingItemSchema.deserialize,
        allOffsets,
        ReadingItem(),
      ) ??
      [];
  object.wordId = reader.readStringOrNull(offsets[8]);
  return object;
}

P _sourceTokenDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readBool(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readLongOrNull(offset)) as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    case 6:
      return (reader.readStringOrNull(offset)) as P;
    case 7:
      return (reader.readObjectList<ReadingItem>(
                offset,
                ReadingItemSchema.deserialize,
                allOffsets,
                ReadingItem(),
              ) ??
              [])
          as P;
    case 8:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension SourceTokenQueryFilter
    on QueryBuilder<SourceToken, SourceToken, QFilterCondition> {
  QueryBuilder<SourceToken, SourceToken, QAfterFilterCondition>
  grammarCodeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'grammarCode'),
      );
    });
  }

  QueryBuilder<SourceToken, SourceToken, QAfterFilterCondition>
  grammarCodeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'grammarCode'),
      );
    });
  }

  QueryBuilder<SourceToken, SourceToken, QAfterFilterCondition>
  grammarCodeEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'grammarCode',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SourceToken, SourceToken, QAfterFilterCondition>
  grammarCodeGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'grammarCode',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SourceToken, SourceToken, QAfterFilterCondition>
  grammarCodeLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'grammarCode',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SourceToken, SourceToken, QAfterFilterCondition>
  grammarCodeBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'grammarCode',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SourceToken, SourceToken, QAfterFilterCondition>
  grammarCodeStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'grammarCode',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SourceToken, SourceToken, QAfterFilterCondition>
  grammarCodeEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'grammarCode',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SourceToken, SourceToken, QAfterFilterCondition>
  grammarCodeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'grammarCode',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SourceToken, SourceToken, QAfterFilterCondition>
  grammarCodeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'grammarCode',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SourceToken, SourceToken, QAfterFilterCondition>
  grammarCodeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'grammarCode', value: ''),
      );
    });
  }

  QueryBuilder<SourceToken, SourceToken, QAfterFilterCondition>
  grammarCodeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'grammarCode', value: ''),
      );
    });
  }

  QueryBuilder<SourceToken, SourceToken, QAfterFilterCondition> isPunctEqualTo(
    bool value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'isPunct', value: value),
      );
    });
  }

  QueryBuilder<SourceToken, SourceToken, QAfterFilterCondition>
  lemmaKeyIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'lemmaKey'),
      );
    });
  }

  QueryBuilder<SourceToken, SourceToken, QAfterFilterCondition>
  lemmaKeyIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'lemmaKey'),
      );
    });
  }

  QueryBuilder<SourceToken, SourceToken, QAfterFilterCondition> lemmaKeyEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'lemmaKey',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SourceToken, SourceToken, QAfterFilterCondition>
  lemmaKeyGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'lemmaKey',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SourceToken, SourceToken, QAfterFilterCondition>
  lemmaKeyLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'lemmaKey',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SourceToken, SourceToken, QAfterFilterCondition> lemmaKeyBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'lemmaKey',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SourceToken, SourceToken, QAfterFilterCondition>
  lemmaKeyStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'lemmaKey',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SourceToken, SourceToken, QAfterFilterCondition>
  lemmaKeyEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'lemmaKey',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SourceToken, SourceToken, QAfterFilterCondition>
  lemmaKeyContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'lemmaKey',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SourceToken, SourceToken, QAfterFilterCondition> lemmaKeyMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'lemmaKey',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SourceToken, SourceToken, QAfterFilterCondition>
  lemmaKeyIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'lemmaKey', value: ''),
      );
    });
  }

  QueryBuilder<SourceToken, SourceToken, QAfterFilterCondition>
  lemmaKeyIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'lemmaKey', value: ''),
      );
    });
  }

  QueryBuilder<SourceToken, SourceToken, QAfterFilterCondition>
  meaningIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'meaning'),
      );
    });
  }

  QueryBuilder<SourceToken, SourceToken, QAfterFilterCondition>
  meaningIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'meaning'),
      );
    });
  }

  QueryBuilder<SourceToken, SourceToken, QAfterFilterCondition> meaningEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'meaning',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SourceToken, SourceToken, QAfterFilterCondition>
  meaningGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'meaning',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SourceToken, SourceToken, QAfterFilterCondition> meaningLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'meaning',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SourceToken, SourceToken, QAfterFilterCondition> meaningBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'meaning',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SourceToken, SourceToken, QAfterFilterCondition>
  meaningStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'meaning',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SourceToken, SourceToken, QAfterFilterCondition> meaningEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'meaning',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SourceToken, SourceToken, QAfterFilterCondition> meaningContains(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'meaning',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SourceToken, SourceToken, QAfterFilterCondition> meaningMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'meaning',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SourceToken, SourceToken, QAfterFilterCondition>
  meaningIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'meaning', value: ''),
      );
    });
  }

  QueryBuilder<SourceToken, SourceToken, QAfterFilterCondition>
  meaningIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'meaning', value: ''),
      );
    });
  }

  QueryBuilder<SourceToken, SourceToken, QAfterFilterCondition> posIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'pos'),
      );
    });
  }

  QueryBuilder<SourceToken, SourceToken, QAfterFilterCondition> posIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'pos'),
      );
    });
  }

  QueryBuilder<SourceToken, SourceToken, QAfterFilterCondition> posEqualTo(
    int? value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'pos', value: value),
      );
    });
  }

  QueryBuilder<SourceToken, SourceToken, QAfterFilterCondition> posGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'pos',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<SourceToken, SourceToken, QAfterFilterCondition> posLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'pos',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<SourceToken, SourceToken, QAfterFilterCondition> posBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'pos',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<SourceToken, SourceToken, QAfterFilterCondition> posTagIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'posTag'),
      );
    });
  }

  QueryBuilder<SourceToken, SourceToken, QAfterFilterCondition>
  posTagIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'posTag'),
      );
    });
  }

  QueryBuilder<SourceToken, SourceToken, QAfterFilterCondition> posTagEqualTo(
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

  QueryBuilder<SourceToken, SourceToken, QAfterFilterCondition>
  posTagGreaterThan(
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

  QueryBuilder<SourceToken, SourceToken, QAfterFilterCondition> posTagLessThan(
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

  QueryBuilder<SourceToken, SourceToken, QAfterFilterCondition> posTagBetween(
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

  QueryBuilder<SourceToken, SourceToken, QAfterFilterCondition>
  posTagStartsWith(String value, {bool caseSensitive = true}) {
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

  QueryBuilder<SourceToken, SourceToken, QAfterFilterCondition> posTagEndsWith(
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

  QueryBuilder<SourceToken, SourceToken, QAfterFilterCondition> posTagContains(
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

  QueryBuilder<SourceToken, SourceToken, QAfterFilterCondition> posTagMatches(
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

  QueryBuilder<SourceToken, SourceToken, QAfterFilterCondition>
  posTagIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'posTag', value: ''),
      );
    });
  }

  QueryBuilder<SourceToken, SourceToken, QAfterFilterCondition>
  posTagIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'posTag', value: ''),
      );
    });
  }

  QueryBuilder<SourceToken, SourceToken, QAfterFilterCondition> roleIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'role'),
      );
    });
  }

  QueryBuilder<SourceToken, SourceToken, QAfterFilterCondition>
  roleIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'role'),
      );
    });
  }

  QueryBuilder<SourceToken, SourceToken, QAfterFilterCondition> roleEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'role',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SourceToken, SourceToken, QAfterFilterCondition> roleGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'role',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SourceToken, SourceToken, QAfterFilterCondition> roleLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'role',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SourceToken, SourceToken, QAfterFilterCondition> roleBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'role',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SourceToken, SourceToken, QAfterFilterCondition> roleStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'role',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SourceToken, SourceToken, QAfterFilterCondition> roleEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'role',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SourceToken, SourceToken, QAfterFilterCondition> roleContains(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'role',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SourceToken, SourceToken, QAfterFilterCondition> roleMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'role',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SourceToken, SourceToken, QAfterFilterCondition> roleIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'role', value: ''),
      );
    });
  }

  QueryBuilder<SourceToken, SourceToken, QAfterFilterCondition>
  roleIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'role', value: ''),
      );
    });
  }

  QueryBuilder<SourceToken, SourceToken, QAfterFilterCondition>
  versionsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'versions', length, true, length, true);
    });
  }

  QueryBuilder<SourceToken, SourceToken, QAfterFilterCondition>
  versionsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'versions', 0, true, 0, true);
    });
  }

  QueryBuilder<SourceToken, SourceToken, QAfterFilterCondition>
  versionsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'versions', 0, false, 999999, true);
    });
  }

  QueryBuilder<SourceToken, SourceToken, QAfterFilterCondition>
  versionsLengthLessThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'versions', 0, true, length, include);
    });
  }

  QueryBuilder<SourceToken, SourceToken, QAfterFilterCondition>
  versionsLengthGreaterThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'versions', length, include, 999999, true);
    });
  }

  QueryBuilder<SourceToken, SourceToken, QAfterFilterCondition>
  versionsLengthBetween(
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

  QueryBuilder<SourceToken, SourceToken, QAfterFilterCondition> wordIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'wordId'),
      );
    });
  }

  QueryBuilder<SourceToken, SourceToken, QAfterFilterCondition>
  wordIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'wordId'),
      );
    });
  }

  QueryBuilder<SourceToken, SourceToken, QAfterFilterCondition> wordIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'wordId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SourceToken, SourceToken, QAfterFilterCondition>
  wordIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'wordId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SourceToken, SourceToken, QAfterFilterCondition> wordIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'wordId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SourceToken, SourceToken, QAfterFilterCondition> wordIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'wordId',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SourceToken, SourceToken, QAfterFilterCondition>
  wordIdStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'wordId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SourceToken, SourceToken, QAfterFilterCondition> wordIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'wordId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SourceToken, SourceToken, QAfterFilterCondition> wordIdContains(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'wordId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SourceToken, SourceToken, QAfterFilterCondition> wordIdMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'wordId',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SourceToken, SourceToken, QAfterFilterCondition>
  wordIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'wordId', value: ''),
      );
    });
  }

  QueryBuilder<SourceToken, SourceToken, QAfterFilterCondition>
  wordIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'wordId', value: ''),
      );
    });
  }
}

extension SourceTokenQueryObject
    on QueryBuilder<SourceToken, SourceToken, QFilterCondition> {
  QueryBuilder<SourceToken, SourceToken, QAfterFilterCondition> versionsElement(
    FilterQuery<ReadingItem> q,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'versions');
    });
  }
}

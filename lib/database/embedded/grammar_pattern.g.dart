// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'grammar_pattern.dart';

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const GrammarPatternSchema = Schema(
  name: r'GrammarPattern',
  id: 4182009788843776541,
  properties: {
    r'covers': PropertySchema(id: 0, name: r'covers', type: IsarType.longList),
    r'explain': PropertySchema(id: 1, name: r'explain', type: IsarType.string),
    r'level': PropertySchema(id: 2, name: r'level', type: IsarType.string),
    r'title': PropertySchema(id: 3, name: r'title', type: IsarType.string),
    r'versions': PropertySchema(
      id: 4,
      name: r'versions',
      type: IsarType.objectList,

      target: r'ReadingItem',
    ),
  },

  estimateSize: _grammarPatternEstimateSize,
  serialize: _grammarPatternSerialize,
  deserialize: _grammarPatternDeserialize,
  deserializeProp: _grammarPatternDeserializeProp,
);

int _grammarPatternEstimateSize(
  GrammarPattern object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.covers.length * 8;
  {
    final value = object.explain;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.level;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.title;
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
  return bytesCount;
}

void _grammarPatternSerialize(
  GrammarPattern object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLongList(offsets[0], object.covers);
  writer.writeString(offsets[1], object.explain);
  writer.writeString(offsets[2], object.level);
  writer.writeString(offsets[3], object.title);
  writer.writeObjectList<ReadingItem>(
    offsets[4],
    allOffsets,
    ReadingItemSchema.serialize,
    object.versions,
  );
}

GrammarPattern _grammarPatternDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = GrammarPattern();
  object.covers = reader.readLongList(offsets[0]) ?? [];
  object.explain = reader.readStringOrNull(offsets[1]);
  object.level = reader.readStringOrNull(offsets[2]);
  object.title = reader.readStringOrNull(offsets[3]);
  object.versions =
      reader.readObjectList<ReadingItem>(
        offsets[4],
        ReadingItemSchema.deserialize,
        allOffsets,
        ReadingItem(),
      ) ??
      [];
  return object;
}

P _grammarPatternDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLongList(offset) ?? []) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
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

extension GrammarPatternQueryFilter
    on QueryBuilder<GrammarPattern, GrammarPattern, QFilterCondition> {
  QueryBuilder<GrammarPattern, GrammarPattern, QAfterFilterCondition>
  coversElementEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'covers', value: value),
      );
    });
  }

  QueryBuilder<GrammarPattern, GrammarPattern, QAfterFilterCondition>
  coversElementGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'covers',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<GrammarPattern, GrammarPattern, QAfterFilterCondition>
  coversElementLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'covers',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<GrammarPattern, GrammarPattern, QAfterFilterCondition>
  coversElementBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'covers',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<GrammarPattern, GrammarPattern, QAfterFilterCondition>
  coversLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'covers', length, true, length, true);
    });
  }

  QueryBuilder<GrammarPattern, GrammarPattern, QAfterFilterCondition>
  coversIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'covers', 0, true, 0, true);
    });
  }

  QueryBuilder<GrammarPattern, GrammarPattern, QAfterFilterCondition>
  coversIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'covers', 0, false, 999999, true);
    });
  }

  QueryBuilder<GrammarPattern, GrammarPattern, QAfterFilterCondition>
  coversLengthLessThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'covers', 0, true, length, include);
    });
  }

  QueryBuilder<GrammarPattern, GrammarPattern, QAfterFilterCondition>
  coversLengthGreaterThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'covers', length, include, 999999, true);
    });
  }

  QueryBuilder<GrammarPattern, GrammarPattern, QAfterFilterCondition>
  coversLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'covers',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<GrammarPattern, GrammarPattern, QAfterFilterCondition>
  explainIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'explain'),
      );
    });
  }

  QueryBuilder<GrammarPattern, GrammarPattern, QAfterFilterCondition>
  explainIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'explain'),
      );
    });
  }

  QueryBuilder<GrammarPattern, GrammarPattern, QAfterFilterCondition>
  explainEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'explain',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<GrammarPattern, GrammarPattern, QAfterFilterCondition>
  explainGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'explain',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<GrammarPattern, GrammarPattern, QAfterFilterCondition>
  explainLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'explain',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<GrammarPattern, GrammarPattern, QAfterFilterCondition>
  explainBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'explain',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<GrammarPattern, GrammarPattern, QAfterFilterCondition>
  explainStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'explain',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<GrammarPattern, GrammarPattern, QAfterFilterCondition>
  explainEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'explain',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<GrammarPattern, GrammarPattern, QAfterFilterCondition>
  explainContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'explain',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<GrammarPattern, GrammarPattern, QAfterFilterCondition>
  explainMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'explain',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<GrammarPattern, GrammarPattern, QAfterFilterCondition>
  explainIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'explain', value: ''),
      );
    });
  }

  QueryBuilder<GrammarPattern, GrammarPattern, QAfterFilterCondition>
  explainIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'explain', value: ''),
      );
    });
  }

  QueryBuilder<GrammarPattern, GrammarPattern, QAfterFilterCondition>
  levelIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'level'),
      );
    });
  }

  QueryBuilder<GrammarPattern, GrammarPattern, QAfterFilterCondition>
  levelIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'level'),
      );
    });
  }

  QueryBuilder<GrammarPattern, GrammarPattern, QAfterFilterCondition>
  levelEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'level',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<GrammarPattern, GrammarPattern, QAfterFilterCondition>
  levelGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'level',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<GrammarPattern, GrammarPattern, QAfterFilterCondition>
  levelLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'level',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<GrammarPattern, GrammarPattern, QAfterFilterCondition>
  levelBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'level',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<GrammarPattern, GrammarPattern, QAfterFilterCondition>
  levelStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'level',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<GrammarPattern, GrammarPattern, QAfterFilterCondition>
  levelEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'level',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<GrammarPattern, GrammarPattern, QAfterFilterCondition>
  levelContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'level',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<GrammarPattern, GrammarPattern, QAfterFilterCondition>
  levelMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'level',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<GrammarPattern, GrammarPattern, QAfterFilterCondition>
  levelIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'level', value: ''),
      );
    });
  }

  QueryBuilder<GrammarPattern, GrammarPattern, QAfterFilterCondition>
  levelIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'level', value: ''),
      );
    });
  }

  QueryBuilder<GrammarPattern, GrammarPattern, QAfterFilterCondition>
  titleIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'title'),
      );
    });
  }

  QueryBuilder<GrammarPattern, GrammarPattern, QAfterFilterCondition>
  titleIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'title'),
      );
    });
  }

  QueryBuilder<GrammarPattern, GrammarPattern, QAfterFilterCondition>
  titleEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'title',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<GrammarPattern, GrammarPattern, QAfterFilterCondition>
  titleGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'title',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<GrammarPattern, GrammarPattern, QAfterFilterCondition>
  titleLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'title',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<GrammarPattern, GrammarPattern, QAfterFilterCondition>
  titleBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'title',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<GrammarPattern, GrammarPattern, QAfterFilterCondition>
  titleStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'title',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<GrammarPattern, GrammarPattern, QAfterFilterCondition>
  titleEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'title',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<GrammarPattern, GrammarPattern, QAfterFilterCondition>
  titleContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'title',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<GrammarPattern, GrammarPattern, QAfterFilterCondition>
  titleMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'title',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<GrammarPattern, GrammarPattern, QAfterFilterCondition>
  titleIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'title', value: ''),
      );
    });
  }

  QueryBuilder<GrammarPattern, GrammarPattern, QAfterFilterCondition>
  titleIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'title', value: ''),
      );
    });
  }

  QueryBuilder<GrammarPattern, GrammarPattern, QAfterFilterCondition>
  versionsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'versions', length, true, length, true);
    });
  }

  QueryBuilder<GrammarPattern, GrammarPattern, QAfterFilterCondition>
  versionsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'versions', 0, true, 0, true);
    });
  }

  QueryBuilder<GrammarPattern, GrammarPattern, QAfterFilterCondition>
  versionsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'versions', 0, false, 999999, true);
    });
  }

  QueryBuilder<GrammarPattern, GrammarPattern, QAfterFilterCondition>
  versionsLengthLessThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'versions', 0, true, length, include);
    });
  }

  QueryBuilder<GrammarPattern, GrammarPattern, QAfterFilterCondition>
  versionsLengthGreaterThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'versions', length, include, 999999, true);
    });
  }

  QueryBuilder<GrammarPattern, GrammarPattern, QAfterFilterCondition>
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
}

extension GrammarPatternQueryObject
    on QueryBuilder<GrammarPattern, GrammarPattern, QFilterCondition> {
  QueryBuilder<GrammarPattern, GrammarPattern, QAfterFilterCondition>
  versionsElement(FilterQuery<ReadingItem> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'versions');
    });
  }
}

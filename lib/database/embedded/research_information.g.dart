// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'research_information.dart';

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const ResearchInformationSchema = Schema(
  name: r'ResearchInformation',
  id: -996376257169786456,
  properties: {
    r'context': PropertySchema(id: 0, name: r'context', type: IsarType.string),
    r'glossary': PropertySchema(
      id: 1,
      name: r'glossary',
      type: IsarType.stringList,
    ),
  },

  estimateSize: _researchInformationEstimateSize,
  serialize: _researchInformationSerialize,
  deserialize: _researchInformationDeserialize,
  deserializeProp: _researchInformationDeserializeProp,
);

int _researchInformationEstimateSize(
  ResearchInformation object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.context;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.glossary.length * 3;
  {
    for (var i = 0; i < object.glossary.length; i++) {
      final value = object.glossary[i];
      bytesCount += value.length * 3;
    }
  }
  return bytesCount;
}

void _researchInformationSerialize(
  ResearchInformation object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.context);
  writer.writeStringList(offsets[1], object.glossary);
}

ResearchInformation _researchInformationDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ResearchInformation();
  object.context = reader.readStringOrNull(offsets[0]);
  object.glossary = reader.readStringList(offsets[1]) ?? [];
  return object;
}

P _researchInformationDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readStringList(offset) ?? []) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension ResearchInformationQueryFilter
    on
        QueryBuilder<
          ResearchInformation,
          ResearchInformation,
          QFilterCondition
        > {
  QueryBuilder<ResearchInformation, ResearchInformation, QAfterFilterCondition>
  contextIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'context'),
      );
    });
  }

  QueryBuilder<ResearchInformation, ResearchInformation, QAfterFilterCondition>
  contextIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'context'),
      );
    });
  }

  QueryBuilder<ResearchInformation, ResearchInformation, QAfterFilterCondition>
  contextEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'context',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ResearchInformation, ResearchInformation, QAfterFilterCondition>
  contextGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'context',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ResearchInformation, ResearchInformation, QAfterFilterCondition>
  contextLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'context',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ResearchInformation, ResearchInformation, QAfterFilterCondition>
  contextBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'context',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ResearchInformation, ResearchInformation, QAfterFilterCondition>
  contextStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'context',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ResearchInformation, ResearchInformation, QAfterFilterCondition>
  contextEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'context',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ResearchInformation, ResearchInformation, QAfterFilterCondition>
  contextContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'context',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ResearchInformation, ResearchInformation, QAfterFilterCondition>
  contextMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'context',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ResearchInformation, ResearchInformation, QAfterFilterCondition>
  contextIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'context', value: ''),
      );
    });
  }

  QueryBuilder<ResearchInformation, ResearchInformation, QAfterFilterCondition>
  contextIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'context', value: ''),
      );
    });
  }

  QueryBuilder<ResearchInformation, ResearchInformation, QAfterFilterCondition>
  glossaryElementEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'glossary',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ResearchInformation, ResearchInformation, QAfterFilterCondition>
  glossaryElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'glossary',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ResearchInformation, ResearchInformation, QAfterFilterCondition>
  glossaryElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'glossary',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ResearchInformation, ResearchInformation, QAfterFilterCondition>
  glossaryElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'glossary',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ResearchInformation, ResearchInformation, QAfterFilterCondition>
  glossaryElementStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'glossary',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ResearchInformation, ResearchInformation, QAfterFilterCondition>
  glossaryElementEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'glossary',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ResearchInformation, ResearchInformation, QAfterFilterCondition>
  glossaryElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'glossary',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ResearchInformation, ResearchInformation, QAfterFilterCondition>
  glossaryElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'glossary',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ResearchInformation, ResearchInformation, QAfterFilterCondition>
  glossaryElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'glossary', value: ''),
      );
    });
  }

  QueryBuilder<ResearchInformation, ResearchInformation, QAfterFilterCondition>
  glossaryElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'glossary', value: ''),
      );
    });
  }

  QueryBuilder<ResearchInformation, ResearchInformation, QAfterFilterCondition>
  glossaryLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'glossary', length, true, length, true);
    });
  }

  QueryBuilder<ResearchInformation, ResearchInformation, QAfterFilterCondition>
  glossaryIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'glossary', 0, true, 0, true);
    });
  }

  QueryBuilder<ResearchInformation, ResearchInformation, QAfterFilterCondition>
  glossaryIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'glossary', 0, false, 999999, true);
    });
  }

  QueryBuilder<ResearchInformation, ResearchInformation, QAfterFilterCondition>
  glossaryLengthLessThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'glossary', 0, true, length, include);
    });
  }

  QueryBuilder<ResearchInformation, ResearchInformation, QAfterFilterCondition>
  glossaryLengthGreaterThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'glossary', length, include, 999999, true);
    });
  }

  QueryBuilder<ResearchInformation, ResearchInformation, QAfterFilterCondition>
  glossaryLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'glossary',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }
}

extension ResearchInformationQueryObject
    on
        QueryBuilder<
          ResearchInformation,
          ResearchInformation,
          QFilterCondition
        > {}

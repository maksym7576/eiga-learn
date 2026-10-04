// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'align_group.dart';

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const AlignGroupSchema = Schema(
  name: r'AlignGroup',
  id: 6443192762211104039,
  properties: {
    r'groupId': PropertySchema(id: 0, name: r'groupId', type: IsarType.long),
    r'kind': PropertySchema(id: 1, name: r'kind', type: IsarType.string),
    r'sourcePositions': PropertySchema(
      id: 2,
      name: r'sourcePositions',
      type: IsarType.longList,
    ),
    r'targetPositions': PropertySchema(
      id: 3,
      name: r'targetPositions',
      type: IsarType.longList,
    ),
  },

  estimateSize: _alignGroupEstimateSize,
  serialize: _alignGroupSerialize,
  deserialize: _alignGroupDeserialize,
  deserializeProp: _alignGroupDeserializeProp,
);

int _alignGroupEstimateSize(
  AlignGroup object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.kind;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.sourcePositions.length * 8;
  bytesCount += 3 + object.targetPositions.length * 8;
  return bytesCount;
}

void _alignGroupSerialize(
  AlignGroup object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.groupId);
  writer.writeString(offsets[1], object.kind);
  writer.writeLongList(offsets[2], object.sourcePositions);
  writer.writeLongList(offsets[3], object.targetPositions);
}

AlignGroup _alignGroupDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = AlignGroup();
  object.groupId = reader.readLongOrNull(offsets[0]);
  object.kind = reader.readStringOrNull(offsets[1]);
  object.sourcePositions = reader.readLongList(offsets[2]) ?? [];
  object.targetPositions = reader.readLongList(offsets[3]) ?? [];
  return object;
}

P _alignGroupDeserializeProp<P>(
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
      return (reader.readLongList(offset) ?? []) as P;
    case 3:
      return (reader.readLongList(offset) ?? []) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension AlignGroupQueryFilter
    on QueryBuilder<AlignGroup, AlignGroup, QFilterCondition> {
  QueryBuilder<AlignGroup, AlignGroup, QAfterFilterCondition> groupIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'groupId'),
      );
    });
  }

  QueryBuilder<AlignGroup, AlignGroup, QAfterFilterCondition>
  groupIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'groupId'),
      );
    });
  }

  QueryBuilder<AlignGroup, AlignGroup, QAfterFilterCondition> groupIdEqualTo(
    int? value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'groupId', value: value),
      );
    });
  }

  QueryBuilder<AlignGroup, AlignGroup, QAfterFilterCondition>
  groupIdGreaterThan(int? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'groupId',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<AlignGroup, AlignGroup, QAfterFilterCondition> groupIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'groupId',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<AlignGroup, AlignGroup, QAfterFilterCondition> groupIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'groupId',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<AlignGroup, AlignGroup, QAfterFilterCondition> kindIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'kind'),
      );
    });
  }

  QueryBuilder<AlignGroup, AlignGroup, QAfterFilterCondition> kindIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'kind'),
      );
    });
  }

  QueryBuilder<AlignGroup, AlignGroup, QAfterFilterCondition> kindEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'kind',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AlignGroup, AlignGroup, QAfterFilterCondition> kindGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'kind',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AlignGroup, AlignGroup, QAfterFilterCondition> kindLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'kind',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AlignGroup, AlignGroup, QAfterFilterCondition> kindBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'kind',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AlignGroup, AlignGroup, QAfterFilterCondition> kindStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'kind',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AlignGroup, AlignGroup, QAfterFilterCondition> kindEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'kind',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AlignGroup, AlignGroup, QAfterFilterCondition> kindContains(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'kind',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AlignGroup, AlignGroup, QAfterFilterCondition> kindMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'kind',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AlignGroup, AlignGroup, QAfterFilterCondition> kindIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'kind', value: ''),
      );
    });
  }

  QueryBuilder<AlignGroup, AlignGroup, QAfterFilterCondition> kindIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'kind', value: ''),
      );
    });
  }

  QueryBuilder<AlignGroup, AlignGroup, QAfterFilterCondition>
  sourcePositionsElementEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'sourcePositions', value: value),
      );
    });
  }

  QueryBuilder<AlignGroup, AlignGroup, QAfterFilterCondition>
  sourcePositionsElementGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'sourcePositions',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<AlignGroup, AlignGroup, QAfterFilterCondition>
  sourcePositionsElementLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'sourcePositions',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<AlignGroup, AlignGroup, QAfterFilterCondition>
  sourcePositionsElementBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'sourcePositions',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<AlignGroup, AlignGroup, QAfterFilterCondition>
  sourcePositionsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'sourcePositions', length, true, length, true);
    });
  }

  QueryBuilder<AlignGroup, AlignGroup, QAfterFilterCondition>
  sourcePositionsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'sourcePositions', 0, true, 0, true);
    });
  }

  QueryBuilder<AlignGroup, AlignGroup, QAfterFilterCondition>
  sourcePositionsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'sourcePositions', 0, false, 999999, true);
    });
  }

  QueryBuilder<AlignGroup, AlignGroup, QAfterFilterCondition>
  sourcePositionsLengthLessThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'sourcePositions', 0, true, length, include);
    });
  }

  QueryBuilder<AlignGroup, AlignGroup, QAfterFilterCondition>
  sourcePositionsLengthGreaterThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'sourcePositions',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<AlignGroup, AlignGroup, QAfterFilterCondition>
  sourcePositionsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'sourcePositions',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<AlignGroup, AlignGroup, QAfterFilterCondition>
  targetPositionsElementEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'targetPositions', value: value),
      );
    });
  }

  QueryBuilder<AlignGroup, AlignGroup, QAfterFilterCondition>
  targetPositionsElementGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'targetPositions',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<AlignGroup, AlignGroup, QAfterFilterCondition>
  targetPositionsElementLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'targetPositions',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<AlignGroup, AlignGroup, QAfterFilterCondition>
  targetPositionsElementBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'targetPositions',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<AlignGroup, AlignGroup, QAfterFilterCondition>
  targetPositionsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'targetPositions', length, true, length, true);
    });
  }

  QueryBuilder<AlignGroup, AlignGroup, QAfterFilterCondition>
  targetPositionsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'targetPositions', 0, true, 0, true);
    });
  }

  QueryBuilder<AlignGroup, AlignGroup, QAfterFilterCondition>
  targetPositionsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'targetPositions', 0, false, 999999, true);
    });
  }

  QueryBuilder<AlignGroup, AlignGroup, QAfterFilterCondition>
  targetPositionsLengthLessThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'targetPositions', 0, true, length, include);
    });
  }

  QueryBuilder<AlignGroup, AlignGroup, QAfterFilterCondition>
  targetPositionsLengthGreaterThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'targetPositions',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<AlignGroup, AlignGroup, QAfterFilterCondition>
  targetPositionsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'targetPositions',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }
}

extension AlignGroupQueryObject
    on QueryBuilder<AlignGroup, AlignGroup, QFilterCondition> {}

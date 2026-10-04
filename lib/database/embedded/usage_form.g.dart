// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'usage_form.dart';

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const UsageFormSchema = Schema(
  name: r'UsageForm',
  id: -7191880406828978153,
  properties: {
    r'count': PropertySchema(id: 0, name: r'count', type: IsarType.long),
    r'grammarCode': PropertySchema(
      id: 1,
      name: r'grammarCode',
      type: IsarType.string,
    ),
    r'versions': PropertySchema(
      id: 2,
      name: r'versions',
      type: IsarType.objectList,

      target: r'ReadingItem',
    ),
  },

  estimateSize: _usageFormEstimateSize,
  serialize: _usageFormSerialize,
  deserialize: _usageFormDeserialize,
  deserializeProp: _usageFormDeserializeProp,
);

int _usageFormEstimateSize(
  UsageForm object,
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

void _usageFormSerialize(
  UsageForm object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.count);
  writer.writeString(offsets[1], object.grammarCode);
  writer.writeObjectList<ReadingItem>(
    offsets[2],
    allOffsets,
    ReadingItemSchema.serialize,
    object.versions,
  );
}

UsageForm _usageFormDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = UsageForm();
  object.count = reader.readLong(offsets[0]);
  object.grammarCode = reader.readStringOrNull(offsets[1]);
  object.versions =
      reader.readObjectList<ReadingItem>(
        offsets[2],
        ReadingItemSchema.deserialize,
        allOffsets,
        ReadingItem(),
      ) ??
      [];
  return object;
}

P _usageFormDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLong(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
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

extension UsageFormQueryFilter
    on QueryBuilder<UsageForm, UsageForm, QFilterCondition> {
  QueryBuilder<UsageForm, UsageForm, QAfterFilterCondition> countEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'count', value: value),
      );
    });
  }

  QueryBuilder<UsageForm, UsageForm, QAfterFilterCondition> countGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'count',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<UsageForm, UsageForm, QAfterFilterCondition> countLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'count',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<UsageForm, UsageForm, QAfterFilterCondition> countBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'count',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<UsageForm, UsageForm, QAfterFilterCondition>
  grammarCodeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'grammarCode'),
      );
    });
  }

  QueryBuilder<UsageForm, UsageForm, QAfterFilterCondition>
  grammarCodeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'grammarCode'),
      );
    });
  }

  QueryBuilder<UsageForm, UsageForm, QAfterFilterCondition> grammarCodeEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
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

  QueryBuilder<UsageForm, UsageForm, QAfterFilterCondition>
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

  QueryBuilder<UsageForm, UsageForm, QAfterFilterCondition> grammarCodeLessThan(
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

  QueryBuilder<UsageForm, UsageForm, QAfterFilterCondition> grammarCodeBetween(
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

  QueryBuilder<UsageForm, UsageForm, QAfterFilterCondition>
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

  QueryBuilder<UsageForm, UsageForm, QAfterFilterCondition> grammarCodeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
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

  QueryBuilder<UsageForm, UsageForm, QAfterFilterCondition> grammarCodeContains(
    String value, {
    bool caseSensitive = true,
  }) {
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

  QueryBuilder<UsageForm, UsageForm, QAfterFilterCondition> grammarCodeMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
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

  QueryBuilder<UsageForm, UsageForm, QAfterFilterCondition>
  grammarCodeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'grammarCode', value: ''),
      );
    });
  }

  QueryBuilder<UsageForm, UsageForm, QAfterFilterCondition>
  grammarCodeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'grammarCode', value: ''),
      );
    });
  }

  QueryBuilder<UsageForm, UsageForm, QAfterFilterCondition>
  versionsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'versions', length, true, length, true);
    });
  }

  QueryBuilder<UsageForm, UsageForm, QAfterFilterCondition> versionsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'versions', 0, true, 0, true);
    });
  }

  QueryBuilder<UsageForm, UsageForm, QAfterFilterCondition>
  versionsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'versions', 0, false, 999999, true);
    });
  }

  QueryBuilder<UsageForm, UsageForm, QAfterFilterCondition>
  versionsLengthLessThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'versions', 0, true, length, include);
    });
  }

  QueryBuilder<UsageForm, UsageForm, QAfterFilterCondition>
  versionsLengthGreaterThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'versions', length, include, 999999, true);
    });
  }

  QueryBuilder<UsageForm, UsageForm, QAfterFilterCondition>
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

extension UsageFormQueryObject
    on QueryBuilder<UsageForm, UsageForm, QFilterCondition> {
  QueryBuilder<UsageForm, UsageForm, QAfterFilterCondition> versionsElement(
    FilterQuery<ReadingItem> q,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'versions');
    });
  }
}

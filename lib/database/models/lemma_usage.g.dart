// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lemma_usage.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetLemmaUsageCollection on Isar {
  IsarCollection<LemmaUsage> get lemmaUsages => this.collection();
}

const LemmaUsageSchema = CollectionSchema(
  name: r'LemmaUsage',
  id: 4038850962203335294,
  properties: {
    r'forms': PropertySchema(
      id: 0,
      name: r'forms',
      type: IsarType.objectList,

      target: r'UsageForm',
    ),
    r'lemmaKey': PropertySchema(
      id: 1,
      name: r'lemmaKey',
      type: IsarType.string,
    ),
    r'occurrences': PropertySchema(
      id: 2,
      name: r'occurrences',
      type: IsarType.long,
    ),
    r'samplePhraseIds': PropertySchema(
      id: 3,
      name: r'samplePhraseIds',
      type: IsarType.longList,
    ),
    r'usageKey': PropertySchema(
      id: 4,
      name: r'usageKey',
      type: IsarType.string,
    ),
    r'videoId': PropertySchema(id: 5, name: r'videoId', type: IsarType.long),
  },

  estimateSize: _lemmaUsageEstimateSize,
  serialize: _lemmaUsageSerialize,
  deserialize: _lemmaUsageDeserialize,
  deserializeProp: _lemmaUsageDeserializeProp,
  idName: r'id',
  indexes: {
    r'usageKey': IndexSchema(
      id: -2752858628554433544,
      name: r'usageKey',
      unique: true,
      replace: true,
      properties: [
        IndexPropertySchema(
          name: r'usageKey',
          type: IndexType.hash,
          caseSensitive: true,
        ),
      ],
    ),
  },
  links: {},
  embeddedSchemas: {
    r'UsageForm': UsageFormSchema,
    r'ReadingItem': ReadingItemSchema,
  },

  getId: _lemmaUsageGetId,
  getLinks: _lemmaUsageGetLinks,
  attach: _lemmaUsageAttach,
  version: '3.3.2',
);

int _lemmaUsageEstimateSize(
  LemmaUsage object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.forms.length * 3;
  {
    final offsets = allOffsets[UsageForm]!;
    for (var i = 0; i < object.forms.length; i++) {
      final value = object.forms[i];
      bytesCount += UsageFormSchema.estimateSize(value, offsets, allOffsets);
    }
  }
  bytesCount += 3 + object.lemmaKey.length * 3;
  bytesCount += 3 + object.samplePhraseIds.length * 8;
  bytesCount += 3 + object.usageKey.length * 3;
  return bytesCount;
}

void _lemmaUsageSerialize(
  LemmaUsage object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeObjectList<UsageForm>(
    offsets[0],
    allOffsets,
    UsageFormSchema.serialize,
    object.forms,
  );
  writer.writeString(offsets[1], object.lemmaKey);
  writer.writeLong(offsets[2], object.occurrences);
  writer.writeLongList(offsets[3], object.samplePhraseIds);
  writer.writeString(offsets[4], object.usageKey);
  writer.writeLong(offsets[5], object.videoId);
}

LemmaUsage _lemmaUsageDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = LemmaUsage();
  object.forms =
      reader.readObjectList<UsageForm>(
        offsets[0],
        UsageFormSchema.deserialize,
        allOffsets,
        UsageForm(),
      ) ??
      [];
  object.id = id;
  object.lemmaKey = reader.readString(offsets[1]);
  object.occurrences = reader.readLong(offsets[2]);
  object.samplePhraseIds = reader.readLongList(offsets[3]) ?? [];
  object.usageKey = reader.readString(offsets[4]);
  object.videoId = reader.readLong(offsets[5]);
  return object;
}

P _lemmaUsageDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readObjectList<UsageForm>(
                offset,
                UsageFormSchema.deserialize,
                allOffsets,
                UsageForm(),
              ) ??
              [])
          as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readLong(offset)) as P;
    case 3:
      return (reader.readLongList(offset) ?? []) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _lemmaUsageGetId(LemmaUsage object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _lemmaUsageGetLinks(LemmaUsage object) {
  return [];
}

void _lemmaUsageAttach(IsarCollection<dynamic> col, Id id, LemmaUsage object) {
  object.id = id;
}

extension LemmaUsageByIndex on IsarCollection<LemmaUsage> {
  Future<LemmaUsage?> getByUsageKey(String usageKey) {
    return getByIndex(r'usageKey', [usageKey]);
  }

  LemmaUsage? getByUsageKeySync(String usageKey) {
    return getByIndexSync(r'usageKey', [usageKey]);
  }

  Future<bool> deleteByUsageKey(String usageKey) {
    return deleteByIndex(r'usageKey', [usageKey]);
  }

  bool deleteByUsageKeySync(String usageKey) {
    return deleteByIndexSync(r'usageKey', [usageKey]);
  }

  Future<List<LemmaUsage?>> getAllByUsageKey(List<String> usageKeyValues) {
    final values = usageKeyValues.map((e) => [e]).toList();
    return getAllByIndex(r'usageKey', values);
  }

  List<LemmaUsage?> getAllByUsageKeySync(List<String> usageKeyValues) {
    final values = usageKeyValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'usageKey', values);
  }

  Future<int> deleteAllByUsageKey(List<String> usageKeyValues) {
    final values = usageKeyValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'usageKey', values);
  }

  int deleteAllByUsageKeySync(List<String> usageKeyValues) {
    final values = usageKeyValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'usageKey', values);
  }

  Future<Id> putByUsageKey(LemmaUsage object) {
    return putByIndex(r'usageKey', object);
  }

  Id putByUsageKeySync(LemmaUsage object, {bool saveLinks = true}) {
    return putByIndexSync(r'usageKey', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByUsageKey(List<LemmaUsage> objects) {
    return putAllByIndex(r'usageKey', objects);
  }

  List<Id> putAllByUsageKeySync(
    List<LemmaUsage> objects, {
    bool saveLinks = true,
  }) {
    return putAllByIndexSync(r'usageKey', objects, saveLinks: saveLinks);
  }
}

extension LemmaUsageQueryWhereSort
    on QueryBuilder<LemmaUsage, LemmaUsage, QWhere> {
  QueryBuilder<LemmaUsage, LemmaUsage, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension LemmaUsageQueryWhere
    on QueryBuilder<LemmaUsage, LemmaUsage, QWhereClause> {
  QueryBuilder<LemmaUsage, LemmaUsage, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(lower: id, upper: id));
    });
  }

  QueryBuilder<LemmaUsage, LemmaUsage, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<LemmaUsage, LemmaUsage, QAfterWhereClause> idGreaterThan(
    Id id, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<LemmaUsage, LemmaUsage, QAfterWhereClause> idLessThan(
    Id id, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<LemmaUsage, LemmaUsage, QAfterWhereClause> idBetween(
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

  QueryBuilder<LemmaUsage, LemmaUsage, QAfterWhereClause> usageKeyEqualTo(
    String usageKey,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'usageKey', value: [usageKey]),
      );
    });
  }

  QueryBuilder<LemmaUsage, LemmaUsage, QAfterWhereClause> usageKeyNotEqualTo(
    String usageKey,
  ) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'usageKey',
                lower: [],
                upper: [usageKey],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'usageKey',
                lower: [usageKey],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'usageKey',
                lower: [usageKey],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'usageKey',
                lower: [],
                upper: [usageKey],
                includeUpper: false,
              ),
            );
      }
    });
  }
}

extension LemmaUsageQueryFilter
    on QueryBuilder<LemmaUsage, LemmaUsage, QFilterCondition> {
  QueryBuilder<LemmaUsage, LemmaUsage, QAfterFilterCondition>
  formsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'forms', length, true, length, true);
    });
  }

  QueryBuilder<LemmaUsage, LemmaUsage, QAfterFilterCondition> formsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'forms', 0, true, 0, true);
    });
  }

  QueryBuilder<LemmaUsage, LemmaUsage, QAfterFilterCondition>
  formsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'forms', 0, false, 999999, true);
    });
  }

  QueryBuilder<LemmaUsage, LemmaUsage, QAfterFilterCondition>
  formsLengthLessThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'forms', 0, true, length, include);
    });
  }

  QueryBuilder<LemmaUsage, LemmaUsage, QAfterFilterCondition>
  formsLengthGreaterThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'forms', length, include, 999999, true);
    });
  }

  QueryBuilder<LemmaUsage, LemmaUsage, QAfterFilterCondition>
  formsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'forms',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<LemmaUsage, LemmaUsage, QAfterFilterCondition> idEqualTo(
    Id value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'id', value: value),
      );
    });
  }

  QueryBuilder<LemmaUsage, LemmaUsage, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<LemmaUsage, LemmaUsage, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<LemmaUsage, LemmaUsage, QAfterFilterCondition> idBetween(
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

  QueryBuilder<LemmaUsage, LemmaUsage, QAfterFilterCondition> lemmaKeyEqualTo(
    String value, {
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

  QueryBuilder<LemmaUsage, LemmaUsage, QAfterFilterCondition>
  lemmaKeyGreaterThan(
    String value, {
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

  QueryBuilder<LemmaUsage, LemmaUsage, QAfterFilterCondition> lemmaKeyLessThan(
    String value, {
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

  QueryBuilder<LemmaUsage, LemmaUsage, QAfterFilterCondition> lemmaKeyBetween(
    String lower,
    String upper, {
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

  QueryBuilder<LemmaUsage, LemmaUsage, QAfterFilterCondition>
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

  QueryBuilder<LemmaUsage, LemmaUsage, QAfterFilterCondition> lemmaKeyEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
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

  QueryBuilder<LemmaUsage, LemmaUsage, QAfterFilterCondition> lemmaKeyContains(
    String value, {
    bool caseSensitive = true,
  }) {
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

  QueryBuilder<LemmaUsage, LemmaUsage, QAfterFilterCondition> lemmaKeyMatches(
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

  QueryBuilder<LemmaUsage, LemmaUsage, QAfterFilterCondition>
  lemmaKeyIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'lemmaKey', value: ''),
      );
    });
  }

  QueryBuilder<LemmaUsage, LemmaUsage, QAfterFilterCondition>
  lemmaKeyIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'lemmaKey', value: ''),
      );
    });
  }

  QueryBuilder<LemmaUsage, LemmaUsage, QAfterFilterCondition>
  occurrencesEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'occurrences', value: value),
      );
    });
  }

  QueryBuilder<LemmaUsage, LemmaUsage, QAfterFilterCondition>
  occurrencesGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'occurrences',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<LemmaUsage, LemmaUsage, QAfterFilterCondition>
  occurrencesLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'occurrences',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<LemmaUsage, LemmaUsage, QAfterFilterCondition>
  occurrencesBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'occurrences',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<LemmaUsage, LemmaUsage, QAfterFilterCondition>
  samplePhraseIdsElementEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'samplePhraseIds', value: value),
      );
    });
  }

  QueryBuilder<LemmaUsage, LemmaUsage, QAfterFilterCondition>
  samplePhraseIdsElementGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'samplePhraseIds',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<LemmaUsage, LemmaUsage, QAfterFilterCondition>
  samplePhraseIdsElementLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'samplePhraseIds',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<LemmaUsage, LemmaUsage, QAfterFilterCondition>
  samplePhraseIdsElementBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'samplePhraseIds',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<LemmaUsage, LemmaUsage, QAfterFilterCondition>
  samplePhraseIdsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'samplePhraseIds', length, true, length, true);
    });
  }

  QueryBuilder<LemmaUsage, LemmaUsage, QAfterFilterCondition>
  samplePhraseIdsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'samplePhraseIds', 0, true, 0, true);
    });
  }

  QueryBuilder<LemmaUsage, LemmaUsage, QAfterFilterCondition>
  samplePhraseIdsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'samplePhraseIds', 0, false, 999999, true);
    });
  }

  QueryBuilder<LemmaUsage, LemmaUsage, QAfterFilterCondition>
  samplePhraseIdsLengthLessThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'samplePhraseIds', 0, true, length, include);
    });
  }

  QueryBuilder<LemmaUsage, LemmaUsage, QAfterFilterCondition>
  samplePhraseIdsLengthGreaterThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'samplePhraseIds',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<LemmaUsage, LemmaUsage, QAfterFilterCondition>
  samplePhraseIdsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'samplePhraseIds',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<LemmaUsage, LemmaUsage, QAfterFilterCondition> usageKeyEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'usageKey',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LemmaUsage, LemmaUsage, QAfterFilterCondition>
  usageKeyGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'usageKey',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LemmaUsage, LemmaUsage, QAfterFilterCondition> usageKeyLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'usageKey',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LemmaUsage, LemmaUsage, QAfterFilterCondition> usageKeyBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'usageKey',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LemmaUsage, LemmaUsage, QAfterFilterCondition>
  usageKeyStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'usageKey',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LemmaUsage, LemmaUsage, QAfterFilterCondition> usageKeyEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'usageKey',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LemmaUsage, LemmaUsage, QAfterFilterCondition> usageKeyContains(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'usageKey',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LemmaUsage, LemmaUsage, QAfterFilterCondition> usageKeyMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'usageKey',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LemmaUsage, LemmaUsage, QAfterFilterCondition>
  usageKeyIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'usageKey', value: ''),
      );
    });
  }

  QueryBuilder<LemmaUsage, LemmaUsage, QAfterFilterCondition>
  usageKeyIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'usageKey', value: ''),
      );
    });
  }

  QueryBuilder<LemmaUsage, LemmaUsage, QAfterFilterCondition> videoIdEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'videoId', value: value),
      );
    });
  }

  QueryBuilder<LemmaUsage, LemmaUsage, QAfterFilterCondition>
  videoIdGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'videoId',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<LemmaUsage, LemmaUsage, QAfterFilterCondition> videoIdLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'videoId',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<LemmaUsage, LemmaUsage, QAfterFilterCondition> videoIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'videoId',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }
}

extension LemmaUsageQueryObject
    on QueryBuilder<LemmaUsage, LemmaUsage, QFilterCondition> {
  QueryBuilder<LemmaUsage, LemmaUsage, QAfterFilterCondition> formsElement(
    FilterQuery<UsageForm> q,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'forms');
    });
  }
}

extension LemmaUsageQueryLinks
    on QueryBuilder<LemmaUsage, LemmaUsage, QFilterCondition> {}

extension LemmaUsageQuerySortBy
    on QueryBuilder<LemmaUsage, LemmaUsage, QSortBy> {
  QueryBuilder<LemmaUsage, LemmaUsage, QAfterSortBy> sortByLemmaKey() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lemmaKey', Sort.asc);
    });
  }

  QueryBuilder<LemmaUsage, LemmaUsage, QAfterSortBy> sortByLemmaKeyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lemmaKey', Sort.desc);
    });
  }

  QueryBuilder<LemmaUsage, LemmaUsage, QAfterSortBy> sortByOccurrences() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'occurrences', Sort.asc);
    });
  }

  QueryBuilder<LemmaUsage, LemmaUsage, QAfterSortBy> sortByOccurrencesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'occurrences', Sort.desc);
    });
  }

  QueryBuilder<LemmaUsage, LemmaUsage, QAfterSortBy> sortByUsageKey() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'usageKey', Sort.asc);
    });
  }

  QueryBuilder<LemmaUsage, LemmaUsage, QAfterSortBy> sortByUsageKeyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'usageKey', Sort.desc);
    });
  }

  QueryBuilder<LemmaUsage, LemmaUsage, QAfterSortBy> sortByVideoId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'videoId', Sort.asc);
    });
  }

  QueryBuilder<LemmaUsage, LemmaUsage, QAfterSortBy> sortByVideoIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'videoId', Sort.desc);
    });
  }
}

extension LemmaUsageQuerySortThenBy
    on QueryBuilder<LemmaUsage, LemmaUsage, QSortThenBy> {
  QueryBuilder<LemmaUsage, LemmaUsage, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<LemmaUsage, LemmaUsage, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<LemmaUsage, LemmaUsage, QAfterSortBy> thenByLemmaKey() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lemmaKey', Sort.asc);
    });
  }

  QueryBuilder<LemmaUsage, LemmaUsage, QAfterSortBy> thenByLemmaKeyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lemmaKey', Sort.desc);
    });
  }

  QueryBuilder<LemmaUsage, LemmaUsage, QAfterSortBy> thenByOccurrences() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'occurrences', Sort.asc);
    });
  }

  QueryBuilder<LemmaUsage, LemmaUsage, QAfterSortBy> thenByOccurrencesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'occurrences', Sort.desc);
    });
  }

  QueryBuilder<LemmaUsage, LemmaUsage, QAfterSortBy> thenByUsageKey() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'usageKey', Sort.asc);
    });
  }

  QueryBuilder<LemmaUsage, LemmaUsage, QAfterSortBy> thenByUsageKeyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'usageKey', Sort.desc);
    });
  }

  QueryBuilder<LemmaUsage, LemmaUsage, QAfterSortBy> thenByVideoId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'videoId', Sort.asc);
    });
  }

  QueryBuilder<LemmaUsage, LemmaUsage, QAfterSortBy> thenByVideoIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'videoId', Sort.desc);
    });
  }
}

extension LemmaUsageQueryWhereDistinct
    on QueryBuilder<LemmaUsage, LemmaUsage, QDistinct> {
  QueryBuilder<LemmaUsage, LemmaUsage, QDistinct> distinctByLemmaKey({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lemmaKey', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<LemmaUsage, LemmaUsage, QDistinct> distinctByOccurrences() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'occurrences');
    });
  }

  QueryBuilder<LemmaUsage, LemmaUsage, QDistinct> distinctBySamplePhraseIds() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'samplePhraseIds');
    });
  }

  QueryBuilder<LemmaUsage, LemmaUsage, QDistinct> distinctByUsageKey({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'usageKey', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<LemmaUsage, LemmaUsage, QDistinct> distinctByVideoId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'videoId');
    });
  }
}

extension LemmaUsageQueryProperty
    on QueryBuilder<LemmaUsage, LemmaUsage, QQueryProperty> {
  QueryBuilder<LemmaUsage, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<LemmaUsage, List<UsageForm>, QQueryOperations> formsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'forms');
    });
  }

  QueryBuilder<LemmaUsage, String, QQueryOperations> lemmaKeyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lemmaKey');
    });
  }

  QueryBuilder<LemmaUsage, int, QQueryOperations> occurrencesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'occurrences');
    });
  }

  QueryBuilder<LemmaUsage, List<int>, QQueryOperations>
  samplePhraseIdsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'samplePhraseIds');
    });
  }

  QueryBuilder<LemmaUsage, String, QQueryOperations> usageKeyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'usageKey');
    });
  }

  QueryBuilder<LemmaUsage, int, QQueryOperations> videoIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'videoId');
    });
  }
}

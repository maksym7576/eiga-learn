// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lemma_gloss.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetLemmaGlossCollection on Isar {
  IsarCollection<LemmaGloss> get lemmaGloss => this.collection();
}

const LemmaGlossSchema = CollectionSchema(
  name: r'LemmaGloss',
  id: -7491585909669224855,
  properties: {
    r'isLexiconDone': PropertySchema(
      id: 0,
      name: r'isLexiconDone',
      type: IsarType.bool,
    ),
    r'lang': PropertySchema(id: 1, name: r'lang', type: IsarType.string),
    r'lemmaKey': PropertySchema(
      id: 2,
      name: r'lemmaKey',
      type: IsarType.string,
    ),
    r'sync': PropertySchema(
      id: 3,
      name: r'sync',
      type: IsarType.object,

      target: r'SyncMeta',
    ),
    r'translation': PropertySchema(
      id: 4,
      name: r'translation',
      type: IsarType.string,
    ),
  },

  estimateSize: _lemmaGlossEstimateSize,
  serialize: _lemmaGlossSerialize,
  deserialize: _lemmaGlossDeserialize,
  deserializeProp: _lemmaGlossDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {r'SyncMeta': SyncMetaSchema},

  getId: _lemmaGlossGetId,
  getLinks: _lemmaGlossGetLinks,
  attach: _lemmaGlossAttach,
  version: '3.3.2',
);

int _lemmaGlossEstimateSize(
  LemmaGloss object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.lang.length * 3;
  bytesCount += 3 + object.lemmaKey.length * 3;
  bytesCount +=
      3 +
      SyncMetaSchema.estimateSize(
        object.sync,
        allOffsets[SyncMeta]!,
        allOffsets,
      );
  bytesCount += 3 + object.translation.length * 3;
  return bytesCount;
}

void _lemmaGlossSerialize(
  LemmaGloss object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeBool(offsets[0], object.isLexiconDone);
  writer.writeString(offsets[1], object.lang);
  writer.writeString(offsets[2], object.lemmaKey);
  writer.writeObject<SyncMeta>(
    offsets[3],
    allOffsets,
    SyncMetaSchema.serialize,
    object.sync,
  );
  writer.writeString(offsets[4], object.translation);
}

LemmaGloss _lemmaGlossDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = LemmaGloss();
  object.id = id;
  object.isLexiconDone = reader.readBool(offsets[0]);
  object.lang = reader.readString(offsets[1]);
  object.lemmaKey = reader.readString(offsets[2]);
  object.sync =
      reader.readObjectOrNull<SyncMeta>(
        offsets[3],
        SyncMetaSchema.deserialize,
        allOffsets,
      ) ??
      SyncMeta();
  object.translation = reader.readString(offsets[4]);
  return object;
}

P _lemmaGlossDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readBool(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readObjectOrNull<SyncMeta>(
                offset,
                SyncMetaSchema.deserialize,
                allOffsets,
              ) ??
              SyncMeta())
          as P;
    case 4:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _lemmaGlossGetId(LemmaGloss object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _lemmaGlossGetLinks(LemmaGloss object) {
  return [];
}

void _lemmaGlossAttach(IsarCollection<dynamic> col, Id id, LemmaGloss object) {
  object.id = id;
}

extension LemmaGlossQueryWhereSort
    on QueryBuilder<LemmaGloss, LemmaGloss, QWhere> {
  QueryBuilder<LemmaGloss, LemmaGloss, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension LemmaGlossQueryWhere
    on QueryBuilder<LemmaGloss, LemmaGloss, QWhereClause> {
  QueryBuilder<LemmaGloss, LemmaGloss, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(lower: id, upper: id));
    });
  }

  QueryBuilder<LemmaGloss, LemmaGloss, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<LemmaGloss, LemmaGloss, QAfterWhereClause> idGreaterThan(
    Id id, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<LemmaGloss, LemmaGloss, QAfterWhereClause> idLessThan(
    Id id, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<LemmaGloss, LemmaGloss, QAfterWhereClause> idBetween(
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
}

extension LemmaGlossQueryFilter
    on QueryBuilder<LemmaGloss, LemmaGloss, QFilterCondition> {
  QueryBuilder<LemmaGloss, LemmaGloss, QAfterFilterCondition> idEqualTo(
    Id value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'id', value: value),
      );
    });
  }

  QueryBuilder<LemmaGloss, LemmaGloss, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<LemmaGloss, LemmaGloss, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<LemmaGloss, LemmaGloss, QAfterFilterCondition> idBetween(
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

  QueryBuilder<LemmaGloss, LemmaGloss, QAfterFilterCondition>
  isLexiconDoneEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'isLexiconDone', value: value),
      );
    });
  }

  QueryBuilder<LemmaGloss, LemmaGloss, QAfterFilterCondition> langEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'lang',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LemmaGloss, LemmaGloss, QAfterFilterCondition> langGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'lang',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LemmaGloss, LemmaGloss, QAfterFilterCondition> langLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'lang',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LemmaGloss, LemmaGloss, QAfterFilterCondition> langBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'lang',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LemmaGloss, LemmaGloss, QAfterFilterCondition> langStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'lang',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LemmaGloss, LemmaGloss, QAfterFilterCondition> langEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'lang',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LemmaGloss, LemmaGloss, QAfterFilterCondition> langContains(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'lang',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LemmaGloss, LemmaGloss, QAfterFilterCondition> langMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'lang',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LemmaGloss, LemmaGloss, QAfterFilterCondition> langIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'lang', value: ''),
      );
    });
  }

  QueryBuilder<LemmaGloss, LemmaGloss, QAfterFilterCondition> langIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'lang', value: ''),
      );
    });
  }

  QueryBuilder<LemmaGloss, LemmaGloss, QAfterFilterCondition> lemmaKeyEqualTo(
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

  QueryBuilder<LemmaGloss, LemmaGloss, QAfterFilterCondition>
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

  QueryBuilder<LemmaGloss, LemmaGloss, QAfterFilterCondition> lemmaKeyLessThan(
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

  QueryBuilder<LemmaGloss, LemmaGloss, QAfterFilterCondition> lemmaKeyBetween(
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

  QueryBuilder<LemmaGloss, LemmaGloss, QAfterFilterCondition>
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

  QueryBuilder<LemmaGloss, LemmaGloss, QAfterFilterCondition> lemmaKeyEndsWith(
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

  QueryBuilder<LemmaGloss, LemmaGloss, QAfterFilterCondition> lemmaKeyContains(
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

  QueryBuilder<LemmaGloss, LemmaGloss, QAfterFilterCondition> lemmaKeyMatches(
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

  QueryBuilder<LemmaGloss, LemmaGloss, QAfterFilterCondition>
  lemmaKeyIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'lemmaKey', value: ''),
      );
    });
  }

  QueryBuilder<LemmaGloss, LemmaGloss, QAfterFilterCondition>
  lemmaKeyIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'lemmaKey', value: ''),
      );
    });
  }

  QueryBuilder<LemmaGloss, LemmaGloss, QAfterFilterCondition>
  translationEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'translation',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LemmaGloss, LemmaGloss, QAfterFilterCondition>
  translationGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'translation',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LemmaGloss, LemmaGloss, QAfterFilterCondition>
  translationLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'translation',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LemmaGloss, LemmaGloss, QAfterFilterCondition>
  translationBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'translation',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LemmaGloss, LemmaGloss, QAfterFilterCondition>
  translationStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'translation',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LemmaGloss, LemmaGloss, QAfterFilterCondition>
  translationEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'translation',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LemmaGloss, LemmaGloss, QAfterFilterCondition>
  translationContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'translation',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LemmaGloss, LemmaGloss, QAfterFilterCondition>
  translationMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'translation',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LemmaGloss, LemmaGloss, QAfterFilterCondition>
  translationIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'translation', value: ''),
      );
    });
  }

  QueryBuilder<LemmaGloss, LemmaGloss, QAfterFilterCondition>
  translationIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'translation', value: ''),
      );
    });
  }
}

extension LemmaGlossQueryObject
    on QueryBuilder<LemmaGloss, LemmaGloss, QFilterCondition> {
  QueryBuilder<LemmaGloss, LemmaGloss, QAfterFilterCondition> sync(
    FilterQuery<SyncMeta> q,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'sync');
    });
  }
}

extension LemmaGlossQueryLinks
    on QueryBuilder<LemmaGloss, LemmaGloss, QFilterCondition> {}

extension LemmaGlossQuerySortBy
    on QueryBuilder<LemmaGloss, LemmaGloss, QSortBy> {
  QueryBuilder<LemmaGloss, LemmaGloss, QAfterSortBy> sortByIsLexiconDone() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isLexiconDone', Sort.asc);
    });
  }

  QueryBuilder<LemmaGloss, LemmaGloss, QAfterSortBy> sortByIsLexiconDoneDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isLexiconDone', Sort.desc);
    });
  }

  QueryBuilder<LemmaGloss, LemmaGloss, QAfterSortBy> sortByLang() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lang', Sort.asc);
    });
  }

  QueryBuilder<LemmaGloss, LemmaGloss, QAfterSortBy> sortByLangDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lang', Sort.desc);
    });
  }

  QueryBuilder<LemmaGloss, LemmaGloss, QAfterSortBy> sortByLemmaKey() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lemmaKey', Sort.asc);
    });
  }

  QueryBuilder<LemmaGloss, LemmaGloss, QAfterSortBy> sortByLemmaKeyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lemmaKey', Sort.desc);
    });
  }

  QueryBuilder<LemmaGloss, LemmaGloss, QAfterSortBy> sortByTranslation() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'translation', Sort.asc);
    });
  }

  QueryBuilder<LemmaGloss, LemmaGloss, QAfterSortBy> sortByTranslationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'translation', Sort.desc);
    });
  }
}

extension LemmaGlossQuerySortThenBy
    on QueryBuilder<LemmaGloss, LemmaGloss, QSortThenBy> {
  QueryBuilder<LemmaGloss, LemmaGloss, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<LemmaGloss, LemmaGloss, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<LemmaGloss, LemmaGloss, QAfterSortBy> thenByIsLexiconDone() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isLexiconDone', Sort.asc);
    });
  }

  QueryBuilder<LemmaGloss, LemmaGloss, QAfterSortBy> thenByIsLexiconDoneDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isLexiconDone', Sort.desc);
    });
  }

  QueryBuilder<LemmaGloss, LemmaGloss, QAfterSortBy> thenByLang() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lang', Sort.asc);
    });
  }

  QueryBuilder<LemmaGloss, LemmaGloss, QAfterSortBy> thenByLangDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lang', Sort.desc);
    });
  }

  QueryBuilder<LemmaGloss, LemmaGloss, QAfterSortBy> thenByLemmaKey() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lemmaKey', Sort.asc);
    });
  }

  QueryBuilder<LemmaGloss, LemmaGloss, QAfterSortBy> thenByLemmaKeyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lemmaKey', Sort.desc);
    });
  }

  QueryBuilder<LemmaGloss, LemmaGloss, QAfterSortBy> thenByTranslation() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'translation', Sort.asc);
    });
  }

  QueryBuilder<LemmaGloss, LemmaGloss, QAfterSortBy> thenByTranslationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'translation', Sort.desc);
    });
  }
}

extension LemmaGlossQueryWhereDistinct
    on QueryBuilder<LemmaGloss, LemmaGloss, QDistinct> {
  QueryBuilder<LemmaGloss, LemmaGloss, QDistinct> distinctByIsLexiconDone() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isLexiconDone');
    });
  }

  QueryBuilder<LemmaGloss, LemmaGloss, QDistinct> distinctByLang({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lang', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<LemmaGloss, LemmaGloss, QDistinct> distinctByLemmaKey({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lemmaKey', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<LemmaGloss, LemmaGloss, QDistinct> distinctByTranslation({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'translation', caseSensitive: caseSensitive);
    });
  }
}

extension LemmaGlossQueryProperty
    on QueryBuilder<LemmaGloss, LemmaGloss, QQueryProperty> {
  QueryBuilder<LemmaGloss, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<LemmaGloss, bool, QQueryOperations> isLexiconDoneProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isLexiconDone');
    });
  }

  QueryBuilder<LemmaGloss, String, QQueryOperations> langProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lang');
    });
  }

  QueryBuilder<LemmaGloss, String, QQueryOperations> lemmaKeyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lemmaKey');
    });
  }

  QueryBuilder<LemmaGloss, SyncMeta, QQueryOperations> syncProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'sync');
    });
  }

  QueryBuilder<LemmaGloss, String, QQueryOperations> translationProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'translation');
    });
  }
}

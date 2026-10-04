// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_lemma_state.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetUserLemmaStateCollection on Isar {
  IsarCollection<UserLemmaState> get userLemmaStates => this.collection();
}

const UserLemmaStateSchema = CollectionSchema(
  name: r'UserLemmaState',
  id: -1403275673947444939,
  properties: {
    r'lemmaKey': PropertySchema(
      id: 0,
      name: r'lemmaKey',
      type: IsarType.string,
    ),
    r'status': PropertySchema(id: 1, name: r'status', type: IsarType.string),
    r'sync': PropertySchema(
      id: 2,
      name: r'sync',
      type: IsarType.object,

      target: r'SyncMeta',
    ),
    r'updatedAt': PropertySchema(
      id: 3,
      name: r'updatedAt',
      type: IsarType.dateTime,
    ),
  },

  estimateSize: _userLemmaStateEstimateSize,
  serialize: _userLemmaStateSerialize,
  deserialize: _userLemmaStateDeserialize,
  deserializeProp: _userLemmaStateDeserializeProp,
  idName: r'id',
  indexes: {
    r'lemmaKey': IndexSchema(
      id: -2722901746191118219,
      name: r'lemmaKey',
      unique: true,
      replace: true,
      properties: [
        IndexPropertySchema(
          name: r'lemmaKey',
          type: IndexType.hash,
          caseSensitive: true,
        ),
      ],
    ),
  },
  links: {},
  embeddedSchemas: {r'SyncMeta': SyncMetaSchema},

  getId: _userLemmaStateGetId,
  getLinks: _userLemmaStateGetLinks,
  attach: _userLemmaStateAttach,
  version: '3.3.2',
);

int _userLemmaStateEstimateSize(
  UserLemmaState object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.lemmaKey.length * 3;
  bytesCount += 3 + object.status.length * 3;
  bytesCount +=
      3 +
      SyncMetaSchema.estimateSize(
        object.sync,
        allOffsets[SyncMeta]!,
        allOffsets,
      );
  return bytesCount;
}

void _userLemmaStateSerialize(
  UserLemmaState object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.lemmaKey);
  writer.writeString(offsets[1], object.status);
  writer.writeObject<SyncMeta>(
    offsets[2],
    allOffsets,
    SyncMetaSchema.serialize,
    object.sync,
  );
  writer.writeDateTime(offsets[3], object.updatedAt);
}

UserLemmaState _userLemmaStateDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = UserLemmaState();
  object.id = id;
  object.lemmaKey = reader.readString(offsets[0]);
  object.status = reader.readString(offsets[1]);
  object.sync =
      reader.readObjectOrNull<SyncMeta>(
        offsets[2],
        SyncMetaSchema.deserialize,
        allOffsets,
      ) ??
      SyncMeta();
  object.updatedAt = reader.readDateTimeOrNull(offsets[3]);
  return object;
}

P _userLemmaStateDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readObjectOrNull<SyncMeta>(
                offset,
                SyncMetaSchema.deserialize,
                allOffsets,
              ) ??
              SyncMeta())
          as P;
    case 3:
      return (reader.readDateTimeOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _userLemmaStateGetId(UserLemmaState object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _userLemmaStateGetLinks(UserLemmaState object) {
  return [];
}

void _userLemmaStateAttach(
  IsarCollection<dynamic> col,
  Id id,
  UserLemmaState object,
) {
  object.id = id;
}

extension UserLemmaStateByIndex on IsarCollection<UserLemmaState> {
  Future<UserLemmaState?> getByLemmaKey(String lemmaKey) {
    return getByIndex(r'lemmaKey', [lemmaKey]);
  }

  UserLemmaState? getByLemmaKeySync(String lemmaKey) {
    return getByIndexSync(r'lemmaKey', [lemmaKey]);
  }

  Future<bool> deleteByLemmaKey(String lemmaKey) {
    return deleteByIndex(r'lemmaKey', [lemmaKey]);
  }

  bool deleteByLemmaKeySync(String lemmaKey) {
    return deleteByIndexSync(r'lemmaKey', [lemmaKey]);
  }

  Future<List<UserLemmaState?>> getAllByLemmaKey(List<String> lemmaKeyValues) {
    final values = lemmaKeyValues.map((e) => [e]).toList();
    return getAllByIndex(r'lemmaKey', values);
  }

  List<UserLemmaState?> getAllByLemmaKeySync(List<String> lemmaKeyValues) {
    final values = lemmaKeyValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'lemmaKey', values);
  }

  Future<int> deleteAllByLemmaKey(List<String> lemmaKeyValues) {
    final values = lemmaKeyValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'lemmaKey', values);
  }

  int deleteAllByLemmaKeySync(List<String> lemmaKeyValues) {
    final values = lemmaKeyValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'lemmaKey', values);
  }

  Future<Id> putByLemmaKey(UserLemmaState object) {
    return putByIndex(r'lemmaKey', object);
  }

  Id putByLemmaKeySync(UserLemmaState object, {bool saveLinks = true}) {
    return putByIndexSync(r'lemmaKey', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByLemmaKey(List<UserLemmaState> objects) {
    return putAllByIndex(r'lemmaKey', objects);
  }

  List<Id> putAllByLemmaKeySync(
    List<UserLemmaState> objects, {
    bool saveLinks = true,
  }) {
    return putAllByIndexSync(r'lemmaKey', objects, saveLinks: saveLinks);
  }
}

extension UserLemmaStateQueryWhereSort
    on QueryBuilder<UserLemmaState, UserLemmaState, QWhere> {
  QueryBuilder<UserLemmaState, UserLemmaState, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension UserLemmaStateQueryWhere
    on QueryBuilder<UserLemmaState, UserLemmaState, QWhereClause> {
  QueryBuilder<UserLemmaState, UserLemmaState, QAfterWhereClause> idEqualTo(
    Id id,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(lower: id, upper: id));
    });
  }

  QueryBuilder<UserLemmaState, UserLemmaState, QAfterWhereClause> idNotEqualTo(
    Id id,
  ) {
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

  QueryBuilder<UserLemmaState, UserLemmaState, QAfterWhereClause> idGreaterThan(
    Id id, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<UserLemmaState, UserLemmaState, QAfterWhereClause> idLessThan(
    Id id, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<UserLemmaState, UserLemmaState, QAfterWhereClause> idBetween(
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

  QueryBuilder<UserLemmaState, UserLemmaState, QAfterWhereClause>
  lemmaKeyEqualTo(String lemmaKey) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'lemmaKey', value: [lemmaKey]),
      );
    });
  }

  QueryBuilder<UserLemmaState, UserLemmaState, QAfterWhereClause>
  lemmaKeyNotEqualTo(String lemmaKey) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'lemmaKey',
                lower: [],
                upper: [lemmaKey],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'lemmaKey',
                lower: [lemmaKey],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'lemmaKey',
                lower: [lemmaKey],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'lemmaKey',
                lower: [],
                upper: [lemmaKey],
                includeUpper: false,
              ),
            );
      }
    });
  }
}

extension UserLemmaStateQueryFilter
    on QueryBuilder<UserLemmaState, UserLemmaState, QFilterCondition> {
  QueryBuilder<UserLemmaState, UserLemmaState, QAfterFilterCondition> idEqualTo(
    Id value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'id', value: value),
      );
    });
  }

  QueryBuilder<UserLemmaState, UserLemmaState, QAfterFilterCondition>
  idGreaterThan(Id value, {bool include = false}) {
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

  QueryBuilder<UserLemmaState, UserLemmaState, QAfterFilterCondition>
  idLessThan(Id value, {bool include = false}) {
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

  QueryBuilder<UserLemmaState, UserLemmaState, QAfterFilterCondition> idBetween(
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

  QueryBuilder<UserLemmaState, UserLemmaState, QAfterFilterCondition>
  lemmaKeyEqualTo(String value, {bool caseSensitive = true}) {
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

  QueryBuilder<UserLemmaState, UserLemmaState, QAfterFilterCondition>
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

  QueryBuilder<UserLemmaState, UserLemmaState, QAfterFilterCondition>
  lemmaKeyLessThan(
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

  QueryBuilder<UserLemmaState, UserLemmaState, QAfterFilterCondition>
  lemmaKeyBetween(
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

  QueryBuilder<UserLemmaState, UserLemmaState, QAfterFilterCondition>
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

  QueryBuilder<UserLemmaState, UserLemmaState, QAfterFilterCondition>
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

  QueryBuilder<UserLemmaState, UserLemmaState, QAfterFilterCondition>
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

  QueryBuilder<UserLemmaState, UserLemmaState, QAfterFilterCondition>
  lemmaKeyMatches(String pattern, {bool caseSensitive = true}) {
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

  QueryBuilder<UserLemmaState, UserLemmaState, QAfterFilterCondition>
  lemmaKeyIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'lemmaKey', value: ''),
      );
    });
  }

  QueryBuilder<UserLemmaState, UserLemmaState, QAfterFilterCondition>
  lemmaKeyIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'lemmaKey', value: ''),
      );
    });
  }

  QueryBuilder<UserLemmaState, UserLemmaState, QAfterFilterCondition>
  statusEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'status',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<UserLemmaState, UserLemmaState, QAfterFilterCondition>
  statusGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'status',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<UserLemmaState, UserLemmaState, QAfterFilterCondition>
  statusLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'status',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<UserLemmaState, UserLemmaState, QAfterFilterCondition>
  statusBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'status',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<UserLemmaState, UserLemmaState, QAfterFilterCondition>
  statusStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'status',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<UserLemmaState, UserLemmaState, QAfterFilterCondition>
  statusEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'status',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<UserLemmaState, UserLemmaState, QAfterFilterCondition>
  statusContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'status',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<UserLemmaState, UserLemmaState, QAfterFilterCondition>
  statusMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'status',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<UserLemmaState, UserLemmaState, QAfterFilterCondition>
  statusIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'status', value: ''),
      );
    });
  }

  QueryBuilder<UserLemmaState, UserLemmaState, QAfterFilterCondition>
  statusIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'status', value: ''),
      );
    });
  }

  QueryBuilder<UserLemmaState, UserLemmaState, QAfterFilterCondition>
  updatedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'updatedAt'),
      );
    });
  }

  QueryBuilder<UserLemmaState, UserLemmaState, QAfterFilterCondition>
  updatedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'updatedAt'),
      );
    });
  }

  QueryBuilder<UserLemmaState, UserLemmaState, QAfterFilterCondition>
  updatedAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'updatedAt', value: value),
      );
    });
  }

  QueryBuilder<UserLemmaState, UserLemmaState, QAfterFilterCondition>
  updatedAtGreaterThan(DateTime? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'updatedAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<UserLemmaState, UserLemmaState, QAfterFilterCondition>
  updatedAtLessThan(DateTime? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'updatedAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<UserLemmaState, UserLemmaState, QAfterFilterCondition>
  updatedAtBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'updatedAt',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }
}

extension UserLemmaStateQueryObject
    on QueryBuilder<UserLemmaState, UserLemmaState, QFilterCondition> {
  QueryBuilder<UserLemmaState, UserLemmaState, QAfterFilterCondition> sync(
    FilterQuery<SyncMeta> q,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'sync');
    });
  }
}

extension UserLemmaStateQueryLinks
    on QueryBuilder<UserLemmaState, UserLemmaState, QFilterCondition> {}

extension UserLemmaStateQuerySortBy
    on QueryBuilder<UserLemmaState, UserLemmaState, QSortBy> {
  QueryBuilder<UserLemmaState, UserLemmaState, QAfterSortBy> sortByLemmaKey() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lemmaKey', Sort.asc);
    });
  }

  QueryBuilder<UserLemmaState, UserLemmaState, QAfterSortBy>
  sortByLemmaKeyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lemmaKey', Sort.desc);
    });
  }

  QueryBuilder<UserLemmaState, UserLemmaState, QAfterSortBy> sortByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<UserLemmaState, UserLemmaState, QAfterSortBy>
  sortByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<UserLemmaState, UserLemmaState, QAfterSortBy> sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<UserLemmaState, UserLemmaState, QAfterSortBy>
  sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }
}

extension UserLemmaStateQuerySortThenBy
    on QueryBuilder<UserLemmaState, UserLemmaState, QSortThenBy> {
  QueryBuilder<UserLemmaState, UserLemmaState, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<UserLemmaState, UserLemmaState, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<UserLemmaState, UserLemmaState, QAfterSortBy> thenByLemmaKey() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lemmaKey', Sort.asc);
    });
  }

  QueryBuilder<UserLemmaState, UserLemmaState, QAfterSortBy>
  thenByLemmaKeyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lemmaKey', Sort.desc);
    });
  }

  QueryBuilder<UserLemmaState, UserLemmaState, QAfterSortBy> thenByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<UserLemmaState, UserLemmaState, QAfterSortBy>
  thenByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<UserLemmaState, UserLemmaState, QAfterSortBy> thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<UserLemmaState, UserLemmaState, QAfterSortBy>
  thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }
}

extension UserLemmaStateQueryWhereDistinct
    on QueryBuilder<UserLemmaState, UserLemmaState, QDistinct> {
  QueryBuilder<UserLemmaState, UserLemmaState, QDistinct> distinctByLemmaKey({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lemmaKey', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<UserLemmaState, UserLemmaState, QDistinct> distinctByStatus({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'status', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<UserLemmaState, UserLemmaState, QDistinct>
  distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }
}

extension UserLemmaStateQueryProperty
    on QueryBuilder<UserLemmaState, UserLemmaState, QQueryProperty> {
  QueryBuilder<UserLemmaState, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<UserLemmaState, String, QQueryOperations> lemmaKeyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lemmaKey');
    });
  }

  QueryBuilder<UserLemmaState, String, QQueryOperations> statusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'status');
    });
  }

  QueryBuilder<UserLemmaState, SyncMeta, QQueryOperations> syncProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'sync');
    });
  }

  QueryBuilder<UserLemmaState, DateTime?, QQueryOperations>
  updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }
}

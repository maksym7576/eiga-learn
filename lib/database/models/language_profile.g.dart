// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'language_profile.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetLanguageProfileCollection on Isar {
  IsarCollection<LanguageProfile> get languageProfiles => this.collection();
}

const LanguageProfileSchema = CollectionSchema(
  name: r'LanguageProfile',
  id: 1470481980781859159,
  properties: {
    r'createdAt': PropertySchema(
      id: 0,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'dbName': PropertySchema(id: 1, name: r'dbName', type: IsarType.string),
    r'defaultModelName': PropertySchema(
      id: 2,
      name: r'defaultModelName',
      type: IsarType.string,
    ),
    r'isActive': PropertySchema(id: 3, name: r'isActive', type: IsarType.bool),
    r'lastOpenedAt': PropertySchema(
      id: 4,
      name: r'lastOpenedAt',
      type: IsarType.dateTime,
    ),
    r'readingOptions': PropertySchema(
      id: 5,
      name: r'readingOptions',
      type: IsarType.string,
    ),
    r'sourceLang': PropertySchema(
      id: 6,
      name: r'sourceLang',
      type: IsarType.string,
    ),
    r'spacingOption': PropertySchema(
      id: 7,
      name: r'spacingOption',
      type: IsarType.string,
    ),
    r'targetLang': PropertySchema(
      id: 8,
      name: r'targetLang',
      type: IsarType.string,
    ),
    r'tokenizationMethod': PropertySchema(
      id: 9,
      name: r'tokenizationMethod',
      type: IsarType.string,
    ),
  },

  estimateSize: _languageProfileEstimateSize,
  serialize: _languageProfileSerialize,
  deserialize: _languageProfileDeserialize,
  deserializeProp: _languageProfileDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},

  getId: _languageProfileGetId,
  getLinks: _languageProfileGetLinks,
  attach: _languageProfileAttach,
  version: '3.3.2',
);

int _languageProfileEstimateSize(
  LanguageProfile object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.dbName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.defaultModelName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.readingOptions;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.sourceLang;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.spacingOption;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.targetLang;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.tokenizationMethod;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _languageProfileSerialize(
  LanguageProfile object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.createdAt);
  writer.writeString(offsets[1], object.dbName);
  writer.writeString(offsets[2], object.defaultModelName);
  writer.writeBool(offsets[3], object.isActive);
  writer.writeDateTime(offsets[4], object.lastOpenedAt);
  writer.writeString(offsets[5], object.readingOptions);
  writer.writeString(offsets[6], object.sourceLang);
  writer.writeString(offsets[7], object.spacingOption);
  writer.writeString(offsets[8], object.targetLang);
  writer.writeString(offsets[9], object.tokenizationMethod);
}

LanguageProfile _languageProfileDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = LanguageProfile();
  object.createdAt = reader.readDateTimeOrNull(offsets[0]);
  object.dbName = reader.readStringOrNull(offsets[1]);
  object.defaultModelName = reader.readStringOrNull(offsets[2]);
  object.id = id;
  object.isActive = reader.readBool(offsets[3]);
  object.lastOpenedAt = reader.readDateTimeOrNull(offsets[4]);
  object.readingOptions = reader.readStringOrNull(offsets[5]);
  object.sourceLang = reader.readStringOrNull(offsets[6]);
  object.spacingOption = reader.readStringOrNull(offsets[7]);
  object.targetLang = reader.readStringOrNull(offsets[8]);
  object.tokenizationMethod = reader.readStringOrNull(offsets[9]);
  return object;
}

P _languageProfileDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readBool(offset)) as P;
    case 4:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    case 6:
      return (reader.readStringOrNull(offset)) as P;
    case 7:
      return (reader.readStringOrNull(offset)) as P;
    case 8:
      return (reader.readStringOrNull(offset)) as P;
    case 9:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _languageProfileGetId(LanguageProfile object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _languageProfileGetLinks(LanguageProfile object) {
  return [];
}

void _languageProfileAttach(
  IsarCollection<dynamic> col,
  Id id,
  LanguageProfile object,
) {
  object.id = id;
}

extension LanguageProfileQueryWhereSort
    on QueryBuilder<LanguageProfile, LanguageProfile, QWhere> {
  QueryBuilder<LanguageProfile, LanguageProfile, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension LanguageProfileQueryWhere
    on QueryBuilder<LanguageProfile, LanguageProfile, QWhereClause> {
  QueryBuilder<LanguageProfile, LanguageProfile, QAfterWhereClause> idEqualTo(
    Id id,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(lower: id, upper: id));
    });
  }

  QueryBuilder<LanguageProfile, LanguageProfile, QAfterWhereClause>
  idNotEqualTo(Id id) {
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

  QueryBuilder<LanguageProfile, LanguageProfile, QAfterWhereClause>
  idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<LanguageProfile, LanguageProfile, QAfterWhereClause> idLessThan(
    Id id, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<LanguageProfile, LanguageProfile, QAfterWhereClause> idBetween(
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

extension LanguageProfileQueryFilter
    on QueryBuilder<LanguageProfile, LanguageProfile, QFilterCondition> {
  QueryBuilder<LanguageProfile, LanguageProfile, QAfterFilterCondition>
  createdAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'createdAt'),
      );
    });
  }

  QueryBuilder<LanguageProfile, LanguageProfile, QAfterFilterCondition>
  createdAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'createdAt'),
      );
    });
  }

  QueryBuilder<LanguageProfile, LanguageProfile, QAfterFilterCondition>
  createdAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'createdAt', value: value),
      );
    });
  }

  QueryBuilder<LanguageProfile, LanguageProfile, QAfterFilterCondition>
  createdAtGreaterThan(DateTime? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'createdAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<LanguageProfile, LanguageProfile, QAfterFilterCondition>
  createdAtLessThan(DateTime? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'createdAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<LanguageProfile, LanguageProfile, QAfterFilterCondition>
  createdAtBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'createdAt',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<LanguageProfile, LanguageProfile, QAfterFilterCondition>
  dbNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'dbName'),
      );
    });
  }

  QueryBuilder<LanguageProfile, LanguageProfile, QAfterFilterCondition>
  dbNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'dbName'),
      );
    });
  }

  QueryBuilder<LanguageProfile, LanguageProfile, QAfterFilterCondition>
  dbNameEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'dbName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LanguageProfile, LanguageProfile, QAfterFilterCondition>
  dbNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'dbName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LanguageProfile, LanguageProfile, QAfterFilterCondition>
  dbNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'dbName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LanguageProfile, LanguageProfile, QAfterFilterCondition>
  dbNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'dbName',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LanguageProfile, LanguageProfile, QAfterFilterCondition>
  dbNameStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'dbName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LanguageProfile, LanguageProfile, QAfterFilterCondition>
  dbNameEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'dbName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LanguageProfile, LanguageProfile, QAfterFilterCondition>
  dbNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'dbName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LanguageProfile, LanguageProfile, QAfterFilterCondition>
  dbNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'dbName',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LanguageProfile, LanguageProfile, QAfterFilterCondition>
  dbNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'dbName', value: ''),
      );
    });
  }

  QueryBuilder<LanguageProfile, LanguageProfile, QAfterFilterCondition>
  dbNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'dbName', value: ''),
      );
    });
  }

  QueryBuilder<LanguageProfile, LanguageProfile, QAfterFilterCondition>
  defaultModelNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'defaultModelName'),
      );
    });
  }

  QueryBuilder<LanguageProfile, LanguageProfile, QAfterFilterCondition>
  defaultModelNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'defaultModelName'),
      );
    });
  }

  QueryBuilder<LanguageProfile, LanguageProfile, QAfterFilterCondition>
  defaultModelNameEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'defaultModelName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LanguageProfile, LanguageProfile, QAfterFilterCondition>
  defaultModelNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'defaultModelName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LanguageProfile, LanguageProfile, QAfterFilterCondition>
  defaultModelNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'defaultModelName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LanguageProfile, LanguageProfile, QAfterFilterCondition>
  defaultModelNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'defaultModelName',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LanguageProfile, LanguageProfile, QAfterFilterCondition>
  defaultModelNameStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'defaultModelName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LanguageProfile, LanguageProfile, QAfterFilterCondition>
  defaultModelNameEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'defaultModelName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LanguageProfile, LanguageProfile, QAfterFilterCondition>
  defaultModelNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'defaultModelName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LanguageProfile, LanguageProfile, QAfterFilterCondition>
  defaultModelNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'defaultModelName',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LanguageProfile, LanguageProfile, QAfterFilterCondition>
  defaultModelNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'defaultModelName', value: ''),
      );
    });
  }

  QueryBuilder<LanguageProfile, LanguageProfile, QAfterFilterCondition>
  defaultModelNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'defaultModelName', value: ''),
      );
    });
  }

  QueryBuilder<LanguageProfile, LanguageProfile, QAfterFilterCondition>
  idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'id', value: value),
      );
    });
  }

  QueryBuilder<LanguageProfile, LanguageProfile, QAfterFilterCondition>
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

  QueryBuilder<LanguageProfile, LanguageProfile, QAfterFilterCondition>
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

  QueryBuilder<LanguageProfile, LanguageProfile, QAfterFilterCondition>
  idBetween(
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

  QueryBuilder<LanguageProfile, LanguageProfile, QAfterFilterCondition>
  isActiveEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'isActive', value: value),
      );
    });
  }

  QueryBuilder<LanguageProfile, LanguageProfile, QAfterFilterCondition>
  lastOpenedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'lastOpenedAt'),
      );
    });
  }

  QueryBuilder<LanguageProfile, LanguageProfile, QAfterFilterCondition>
  lastOpenedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'lastOpenedAt'),
      );
    });
  }

  QueryBuilder<LanguageProfile, LanguageProfile, QAfterFilterCondition>
  lastOpenedAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'lastOpenedAt', value: value),
      );
    });
  }

  QueryBuilder<LanguageProfile, LanguageProfile, QAfterFilterCondition>
  lastOpenedAtGreaterThan(DateTime? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'lastOpenedAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<LanguageProfile, LanguageProfile, QAfterFilterCondition>
  lastOpenedAtLessThan(DateTime? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'lastOpenedAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<LanguageProfile, LanguageProfile, QAfterFilterCondition>
  lastOpenedAtBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'lastOpenedAt',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<LanguageProfile, LanguageProfile, QAfterFilterCondition>
  readingOptionsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'readingOptions'),
      );
    });
  }

  QueryBuilder<LanguageProfile, LanguageProfile, QAfterFilterCondition>
  readingOptionsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'readingOptions'),
      );
    });
  }

  QueryBuilder<LanguageProfile, LanguageProfile, QAfterFilterCondition>
  readingOptionsEqualTo(String? value, {bool caseSensitive = true}) {
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

  QueryBuilder<LanguageProfile, LanguageProfile, QAfterFilterCondition>
  readingOptionsGreaterThan(
    String? value, {
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

  QueryBuilder<LanguageProfile, LanguageProfile, QAfterFilterCondition>
  readingOptionsLessThan(
    String? value, {
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

  QueryBuilder<LanguageProfile, LanguageProfile, QAfterFilterCondition>
  readingOptionsBetween(
    String? lower,
    String? upper, {
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

  QueryBuilder<LanguageProfile, LanguageProfile, QAfterFilterCondition>
  readingOptionsStartsWith(String value, {bool caseSensitive = true}) {
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

  QueryBuilder<LanguageProfile, LanguageProfile, QAfterFilterCondition>
  readingOptionsEndsWith(String value, {bool caseSensitive = true}) {
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

  QueryBuilder<LanguageProfile, LanguageProfile, QAfterFilterCondition>
  readingOptionsContains(String value, {bool caseSensitive = true}) {
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

  QueryBuilder<LanguageProfile, LanguageProfile, QAfterFilterCondition>
  readingOptionsMatches(String pattern, {bool caseSensitive = true}) {
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

  QueryBuilder<LanguageProfile, LanguageProfile, QAfterFilterCondition>
  readingOptionsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'readingOptions', value: ''),
      );
    });
  }

  QueryBuilder<LanguageProfile, LanguageProfile, QAfterFilterCondition>
  readingOptionsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'readingOptions', value: ''),
      );
    });
  }

  QueryBuilder<LanguageProfile, LanguageProfile, QAfterFilterCondition>
  sourceLangIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'sourceLang'),
      );
    });
  }

  QueryBuilder<LanguageProfile, LanguageProfile, QAfterFilterCondition>
  sourceLangIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'sourceLang'),
      );
    });
  }

  QueryBuilder<LanguageProfile, LanguageProfile, QAfterFilterCondition>
  sourceLangEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'sourceLang',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LanguageProfile, LanguageProfile, QAfterFilterCondition>
  sourceLangGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'sourceLang',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LanguageProfile, LanguageProfile, QAfterFilterCondition>
  sourceLangLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'sourceLang',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LanguageProfile, LanguageProfile, QAfterFilterCondition>
  sourceLangBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'sourceLang',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LanguageProfile, LanguageProfile, QAfterFilterCondition>
  sourceLangStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'sourceLang',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LanguageProfile, LanguageProfile, QAfterFilterCondition>
  sourceLangEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'sourceLang',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LanguageProfile, LanguageProfile, QAfterFilterCondition>
  sourceLangContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'sourceLang',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LanguageProfile, LanguageProfile, QAfterFilterCondition>
  sourceLangMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'sourceLang',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LanguageProfile, LanguageProfile, QAfterFilterCondition>
  sourceLangIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'sourceLang', value: ''),
      );
    });
  }

  QueryBuilder<LanguageProfile, LanguageProfile, QAfterFilterCondition>
  sourceLangIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'sourceLang', value: ''),
      );
    });
  }

  QueryBuilder<LanguageProfile, LanguageProfile, QAfterFilterCondition>
  spacingOptionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'spacingOption'),
      );
    });
  }

  QueryBuilder<LanguageProfile, LanguageProfile, QAfterFilterCondition>
  spacingOptionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'spacingOption'),
      );
    });
  }

  QueryBuilder<LanguageProfile, LanguageProfile, QAfterFilterCondition>
  spacingOptionEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'spacingOption',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LanguageProfile, LanguageProfile, QAfterFilterCondition>
  spacingOptionGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'spacingOption',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LanguageProfile, LanguageProfile, QAfterFilterCondition>
  spacingOptionLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'spacingOption',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LanguageProfile, LanguageProfile, QAfterFilterCondition>
  spacingOptionBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'spacingOption',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LanguageProfile, LanguageProfile, QAfterFilterCondition>
  spacingOptionStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'spacingOption',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LanguageProfile, LanguageProfile, QAfterFilterCondition>
  spacingOptionEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'spacingOption',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LanguageProfile, LanguageProfile, QAfterFilterCondition>
  spacingOptionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'spacingOption',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LanguageProfile, LanguageProfile, QAfterFilterCondition>
  spacingOptionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'spacingOption',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LanguageProfile, LanguageProfile, QAfterFilterCondition>
  spacingOptionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'spacingOption', value: ''),
      );
    });
  }

  QueryBuilder<LanguageProfile, LanguageProfile, QAfterFilterCondition>
  spacingOptionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'spacingOption', value: ''),
      );
    });
  }

  QueryBuilder<LanguageProfile, LanguageProfile, QAfterFilterCondition>
  targetLangIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'targetLang'),
      );
    });
  }

  QueryBuilder<LanguageProfile, LanguageProfile, QAfterFilterCondition>
  targetLangIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'targetLang'),
      );
    });
  }

  QueryBuilder<LanguageProfile, LanguageProfile, QAfterFilterCondition>
  targetLangEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'targetLang',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LanguageProfile, LanguageProfile, QAfterFilterCondition>
  targetLangGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'targetLang',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LanguageProfile, LanguageProfile, QAfterFilterCondition>
  targetLangLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'targetLang',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LanguageProfile, LanguageProfile, QAfterFilterCondition>
  targetLangBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'targetLang',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LanguageProfile, LanguageProfile, QAfterFilterCondition>
  targetLangStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'targetLang',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LanguageProfile, LanguageProfile, QAfterFilterCondition>
  targetLangEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'targetLang',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LanguageProfile, LanguageProfile, QAfterFilterCondition>
  targetLangContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'targetLang',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LanguageProfile, LanguageProfile, QAfterFilterCondition>
  targetLangMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'targetLang',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LanguageProfile, LanguageProfile, QAfterFilterCondition>
  targetLangIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'targetLang', value: ''),
      );
    });
  }

  QueryBuilder<LanguageProfile, LanguageProfile, QAfterFilterCondition>
  targetLangIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'targetLang', value: ''),
      );
    });
  }

  QueryBuilder<LanguageProfile, LanguageProfile, QAfterFilterCondition>
  tokenizationMethodIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'tokenizationMethod'),
      );
    });
  }

  QueryBuilder<LanguageProfile, LanguageProfile, QAfterFilterCondition>
  tokenizationMethodIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'tokenizationMethod'),
      );
    });
  }

  QueryBuilder<LanguageProfile, LanguageProfile, QAfterFilterCondition>
  tokenizationMethodEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'tokenizationMethod',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LanguageProfile, LanguageProfile, QAfterFilterCondition>
  tokenizationMethodGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'tokenizationMethod',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LanguageProfile, LanguageProfile, QAfterFilterCondition>
  tokenizationMethodLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'tokenizationMethod',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LanguageProfile, LanguageProfile, QAfterFilterCondition>
  tokenizationMethodBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'tokenizationMethod',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LanguageProfile, LanguageProfile, QAfterFilterCondition>
  tokenizationMethodStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'tokenizationMethod',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LanguageProfile, LanguageProfile, QAfterFilterCondition>
  tokenizationMethodEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'tokenizationMethod',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LanguageProfile, LanguageProfile, QAfterFilterCondition>
  tokenizationMethodContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'tokenizationMethod',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LanguageProfile, LanguageProfile, QAfterFilterCondition>
  tokenizationMethodMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'tokenizationMethod',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LanguageProfile, LanguageProfile, QAfterFilterCondition>
  tokenizationMethodIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'tokenizationMethod', value: ''),
      );
    });
  }

  QueryBuilder<LanguageProfile, LanguageProfile, QAfterFilterCondition>
  tokenizationMethodIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'tokenizationMethod', value: ''),
      );
    });
  }
}

extension LanguageProfileQueryObject
    on QueryBuilder<LanguageProfile, LanguageProfile, QFilterCondition> {}

extension LanguageProfileQueryLinks
    on QueryBuilder<LanguageProfile, LanguageProfile, QFilterCondition> {}

extension LanguageProfileQuerySortBy
    on QueryBuilder<LanguageProfile, LanguageProfile, QSortBy> {
  QueryBuilder<LanguageProfile, LanguageProfile, QAfterSortBy>
  sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<LanguageProfile, LanguageProfile, QAfterSortBy>
  sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<LanguageProfile, LanguageProfile, QAfterSortBy> sortByDbName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dbName', Sort.asc);
    });
  }

  QueryBuilder<LanguageProfile, LanguageProfile, QAfterSortBy>
  sortByDbNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dbName', Sort.desc);
    });
  }

  QueryBuilder<LanguageProfile, LanguageProfile, QAfterSortBy>
  sortByDefaultModelName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'defaultModelName', Sort.asc);
    });
  }

  QueryBuilder<LanguageProfile, LanguageProfile, QAfterSortBy>
  sortByDefaultModelNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'defaultModelName', Sort.desc);
    });
  }

  QueryBuilder<LanguageProfile, LanguageProfile, QAfterSortBy>
  sortByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.asc);
    });
  }

  QueryBuilder<LanguageProfile, LanguageProfile, QAfterSortBy>
  sortByIsActiveDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.desc);
    });
  }

  QueryBuilder<LanguageProfile, LanguageProfile, QAfterSortBy>
  sortByLastOpenedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastOpenedAt', Sort.asc);
    });
  }

  QueryBuilder<LanguageProfile, LanguageProfile, QAfterSortBy>
  sortByLastOpenedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastOpenedAt', Sort.desc);
    });
  }

  QueryBuilder<LanguageProfile, LanguageProfile, QAfterSortBy>
  sortByReadingOptions() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'readingOptions', Sort.asc);
    });
  }

  QueryBuilder<LanguageProfile, LanguageProfile, QAfterSortBy>
  sortByReadingOptionsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'readingOptions', Sort.desc);
    });
  }

  QueryBuilder<LanguageProfile, LanguageProfile, QAfterSortBy>
  sortBySourceLang() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sourceLang', Sort.asc);
    });
  }

  QueryBuilder<LanguageProfile, LanguageProfile, QAfterSortBy>
  sortBySourceLangDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sourceLang', Sort.desc);
    });
  }

  QueryBuilder<LanguageProfile, LanguageProfile, QAfterSortBy>
  sortBySpacingOption() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'spacingOption', Sort.asc);
    });
  }

  QueryBuilder<LanguageProfile, LanguageProfile, QAfterSortBy>
  sortBySpacingOptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'spacingOption', Sort.desc);
    });
  }

  QueryBuilder<LanguageProfile, LanguageProfile, QAfterSortBy>
  sortByTargetLang() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'targetLang', Sort.asc);
    });
  }

  QueryBuilder<LanguageProfile, LanguageProfile, QAfterSortBy>
  sortByTargetLangDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'targetLang', Sort.desc);
    });
  }

  QueryBuilder<LanguageProfile, LanguageProfile, QAfterSortBy>
  sortByTokenizationMethod() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tokenizationMethod', Sort.asc);
    });
  }

  QueryBuilder<LanguageProfile, LanguageProfile, QAfterSortBy>
  sortByTokenizationMethodDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tokenizationMethod', Sort.desc);
    });
  }
}

extension LanguageProfileQuerySortThenBy
    on QueryBuilder<LanguageProfile, LanguageProfile, QSortThenBy> {
  QueryBuilder<LanguageProfile, LanguageProfile, QAfterSortBy>
  thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<LanguageProfile, LanguageProfile, QAfterSortBy>
  thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<LanguageProfile, LanguageProfile, QAfterSortBy> thenByDbName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dbName', Sort.asc);
    });
  }

  QueryBuilder<LanguageProfile, LanguageProfile, QAfterSortBy>
  thenByDbNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dbName', Sort.desc);
    });
  }

  QueryBuilder<LanguageProfile, LanguageProfile, QAfterSortBy>
  thenByDefaultModelName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'defaultModelName', Sort.asc);
    });
  }

  QueryBuilder<LanguageProfile, LanguageProfile, QAfterSortBy>
  thenByDefaultModelNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'defaultModelName', Sort.desc);
    });
  }

  QueryBuilder<LanguageProfile, LanguageProfile, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<LanguageProfile, LanguageProfile, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<LanguageProfile, LanguageProfile, QAfterSortBy>
  thenByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.asc);
    });
  }

  QueryBuilder<LanguageProfile, LanguageProfile, QAfterSortBy>
  thenByIsActiveDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.desc);
    });
  }

  QueryBuilder<LanguageProfile, LanguageProfile, QAfterSortBy>
  thenByLastOpenedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastOpenedAt', Sort.asc);
    });
  }

  QueryBuilder<LanguageProfile, LanguageProfile, QAfterSortBy>
  thenByLastOpenedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastOpenedAt', Sort.desc);
    });
  }

  QueryBuilder<LanguageProfile, LanguageProfile, QAfterSortBy>
  thenByReadingOptions() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'readingOptions', Sort.asc);
    });
  }

  QueryBuilder<LanguageProfile, LanguageProfile, QAfterSortBy>
  thenByReadingOptionsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'readingOptions', Sort.desc);
    });
  }

  QueryBuilder<LanguageProfile, LanguageProfile, QAfterSortBy>
  thenBySourceLang() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sourceLang', Sort.asc);
    });
  }

  QueryBuilder<LanguageProfile, LanguageProfile, QAfterSortBy>
  thenBySourceLangDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sourceLang', Sort.desc);
    });
  }

  QueryBuilder<LanguageProfile, LanguageProfile, QAfterSortBy>
  thenBySpacingOption() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'spacingOption', Sort.asc);
    });
  }

  QueryBuilder<LanguageProfile, LanguageProfile, QAfterSortBy>
  thenBySpacingOptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'spacingOption', Sort.desc);
    });
  }

  QueryBuilder<LanguageProfile, LanguageProfile, QAfterSortBy>
  thenByTargetLang() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'targetLang', Sort.asc);
    });
  }

  QueryBuilder<LanguageProfile, LanguageProfile, QAfterSortBy>
  thenByTargetLangDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'targetLang', Sort.desc);
    });
  }

  QueryBuilder<LanguageProfile, LanguageProfile, QAfterSortBy>
  thenByTokenizationMethod() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tokenizationMethod', Sort.asc);
    });
  }

  QueryBuilder<LanguageProfile, LanguageProfile, QAfterSortBy>
  thenByTokenizationMethodDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tokenizationMethod', Sort.desc);
    });
  }
}

extension LanguageProfileQueryWhereDistinct
    on QueryBuilder<LanguageProfile, LanguageProfile, QDistinct> {
  QueryBuilder<LanguageProfile, LanguageProfile, QDistinct>
  distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<LanguageProfile, LanguageProfile, QDistinct> distinctByDbName({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dbName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<LanguageProfile, LanguageProfile, QDistinct>
  distinctByDefaultModelName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(
        r'defaultModelName',
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<LanguageProfile, LanguageProfile, QDistinct>
  distinctByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isActive');
    });
  }

  QueryBuilder<LanguageProfile, LanguageProfile, QDistinct>
  distinctByLastOpenedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastOpenedAt');
    });
  }

  QueryBuilder<LanguageProfile, LanguageProfile, QDistinct>
  distinctByReadingOptions({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(
        r'readingOptions',
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<LanguageProfile, LanguageProfile, QDistinct>
  distinctBySourceLang({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'sourceLang', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<LanguageProfile, LanguageProfile, QDistinct>
  distinctBySpacingOption({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(
        r'spacingOption',
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<LanguageProfile, LanguageProfile, QDistinct>
  distinctByTargetLang({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'targetLang', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<LanguageProfile, LanguageProfile, QDistinct>
  distinctByTokenizationMethod({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(
        r'tokenizationMethod',
        caseSensitive: caseSensitive,
      );
    });
  }
}

extension LanguageProfileQueryProperty
    on QueryBuilder<LanguageProfile, LanguageProfile, QQueryProperty> {
  QueryBuilder<LanguageProfile, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<LanguageProfile, DateTime?, QQueryOperations>
  createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<LanguageProfile, String?, QQueryOperations> dbNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dbName');
    });
  }

  QueryBuilder<LanguageProfile, String?, QQueryOperations>
  defaultModelNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'defaultModelName');
    });
  }

  QueryBuilder<LanguageProfile, bool, QQueryOperations> isActiveProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isActive');
    });
  }

  QueryBuilder<LanguageProfile, DateTime?, QQueryOperations>
  lastOpenedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastOpenedAt');
    });
  }

  QueryBuilder<LanguageProfile, String?, QQueryOperations>
  readingOptionsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'readingOptions');
    });
  }

  QueryBuilder<LanguageProfile, String?, QQueryOperations>
  sourceLangProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'sourceLang');
    });
  }

  QueryBuilder<LanguageProfile, String?, QQueryOperations>
  spacingOptionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'spacingOption');
    });
  }

  QueryBuilder<LanguageProfile, String?, QQueryOperations>
  targetLangProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'targetLang');
    });
  }

  QueryBuilder<LanguageProfile, String?, QQueryOperations>
  tokenizationMethodProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'tokenizationMethod');
    });
  }
}

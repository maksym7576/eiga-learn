// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'step_model_preference.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetStepModelPreferenceCollection on Isar {
  IsarCollection<StepModelPreference> get stepModelPreferences =>
      this.collection();
}

const StepModelPreferenceSchema = CollectionSchema(
  name: r'StepModelPreference',
  id: -3547894738701540534,
  properties: {
    r'isAuto': PropertySchema(id: 0, name: r'isAuto', type: IsarType.bool),
    r'modelName': PropertySchema(
      id: 1,
      name: r'modelName',
      type: IsarType.string,
    ),
    r'stepId': PropertySchema(id: 2, name: r'stepId', type: IsarType.string),
  },

  estimateSize: _stepModelPreferenceEstimateSize,
  serialize: _stepModelPreferenceSerialize,
  deserialize: _stepModelPreferenceDeserialize,
  deserializeProp: _stepModelPreferenceDeserializeProp,
  idName: r'id',
  indexes: {
    r'stepId': IndexSchema(
      id: 8514370192842249260,
      name: r'stepId',
      unique: true,
      replace: true,
      properties: [
        IndexPropertySchema(
          name: r'stepId',
          type: IndexType.hash,
          caseSensitive: true,
        ),
      ],
    ),
  },
  links: {},
  embeddedSchemas: {},

  getId: _stepModelPreferenceGetId,
  getLinks: _stepModelPreferenceGetLinks,
  attach: _stepModelPreferenceAttach,
  version: '3.3.2',
);

int _stepModelPreferenceEstimateSize(
  StepModelPreference object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.modelName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.stepId.length * 3;
  return bytesCount;
}

void _stepModelPreferenceSerialize(
  StepModelPreference object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeBool(offsets[0], object.isAuto);
  writer.writeString(offsets[1], object.modelName);
  writer.writeString(offsets[2], object.stepId);
}

StepModelPreference _stepModelPreferenceDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = StepModelPreference();
  object.id = id;
  object.isAuto = reader.readBool(offsets[0]);
  object.modelName = reader.readStringOrNull(offsets[1]);
  object.stepId = reader.readString(offsets[2]);
  return object;
}

P _stepModelPreferenceDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readBool(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _stepModelPreferenceGetId(StepModelPreference object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _stepModelPreferenceGetLinks(
  StepModelPreference object,
) {
  return [];
}

void _stepModelPreferenceAttach(
  IsarCollection<dynamic> col,
  Id id,
  StepModelPreference object,
) {
  object.id = id;
}

extension StepModelPreferenceByIndex on IsarCollection<StepModelPreference> {
  Future<StepModelPreference?> getByStepId(String stepId) {
    return getByIndex(r'stepId', [stepId]);
  }

  StepModelPreference? getByStepIdSync(String stepId) {
    return getByIndexSync(r'stepId', [stepId]);
  }

  Future<bool> deleteByStepId(String stepId) {
    return deleteByIndex(r'stepId', [stepId]);
  }

  bool deleteByStepIdSync(String stepId) {
    return deleteByIndexSync(r'stepId', [stepId]);
  }

  Future<List<StepModelPreference?>> getAllByStepId(List<String> stepIdValues) {
    final values = stepIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'stepId', values);
  }

  List<StepModelPreference?> getAllByStepIdSync(List<String> stepIdValues) {
    final values = stepIdValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'stepId', values);
  }

  Future<int> deleteAllByStepId(List<String> stepIdValues) {
    final values = stepIdValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'stepId', values);
  }

  int deleteAllByStepIdSync(List<String> stepIdValues) {
    final values = stepIdValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'stepId', values);
  }

  Future<Id> putByStepId(StepModelPreference object) {
    return putByIndex(r'stepId', object);
  }

  Id putByStepIdSync(StepModelPreference object, {bool saveLinks = true}) {
    return putByIndexSync(r'stepId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByStepId(List<StepModelPreference> objects) {
    return putAllByIndex(r'stepId', objects);
  }

  List<Id> putAllByStepIdSync(
    List<StepModelPreference> objects, {
    bool saveLinks = true,
  }) {
    return putAllByIndexSync(r'stepId', objects, saveLinks: saveLinks);
  }
}

extension StepModelPreferenceQueryWhereSort
    on QueryBuilder<StepModelPreference, StepModelPreference, QWhere> {
  QueryBuilder<StepModelPreference, StepModelPreference, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension StepModelPreferenceQueryWhere
    on QueryBuilder<StepModelPreference, StepModelPreference, QWhereClause> {
  QueryBuilder<StepModelPreference, StepModelPreference, QAfterWhereClause>
  idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(lower: id, upper: id));
    });
  }

  QueryBuilder<StepModelPreference, StepModelPreference, QAfterWhereClause>
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

  QueryBuilder<StepModelPreference, StepModelPreference, QAfterWhereClause>
  idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<StepModelPreference, StepModelPreference, QAfterWhereClause>
  idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<StepModelPreference, StepModelPreference, QAfterWhereClause>
  idBetween(
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

  QueryBuilder<StepModelPreference, StepModelPreference, QAfterWhereClause>
  stepIdEqualTo(String stepId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'stepId', value: [stepId]),
      );
    });
  }

  QueryBuilder<StepModelPreference, StepModelPreference, QAfterWhereClause>
  stepIdNotEqualTo(String stepId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'stepId',
                lower: [],
                upper: [stepId],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'stepId',
                lower: [stepId],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'stepId',
                lower: [stepId],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'stepId',
                lower: [],
                upper: [stepId],
                includeUpper: false,
              ),
            );
      }
    });
  }
}

extension StepModelPreferenceQueryFilter
    on
        QueryBuilder<
          StepModelPreference,
          StepModelPreference,
          QFilterCondition
        > {
  QueryBuilder<StepModelPreference, StepModelPreference, QAfterFilterCondition>
  idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'id', value: value),
      );
    });
  }

  QueryBuilder<StepModelPreference, StepModelPreference, QAfterFilterCondition>
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

  QueryBuilder<StepModelPreference, StepModelPreference, QAfterFilterCondition>
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

  QueryBuilder<StepModelPreference, StepModelPreference, QAfterFilterCondition>
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

  QueryBuilder<StepModelPreference, StepModelPreference, QAfterFilterCondition>
  isAutoEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'isAuto', value: value),
      );
    });
  }

  QueryBuilder<StepModelPreference, StepModelPreference, QAfterFilterCondition>
  modelNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'modelName'),
      );
    });
  }

  QueryBuilder<StepModelPreference, StepModelPreference, QAfterFilterCondition>
  modelNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'modelName'),
      );
    });
  }

  QueryBuilder<StepModelPreference, StepModelPreference, QAfterFilterCondition>
  modelNameEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'modelName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<StepModelPreference, StepModelPreference, QAfterFilterCondition>
  modelNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'modelName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<StepModelPreference, StepModelPreference, QAfterFilterCondition>
  modelNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'modelName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<StepModelPreference, StepModelPreference, QAfterFilterCondition>
  modelNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'modelName',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<StepModelPreference, StepModelPreference, QAfterFilterCondition>
  modelNameStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'modelName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<StepModelPreference, StepModelPreference, QAfterFilterCondition>
  modelNameEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'modelName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<StepModelPreference, StepModelPreference, QAfterFilterCondition>
  modelNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'modelName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<StepModelPreference, StepModelPreference, QAfterFilterCondition>
  modelNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'modelName',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<StepModelPreference, StepModelPreference, QAfterFilterCondition>
  modelNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'modelName', value: ''),
      );
    });
  }

  QueryBuilder<StepModelPreference, StepModelPreference, QAfterFilterCondition>
  modelNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'modelName', value: ''),
      );
    });
  }

  QueryBuilder<StepModelPreference, StepModelPreference, QAfterFilterCondition>
  stepIdEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'stepId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<StepModelPreference, StepModelPreference, QAfterFilterCondition>
  stepIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'stepId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<StepModelPreference, StepModelPreference, QAfterFilterCondition>
  stepIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'stepId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<StepModelPreference, StepModelPreference, QAfterFilterCondition>
  stepIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'stepId',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<StepModelPreference, StepModelPreference, QAfterFilterCondition>
  stepIdStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'stepId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<StepModelPreference, StepModelPreference, QAfterFilterCondition>
  stepIdEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'stepId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<StepModelPreference, StepModelPreference, QAfterFilterCondition>
  stepIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'stepId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<StepModelPreference, StepModelPreference, QAfterFilterCondition>
  stepIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'stepId',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<StepModelPreference, StepModelPreference, QAfterFilterCondition>
  stepIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'stepId', value: ''),
      );
    });
  }

  QueryBuilder<StepModelPreference, StepModelPreference, QAfterFilterCondition>
  stepIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'stepId', value: ''),
      );
    });
  }
}

extension StepModelPreferenceQueryObject
    on
        QueryBuilder<
          StepModelPreference,
          StepModelPreference,
          QFilterCondition
        > {}

extension StepModelPreferenceQueryLinks
    on
        QueryBuilder<
          StepModelPreference,
          StepModelPreference,
          QFilterCondition
        > {}

extension StepModelPreferenceQuerySortBy
    on QueryBuilder<StepModelPreference, StepModelPreference, QSortBy> {
  QueryBuilder<StepModelPreference, StepModelPreference, QAfterSortBy>
  sortByIsAuto() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isAuto', Sort.asc);
    });
  }

  QueryBuilder<StepModelPreference, StepModelPreference, QAfterSortBy>
  sortByIsAutoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isAuto', Sort.desc);
    });
  }

  QueryBuilder<StepModelPreference, StepModelPreference, QAfterSortBy>
  sortByModelName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'modelName', Sort.asc);
    });
  }

  QueryBuilder<StepModelPreference, StepModelPreference, QAfterSortBy>
  sortByModelNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'modelName', Sort.desc);
    });
  }

  QueryBuilder<StepModelPreference, StepModelPreference, QAfterSortBy>
  sortByStepId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stepId', Sort.asc);
    });
  }

  QueryBuilder<StepModelPreference, StepModelPreference, QAfterSortBy>
  sortByStepIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stepId', Sort.desc);
    });
  }
}

extension StepModelPreferenceQuerySortThenBy
    on QueryBuilder<StepModelPreference, StepModelPreference, QSortThenBy> {
  QueryBuilder<StepModelPreference, StepModelPreference, QAfterSortBy>
  thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<StepModelPreference, StepModelPreference, QAfterSortBy>
  thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<StepModelPreference, StepModelPreference, QAfterSortBy>
  thenByIsAuto() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isAuto', Sort.asc);
    });
  }

  QueryBuilder<StepModelPreference, StepModelPreference, QAfterSortBy>
  thenByIsAutoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isAuto', Sort.desc);
    });
  }

  QueryBuilder<StepModelPreference, StepModelPreference, QAfterSortBy>
  thenByModelName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'modelName', Sort.asc);
    });
  }

  QueryBuilder<StepModelPreference, StepModelPreference, QAfterSortBy>
  thenByModelNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'modelName', Sort.desc);
    });
  }

  QueryBuilder<StepModelPreference, StepModelPreference, QAfterSortBy>
  thenByStepId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stepId', Sort.asc);
    });
  }

  QueryBuilder<StepModelPreference, StepModelPreference, QAfterSortBy>
  thenByStepIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stepId', Sort.desc);
    });
  }
}

extension StepModelPreferenceQueryWhereDistinct
    on QueryBuilder<StepModelPreference, StepModelPreference, QDistinct> {
  QueryBuilder<StepModelPreference, StepModelPreference, QDistinct>
  distinctByIsAuto() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isAuto');
    });
  }

  QueryBuilder<StepModelPreference, StepModelPreference, QDistinct>
  distinctByModelName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'modelName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<StepModelPreference, StepModelPreference, QDistinct>
  distinctByStepId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'stepId', caseSensitive: caseSensitive);
    });
  }
}

extension StepModelPreferenceQueryProperty
    on QueryBuilder<StepModelPreference, StepModelPreference, QQueryProperty> {
  QueryBuilder<StepModelPreference, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<StepModelPreference, bool, QQueryOperations> isAutoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isAuto');
    });
  }

  QueryBuilder<StepModelPreference, String?, QQueryOperations>
  modelNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'modelName');
    });
  }

  QueryBuilder<StepModelPreference, String, QQueryOperations> stepIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'stepId');
    });
  }
}

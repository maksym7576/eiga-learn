// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'score_components.dart';

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const ScoreComponentsSchema = Schema(
  name: r'ScoreComponents',
  id: 1770778374593679450,
  properties: {
    r'cost': PropertySchema(id: 0, name: r'cost', type: IsarType.double),
    r'quality': PropertySchema(id: 1, name: r'quality', type: IsarType.double),
    r'reliability': PropertySchema(
      id: 2,
      name: r'reliability',
      type: IsarType.double,
    ),
    r'speed': PropertySchema(id: 3, name: r'speed', type: IsarType.double),
  },

  estimateSize: _scoreComponentsEstimateSize,
  serialize: _scoreComponentsSerialize,
  deserialize: _scoreComponentsDeserialize,
  deserializeProp: _scoreComponentsDeserializeProp,
);

int _scoreComponentsEstimateSize(
  ScoreComponents object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _scoreComponentsSerialize(
  ScoreComponents object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDouble(offsets[0], object.cost);
  writer.writeDouble(offsets[1], object.quality);
  writer.writeDouble(offsets[2], object.reliability);
  writer.writeDouble(offsets[3], object.speed);
}

ScoreComponents _scoreComponentsDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ScoreComponents();
  object.cost = reader.readDoubleOrNull(offsets[0]);
  object.quality = reader.readDoubleOrNull(offsets[1]);
  object.reliability = reader.readDoubleOrNull(offsets[2]);
  object.speed = reader.readDoubleOrNull(offsets[3]);
  return object;
}

P _scoreComponentsDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDoubleOrNull(offset)) as P;
    case 1:
      return (reader.readDoubleOrNull(offset)) as P;
    case 2:
      return (reader.readDoubleOrNull(offset)) as P;
    case 3:
      return (reader.readDoubleOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension ScoreComponentsQueryFilter
    on QueryBuilder<ScoreComponents, ScoreComponents, QFilterCondition> {
  QueryBuilder<ScoreComponents, ScoreComponents, QAfterFilterCondition>
  costIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'cost'),
      );
    });
  }

  QueryBuilder<ScoreComponents, ScoreComponents, QAfterFilterCondition>
  costIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'cost'),
      );
    });
  }

  QueryBuilder<ScoreComponents, ScoreComponents, QAfterFilterCondition>
  costEqualTo(double? value, {double epsilon = Query.epsilon}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'cost',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<ScoreComponents, ScoreComponents, QAfterFilterCondition>
  costGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'cost',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<ScoreComponents, ScoreComponents, QAfterFilterCondition>
  costLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'cost',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<ScoreComponents, ScoreComponents, QAfterFilterCondition>
  costBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'cost',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<ScoreComponents, ScoreComponents, QAfterFilterCondition>
  qualityIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'quality'),
      );
    });
  }

  QueryBuilder<ScoreComponents, ScoreComponents, QAfterFilterCondition>
  qualityIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'quality'),
      );
    });
  }

  QueryBuilder<ScoreComponents, ScoreComponents, QAfterFilterCondition>
  qualityEqualTo(double? value, {double epsilon = Query.epsilon}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'quality',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<ScoreComponents, ScoreComponents, QAfterFilterCondition>
  qualityGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'quality',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<ScoreComponents, ScoreComponents, QAfterFilterCondition>
  qualityLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'quality',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<ScoreComponents, ScoreComponents, QAfterFilterCondition>
  qualityBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'quality',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<ScoreComponents, ScoreComponents, QAfterFilterCondition>
  reliabilityIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'reliability'),
      );
    });
  }

  QueryBuilder<ScoreComponents, ScoreComponents, QAfterFilterCondition>
  reliabilityIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'reliability'),
      );
    });
  }

  QueryBuilder<ScoreComponents, ScoreComponents, QAfterFilterCondition>
  reliabilityEqualTo(double? value, {double epsilon = Query.epsilon}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'reliability',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<ScoreComponents, ScoreComponents, QAfterFilterCondition>
  reliabilityGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'reliability',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<ScoreComponents, ScoreComponents, QAfterFilterCondition>
  reliabilityLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'reliability',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<ScoreComponents, ScoreComponents, QAfterFilterCondition>
  reliabilityBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'reliability',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<ScoreComponents, ScoreComponents, QAfterFilterCondition>
  speedIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'speed'),
      );
    });
  }

  QueryBuilder<ScoreComponents, ScoreComponents, QAfterFilterCondition>
  speedIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'speed'),
      );
    });
  }

  QueryBuilder<ScoreComponents, ScoreComponents, QAfterFilterCondition>
  speedEqualTo(double? value, {double epsilon = Query.epsilon}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'speed',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<ScoreComponents, ScoreComponents, QAfterFilterCondition>
  speedGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'speed',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<ScoreComponents, ScoreComponents, QAfterFilterCondition>
  speedLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'speed',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<ScoreComponents, ScoreComponents, QAfterFilterCondition>
  speedBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'speed',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,

          epsilon: epsilon,
        ),
      );
    });
  }
}

extension ScoreComponentsQueryObject
    on QueryBuilder<ScoreComponents, ScoreComponents, QFilterCondition> {}

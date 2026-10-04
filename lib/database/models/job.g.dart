// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'job.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetJobCollection on Isar {
  IsarCollection<Job> get jobs => this.collection();
}

const JobSchema = CollectionSchema(
  name: r'Job',
  id: -5961302972855324388,
  properties: {
    r'completedSteps': PropertySchema(
      id: 0,
      name: r'completedSteps',
      type: IsarType.stringList,
    ),
    r'currentStep': PropertySchema(
      id: 1,
      name: r'currentStep',
      type: IsarType.string,
    ),
    r'errorMessage': PropertySchema(
      id: 2,
      name: r'errorMessage',
      type: IsarType.string,
    ),
    r'executionPlan': PropertySchema(
      id: 3,
      name: r'executionPlan',
      type: IsarType.stringList,
    ),
    r'finishedAt': PropertySchema(
      id: 4,
      name: r'finishedAt',
      type: IsarType.dateTime,
    ),
    r'isAuto': PropertySchema(id: 5, name: r'isAuto', type: IsarType.bool),
    r'modelName': PropertySchema(
      id: 6,
      name: r'modelName',
      type: IsarType.string,
    ),
    r'phase': PropertySchema(id: 7, name: r'phase', type: IsarType.string),
    r'phraseOrders': PropertySchema(
      id: 8,
      name: r'phraseOrders',
      type: IsarType.longList,
    ),
    r'pipelineId': PropertySchema(
      id: 9,
      name: r'pipelineId',
      type: IsarType.string,
    ),
    r'processedPhrases': PropertySchema(
      id: 10,
      name: r'processedPhrases',
      type: IsarType.long,
    ),
    r'stageProcessedPhrases': PropertySchema(
      id: 11,
      name: r'stageProcessedPhrases',
      type: IsarType.long,
    ),
    r'stageTotalPhrases': PropertySchema(
      id: 12,
      name: r'stageTotalPhrases',
      type: IsarType.long,
    ),
    r'startedAt': PropertySchema(
      id: 13,
      name: r'startedAt',
      type: IsarType.dateTime,
    ),
    r'status': PropertySchema(id: 14, name: r'status', type: IsarType.string),
    r'totalPhrases': PropertySchema(
      id: 15,
      name: r'totalPhrases',
      type: IsarType.long,
    ),
    r'videoId': PropertySchema(id: 16, name: r'videoId', type: IsarType.long),
  },

  estimateSize: _jobEstimateSize,
  serialize: _jobSerialize,
  deserialize: _jobDeserialize,
  deserializeProp: _jobDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},

  getId: _jobGetId,
  getLinks: _jobGetLinks,
  attach: _jobAttach,
  version: '3.3.2',
);

int _jobEstimateSize(
  Job object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.completedSteps.length * 3;
  {
    for (var i = 0; i < object.completedSteps.length; i++) {
      final value = object.completedSteps[i];
      bytesCount += value.length * 3;
    }
  }
  {
    final value = object.currentStep;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.errorMessage;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.executionPlan.length * 3;
  {
    for (var i = 0; i < object.executionPlan.length; i++) {
      final value = object.executionPlan[i];
      bytesCount += value.length * 3;
    }
  }
  bytesCount += 3 + object.modelName.length * 3;
  bytesCount += 3 + object.phase.length * 3;
  bytesCount += 3 + object.phraseOrders.length * 8;
  {
    final value = object.pipelineId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.status.length * 3;
  return bytesCount;
}

void _jobSerialize(
  Job object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeStringList(offsets[0], object.completedSteps);
  writer.writeString(offsets[1], object.currentStep);
  writer.writeString(offsets[2], object.errorMessage);
  writer.writeStringList(offsets[3], object.executionPlan);
  writer.writeDateTime(offsets[4], object.finishedAt);
  writer.writeBool(offsets[5], object.isAuto);
  writer.writeString(offsets[6], object.modelName);
  writer.writeString(offsets[7], object.phase);
  writer.writeLongList(offsets[8], object.phraseOrders);
  writer.writeString(offsets[9], object.pipelineId);
  writer.writeLong(offsets[10], object.processedPhrases);
  writer.writeLong(offsets[11], object.stageProcessedPhrases);
  writer.writeLong(offsets[12], object.stageTotalPhrases);
  writer.writeDateTime(offsets[13], object.startedAt);
  writer.writeString(offsets[14], object.status);
  writer.writeLong(offsets[15], object.totalPhrases);
  writer.writeLong(offsets[16], object.videoId);
}

Job _jobDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Job();
  object.completedSteps = reader.readStringList(offsets[0]) ?? [];
  object.currentStep = reader.readStringOrNull(offsets[1]);
  object.errorMessage = reader.readStringOrNull(offsets[2]);
  object.executionPlan = reader.readStringList(offsets[3]) ?? [];
  object.finishedAt = reader.readDateTimeOrNull(offsets[4]);
  object.id = id;
  object.isAuto = reader.readBool(offsets[5]);
  object.modelName = reader.readString(offsets[6]);
  object.phase = reader.readString(offsets[7]);
  object.phraseOrders = reader.readLongList(offsets[8]) ?? [];
  object.pipelineId = reader.readStringOrNull(offsets[9]);
  object.processedPhrases = reader.readLong(offsets[10]);
  object.stageProcessedPhrases = reader.readLong(offsets[11]);
  object.stageTotalPhrases = reader.readLong(offsets[12]);
  object.startedAt = reader.readDateTimeOrNull(offsets[13]);
  object.status = reader.readString(offsets[14]);
  object.totalPhrases = reader.readLong(offsets[15]);
  object.videoId = reader.readLong(offsets[16]);
  return object;
}

P _jobDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringList(offset) ?? []) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readStringList(offset) ?? []) as P;
    case 4:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 5:
      return (reader.readBool(offset)) as P;
    case 6:
      return (reader.readString(offset)) as P;
    case 7:
      return (reader.readString(offset)) as P;
    case 8:
      return (reader.readLongList(offset) ?? []) as P;
    case 9:
      return (reader.readStringOrNull(offset)) as P;
    case 10:
      return (reader.readLong(offset)) as P;
    case 11:
      return (reader.readLong(offset)) as P;
    case 12:
      return (reader.readLong(offset)) as P;
    case 13:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 14:
      return (reader.readString(offset)) as P;
    case 15:
      return (reader.readLong(offset)) as P;
    case 16:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _jobGetId(Job object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _jobGetLinks(Job object) {
  return [];
}

void _jobAttach(IsarCollection<dynamic> col, Id id, Job object) {
  object.id = id;
}

extension JobQueryWhereSort on QueryBuilder<Job, Job, QWhere> {
  QueryBuilder<Job, Job, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension JobQueryWhere on QueryBuilder<Job, Job, QWhereClause> {
  QueryBuilder<Job, Job, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(lower: id, upper: id));
    });
  }

  QueryBuilder<Job, Job, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<Job, Job, QAfterWhereClause> idGreaterThan(
    Id id, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Job, Job, QAfterWhereClause> idLessThan(
    Id id, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Job, Job, QAfterWhereClause> idBetween(
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

extension JobQueryFilter on QueryBuilder<Job, Job, QFilterCondition> {
  QueryBuilder<Job, Job, QAfterFilterCondition> completedStepsElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'completedSteps',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition>
  completedStepsElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'completedSteps',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> completedStepsElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'completedSteps',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> completedStepsElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'completedSteps',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> completedStepsElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'completedSteps',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> completedStepsElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'completedSteps',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> completedStepsElementContains(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'completedSteps',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> completedStepsElementMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'completedSteps',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> completedStepsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'completedSteps', value: ''),
      );
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition>
  completedStepsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'completedSteps', value: ''),
      );
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> completedStepsLengthEqualTo(
    int length,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'completedSteps', length, true, length, true);
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> completedStepsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'completedSteps', 0, true, 0, true);
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> completedStepsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'completedSteps', 0, false, 999999, true);
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> completedStepsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'completedSteps', 0, true, length, include);
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> completedStepsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'completedSteps', length, include, 999999, true);
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> completedStepsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'completedSteps',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> currentStepIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'currentStep'),
      );
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> currentStepIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'currentStep'),
      );
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> currentStepEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'currentStep',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> currentStepGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'currentStep',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> currentStepLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'currentStep',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> currentStepBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'currentStep',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> currentStepStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'currentStep',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> currentStepEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'currentStep',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> currentStepContains(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'currentStep',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> currentStepMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'currentStep',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> currentStepIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'currentStep', value: ''),
      );
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> currentStepIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'currentStep', value: ''),
      );
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> errorMessageIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'errorMessage'),
      );
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> errorMessageIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'errorMessage'),
      );
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> errorMessageEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'errorMessage',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> errorMessageGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'errorMessage',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> errorMessageLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'errorMessage',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> errorMessageBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'errorMessage',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> errorMessageStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'errorMessage',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> errorMessageEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'errorMessage',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> errorMessageContains(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'errorMessage',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> errorMessageMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'errorMessage',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> errorMessageIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'errorMessage', value: ''),
      );
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> errorMessageIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'errorMessage', value: ''),
      );
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> executionPlanElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'executionPlan',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> executionPlanElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'executionPlan',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> executionPlanElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'executionPlan',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> executionPlanElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'executionPlan',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> executionPlanElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'executionPlan',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> executionPlanElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'executionPlan',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> executionPlanElementContains(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'executionPlan',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> executionPlanElementMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'executionPlan',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> executionPlanElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'executionPlan', value: ''),
      );
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition>
  executionPlanElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'executionPlan', value: ''),
      );
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> executionPlanLengthEqualTo(
    int length,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'executionPlan', length, true, length, true);
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> executionPlanIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'executionPlan', 0, true, 0, true);
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> executionPlanIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'executionPlan', 0, false, 999999, true);
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> executionPlanLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'executionPlan', 0, true, length, include);
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> executionPlanLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'executionPlan', length, include, 999999, true);
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> executionPlanLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'executionPlan',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> finishedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'finishedAt'),
      );
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> finishedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'finishedAt'),
      );
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> finishedAtEqualTo(
    DateTime? value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'finishedAt', value: value),
      );
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> finishedAtGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'finishedAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> finishedAtLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'finishedAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> finishedAtBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'finishedAt',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'id', value: value),
      );
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Job, Job, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Job, Job, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Job, Job, QAfterFilterCondition> isAutoEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'isAuto', value: value),
      );
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> modelNameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
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

  QueryBuilder<Job, Job, QAfterFilterCondition> modelNameGreaterThan(
    String value, {
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

  QueryBuilder<Job, Job, QAfterFilterCondition> modelNameLessThan(
    String value, {
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

  QueryBuilder<Job, Job, QAfterFilterCondition> modelNameBetween(
    String lower,
    String upper, {
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

  QueryBuilder<Job, Job, QAfterFilterCondition> modelNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
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

  QueryBuilder<Job, Job, QAfterFilterCondition> modelNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
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

  QueryBuilder<Job, Job, QAfterFilterCondition> modelNameContains(
    String value, {
    bool caseSensitive = true,
  }) {
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

  QueryBuilder<Job, Job, QAfterFilterCondition> modelNameMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
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

  QueryBuilder<Job, Job, QAfterFilterCondition> modelNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'modelName', value: ''),
      );
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> modelNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'modelName', value: ''),
      );
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> phaseEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'phase',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> phaseGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'phase',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> phaseLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'phase',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> phaseBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'phase',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> phaseStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'phase',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> phaseEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'phase',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> phaseContains(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'phase',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> phaseMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'phase',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> phaseIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'phase', value: ''),
      );
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> phaseIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'phase', value: ''),
      );
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> phraseOrdersElementEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'phraseOrders', value: value),
      );
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> phraseOrdersElementGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'phraseOrders',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> phraseOrdersElementLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'phraseOrders',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> phraseOrdersElementBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'phraseOrders',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> phraseOrdersLengthEqualTo(
    int length,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'phraseOrders', length, true, length, true);
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> phraseOrdersIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'phraseOrders', 0, true, 0, true);
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> phraseOrdersIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'phraseOrders', 0, false, 999999, true);
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> phraseOrdersLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'phraseOrders', 0, true, length, include);
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> phraseOrdersLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'phraseOrders', length, include, 999999, true);
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> phraseOrdersLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'phraseOrders',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> pipelineIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'pipelineId'),
      );
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> pipelineIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'pipelineId'),
      );
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> pipelineIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'pipelineId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> pipelineIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'pipelineId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> pipelineIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'pipelineId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> pipelineIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'pipelineId',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> pipelineIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'pipelineId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> pipelineIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'pipelineId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> pipelineIdContains(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'pipelineId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> pipelineIdMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'pipelineId',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> pipelineIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'pipelineId', value: ''),
      );
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> pipelineIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'pipelineId', value: ''),
      );
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> processedPhrasesEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'processedPhrases', value: value),
      );
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> processedPhrasesGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'processedPhrases',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> processedPhrasesLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'processedPhrases',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> processedPhrasesBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'processedPhrases',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> stageProcessedPhrasesEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'stageProcessedPhrases',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition>
  stageProcessedPhrasesGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'stageProcessedPhrases',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> stageProcessedPhrasesLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'stageProcessedPhrases',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> stageProcessedPhrasesBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'stageProcessedPhrases',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> stageTotalPhrasesEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'stageTotalPhrases', value: value),
      );
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> stageTotalPhrasesGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'stageTotalPhrases',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> stageTotalPhrasesLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'stageTotalPhrases',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> stageTotalPhrasesBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'stageTotalPhrases',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> startedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'startedAt'),
      );
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> startedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'startedAt'),
      );
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> startedAtEqualTo(
    DateTime? value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'startedAt', value: value),
      );
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> startedAtGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'startedAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> startedAtLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'startedAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> startedAtBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'startedAt',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> statusEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
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

  QueryBuilder<Job, Job, QAfterFilterCondition> statusGreaterThan(
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

  QueryBuilder<Job, Job, QAfterFilterCondition> statusLessThan(
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

  QueryBuilder<Job, Job, QAfterFilterCondition> statusBetween(
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

  QueryBuilder<Job, Job, QAfterFilterCondition> statusStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
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

  QueryBuilder<Job, Job, QAfterFilterCondition> statusEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
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

  QueryBuilder<Job, Job, QAfterFilterCondition> statusContains(
    String value, {
    bool caseSensitive = true,
  }) {
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

  QueryBuilder<Job, Job, QAfterFilterCondition> statusMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
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

  QueryBuilder<Job, Job, QAfterFilterCondition> statusIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'status', value: ''),
      );
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> statusIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'status', value: ''),
      );
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> totalPhrasesEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'totalPhrases', value: value),
      );
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> totalPhrasesGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'totalPhrases',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> totalPhrasesLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'totalPhrases',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> totalPhrasesBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'totalPhrases',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> videoIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'videoId', value: value),
      );
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> videoIdGreaterThan(
    int value, {
    bool include = false,
  }) {
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

  QueryBuilder<Job, Job, QAfterFilterCondition> videoIdLessThan(
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

  QueryBuilder<Job, Job, QAfterFilterCondition> videoIdBetween(
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

extension JobQueryObject on QueryBuilder<Job, Job, QFilterCondition> {}

extension JobQueryLinks on QueryBuilder<Job, Job, QFilterCondition> {}

extension JobQuerySortBy on QueryBuilder<Job, Job, QSortBy> {
  QueryBuilder<Job, Job, QAfterSortBy> sortByCurrentStep() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentStep', Sort.asc);
    });
  }

  QueryBuilder<Job, Job, QAfterSortBy> sortByCurrentStepDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentStep', Sort.desc);
    });
  }

  QueryBuilder<Job, Job, QAfterSortBy> sortByErrorMessage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'errorMessage', Sort.asc);
    });
  }

  QueryBuilder<Job, Job, QAfterSortBy> sortByErrorMessageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'errorMessage', Sort.desc);
    });
  }

  QueryBuilder<Job, Job, QAfterSortBy> sortByFinishedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'finishedAt', Sort.asc);
    });
  }

  QueryBuilder<Job, Job, QAfterSortBy> sortByFinishedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'finishedAt', Sort.desc);
    });
  }

  QueryBuilder<Job, Job, QAfterSortBy> sortByIsAuto() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isAuto', Sort.asc);
    });
  }

  QueryBuilder<Job, Job, QAfterSortBy> sortByIsAutoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isAuto', Sort.desc);
    });
  }

  QueryBuilder<Job, Job, QAfterSortBy> sortByModelName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'modelName', Sort.asc);
    });
  }

  QueryBuilder<Job, Job, QAfterSortBy> sortByModelNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'modelName', Sort.desc);
    });
  }

  QueryBuilder<Job, Job, QAfterSortBy> sortByPhase() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'phase', Sort.asc);
    });
  }

  QueryBuilder<Job, Job, QAfterSortBy> sortByPhaseDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'phase', Sort.desc);
    });
  }

  QueryBuilder<Job, Job, QAfterSortBy> sortByPipelineId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pipelineId', Sort.asc);
    });
  }

  QueryBuilder<Job, Job, QAfterSortBy> sortByPipelineIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pipelineId', Sort.desc);
    });
  }

  QueryBuilder<Job, Job, QAfterSortBy> sortByProcessedPhrases() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'processedPhrases', Sort.asc);
    });
  }

  QueryBuilder<Job, Job, QAfterSortBy> sortByProcessedPhrasesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'processedPhrases', Sort.desc);
    });
  }

  QueryBuilder<Job, Job, QAfterSortBy> sortByStageProcessedPhrases() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stageProcessedPhrases', Sort.asc);
    });
  }

  QueryBuilder<Job, Job, QAfterSortBy> sortByStageProcessedPhrasesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stageProcessedPhrases', Sort.desc);
    });
  }

  QueryBuilder<Job, Job, QAfterSortBy> sortByStageTotalPhrases() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stageTotalPhrases', Sort.asc);
    });
  }

  QueryBuilder<Job, Job, QAfterSortBy> sortByStageTotalPhrasesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stageTotalPhrases', Sort.desc);
    });
  }

  QueryBuilder<Job, Job, QAfterSortBy> sortByStartedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startedAt', Sort.asc);
    });
  }

  QueryBuilder<Job, Job, QAfterSortBy> sortByStartedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startedAt', Sort.desc);
    });
  }

  QueryBuilder<Job, Job, QAfterSortBy> sortByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<Job, Job, QAfterSortBy> sortByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<Job, Job, QAfterSortBy> sortByTotalPhrases() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalPhrases', Sort.asc);
    });
  }

  QueryBuilder<Job, Job, QAfterSortBy> sortByTotalPhrasesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalPhrases', Sort.desc);
    });
  }

  QueryBuilder<Job, Job, QAfterSortBy> sortByVideoId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'videoId', Sort.asc);
    });
  }

  QueryBuilder<Job, Job, QAfterSortBy> sortByVideoIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'videoId', Sort.desc);
    });
  }
}

extension JobQuerySortThenBy on QueryBuilder<Job, Job, QSortThenBy> {
  QueryBuilder<Job, Job, QAfterSortBy> thenByCurrentStep() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentStep', Sort.asc);
    });
  }

  QueryBuilder<Job, Job, QAfterSortBy> thenByCurrentStepDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentStep', Sort.desc);
    });
  }

  QueryBuilder<Job, Job, QAfterSortBy> thenByErrorMessage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'errorMessage', Sort.asc);
    });
  }

  QueryBuilder<Job, Job, QAfterSortBy> thenByErrorMessageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'errorMessage', Sort.desc);
    });
  }

  QueryBuilder<Job, Job, QAfterSortBy> thenByFinishedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'finishedAt', Sort.asc);
    });
  }

  QueryBuilder<Job, Job, QAfterSortBy> thenByFinishedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'finishedAt', Sort.desc);
    });
  }

  QueryBuilder<Job, Job, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Job, Job, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Job, Job, QAfterSortBy> thenByIsAuto() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isAuto', Sort.asc);
    });
  }

  QueryBuilder<Job, Job, QAfterSortBy> thenByIsAutoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isAuto', Sort.desc);
    });
  }

  QueryBuilder<Job, Job, QAfterSortBy> thenByModelName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'modelName', Sort.asc);
    });
  }

  QueryBuilder<Job, Job, QAfterSortBy> thenByModelNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'modelName', Sort.desc);
    });
  }

  QueryBuilder<Job, Job, QAfterSortBy> thenByPhase() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'phase', Sort.asc);
    });
  }

  QueryBuilder<Job, Job, QAfterSortBy> thenByPhaseDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'phase', Sort.desc);
    });
  }

  QueryBuilder<Job, Job, QAfterSortBy> thenByPipelineId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pipelineId', Sort.asc);
    });
  }

  QueryBuilder<Job, Job, QAfterSortBy> thenByPipelineIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pipelineId', Sort.desc);
    });
  }

  QueryBuilder<Job, Job, QAfterSortBy> thenByProcessedPhrases() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'processedPhrases', Sort.asc);
    });
  }

  QueryBuilder<Job, Job, QAfterSortBy> thenByProcessedPhrasesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'processedPhrases', Sort.desc);
    });
  }

  QueryBuilder<Job, Job, QAfterSortBy> thenByStageProcessedPhrases() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stageProcessedPhrases', Sort.asc);
    });
  }

  QueryBuilder<Job, Job, QAfterSortBy> thenByStageProcessedPhrasesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stageProcessedPhrases', Sort.desc);
    });
  }

  QueryBuilder<Job, Job, QAfterSortBy> thenByStageTotalPhrases() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stageTotalPhrases', Sort.asc);
    });
  }

  QueryBuilder<Job, Job, QAfterSortBy> thenByStageTotalPhrasesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stageTotalPhrases', Sort.desc);
    });
  }

  QueryBuilder<Job, Job, QAfterSortBy> thenByStartedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startedAt', Sort.asc);
    });
  }

  QueryBuilder<Job, Job, QAfterSortBy> thenByStartedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startedAt', Sort.desc);
    });
  }

  QueryBuilder<Job, Job, QAfterSortBy> thenByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<Job, Job, QAfterSortBy> thenByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<Job, Job, QAfterSortBy> thenByTotalPhrases() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalPhrases', Sort.asc);
    });
  }

  QueryBuilder<Job, Job, QAfterSortBy> thenByTotalPhrasesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalPhrases', Sort.desc);
    });
  }

  QueryBuilder<Job, Job, QAfterSortBy> thenByVideoId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'videoId', Sort.asc);
    });
  }

  QueryBuilder<Job, Job, QAfterSortBy> thenByVideoIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'videoId', Sort.desc);
    });
  }
}

extension JobQueryWhereDistinct on QueryBuilder<Job, Job, QDistinct> {
  QueryBuilder<Job, Job, QDistinct> distinctByCompletedSteps() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'completedSteps');
    });
  }

  QueryBuilder<Job, Job, QDistinct> distinctByCurrentStep({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'currentStep', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Job, Job, QDistinct> distinctByErrorMessage({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'errorMessage', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Job, Job, QDistinct> distinctByExecutionPlan() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'executionPlan');
    });
  }

  QueryBuilder<Job, Job, QDistinct> distinctByFinishedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'finishedAt');
    });
  }

  QueryBuilder<Job, Job, QDistinct> distinctByIsAuto() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isAuto');
    });
  }

  QueryBuilder<Job, Job, QDistinct> distinctByModelName({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'modelName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Job, Job, QDistinct> distinctByPhase({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'phase', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Job, Job, QDistinct> distinctByPhraseOrders() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'phraseOrders');
    });
  }

  QueryBuilder<Job, Job, QDistinct> distinctByPipelineId({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'pipelineId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Job, Job, QDistinct> distinctByProcessedPhrases() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'processedPhrases');
    });
  }

  QueryBuilder<Job, Job, QDistinct> distinctByStageProcessedPhrases() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'stageProcessedPhrases');
    });
  }

  QueryBuilder<Job, Job, QDistinct> distinctByStageTotalPhrases() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'stageTotalPhrases');
    });
  }

  QueryBuilder<Job, Job, QDistinct> distinctByStartedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'startedAt');
    });
  }

  QueryBuilder<Job, Job, QDistinct> distinctByStatus({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'status', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Job, Job, QDistinct> distinctByTotalPhrases() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalPhrases');
    });
  }

  QueryBuilder<Job, Job, QDistinct> distinctByVideoId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'videoId');
    });
  }
}

extension JobQueryProperty on QueryBuilder<Job, Job, QQueryProperty> {
  QueryBuilder<Job, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Job, List<String>, QQueryOperations> completedStepsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'completedSteps');
    });
  }

  QueryBuilder<Job, String?, QQueryOperations> currentStepProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'currentStep');
    });
  }

  QueryBuilder<Job, String?, QQueryOperations> errorMessageProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'errorMessage');
    });
  }

  QueryBuilder<Job, List<String>, QQueryOperations> executionPlanProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'executionPlan');
    });
  }

  QueryBuilder<Job, DateTime?, QQueryOperations> finishedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'finishedAt');
    });
  }

  QueryBuilder<Job, bool, QQueryOperations> isAutoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isAuto');
    });
  }

  QueryBuilder<Job, String, QQueryOperations> modelNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'modelName');
    });
  }

  QueryBuilder<Job, String, QQueryOperations> phaseProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'phase');
    });
  }

  QueryBuilder<Job, List<int>, QQueryOperations> phraseOrdersProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'phraseOrders');
    });
  }

  QueryBuilder<Job, String?, QQueryOperations> pipelineIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'pipelineId');
    });
  }

  QueryBuilder<Job, int, QQueryOperations> processedPhrasesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'processedPhrases');
    });
  }

  QueryBuilder<Job, int, QQueryOperations> stageProcessedPhrasesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'stageProcessedPhrases');
    });
  }

  QueryBuilder<Job, int, QQueryOperations> stageTotalPhrasesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'stageTotalPhrases');
    });
  }

  QueryBuilder<Job, DateTime?, QQueryOperations> startedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'startedAt');
    });
  }

  QueryBuilder<Job, String, QQueryOperations> statusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'status');
    });
  }

  QueryBuilder<Job, int, QQueryOperations> totalPhrasesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalPhrases');
    });
  }

  QueryBuilder<Job, int, QQueryOperations> videoIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'videoId');
    });
  }
}

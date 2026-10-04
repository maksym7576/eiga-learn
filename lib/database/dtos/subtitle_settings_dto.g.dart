// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subtitle_settings_dto.dart';

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const SubtitleSettingsDtoSchema = Schema(
  name: r'SubtitleSettingsDto',
  id: 9186262107492554115,
  properties: {
    r'additionalScaleFs': PropertySchema(
      id: 0,
      name: r'additionalScaleFs',
      type: IsarType.double,
    ),
    r'additionalScaleWin': PropertySchema(
      id: 1,
      name: r'additionalScaleWin',
      type: IsarType.double,
    ),
    r'backdropOpacity': PropertySchema(
      id: 2,
      name: r'backdropOpacity',
      type: IsarType.double,
    ),
    r'backdropPadding': PropertySchema(
      id: 3,
      name: r'backdropPadding',
      type: IsarType.double,
    ),
    r'fontSize': PropertySchema(
      id: 4,
      name: r'fontSize',
      type: IsarType.double,
    ),
    r'fontWeightFs': PropertySchema(
      id: 5,
      name: r'fontWeightFs',
      type: IsarType.double,
    ),
    r'fontWeightWin': PropertySchema(
      id: 6,
      name: r'fontWeightWin',
      type: IsarType.double,
    ),
    r'globalOutlineWidthFs': PropertySchema(
      id: 7,
      name: r'globalOutlineWidthFs',
      type: IsarType.double,
    ),
    r'letterSpacingFs': PropertySchema(
      id: 8,
      name: r'letterSpacingFs',
      type: IsarType.double,
    ),
    r'letterSpacingWin': PropertySchema(
      id: 9,
      name: r'letterSpacingWin',
      type: IsarType.double,
    ),
    r'originalOutlineWidthFs': PropertySchema(
      id: 10,
      name: r'originalOutlineWidthFs',
      type: IsarType.double,
    ),
    r'originalScaleFs': PropertySchema(
      id: 11,
      name: r'originalScaleFs',
      type: IsarType.double,
    ),
    r'originalScaleWin': PropertySchema(
      id: 12,
      name: r'originalScaleWin',
      type: IsarType.double,
    ),
    r'originalToAdditionalSpacingFs': PropertySchema(
      id: 13,
      name: r'originalToAdditionalSpacingFs',
      type: IsarType.double,
    ),
    r'originalToTranslationSpacingFs': PropertySchema(
      id: 14,
      name: r'originalToTranslationSpacingFs',
      type: IsarType.double,
    ),
    r'outlineWidth': PropertySchema(
      id: 15,
      name: r'outlineWidth',
      type: IsarType.double,
    ),
    r'showBackdrop': PropertySchema(
      id: 16,
      name: r'showBackdrop',
      type: IsarType.bool,
    ),
    r'translationLetterSpacingFs': PropertySchema(
      id: 17,
      name: r'translationLetterSpacingFs',
      type: IsarType.double,
    ),
    r'translationLetterSpacingWin': PropertySchema(
      id: 18,
      name: r'translationLetterSpacingWin',
      type: IsarType.double,
    ),
    r'translationOutlineWidthFs': PropertySchema(
      id: 19,
      name: r'translationOutlineWidthFs',
      type: IsarType.double,
    ),
    r'translationScaleFs': PropertySchema(
      id: 20,
      name: r'translationScaleFs',
      type: IsarType.double,
    ),
    r'translationScaleWin': PropertySchema(
      id: 21,
      name: r'translationScaleWin',
      type: IsarType.double,
    ),
    r'verticalOffset': PropertySchema(
      id: 22,
      name: r'verticalOffset',
      type: IsarType.double,
    ),
    r'windowedFontSize': PropertySchema(
      id: 23,
      name: r'windowedFontSize',
      type: IsarType.double,
    ),
  },

  estimateSize: _subtitleSettingsDtoEstimateSize,
  serialize: _subtitleSettingsDtoSerialize,
  deserialize: _subtitleSettingsDtoDeserialize,
  deserializeProp: _subtitleSettingsDtoDeserializeProp,
);

int _subtitleSettingsDtoEstimateSize(
  SubtitleSettingsDto object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _subtitleSettingsDtoSerialize(
  SubtitleSettingsDto object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDouble(offsets[0], object.additionalScaleFs);
  writer.writeDouble(offsets[1], object.additionalScaleWin);
  writer.writeDouble(offsets[2], object.backdropOpacity);
  writer.writeDouble(offsets[3], object.backdropPadding);
  writer.writeDouble(offsets[4], object.fontSize);
  writer.writeDouble(offsets[5], object.fontWeightFs);
  writer.writeDouble(offsets[6], object.fontWeightWin);
  writer.writeDouble(offsets[7], object.globalOutlineWidthFs);
  writer.writeDouble(offsets[8], object.letterSpacingFs);
  writer.writeDouble(offsets[9], object.letterSpacingWin);
  writer.writeDouble(offsets[10], object.originalOutlineWidthFs);
  writer.writeDouble(offsets[11], object.originalScaleFs);
  writer.writeDouble(offsets[12], object.originalScaleWin);
  writer.writeDouble(offsets[13], object.originalToAdditionalSpacingFs);
  writer.writeDouble(offsets[14], object.originalToTranslationSpacingFs);
  writer.writeDouble(offsets[15], object.outlineWidth);
  writer.writeBool(offsets[16], object.showBackdrop);
  writer.writeDouble(offsets[17], object.translationLetterSpacingFs);
  writer.writeDouble(offsets[18], object.translationLetterSpacingWin);
  writer.writeDouble(offsets[19], object.translationOutlineWidthFs);
  writer.writeDouble(offsets[20], object.translationScaleFs);
  writer.writeDouble(offsets[21], object.translationScaleWin);
  writer.writeDouble(offsets[22], object.verticalOffset);
  writer.writeDouble(offsets[23], object.windowedFontSize);
}

SubtitleSettingsDto _subtitleSettingsDtoDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = SubtitleSettingsDto();
  object.additionalScaleFs = reader.readDouble(offsets[0]);
  object.additionalScaleWin = reader.readDouble(offsets[1]);
  object.backdropOpacity = reader.readDouble(offsets[2]);
  object.backdropPadding = reader.readDouble(offsets[3]);
  object.fontSize = reader.readDouble(offsets[4]);
  object.fontWeightFs = reader.readDouble(offsets[5]);
  object.fontWeightWin = reader.readDouble(offsets[6]);
  object.globalOutlineWidthFs = reader.readDouble(offsets[7]);
  object.letterSpacingFs = reader.readDouble(offsets[8]);
  object.letterSpacingWin = reader.readDouble(offsets[9]);
  object.originalOutlineWidthFs = reader.readDouble(offsets[10]);
  object.originalScaleFs = reader.readDouble(offsets[11]);
  object.originalScaleWin = reader.readDouble(offsets[12]);
  object.originalToAdditionalSpacingFs = reader.readDouble(offsets[13]);
  object.originalToTranslationSpacingFs = reader.readDouble(offsets[14]);
  object.outlineWidth = reader.readDouble(offsets[15]);
  object.showBackdrop = reader.readBool(offsets[16]);
  object.translationLetterSpacingFs = reader.readDouble(offsets[17]);
  object.translationLetterSpacingWin = reader.readDouble(offsets[18]);
  object.translationOutlineWidthFs = reader.readDouble(offsets[19]);
  object.translationScaleFs = reader.readDouble(offsets[20]);
  object.translationScaleWin = reader.readDouble(offsets[21]);
  object.verticalOffset = reader.readDouble(offsets[22]);
  object.windowedFontSize = reader.readDouble(offsets[23]);
  return object;
}

P _subtitleSettingsDtoDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDouble(offset)) as P;
    case 1:
      return (reader.readDouble(offset)) as P;
    case 2:
      return (reader.readDouble(offset)) as P;
    case 3:
      return (reader.readDouble(offset)) as P;
    case 4:
      return (reader.readDouble(offset)) as P;
    case 5:
      return (reader.readDouble(offset)) as P;
    case 6:
      return (reader.readDouble(offset)) as P;
    case 7:
      return (reader.readDouble(offset)) as P;
    case 8:
      return (reader.readDouble(offset)) as P;
    case 9:
      return (reader.readDouble(offset)) as P;
    case 10:
      return (reader.readDouble(offset)) as P;
    case 11:
      return (reader.readDouble(offset)) as P;
    case 12:
      return (reader.readDouble(offset)) as P;
    case 13:
      return (reader.readDouble(offset)) as P;
    case 14:
      return (reader.readDouble(offset)) as P;
    case 15:
      return (reader.readDouble(offset)) as P;
    case 16:
      return (reader.readBool(offset)) as P;
    case 17:
      return (reader.readDouble(offset)) as P;
    case 18:
      return (reader.readDouble(offset)) as P;
    case 19:
      return (reader.readDouble(offset)) as P;
    case 20:
      return (reader.readDouble(offset)) as P;
    case 21:
      return (reader.readDouble(offset)) as P;
    case 22:
      return (reader.readDouble(offset)) as P;
    case 23:
      return (reader.readDouble(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension SubtitleSettingsDtoQueryFilter
    on
        QueryBuilder<
          SubtitleSettingsDto,
          SubtitleSettingsDto,
          QFilterCondition
        > {
  QueryBuilder<SubtitleSettingsDto, SubtitleSettingsDto, QAfterFilterCondition>
  additionalScaleFsEqualTo(double value, {double epsilon = Query.epsilon}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'additionalScaleFs',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<SubtitleSettingsDto, SubtitleSettingsDto, QAfterFilterCondition>
  additionalScaleFsGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'additionalScaleFs',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<SubtitleSettingsDto, SubtitleSettingsDto, QAfterFilterCondition>
  additionalScaleFsLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'additionalScaleFs',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<SubtitleSettingsDto, SubtitleSettingsDto, QAfterFilterCondition>
  additionalScaleFsBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'additionalScaleFs',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<SubtitleSettingsDto, SubtitleSettingsDto, QAfterFilterCondition>
  additionalScaleWinEqualTo(double value, {double epsilon = Query.epsilon}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'additionalScaleWin',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<SubtitleSettingsDto, SubtitleSettingsDto, QAfterFilterCondition>
  additionalScaleWinGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'additionalScaleWin',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<SubtitleSettingsDto, SubtitleSettingsDto, QAfterFilterCondition>
  additionalScaleWinLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'additionalScaleWin',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<SubtitleSettingsDto, SubtitleSettingsDto, QAfterFilterCondition>
  additionalScaleWinBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'additionalScaleWin',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<SubtitleSettingsDto, SubtitleSettingsDto, QAfterFilterCondition>
  backdropOpacityEqualTo(double value, {double epsilon = Query.epsilon}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'backdropOpacity',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<SubtitleSettingsDto, SubtitleSettingsDto, QAfterFilterCondition>
  backdropOpacityGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'backdropOpacity',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<SubtitleSettingsDto, SubtitleSettingsDto, QAfterFilterCondition>
  backdropOpacityLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'backdropOpacity',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<SubtitleSettingsDto, SubtitleSettingsDto, QAfterFilterCondition>
  backdropOpacityBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'backdropOpacity',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<SubtitleSettingsDto, SubtitleSettingsDto, QAfterFilterCondition>
  backdropPaddingEqualTo(double value, {double epsilon = Query.epsilon}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'backdropPadding',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<SubtitleSettingsDto, SubtitleSettingsDto, QAfterFilterCondition>
  backdropPaddingGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'backdropPadding',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<SubtitleSettingsDto, SubtitleSettingsDto, QAfterFilterCondition>
  backdropPaddingLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'backdropPadding',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<SubtitleSettingsDto, SubtitleSettingsDto, QAfterFilterCondition>
  backdropPaddingBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'backdropPadding',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<SubtitleSettingsDto, SubtitleSettingsDto, QAfterFilterCondition>
  fontSizeEqualTo(double value, {double epsilon = Query.epsilon}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'fontSize',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<SubtitleSettingsDto, SubtitleSettingsDto, QAfterFilterCondition>
  fontSizeGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'fontSize',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<SubtitleSettingsDto, SubtitleSettingsDto, QAfterFilterCondition>
  fontSizeLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'fontSize',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<SubtitleSettingsDto, SubtitleSettingsDto, QAfterFilterCondition>
  fontSizeBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'fontSize',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<SubtitleSettingsDto, SubtitleSettingsDto, QAfterFilterCondition>
  fontWeightFsEqualTo(double value, {double epsilon = Query.epsilon}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'fontWeightFs',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<SubtitleSettingsDto, SubtitleSettingsDto, QAfterFilterCondition>
  fontWeightFsGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'fontWeightFs',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<SubtitleSettingsDto, SubtitleSettingsDto, QAfterFilterCondition>
  fontWeightFsLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'fontWeightFs',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<SubtitleSettingsDto, SubtitleSettingsDto, QAfterFilterCondition>
  fontWeightFsBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'fontWeightFs',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<SubtitleSettingsDto, SubtitleSettingsDto, QAfterFilterCondition>
  fontWeightWinEqualTo(double value, {double epsilon = Query.epsilon}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'fontWeightWin',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<SubtitleSettingsDto, SubtitleSettingsDto, QAfterFilterCondition>
  fontWeightWinGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'fontWeightWin',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<SubtitleSettingsDto, SubtitleSettingsDto, QAfterFilterCondition>
  fontWeightWinLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'fontWeightWin',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<SubtitleSettingsDto, SubtitleSettingsDto, QAfterFilterCondition>
  fontWeightWinBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'fontWeightWin',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<SubtitleSettingsDto, SubtitleSettingsDto, QAfterFilterCondition>
  globalOutlineWidthFsEqualTo(double value, {double epsilon = Query.epsilon}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'globalOutlineWidthFs',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<SubtitleSettingsDto, SubtitleSettingsDto, QAfterFilterCondition>
  globalOutlineWidthFsGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'globalOutlineWidthFs',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<SubtitleSettingsDto, SubtitleSettingsDto, QAfterFilterCondition>
  globalOutlineWidthFsLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'globalOutlineWidthFs',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<SubtitleSettingsDto, SubtitleSettingsDto, QAfterFilterCondition>
  globalOutlineWidthFsBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'globalOutlineWidthFs',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<SubtitleSettingsDto, SubtitleSettingsDto, QAfterFilterCondition>
  letterSpacingFsEqualTo(double value, {double epsilon = Query.epsilon}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'letterSpacingFs',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<SubtitleSettingsDto, SubtitleSettingsDto, QAfterFilterCondition>
  letterSpacingFsGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'letterSpacingFs',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<SubtitleSettingsDto, SubtitleSettingsDto, QAfterFilterCondition>
  letterSpacingFsLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'letterSpacingFs',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<SubtitleSettingsDto, SubtitleSettingsDto, QAfterFilterCondition>
  letterSpacingFsBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'letterSpacingFs',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<SubtitleSettingsDto, SubtitleSettingsDto, QAfterFilterCondition>
  letterSpacingWinEqualTo(double value, {double epsilon = Query.epsilon}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'letterSpacingWin',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<SubtitleSettingsDto, SubtitleSettingsDto, QAfterFilterCondition>
  letterSpacingWinGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'letterSpacingWin',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<SubtitleSettingsDto, SubtitleSettingsDto, QAfterFilterCondition>
  letterSpacingWinLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'letterSpacingWin',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<SubtitleSettingsDto, SubtitleSettingsDto, QAfterFilterCondition>
  letterSpacingWinBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'letterSpacingWin',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<SubtitleSettingsDto, SubtitleSettingsDto, QAfterFilterCondition>
  originalOutlineWidthFsEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'originalOutlineWidthFs',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<SubtitleSettingsDto, SubtitleSettingsDto, QAfterFilterCondition>
  originalOutlineWidthFsGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'originalOutlineWidthFs',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<SubtitleSettingsDto, SubtitleSettingsDto, QAfterFilterCondition>
  originalOutlineWidthFsLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'originalOutlineWidthFs',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<SubtitleSettingsDto, SubtitleSettingsDto, QAfterFilterCondition>
  originalOutlineWidthFsBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'originalOutlineWidthFs',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<SubtitleSettingsDto, SubtitleSettingsDto, QAfterFilterCondition>
  originalScaleFsEqualTo(double value, {double epsilon = Query.epsilon}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'originalScaleFs',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<SubtitleSettingsDto, SubtitleSettingsDto, QAfterFilterCondition>
  originalScaleFsGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'originalScaleFs',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<SubtitleSettingsDto, SubtitleSettingsDto, QAfterFilterCondition>
  originalScaleFsLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'originalScaleFs',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<SubtitleSettingsDto, SubtitleSettingsDto, QAfterFilterCondition>
  originalScaleFsBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'originalScaleFs',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<SubtitleSettingsDto, SubtitleSettingsDto, QAfterFilterCondition>
  originalScaleWinEqualTo(double value, {double epsilon = Query.epsilon}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'originalScaleWin',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<SubtitleSettingsDto, SubtitleSettingsDto, QAfterFilterCondition>
  originalScaleWinGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'originalScaleWin',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<SubtitleSettingsDto, SubtitleSettingsDto, QAfterFilterCondition>
  originalScaleWinLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'originalScaleWin',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<SubtitleSettingsDto, SubtitleSettingsDto, QAfterFilterCondition>
  originalScaleWinBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'originalScaleWin',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<SubtitleSettingsDto, SubtitleSettingsDto, QAfterFilterCondition>
  originalToAdditionalSpacingFsEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'originalToAdditionalSpacingFs',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<SubtitleSettingsDto, SubtitleSettingsDto, QAfterFilterCondition>
  originalToAdditionalSpacingFsGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'originalToAdditionalSpacingFs',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<SubtitleSettingsDto, SubtitleSettingsDto, QAfterFilterCondition>
  originalToAdditionalSpacingFsLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'originalToAdditionalSpacingFs',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<SubtitleSettingsDto, SubtitleSettingsDto, QAfterFilterCondition>
  originalToAdditionalSpacingFsBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'originalToAdditionalSpacingFs',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<SubtitleSettingsDto, SubtitleSettingsDto, QAfterFilterCondition>
  originalToTranslationSpacingFsEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'originalToTranslationSpacingFs',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<SubtitleSettingsDto, SubtitleSettingsDto, QAfterFilterCondition>
  originalToTranslationSpacingFsGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'originalToTranslationSpacingFs',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<SubtitleSettingsDto, SubtitleSettingsDto, QAfterFilterCondition>
  originalToTranslationSpacingFsLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'originalToTranslationSpacingFs',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<SubtitleSettingsDto, SubtitleSettingsDto, QAfterFilterCondition>
  originalToTranslationSpacingFsBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'originalToTranslationSpacingFs',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<SubtitleSettingsDto, SubtitleSettingsDto, QAfterFilterCondition>
  outlineWidthEqualTo(double value, {double epsilon = Query.epsilon}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'outlineWidth',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<SubtitleSettingsDto, SubtitleSettingsDto, QAfterFilterCondition>
  outlineWidthGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'outlineWidth',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<SubtitleSettingsDto, SubtitleSettingsDto, QAfterFilterCondition>
  outlineWidthLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'outlineWidth',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<SubtitleSettingsDto, SubtitleSettingsDto, QAfterFilterCondition>
  outlineWidthBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'outlineWidth',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<SubtitleSettingsDto, SubtitleSettingsDto, QAfterFilterCondition>
  showBackdropEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'showBackdrop', value: value),
      );
    });
  }

  QueryBuilder<SubtitleSettingsDto, SubtitleSettingsDto, QAfterFilterCondition>
  translationLetterSpacingFsEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'translationLetterSpacingFs',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<SubtitleSettingsDto, SubtitleSettingsDto, QAfterFilterCondition>
  translationLetterSpacingFsGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'translationLetterSpacingFs',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<SubtitleSettingsDto, SubtitleSettingsDto, QAfterFilterCondition>
  translationLetterSpacingFsLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'translationLetterSpacingFs',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<SubtitleSettingsDto, SubtitleSettingsDto, QAfterFilterCondition>
  translationLetterSpacingFsBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'translationLetterSpacingFs',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<SubtitleSettingsDto, SubtitleSettingsDto, QAfterFilterCondition>
  translationLetterSpacingWinEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'translationLetterSpacingWin',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<SubtitleSettingsDto, SubtitleSettingsDto, QAfterFilterCondition>
  translationLetterSpacingWinGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'translationLetterSpacingWin',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<SubtitleSettingsDto, SubtitleSettingsDto, QAfterFilterCondition>
  translationLetterSpacingWinLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'translationLetterSpacingWin',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<SubtitleSettingsDto, SubtitleSettingsDto, QAfterFilterCondition>
  translationLetterSpacingWinBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'translationLetterSpacingWin',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<SubtitleSettingsDto, SubtitleSettingsDto, QAfterFilterCondition>
  translationOutlineWidthFsEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'translationOutlineWidthFs',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<SubtitleSettingsDto, SubtitleSettingsDto, QAfterFilterCondition>
  translationOutlineWidthFsGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'translationOutlineWidthFs',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<SubtitleSettingsDto, SubtitleSettingsDto, QAfterFilterCondition>
  translationOutlineWidthFsLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'translationOutlineWidthFs',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<SubtitleSettingsDto, SubtitleSettingsDto, QAfterFilterCondition>
  translationOutlineWidthFsBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'translationOutlineWidthFs',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<SubtitleSettingsDto, SubtitleSettingsDto, QAfterFilterCondition>
  translationScaleFsEqualTo(double value, {double epsilon = Query.epsilon}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'translationScaleFs',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<SubtitleSettingsDto, SubtitleSettingsDto, QAfterFilterCondition>
  translationScaleFsGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'translationScaleFs',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<SubtitleSettingsDto, SubtitleSettingsDto, QAfterFilterCondition>
  translationScaleFsLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'translationScaleFs',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<SubtitleSettingsDto, SubtitleSettingsDto, QAfterFilterCondition>
  translationScaleFsBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'translationScaleFs',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<SubtitleSettingsDto, SubtitleSettingsDto, QAfterFilterCondition>
  translationScaleWinEqualTo(double value, {double epsilon = Query.epsilon}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'translationScaleWin',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<SubtitleSettingsDto, SubtitleSettingsDto, QAfterFilterCondition>
  translationScaleWinGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'translationScaleWin',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<SubtitleSettingsDto, SubtitleSettingsDto, QAfterFilterCondition>
  translationScaleWinLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'translationScaleWin',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<SubtitleSettingsDto, SubtitleSettingsDto, QAfterFilterCondition>
  translationScaleWinBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'translationScaleWin',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<SubtitleSettingsDto, SubtitleSettingsDto, QAfterFilterCondition>
  verticalOffsetEqualTo(double value, {double epsilon = Query.epsilon}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'verticalOffset',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<SubtitleSettingsDto, SubtitleSettingsDto, QAfterFilterCondition>
  verticalOffsetGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'verticalOffset',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<SubtitleSettingsDto, SubtitleSettingsDto, QAfterFilterCondition>
  verticalOffsetLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'verticalOffset',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<SubtitleSettingsDto, SubtitleSettingsDto, QAfterFilterCondition>
  verticalOffsetBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'verticalOffset',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<SubtitleSettingsDto, SubtitleSettingsDto, QAfterFilterCondition>
  windowedFontSizeEqualTo(double value, {double epsilon = Query.epsilon}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'windowedFontSize',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<SubtitleSettingsDto, SubtitleSettingsDto, QAfterFilterCondition>
  windowedFontSizeGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'windowedFontSize',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<SubtitleSettingsDto, SubtitleSettingsDto, QAfterFilterCondition>
  windowedFontSizeLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'windowedFontSize',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<SubtitleSettingsDto, SubtitleSettingsDto, QAfterFilterCondition>
  windowedFontSizeBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'windowedFontSize',
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

extension SubtitleSettingsDtoQueryObject
    on
        QueryBuilder<
          SubtitleSettingsDto,
          SubtitleSettingsDto,
          QFilterCondition
        > {}

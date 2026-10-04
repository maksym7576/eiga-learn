// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'anki_settings_dto.dart';

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const AnkiSettingsDtoSchema = Schema(
  name: r'AnkiSettingsDto',
  id: 4128486625617912699,
  properties: {
    r'connectUrl': PropertySchema(
      id: 0,
      name: r'connectUrl',
      type: IsarType.string,
    ),
    r'deckName': PropertySchema(
      id: 1,
      name: r'deckName',
      type: IsarType.string,
    ),
    r'noteType': PropertySchema(
      id: 2,
      name: r'noteType',
      type: IsarType.string,
    ),
  },

  estimateSize: _ankiSettingsDtoEstimateSize,
  serialize: _ankiSettingsDtoSerialize,
  deserialize: _ankiSettingsDtoDeserialize,
  deserializeProp: _ankiSettingsDtoDeserializeProp,
);

int _ankiSettingsDtoEstimateSize(
  AnkiSettingsDto object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.connectUrl.length * 3;
  bytesCount += 3 + object.deckName.length * 3;
  bytesCount += 3 + object.noteType.length * 3;
  return bytesCount;
}

void _ankiSettingsDtoSerialize(
  AnkiSettingsDto object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.connectUrl);
  writer.writeString(offsets[1], object.deckName);
  writer.writeString(offsets[2], object.noteType);
}

AnkiSettingsDto _ankiSettingsDtoDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = AnkiSettingsDto();
  object.connectUrl = reader.readString(offsets[0]);
  object.deckName = reader.readString(offsets[1]);
  object.noteType = reader.readString(offsets[2]);
  return object;
}

P _ankiSettingsDtoDeserializeProp<P>(
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
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension AnkiSettingsDtoQueryFilter
    on QueryBuilder<AnkiSettingsDto, AnkiSettingsDto, QFilterCondition> {
  QueryBuilder<AnkiSettingsDto, AnkiSettingsDto, QAfterFilterCondition>
  connectUrlEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'connectUrl',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AnkiSettingsDto, AnkiSettingsDto, QAfterFilterCondition>
  connectUrlGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'connectUrl',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AnkiSettingsDto, AnkiSettingsDto, QAfterFilterCondition>
  connectUrlLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'connectUrl',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AnkiSettingsDto, AnkiSettingsDto, QAfterFilterCondition>
  connectUrlBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'connectUrl',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AnkiSettingsDto, AnkiSettingsDto, QAfterFilterCondition>
  connectUrlStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'connectUrl',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AnkiSettingsDto, AnkiSettingsDto, QAfterFilterCondition>
  connectUrlEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'connectUrl',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AnkiSettingsDto, AnkiSettingsDto, QAfterFilterCondition>
  connectUrlContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'connectUrl',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AnkiSettingsDto, AnkiSettingsDto, QAfterFilterCondition>
  connectUrlMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'connectUrl',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AnkiSettingsDto, AnkiSettingsDto, QAfterFilterCondition>
  connectUrlIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'connectUrl', value: ''),
      );
    });
  }

  QueryBuilder<AnkiSettingsDto, AnkiSettingsDto, QAfterFilterCondition>
  connectUrlIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'connectUrl', value: ''),
      );
    });
  }

  QueryBuilder<AnkiSettingsDto, AnkiSettingsDto, QAfterFilterCondition>
  deckNameEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'deckName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AnkiSettingsDto, AnkiSettingsDto, QAfterFilterCondition>
  deckNameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'deckName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AnkiSettingsDto, AnkiSettingsDto, QAfterFilterCondition>
  deckNameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'deckName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AnkiSettingsDto, AnkiSettingsDto, QAfterFilterCondition>
  deckNameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'deckName',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AnkiSettingsDto, AnkiSettingsDto, QAfterFilterCondition>
  deckNameStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'deckName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AnkiSettingsDto, AnkiSettingsDto, QAfterFilterCondition>
  deckNameEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'deckName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AnkiSettingsDto, AnkiSettingsDto, QAfterFilterCondition>
  deckNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'deckName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AnkiSettingsDto, AnkiSettingsDto, QAfterFilterCondition>
  deckNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'deckName',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AnkiSettingsDto, AnkiSettingsDto, QAfterFilterCondition>
  deckNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'deckName', value: ''),
      );
    });
  }

  QueryBuilder<AnkiSettingsDto, AnkiSettingsDto, QAfterFilterCondition>
  deckNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'deckName', value: ''),
      );
    });
  }

  QueryBuilder<AnkiSettingsDto, AnkiSettingsDto, QAfterFilterCondition>
  noteTypeEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'noteType',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AnkiSettingsDto, AnkiSettingsDto, QAfterFilterCondition>
  noteTypeGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'noteType',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AnkiSettingsDto, AnkiSettingsDto, QAfterFilterCondition>
  noteTypeLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'noteType',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AnkiSettingsDto, AnkiSettingsDto, QAfterFilterCondition>
  noteTypeBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'noteType',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AnkiSettingsDto, AnkiSettingsDto, QAfterFilterCondition>
  noteTypeStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'noteType',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AnkiSettingsDto, AnkiSettingsDto, QAfterFilterCondition>
  noteTypeEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'noteType',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AnkiSettingsDto, AnkiSettingsDto, QAfterFilterCondition>
  noteTypeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'noteType',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AnkiSettingsDto, AnkiSettingsDto, QAfterFilterCondition>
  noteTypeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'noteType',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AnkiSettingsDto, AnkiSettingsDto, QAfterFilterCondition>
  noteTypeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'noteType', value: ''),
      );
    });
  }

  QueryBuilder<AnkiSettingsDto, AnkiSettingsDto, QAfterFilterCondition>
  noteTypeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'noteType', value: ''),
      );
    });
  }
}

extension AnkiSettingsDtoQueryObject
    on QueryBuilder<AnkiSettingsDto, AnkiSettingsDto, QFilterCondition> {}

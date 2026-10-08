// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetVideoCollection on Isar {
  IsarCollection<Video> get videos => this.collection();
}

const VideoSchema = CollectionSchema(
  name: r'Video',
  id: 113594071489080673,
  properties: {
    r'coverImagePath': PropertySchema(
      id: 0,
      name: r'coverImagePath',
      type: IsarType.string,
    ),
    r'isCached': PropertySchema(id: 1, name: r'isCached', type: IsarType.bool),
    r'isResearchDone': PropertySchema(
      id: 2,
      name: r'isResearchDone',
      type: IsarType.bool,
    ),
    r'lastProcessedAt': PropertySchema(
      id: 3,
      name: r'lastProcessedAt',
      type: IsarType.dateTime,
    ),
    r'lastVideoPosition': PropertySchema(
      id: 4,
      name: r'lastVideoPosition',
      type: IsarType.long,
    ),
    r'metadata': PropertySchema(
      id: 5,
      name: r'metadata',
      type: IsarType.object,

      target: r'VideoMetadata',
    ),
    r'originalLanguage': PropertySchema(
      id: 6,
      name: r'originalLanguage',
      type: IsarType.string,
    ),
    r'pipelineIdentifier': PropertySchema(
      id: 7,
      name: r'pipelineIdentifier',
      type: IsarType.string,
    ),
    r'pipelineVersion': PropertySchema(
      id: 8,
      name: r'pipelineVersion',
      type: IsarType.string,
    ),
    r'primaryAudio': PropertySchema(
      id: 9,
      name: r'primaryAudio',
      type: IsarType.string,
    ),
    r'researchInformation': PropertySchema(
      id: 10,
      name: r'researchInformation',
      type: IsarType.object,

      target: r'ResearchInformation',
    ),
    r'subtitlePath': PropertySchema(
      id: 11,
      name: r'subtitlePath',
      type: IsarType.string,
    ),
    r'subtitleScans': PropertySchema(
      id: 12,
      name: r'subtitleScans',
      type: IsarType.objectList,

      target: r'SubtitleScan',
    ),
    r'sync': PropertySchema(
      id: 13,
      name: r'sync',
      type: IsarType.object,

      target: r'SyncMeta',
    ),
    r'translatedLanguage': PropertySchema(
      id: 14,
      name: r'translatedLanguage',
      type: IsarType.string,
    ),
    r'videoPath': PropertySchema(
      id: 15,
      name: r'videoPath',
      type: IsarType.string,
    ),
  },

  estimateSize: _videoEstimateSize,
  serialize: _videoSerialize,
  deserialize: _videoDeserialize,
  deserializeProp: _videoDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {
    r'ResearchInformation': ResearchInformationSchema,
    r'VideoMetadata': VideoMetadataSchema,
    r'SubtitleScan': SubtitleScanSchema,
    r'SyncMeta': SyncMetaSchema,
  },

  getId: _videoGetId,
  getLinks: _videoGetLinks,
  attach: _videoAttach,
  version: '3.3.2',
);

int _videoEstimateSize(
  Video object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.coverImagePath;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount +=
      3 +
      VideoMetadataSchema.estimateSize(
        object.metadata,
        allOffsets[VideoMetadata]!,
        allOffsets,
      );
  bytesCount += 3 + object.originalLanguage.length * 3;
  {
    final value = object.pipelineIdentifier;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.pipelineVersion;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.primaryAudio;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.researchInformation;
    if (value != null) {
      bytesCount +=
          3 +
          ResearchInformationSchema.estimateSize(
            value,
            allOffsets[ResearchInformation]!,
            allOffsets,
          );
    }
  }
  {
    final value = object.subtitlePath;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.subtitleScans.length * 3;
  {
    final offsets = allOffsets[SubtitleScan]!;
    for (var i = 0; i < object.subtitleScans.length; i++) {
      final value = object.subtitleScans[i];
      bytesCount += SubtitleScanSchema.estimateSize(value, offsets, allOffsets);
    }
  }
  bytesCount +=
      3 +
      SyncMetaSchema.estimateSize(
        object.sync,
        allOffsets[SyncMeta]!,
        allOffsets,
      );
  bytesCount += 3 + object.translatedLanguage.length * 3;
  {
    final value = object.videoPath;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _videoSerialize(
  Video object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.coverImagePath);
  writer.writeBool(offsets[1], object.isCached);
  writer.writeBool(offsets[2], object.isResearchDone);
  writer.writeDateTime(offsets[3], object.lastProcessedAt);
  writer.writeLong(offsets[4], object.lastVideoPosition);
  writer.writeObject<VideoMetadata>(
    offsets[5],
    allOffsets,
    VideoMetadataSchema.serialize,
    object.metadata,
  );
  writer.writeString(offsets[6], object.originalLanguage);
  writer.writeString(offsets[7], object.pipelineIdentifier);
  writer.writeString(offsets[8], object.pipelineVersion);
  writer.writeString(offsets[9], object.primaryAudio);
  writer.writeObject<ResearchInformation>(
    offsets[10],
    allOffsets,
    ResearchInformationSchema.serialize,
    object.researchInformation,
  );
  writer.writeString(offsets[11], object.subtitlePath);
  writer.writeObjectList<SubtitleScan>(
    offsets[12],
    allOffsets,
    SubtitleScanSchema.serialize,
    object.subtitleScans,
  );
  writer.writeObject<SyncMeta>(
    offsets[13],
    allOffsets,
    SyncMetaSchema.serialize,
    object.sync,
  );
  writer.writeString(offsets[14], object.translatedLanguage);
  writer.writeString(offsets[15], object.videoPath);
}

Video _videoDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Video();
  object.coverImagePath = reader.readStringOrNull(offsets[0]);
  object.id = id;
  object.isCached = reader.readBool(offsets[1]);
  object.isResearchDone = reader.readBool(offsets[2]);
  object.lastProcessedAt = reader.readDateTimeOrNull(offsets[3]);
  object.lastVideoPosition = reader.readLongOrNull(offsets[4]);
  object.metadata =
      reader.readObjectOrNull<VideoMetadata>(
        offsets[5],
        VideoMetadataSchema.deserialize,
        allOffsets,
      ) ??
      VideoMetadata();
  object.originalLanguage = reader.readString(offsets[6]);
  object.pipelineIdentifier = reader.readStringOrNull(offsets[7]);
  object.pipelineVersion = reader.readStringOrNull(offsets[8]);
  object.primaryAudio = reader.readStringOrNull(offsets[9]);
  object.researchInformation = reader.readObjectOrNull<ResearchInformation>(
    offsets[10],
    ResearchInformationSchema.deserialize,
    allOffsets,
  );
  object.subtitlePath = reader.readStringOrNull(offsets[11]);
  object.subtitleScans =
      reader.readObjectList<SubtitleScan>(
        offsets[12],
        SubtitleScanSchema.deserialize,
        allOffsets,
        SubtitleScan(),
      ) ??
      [];
  object.sync =
      reader.readObjectOrNull<SyncMeta>(
        offsets[13],
        SyncMetaSchema.deserialize,
        allOffsets,
      ) ??
      SyncMeta();
  object.translatedLanguage = reader.readString(offsets[14]);
  object.videoPath = reader.readStringOrNull(offsets[15]);
  return object;
}

P _videoDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readBool(offset)) as P;
    case 2:
      return (reader.readBool(offset)) as P;
    case 3:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 4:
      return (reader.readLongOrNull(offset)) as P;
    case 5:
      return (reader.readObjectOrNull<VideoMetadata>(
                offset,
                VideoMetadataSchema.deserialize,
                allOffsets,
              ) ??
              VideoMetadata())
          as P;
    case 6:
      return (reader.readString(offset)) as P;
    case 7:
      return (reader.readStringOrNull(offset)) as P;
    case 8:
      return (reader.readStringOrNull(offset)) as P;
    case 9:
      return (reader.readStringOrNull(offset)) as P;
    case 10:
      return (reader.readObjectOrNull<ResearchInformation>(
            offset,
            ResearchInformationSchema.deserialize,
            allOffsets,
          ))
          as P;
    case 11:
      return (reader.readStringOrNull(offset)) as P;
    case 12:
      return (reader.readObjectList<SubtitleScan>(
                offset,
                SubtitleScanSchema.deserialize,
                allOffsets,
                SubtitleScan(),
              ) ??
              [])
          as P;
    case 13:
      return (reader.readObjectOrNull<SyncMeta>(
                offset,
                SyncMetaSchema.deserialize,
                allOffsets,
              ) ??
              SyncMeta())
          as P;
    case 14:
      return (reader.readString(offset)) as P;
    case 15:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _videoGetId(Video object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _videoGetLinks(Video object) {
  return [];
}

void _videoAttach(IsarCollection<dynamic> col, Id id, Video object) {
  object.id = id;
}

extension VideoQueryWhereSort on QueryBuilder<Video, Video, QWhere> {
  QueryBuilder<Video, Video, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension VideoQueryWhere on QueryBuilder<Video, Video, QWhereClause> {
  QueryBuilder<Video, Video, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(lower: id, upper: id));
    });
  }

  QueryBuilder<Video, Video, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<Video, Video, QAfterWhereClause> idGreaterThan(
    Id id, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Video, Video, QAfterWhereClause> idLessThan(
    Id id, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Video, Video, QAfterWhereClause> idBetween(
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

extension VideoQueryFilter on QueryBuilder<Video, Video, QFilterCondition> {
  QueryBuilder<Video, Video, QAfterFilterCondition> coverImagePathIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'coverImagePath'),
      );
    });
  }

  QueryBuilder<Video, Video, QAfterFilterCondition> coverImagePathIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'coverImagePath'),
      );
    });
  }

  QueryBuilder<Video, Video, QAfterFilterCondition> coverImagePathEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'coverImagePath',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Video, Video, QAfterFilterCondition> coverImagePathGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'coverImagePath',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Video, Video, QAfterFilterCondition> coverImagePathLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'coverImagePath',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Video, Video, QAfterFilterCondition> coverImagePathBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'coverImagePath',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Video, Video, QAfterFilterCondition> coverImagePathStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'coverImagePath',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Video, Video, QAfterFilterCondition> coverImagePathEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'coverImagePath',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Video, Video, QAfterFilterCondition> coverImagePathContains(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'coverImagePath',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Video, Video, QAfterFilterCondition> coverImagePathMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'coverImagePath',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Video, Video, QAfterFilterCondition> coverImagePathIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'coverImagePath', value: ''),
      );
    });
  }

  QueryBuilder<Video, Video, QAfterFilterCondition> coverImagePathIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'coverImagePath', value: ''),
      );
    });
  }

  QueryBuilder<Video, Video, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'id', value: value),
      );
    });
  }

  QueryBuilder<Video, Video, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Video, Video, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Video, Video, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Video, Video, QAfterFilterCondition> isCachedEqualTo(
    bool value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'isCached', value: value),
      );
    });
  }

  QueryBuilder<Video, Video, QAfterFilterCondition> isResearchDoneEqualTo(
    bool value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'isResearchDone', value: value),
      );
    });
  }

  QueryBuilder<Video, Video, QAfterFilterCondition> lastProcessedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'lastProcessedAt'),
      );
    });
  }

  QueryBuilder<Video, Video, QAfterFilterCondition> lastProcessedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'lastProcessedAt'),
      );
    });
  }

  QueryBuilder<Video, Video, QAfterFilterCondition> lastProcessedAtEqualTo(
    DateTime? value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'lastProcessedAt', value: value),
      );
    });
  }

  QueryBuilder<Video, Video, QAfterFilterCondition> lastProcessedAtGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'lastProcessedAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Video, Video, QAfterFilterCondition> lastProcessedAtLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'lastProcessedAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Video, Video, QAfterFilterCondition> lastProcessedAtBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'lastProcessedAt',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<Video, Video, QAfterFilterCondition> lastVideoPositionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'lastVideoPosition'),
      );
    });
  }

  QueryBuilder<Video, Video, QAfterFilterCondition>
  lastVideoPositionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'lastVideoPosition'),
      );
    });
  }

  QueryBuilder<Video, Video, QAfterFilterCondition> lastVideoPositionEqualTo(
    int? value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'lastVideoPosition', value: value),
      );
    });
  }

  QueryBuilder<Video, Video, QAfterFilterCondition>
  lastVideoPositionGreaterThan(int? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'lastVideoPosition',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Video, Video, QAfterFilterCondition> lastVideoPositionLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'lastVideoPosition',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Video, Video, QAfterFilterCondition> lastVideoPositionBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'lastVideoPosition',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<Video, Video, QAfterFilterCondition> originalLanguageEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'originalLanguage',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Video, Video, QAfterFilterCondition> originalLanguageGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'originalLanguage',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Video, Video, QAfterFilterCondition> originalLanguageLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'originalLanguage',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Video, Video, QAfterFilterCondition> originalLanguageBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'originalLanguage',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Video, Video, QAfterFilterCondition> originalLanguageStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'originalLanguage',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Video, Video, QAfterFilterCondition> originalLanguageEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'originalLanguage',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Video, Video, QAfterFilterCondition> originalLanguageContains(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'originalLanguage',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Video, Video, QAfterFilterCondition> originalLanguageMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'originalLanguage',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Video, Video, QAfterFilterCondition> originalLanguageIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'originalLanguage', value: ''),
      );
    });
  }

  QueryBuilder<Video, Video, QAfterFilterCondition>
  originalLanguageIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'originalLanguage', value: ''),
      );
    });
  }

  QueryBuilder<Video, Video, QAfterFilterCondition> pipelineIdentifierIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'pipelineIdentifier'),
      );
    });
  }

  QueryBuilder<Video, Video, QAfterFilterCondition>
  pipelineIdentifierIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'pipelineIdentifier'),
      );
    });
  }

  QueryBuilder<Video, Video, QAfterFilterCondition> pipelineIdentifierEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'pipelineIdentifier',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Video, Video, QAfterFilterCondition>
  pipelineIdentifierGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'pipelineIdentifier',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Video, Video, QAfterFilterCondition> pipelineIdentifierLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'pipelineIdentifier',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Video, Video, QAfterFilterCondition> pipelineIdentifierBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'pipelineIdentifier',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Video, Video, QAfterFilterCondition>
  pipelineIdentifierStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'pipelineIdentifier',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Video, Video, QAfterFilterCondition> pipelineIdentifierEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'pipelineIdentifier',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Video, Video, QAfterFilterCondition> pipelineIdentifierContains(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'pipelineIdentifier',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Video, Video, QAfterFilterCondition> pipelineIdentifierMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'pipelineIdentifier',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Video, Video, QAfterFilterCondition>
  pipelineIdentifierIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'pipelineIdentifier', value: ''),
      );
    });
  }

  QueryBuilder<Video, Video, QAfterFilterCondition>
  pipelineIdentifierIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'pipelineIdentifier', value: ''),
      );
    });
  }

  QueryBuilder<Video, Video, QAfterFilterCondition> pipelineVersionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'pipelineVersion'),
      );
    });
  }

  QueryBuilder<Video, Video, QAfterFilterCondition> pipelineVersionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'pipelineVersion'),
      );
    });
  }

  QueryBuilder<Video, Video, QAfterFilterCondition> pipelineVersionEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'pipelineVersion',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Video, Video, QAfterFilterCondition> pipelineVersionGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'pipelineVersion',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Video, Video, QAfterFilterCondition> pipelineVersionLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'pipelineVersion',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Video, Video, QAfterFilterCondition> pipelineVersionBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'pipelineVersion',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Video, Video, QAfterFilterCondition> pipelineVersionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'pipelineVersion',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Video, Video, QAfterFilterCondition> pipelineVersionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'pipelineVersion',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Video, Video, QAfterFilterCondition> pipelineVersionContains(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'pipelineVersion',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Video, Video, QAfterFilterCondition> pipelineVersionMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'pipelineVersion',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Video, Video, QAfterFilterCondition> pipelineVersionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'pipelineVersion', value: ''),
      );
    });
  }

  QueryBuilder<Video, Video, QAfterFilterCondition>
  pipelineVersionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'pipelineVersion', value: ''),
      );
    });
  }

  QueryBuilder<Video, Video, QAfterFilterCondition> primaryAudioIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'primaryAudio'),
      );
    });
  }

  QueryBuilder<Video, Video, QAfterFilterCondition> primaryAudioIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'primaryAudio'),
      );
    });
  }

  QueryBuilder<Video, Video, QAfterFilterCondition> primaryAudioEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'primaryAudio',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Video, Video, QAfterFilterCondition> primaryAudioGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'primaryAudio',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Video, Video, QAfterFilterCondition> primaryAudioLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'primaryAudio',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Video, Video, QAfterFilterCondition> primaryAudioBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'primaryAudio',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Video, Video, QAfterFilterCondition> primaryAudioStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'primaryAudio',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Video, Video, QAfterFilterCondition> primaryAudioEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'primaryAudio',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Video, Video, QAfterFilterCondition> primaryAudioContains(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'primaryAudio',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Video, Video, QAfterFilterCondition> primaryAudioMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'primaryAudio',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Video, Video, QAfterFilterCondition> primaryAudioIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'primaryAudio', value: ''),
      );
    });
  }

  QueryBuilder<Video, Video, QAfterFilterCondition> primaryAudioIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'primaryAudio', value: ''),
      );
    });
  }

  QueryBuilder<Video, Video, QAfterFilterCondition>
  researchInformationIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'researchInformation'),
      );
    });
  }

  QueryBuilder<Video, Video, QAfterFilterCondition>
  researchInformationIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'researchInformation'),
      );
    });
  }

  QueryBuilder<Video, Video, QAfterFilterCondition> subtitlePathIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'subtitlePath'),
      );
    });
  }

  QueryBuilder<Video, Video, QAfterFilterCondition> subtitlePathIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'subtitlePath'),
      );
    });
  }

  QueryBuilder<Video, Video, QAfterFilterCondition> subtitlePathEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'subtitlePath',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Video, Video, QAfterFilterCondition> subtitlePathGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'subtitlePath',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Video, Video, QAfterFilterCondition> subtitlePathLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'subtitlePath',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Video, Video, QAfterFilterCondition> subtitlePathBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'subtitlePath',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Video, Video, QAfterFilterCondition> subtitlePathStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'subtitlePath',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Video, Video, QAfterFilterCondition> subtitlePathEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'subtitlePath',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Video, Video, QAfterFilterCondition> subtitlePathContains(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'subtitlePath',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Video, Video, QAfterFilterCondition> subtitlePathMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'subtitlePath',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Video, Video, QAfterFilterCondition> subtitlePathIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'subtitlePath', value: ''),
      );
    });
  }

  QueryBuilder<Video, Video, QAfterFilterCondition> subtitlePathIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'subtitlePath', value: ''),
      );
    });
  }

  QueryBuilder<Video, Video, QAfterFilterCondition> subtitleScansLengthEqualTo(
    int length,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'subtitleScans', length, true, length, true);
    });
  }

  QueryBuilder<Video, Video, QAfterFilterCondition> subtitleScansIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'subtitleScans', 0, true, 0, true);
    });
  }

  QueryBuilder<Video, Video, QAfterFilterCondition> subtitleScansIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'subtitleScans', 0, false, 999999, true);
    });
  }

  QueryBuilder<Video, Video, QAfterFilterCondition> subtitleScansLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'subtitleScans', 0, true, length, include);
    });
  }

  QueryBuilder<Video, Video, QAfterFilterCondition>
  subtitleScansLengthGreaterThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'subtitleScans', length, include, 999999, true);
    });
  }

  QueryBuilder<Video, Video, QAfterFilterCondition> subtitleScansLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'subtitleScans',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<Video, Video, QAfterFilterCondition> translatedLanguageEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'translatedLanguage',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Video, Video, QAfterFilterCondition>
  translatedLanguageGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'translatedLanguage',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Video, Video, QAfterFilterCondition> translatedLanguageLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'translatedLanguage',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Video, Video, QAfterFilterCondition> translatedLanguageBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'translatedLanguage',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Video, Video, QAfterFilterCondition>
  translatedLanguageStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'translatedLanguage',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Video, Video, QAfterFilterCondition> translatedLanguageEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'translatedLanguage',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Video, Video, QAfterFilterCondition> translatedLanguageContains(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'translatedLanguage',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Video, Video, QAfterFilterCondition> translatedLanguageMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'translatedLanguage',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Video, Video, QAfterFilterCondition>
  translatedLanguageIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'translatedLanguage', value: ''),
      );
    });
  }

  QueryBuilder<Video, Video, QAfterFilterCondition>
  translatedLanguageIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'translatedLanguage', value: ''),
      );
    });
  }

  QueryBuilder<Video, Video, QAfterFilterCondition> videoPathIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'videoPath'),
      );
    });
  }

  QueryBuilder<Video, Video, QAfterFilterCondition> videoPathIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'videoPath'),
      );
    });
  }

  QueryBuilder<Video, Video, QAfterFilterCondition> videoPathEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'videoPath',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Video, Video, QAfterFilterCondition> videoPathGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'videoPath',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Video, Video, QAfterFilterCondition> videoPathLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'videoPath',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Video, Video, QAfterFilterCondition> videoPathBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'videoPath',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Video, Video, QAfterFilterCondition> videoPathStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'videoPath',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Video, Video, QAfterFilterCondition> videoPathEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'videoPath',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Video, Video, QAfterFilterCondition> videoPathContains(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'videoPath',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Video, Video, QAfterFilterCondition> videoPathMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'videoPath',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Video, Video, QAfterFilterCondition> videoPathIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'videoPath', value: ''),
      );
    });
  }

  QueryBuilder<Video, Video, QAfterFilterCondition> videoPathIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'videoPath', value: ''),
      );
    });
  }
}

extension VideoQueryObject on QueryBuilder<Video, Video, QFilterCondition> {
  QueryBuilder<Video, Video, QAfterFilterCondition> metadata(
    FilterQuery<VideoMetadata> q,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'metadata');
    });
  }

  QueryBuilder<Video, Video, QAfterFilterCondition> researchInformation(
    FilterQuery<ResearchInformation> q,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'researchInformation');
    });
  }

  QueryBuilder<Video, Video, QAfterFilterCondition> subtitleScansElement(
    FilterQuery<SubtitleScan> q,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'subtitleScans');
    });
  }

  QueryBuilder<Video, Video, QAfterFilterCondition> sync(
    FilterQuery<SyncMeta> q,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'sync');
    });
  }
}

extension VideoQueryLinks on QueryBuilder<Video, Video, QFilterCondition> {}

extension VideoQuerySortBy on QueryBuilder<Video, Video, QSortBy> {
  QueryBuilder<Video, Video, QAfterSortBy> sortByCoverImagePath() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'coverImagePath', Sort.asc);
    });
  }

  QueryBuilder<Video, Video, QAfterSortBy> sortByCoverImagePathDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'coverImagePath', Sort.desc);
    });
  }

  QueryBuilder<Video, Video, QAfterSortBy> sortByIsCached() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isCached', Sort.asc);
    });
  }

  QueryBuilder<Video, Video, QAfterSortBy> sortByIsCachedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isCached', Sort.desc);
    });
  }

  QueryBuilder<Video, Video, QAfterSortBy> sortByIsResearchDone() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isResearchDone', Sort.asc);
    });
  }

  QueryBuilder<Video, Video, QAfterSortBy> sortByIsResearchDoneDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isResearchDone', Sort.desc);
    });
  }

  QueryBuilder<Video, Video, QAfterSortBy> sortByLastProcessedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastProcessedAt', Sort.asc);
    });
  }

  QueryBuilder<Video, Video, QAfterSortBy> sortByLastProcessedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastProcessedAt', Sort.desc);
    });
  }

  QueryBuilder<Video, Video, QAfterSortBy> sortByLastVideoPosition() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastVideoPosition', Sort.asc);
    });
  }

  QueryBuilder<Video, Video, QAfterSortBy> sortByLastVideoPositionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastVideoPosition', Sort.desc);
    });
  }

  QueryBuilder<Video, Video, QAfterSortBy> sortByOriginalLanguage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'originalLanguage', Sort.asc);
    });
  }

  QueryBuilder<Video, Video, QAfterSortBy> sortByOriginalLanguageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'originalLanguage', Sort.desc);
    });
  }

  QueryBuilder<Video, Video, QAfterSortBy> sortByPipelineIdentifier() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pipelineIdentifier', Sort.asc);
    });
  }

  QueryBuilder<Video, Video, QAfterSortBy> sortByPipelineIdentifierDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pipelineIdentifier', Sort.desc);
    });
  }

  QueryBuilder<Video, Video, QAfterSortBy> sortByPipelineVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pipelineVersion', Sort.asc);
    });
  }

  QueryBuilder<Video, Video, QAfterSortBy> sortByPipelineVersionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pipelineVersion', Sort.desc);
    });
  }

  QueryBuilder<Video, Video, QAfterSortBy> sortByPrimaryAudio() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'primaryAudio', Sort.asc);
    });
  }

  QueryBuilder<Video, Video, QAfterSortBy> sortByPrimaryAudioDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'primaryAudio', Sort.desc);
    });
  }

  QueryBuilder<Video, Video, QAfterSortBy> sortBySubtitlePath() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'subtitlePath', Sort.asc);
    });
  }

  QueryBuilder<Video, Video, QAfterSortBy> sortBySubtitlePathDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'subtitlePath', Sort.desc);
    });
  }

  QueryBuilder<Video, Video, QAfterSortBy> sortByTranslatedLanguage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'translatedLanguage', Sort.asc);
    });
  }

  QueryBuilder<Video, Video, QAfterSortBy> sortByTranslatedLanguageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'translatedLanguage', Sort.desc);
    });
  }

  QueryBuilder<Video, Video, QAfterSortBy> sortByVideoPath() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'videoPath', Sort.asc);
    });
  }

  QueryBuilder<Video, Video, QAfterSortBy> sortByVideoPathDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'videoPath', Sort.desc);
    });
  }
}

extension VideoQuerySortThenBy on QueryBuilder<Video, Video, QSortThenBy> {
  QueryBuilder<Video, Video, QAfterSortBy> thenByCoverImagePath() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'coverImagePath', Sort.asc);
    });
  }

  QueryBuilder<Video, Video, QAfterSortBy> thenByCoverImagePathDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'coverImagePath', Sort.desc);
    });
  }

  QueryBuilder<Video, Video, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Video, Video, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Video, Video, QAfterSortBy> thenByIsCached() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isCached', Sort.asc);
    });
  }

  QueryBuilder<Video, Video, QAfterSortBy> thenByIsCachedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isCached', Sort.desc);
    });
  }

  QueryBuilder<Video, Video, QAfterSortBy> thenByIsResearchDone() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isResearchDone', Sort.asc);
    });
  }

  QueryBuilder<Video, Video, QAfterSortBy> thenByIsResearchDoneDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isResearchDone', Sort.desc);
    });
  }

  QueryBuilder<Video, Video, QAfterSortBy> thenByLastProcessedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastProcessedAt', Sort.asc);
    });
  }

  QueryBuilder<Video, Video, QAfterSortBy> thenByLastProcessedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastProcessedAt', Sort.desc);
    });
  }

  QueryBuilder<Video, Video, QAfterSortBy> thenByLastVideoPosition() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastVideoPosition', Sort.asc);
    });
  }

  QueryBuilder<Video, Video, QAfterSortBy> thenByLastVideoPositionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastVideoPosition', Sort.desc);
    });
  }

  QueryBuilder<Video, Video, QAfterSortBy> thenByOriginalLanguage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'originalLanguage', Sort.asc);
    });
  }

  QueryBuilder<Video, Video, QAfterSortBy> thenByOriginalLanguageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'originalLanguage', Sort.desc);
    });
  }

  QueryBuilder<Video, Video, QAfterSortBy> thenByPipelineIdentifier() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pipelineIdentifier', Sort.asc);
    });
  }

  QueryBuilder<Video, Video, QAfterSortBy> thenByPipelineIdentifierDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pipelineIdentifier', Sort.desc);
    });
  }

  QueryBuilder<Video, Video, QAfterSortBy> thenByPipelineVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pipelineVersion', Sort.asc);
    });
  }

  QueryBuilder<Video, Video, QAfterSortBy> thenByPipelineVersionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pipelineVersion', Sort.desc);
    });
  }

  QueryBuilder<Video, Video, QAfterSortBy> thenByPrimaryAudio() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'primaryAudio', Sort.asc);
    });
  }

  QueryBuilder<Video, Video, QAfterSortBy> thenByPrimaryAudioDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'primaryAudio', Sort.desc);
    });
  }

  QueryBuilder<Video, Video, QAfterSortBy> thenBySubtitlePath() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'subtitlePath', Sort.asc);
    });
  }

  QueryBuilder<Video, Video, QAfterSortBy> thenBySubtitlePathDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'subtitlePath', Sort.desc);
    });
  }

  QueryBuilder<Video, Video, QAfterSortBy> thenByTranslatedLanguage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'translatedLanguage', Sort.asc);
    });
  }

  QueryBuilder<Video, Video, QAfterSortBy> thenByTranslatedLanguageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'translatedLanguage', Sort.desc);
    });
  }

  QueryBuilder<Video, Video, QAfterSortBy> thenByVideoPath() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'videoPath', Sort.asc);
    });
  }

  QueryBuilder<Video, Video, QAfterSortBy> thenByVideoPathDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'videoPath', Sort.desc);
    });
  }
}

extension VideoQueryWhereDistinct on QueryBuilder<Video, Video, QDistinct> {
  QueryBuilder<Video, Video, QDistinct> distinctByCoverImagePath({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(
        r'coverImagePath',
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<Video, Video, QDistinct> distinctByIsCached() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isCached');
    });
  }

  QueryBuilder<Video, Video, QDistinct> distinctByIsResearchDone() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isResearchDone');
    });
  }

  QueryBuilder<Video, Video, QDistinct> distinctByLastProcessedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastProcessedAt');
    });
  }

  QueryBuilder<Video, Video, QDistinct> distinctByLastVideoPosition() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastVideoPosition');
    });
  }

  QueryBuilder<Video, Video, QDistinct> distinctByOriginalLanguage({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(
        r'originalLanguage',
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<Video, Video, QDistinct> distinctByPipelineIdentifier({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(
        r'pipelineIdentifier',
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<Video, Video, QDistinct> distinctByPipelineVersion({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(
        r'pipelineVersion',
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<Video, Video, QDistinct> distinctByPrimaryAudio({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'primaryAudio', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Video, Video, QDistinct> distinctBySubtitlePath({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'subtitlePath', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Video, Video, QDistinct> distinctByTranslatedLanguage({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(
        r'translatedLanguage',
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<Video, Video, QDistinct> distinctByVideoPath({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'videoPath', caseSensitive: caseSensitive);
    });
  }
}

extension VideoQueryProperty on QueryBuilder<Video, Video, QQueryProperty> {
  QueryBuilder<Video, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Video, String?, QQueryOperations> coverImagePathProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'coverImagePath');
    });
  }

  QueryBuilder<Video, bool, QQueryOperations> isCachedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isCached');
    });
  }

  QueryBuilder<Video, bool, QQueryOperations> isResearchDoneProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isResearchDone');
    });
  }

  QueryBuilder<Video, DateTime?, QQueryOperations> lastProcessedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastProcessedAt');
    });
  }

  QueryBuilder<Video, int?, QQueryOperations> lastVideoPositionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastVideoPosition');
    });
  }

  QueryBuilder<Video, VideoMetadata, QQueryOperations> metadataProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'metadata');
    });
  }

  QueryBuilder<Video, String, QQueryOperations> originalLanguageProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'originalLanguage');
    });
  }

  QueryBuilder<Video, String?, QQueryOperations> pipelineIdentifierProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'pipelineIdentifier');
    });
  }

  QueryBuilder<Video, String?, QQueryOperations> pipelineVersionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'pipelineVersion');
    });
  }

  QueryBuilder<Video, String?, QQueryOperations> primaryAudioProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'primaryAudio');
    });
  }

  QueryBuilder<Video, ResearchInformation?, QQueryOperations>
  researchInformationProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'researchInformation');
    });
  }

  QueryBuilder<Video, String?, QQueryOperations> subtitlePathProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'subtitlePath');
    });
  }

  QueryBuilder<Video, List<SubtitleScan>, QQueryOperations>
  subtitleScansProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'subtitleScans');
    });
  }

  QueryBuilder<Video, SyncMeta, QQueryOperations> syncProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'sync');
    });
  }

  QueryBuilder<Video, String, QQueryOperations> translatedLanguageProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'translatedLanguage');
    });
  }

  QueryBuilder<Video, String?, QQueryOperations> videoPathProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'videoPath');
    });
  }
}

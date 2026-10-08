import 'pipeline_definitions.dart';

class PipelineRegistry {
  static const String defaultPipelineId = 'context_translation_v1';

  static final Map<String, PipelineDefinition> _pipelines = {
    'context_translation_v1': ContextTranslationV1(),
    'transcription_v1': TranscriptionV1(),
  };

  static PipelineDefinition? get(String id) => _pipelines[id];

  static PipelineDefinition getPipeline(String? id) {
    return _pipelines[id ?? defaultPipelineId] ?? _pipelines[defaultPipelineId]!;
  }

  static List<PipelineDefinition> get all => _pipelines.values.toList();
}

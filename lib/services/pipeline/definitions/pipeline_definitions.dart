enum PipelineKind { translation, transcription }

class PipelineDefinition {
  const PipelineDefinition({
    required this.id,
    required this.version,
    required this.kind,
    required this.stepIds,
    this.stepOptions = const {},
  });

  final String id;
  final String version;
  final PipelineKind kind;
  final List<String> stepIds;
  final Map<String, Map<String, dynamic>> stepOptions;
}

class TranscriptionV1 extends PipelineDefinition {
  TranscriptionV1()
      : super(
          id: 'transcription_v1',
          version: '1.0.0',
          kind: PipelineKind.transcription,
          stepIds: [
            'transcribe',
          ],
        );
}

class ContextTranslationV1 extends PipelineDefinition {
  ContextTranslationV1()
      : super(
          id: 'context_translation_v1',
          version: '1.0.0',
          kind: PipelineKind.translation,
          stepIds: [
            'context',
            'translation',
            'tokenization',
            'lemmatization',
            'gloss',
          ],
        );
}

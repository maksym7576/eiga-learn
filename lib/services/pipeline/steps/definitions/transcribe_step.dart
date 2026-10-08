import 'package:eiga/database/models/phrase.dart';
import 'package:eiga/services/pipeline/execution/step_context.dart';
import 'package:eiga/services/pipeline/execution/step_outcome.dart';
import 'package:eiga/services/pipeline/steps/step_definition.dart';

class TranscribeStep extends StepDefinition {
  const TranscribeStep()
      : super(
          id: 'transcribe',
          name: 'Audio Transcription',
          dependsOn: const [],
          scope: StepScope.phrase,
          requiredCapability: 'audio',
        );

  @override
  Future<String> buildPrompt(StepContext context) async {
    return 'Transcribe audio segment.';
  }

  @override
  Future<StepOutcome> parseAndApply(Phrase phrase, String rawResponse) async {
    return StepOutcome.success(acceptedPhrasesCount: 1);
  }
}

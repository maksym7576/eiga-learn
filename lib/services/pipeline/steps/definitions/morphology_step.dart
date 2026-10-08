import 'package:eiga/database/models/phrase.dart';
import 'package:eiga/services/pipeline/execution/step_context.dart';
import 'package:eiga/services/pipeline/execution/step_outcome.dart';
import 'package:eiga/services/pipeline/steps/step_definition.dart';

class MorphologyStep extends StepDefinition {
  const MorphologyStep()
      : super(
          id: 'lemmatization',
          name: 'Morphology & Lemmatization',
          dependsOn: const ['tokenization'],
          scope: StepScope.phrase,
          requiredCapability: 'json',
        );

  @override
  Future<String> buildPrompt(StepContext context) async {
    return 'Extract lemmas and forms.';
  }

  @override
  Future<StepOutcome> parseAndApply(Phrase phrase, String rawResponse) async {
    return StepOutcome.success(acceptedPhrasesCount: 1);
  }
}

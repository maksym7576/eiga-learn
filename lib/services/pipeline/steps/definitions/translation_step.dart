import 'package:eiga/database/models/phrase.dart';
import 'package:eiga/services/pipeline/execution/step_context.dart';
import 'package:eiga/services/pipeline/execution/step_outcome.dart';
import 'package:eiga/services/pipeline/steps/step_definition.dart';

class TranslationStep extends StepDefinition {
  const TranslationStep()
      : super(
          id: 'translation',
          name: 'Phrase Translation',
          dependsOn: const ['context'],
          scope: StepScope.phrase,
          requiredCapability: 'json',
        );

  @override
  Future<String> buildPrompt(StepContext context) async {
    return 'Translate phrases using context and glossary.';
  }

  @override
  Future<StepOutcome> parseAndApply(Phrase phrase, String rawResponse) async {
    phrase.translatedPhrase = 'Translated text';
    return StepOutcome.success(acceptedPhrasesCount: 1);
  }
}

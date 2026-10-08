import 'package:eiga/database/models/phrase.dart';
import 'package:eiga/services/pipeline/execution/step_context.dart';
import 'package:eiga/services/pipeline/execution/step_outcome.dart';
import 'package:eiga/services/pipeline/steps/step_definition.dart';

class GrammarRoleStep extends StepDefinition {
  const GrammarRoleStep()
      : super(
          id: 'gloss',
          name: 'Grammar Role & Gloss',
          dependsOn: const ['lemmatization'],
          scope: StepScope.phrase,
          requiredCapability: 'json',
        );

  @override
  Future<String> buildPrompt(StepContext context) async {
    return 'Determine grammar patterns and glosses.';
  }

  @override
  Future<StepOutcome> parseAndApply(Phrase phrase, String rawResponse) async {
    return StepOutcome.success(acceptedPhrasesCount: 1);
  }
}

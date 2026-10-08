import 'package:eiga/database/models/phrase.dart';
import 'package:eiga/services/pipeline/execution/step_context.dart';
import 'package:eiga/services/pipeline/execution/step_outcome.dart';
import 'package:eiga/services/pipeline/steps/step_definition.dart';

class TokenizeStep extends StepDefinition {
  const TokenizeStep()
      : super(
          id: 'tokenization',
          name: 'Tokenization',
          dependsOn: const ['translation'],
          scope: StepScope.phrase,
          requiredCapability: 'json',
        );

  @override
  Future<String> buildPrompt(StepContext context) async {
    return 'Tokenize source text into tokens.';
  }

  @override
  Future<StepOutcome> parseAndApply(Phrase phrase, String rawResponse) async {
    return StepOutcome.success(acceptedPhrasesCount: 1);
  }
}

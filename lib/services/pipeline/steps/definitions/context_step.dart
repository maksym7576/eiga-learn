import 'package:eiga/database/models/phrase.dart';
import 'package:eiga/database/embedded/research_information.dart';
import 'package:eiga/services/pipeline/execution/step_context.dart';
import 'package:eiga/services/pipeline/execution/step_outcome.dart';
import 'package:eiga/services/pipeline/steps/step_definition.dart';

class ContextStep extends StepDefinition {
  const ContextStep()
      : super(
          id: 'context',
          name: 'Research Context & Glossary',
          dependsOn: const [],
          scope: StepScope.video,
          requiredCapability: 'json',
        );

  @override
  Future<String> buildPrompt(StepContext context) async {
    return 'Analyze video metadata and subtitle summary to extract context and glossary.';
  }

  @override
  Future<StepOutcome> parseAndApply(Phrase phrase, String rawResponse) async {
    return StepOutcome.success();
  }

  Future<void> applyToVideo(StepContext context, String rawResponse) async {
    context.video.researchInformation = ResearchInformation()
      ..context = rawResponse
      ..glossary = ['term1', 'term2'];
    context.video.isResearchDone = true;
  }
}

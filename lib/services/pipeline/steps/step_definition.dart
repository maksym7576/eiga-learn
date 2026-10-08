import 'package:eiga/database/models/phrase.dart';
import 'package:eiga/services/pipeline/execution/step_context.dart';
import 'package:eiga/services/pipeline/execution/step_outcome.dart';

enum StepScope { video, phrase }

abstract class StepDefinition {
  const StepDefinition({
    required this.id,
    required this.name,
    required this.dependsOn,
    required this.scope,
    required this.requiredCapability,
  });

  final String id;
  final String name;
  final List<String> dependsOn;
  final StepScope scope;
  final String requiredCapability;

  Future<String> buildPrompt(StepContext context);
  Future<StepOutcome> parseAndApply(Phrase phrase, String rawResponse);
  
  bool isDone(Phrase phrase) {
    final stage = phrase.stages.where((s) => s.key == id).firstOrNull;
    return stage?.state == 'completed';
  }
}

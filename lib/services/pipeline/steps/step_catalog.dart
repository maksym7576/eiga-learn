import 'step_definition.dart';
import 'definitions/context_step.dart';
import 'definitions/transcribe_step.dart';
import 'definitions/translation_step.dart';
import 'definitions/tokenize_step.dart';
import 'definitions/morphology_step.dart';
import 'definitions/grammar_role_step.dart';

class StepCatalog {
  static final Map<String, StepDefinition> _steps = {
    'context': const ContextStep(),
    'transcribe': const TranscribeStep(),
    'translation': const TranslationStep(),
    'tokenization': const TokenizeStep(),
    'lemmatization': const MorphologyStep(),
    'gloss': const GrammarRoleStep(),
  };

  static StepDefinition? get(String id) => _steps[id];
  static List<StepDefinition> get all => _steps.values.toList();
  static List<String> dependenciesOf(String id) => _steps[id]?.dependsOn ?? [];
}

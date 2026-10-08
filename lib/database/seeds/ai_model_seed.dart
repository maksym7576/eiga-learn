import '../../data/repositories/ai_model_repository.dart';
import '../../database/models/ai_model.dart';
import '../../database/embedded/model_capabilities.dart';
import '../../database/embedded/model_settings.dart';

class AiModelSeed {
  static List<AiModel> get standardAiModels {
    const textSteps = [
      'context',
      'translation',
      'tokenization',
      'lemmatization',
      'gloss',
    ];

    return [
      _createModel(
        name: 'gemini-3.8-flash',
        quality: 9,
        speed: 9,
        rpm: 5,
        rpd: 20,
        tpm: 250000,
        supportedSteps: textSteps,
      ),
      _createModel(
        name: 'gemini-3.7-flash',
        quality: 9,
        speed: 9,
        rpm: 5,
        rpd: 20,
        tpm: 250000,
        supportedSteps: textSteps,
      ),
      _createModel(
        name: 'gemini-3.6-flash',
        quality: 8,
        speed: 9,
        rpm: 5,
        rpd: 20,
        tpm: 250000,
        supportedSteps: textSteps,
      ),
      _createModel(
        name: 'gemini-3.5-flash',
        quality: 8,
        speed: 8,
        rpm: 5,
        rpd: 20,
        tpm: 250000,
        supportedSteps: textSteps,
      ),
      _createModel(
        name: 'gemini-3-flash',
        quality: 8,
        speed: 8,
        rpm: 5,
        rpd: 20,
        tpm: 250000,
        supportedSteps: textSteps,
      ),
      _createModel(
        name: 'gemini-3.5-flash-lite',
        quality: 5,
        speed: 9,
        rpm: 15,
        rpd: 500,
        tpm: 250000,
        supportedSteps: textSteps,
      ),
      _createModel(
        name: 'gemini-3.1-flash-lite',
        quality: 5,
        speed: 9,
        rpm: 15,
        rpd: 500,
        tpm: 250000,
        supportedSteps: textSteps,
      ),
      _createModel(
        name: 'gemini-2.5-flash',
        quality: 8,
        speed: 8,
        rpm: 5,
        rpd: 20,
        tpm: 250000,
        supportedSteps: textSteps,
      ),
      _createModel(
        name: 'gemini-2.5-flash-lite',
        quality: 5,
        speed: 9,
        rpm: 10,
        rpd: 20,
        tpm: 250000,
        supportedSteps: textSteps,
      ),
      _createModel(
        name: 'gemini-3.5-transcribe',
        quality: 8,
        speed: 8,
        rpm: 3,
        rpd: 25,
        tpm: 10000,
        supportedInputs: ['audio'],
        supportedSteps: ['transcribe'],
      ),
    ];
  }

  static AiModel _createModel({
    required String name,
    required int quality,
    required int speed,
    required int rpm,
    required int rpd,
    required int tpm,
    List<String> supportedInputs = const ['text'],
    List<String> supportedSteps = const ['translation'],
  }) {
    return AiModel()
      ..provider = 'google'
      ..name = name
      ..url = 'https://generativelanguage.googleapis.com/v1beta/models/$name'
      ..isEnabled = true
      ..capabilities = (ModelCapabilities()
        ..quality = quality
        ..speed = speed
        ..contextWindow = 1048576
        ..maxOutputTokens = 8192
        ..supportsStreaming = true
        ..supportsJsonMode = true
        ..supportsSystemPrompt = true
        ..supportedInputs = supportedInputs
        ..supportedSteps = supportedSteps
        ..defaultLimit = rpm
        ..defaultDailyLimit = rpd
        ..tpmLimit = tpm
        ..defaultPhrasesPerRequest = 5)
      ..settings = ModelSettings();
  }

  static Future<void> seedIfEmpty(AiModelRepository repository) async {
    final existing = await repository.getAll();
    if (existing.isEmpty) {
      await repository.saveAll(standardAiModels);
    }
  }
}

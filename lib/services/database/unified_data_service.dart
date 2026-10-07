import '../../data/repositories/lemma_repository.dart';
import '../../data/repositories/phrase_repository.dart';
import '../../data/repositories/job_repository.dart';
import '../../data/repositories/ai_model_repository.dart';
import '../../data/repositories/user_lemma_state_repository.dart';
import '../../data/repositories/lemma_gloss_repository.dart';
import '../../data/repositories/lemma_usage_repository.dart';
import '../../data/repositories/ai_model_daily_stat_repository.dart';
import '../../data/repositories/ai_model_event_repository.dart';
import '../../data/repositories/ai_model_score_repository.dart';

import '../../database/models/lemma.dart';
import '../../database/models/phrase.dart';
import '../../database/models/job.dart';
import '../../database/models/ai_model.dart';
import '../../database/models/user_lemma_state.dart';
import '../../database/models/lemma_gloss.dart';
import '../../database/models/lemma_usage.dart';
import '../../database/models/ai_model_daily_stat.dart';
import '../../database/models/ai_model_event.dart';
import '../../database/models/ai_model_score.dart';
import '../../database/models/word_models.dart';
import '../../database/dtos/word_card_response_dto.dart';

/// A single unified service that delegates to all core model repositories
/// and returns results or streams across the database models.
class UnifiedDataService {
  UnifiedDataService({
    required this.lemmaRepo,
    required this.phraseRepo,
    required this.jobRepo,
    required this.aiModelRepo,
    required this.userLemmaStateRepo,
    required this.lemmaGlossRepo,
    required this.lemmaUsageRepo,
    required this.aiModelDailyStatRepo,
    required this.aiModelEventRepo,
    required this.aiModelScoreRepo,
  });

  final LemmaRepository lemmaRepo;
  final PhraseRepository phraseRepo;
  final JobRepository jobRepo;
  final AiModelRepository aiModelRepo;
  final UserLemmaStateRepository userLemmaStateRepo;
  final LemmaGlossRepository lemmaGlossRepo;
  final LemmaUsageRepository lemmaUsageRepo;
  final AiModelDailyStatRepository aiModelDailyStatRepo;
  final AiModelEventRepository aiModelEventRepo;
  final AiModelScoreRepository aiModelScoreRepo;

  // Lemmas
  Future<List<Lemma>> getAllLemmas() => lemmaRepo.getAll();
  Stream<List<Lemma>> watchAllLemmas() => lemmaRepo.watchAll();
  Future<void> saveLemma(Lemma lemma) => lemmaRepo.save(lemma);

  // Phrases
  Future<List<Phrase>> getAllPhrases() => phraseRepo.getAll();
  Stream<List<Phrase>> watchAllPhrases() => phraseRepo.watchAll();
  Future<void> savePhrase(Phrase phrase) => phraseRepo.save(phrase);

  // Jobs
  Future<List<Job>> getAllJobs() => jobRepo.getAll();
  Stream<List<Job>> watchAllJobs() => jobRepo.watchAll();
  Future<void> saveJob(Job job) => jobRepo.save(job);

  // AI Models
  Future<List<AiModel>> getAllAiModels() => aiModelRepo.getAll();
  Stream<List<AiModel>> watchAllAiModels() => aiModelRepo.watchAll();
  Future<void> saveAiModel(AiModel model) => aiModelRepo.save(model);

  // User Lemma States
  Future<List<UserLemmaState>> getAllUserLemmaStates() => userLemmaStateRepo.getAll();
  Stream<List<UserLemmaState>> watchAllUserLemmaStates() => userLemmaStateRepo.watchAll();
  Future<void> saveUserLemmaState(UserLemmaState state) => userLemmaStateRepo.save(state);

  // Lemma Glosses
  Future<List<LemmaGloss>> getAllLemmaGlosses() => lemmaGlossRepo.getAll();
  Stream<List<LemmaGloss>> watchAllLemmaGlosses() => lemmaGlossRepo.watchAll();

  // Lemma Usages
  Future<List<LemmaUsage>> getAllLemmaUsages() => lemmaUsageRepo.getAll();
  Stream<List<LemmaUsage>> watchAllLemmaUsages() => lemmaUsageRepo.watchAll();

  // AI Model Stats, Events, Scores
  Future<List<AiModelDailyStat>> getAllAiModelDailyStats() => aiModelDailyStatRepo.getAll();
  Future<List<AiModelEvent>> getAllAiModelEvents() => aiModelEventRepo.getAll();
  Future<List<AiModelScore>> getAllAiModelScores() => aiModelScoreRepo.getAll();

  /// Returns all cards that have any active status (unknown, learning, known) in a single unified DTO response.
  Future<WordCardResponseDto> getAllCardsWithStatus() async {
    final states = await userLemmaStateRepo.getAll();
    final activeStates = states.where((s) => s.status.isNotEmpty && s.status.toLowerCase() != 'none').toList();
    
    final lemmas = await lemmaRepo.getAll();
    final lemmaMap = {for (final l in lemmas) l.key: l};

    final items = <WordCardItemDto>[];
    for (final state in activeStates) {
      final lemma = lemmaMap[state.lemmaKey];
      
      WordStatus status = WordStatus.none;
      switch (state.status.toLowerCase()) {
        case 'unknown':
          status = WordStatus.unknown;
          break;
        case 'learning':
          status = WordStatus.learning;
          break;
        case 'known':
          status = WordStatus.known;
          break;
      }

      items.add(WordCardItemDto(
        lemmaKey: state.lemmaKey,
        original: lemma?.versions.firstOrNull?.text ?? state.lemmaKey.split('|').first,
        kana: lemma?.versions.skip(1).firstOrNull?.text ?? '',
        romaji: '',
        pos: lemma?.posTag ?? 'unknown',
        jlpt: lemma?.jlptLevel,
        translation: null,
        status: status,
        updatedAt: state.updatedAt,
        synonyms: lemma?.synonymKeys ?? [],
        antonyms: lemma?.antonymKeys ?? [],
      ));
    }

    return WordCardResponseDto(
      items: items,
      totalCount: items.length,
    );
  }
}

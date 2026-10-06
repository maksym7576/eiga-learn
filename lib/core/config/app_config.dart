import 'dart:io';
import 'package:shared_preferences/shared_preferences.dart';

class AppConfig {
  final SharedPreferences _prefs;

  AppConfig(this._prefs);

  // --- Default Values ---
  static const int defaultPhrasesPerRequest = 40;
  static const int defaultSecondsAhead = 100;
  static const int defaultMaxConcurrentProcesses = 2;
  static const int defaultSyncSkipMinutes = 5;
  static const int defaultSyncPointDurationMinutes = 2;
  static const int defaultAudioChunkDurationMinutes = 3;
  static const int defaultTranscriptionOverlapSeconds = 10;

  // --- Storage Keys ---
  static const _keySecondsAhead = 'seconds_before_send';
  static const _keyNumberOfPhrases = 'number_of_phrases';
  static const _keyUseAiStreaming = 'use_ai_streaming';
  static const _keyIsAdaptiveChunkSizeEnabled =
      'is_adaptive_chunk_size_enabled';
  static const _keyIsAutoLockEnabled = 'is_auto_lock_enabled';
  static const _keyLastResetDate = 'last_reset_date_utc';
  static const _keyMaxConcurrentProcesses = 'max_concurrent_processes';

  static const _keyVideoCachingEnabled = 'video_caching_enabled';

  static const _keyBatchSizeTranslate = 'batch_size_translate';
  static const _keyBatchSizeTokenize = 'batch_size_tokenize';
  static const _keyBatchSizeMorphemes = 'batch_size_morphemes';
  static const _keyBatchSizeGrammarRole = 'batch_size_grammar_role';
  static const _keySyncSkipMinutes = 'sync_skip_minutes';
  static const _keySyncPointDurationMinutes = 'sync_point_duration_minutes';
  static const _keyAudioChunkDurationMinutes = 'audio_chunk_duration_minutes';
  static const _keyTranscriptionOverlapSeconds =
      'transcription_overlap_seconds';
  static const _keyAutoTranslateOnImport = 'auto_translate_on_import';
  static const _keyHideParenthesesContent = 'hide_parentheses_content';
  static const _keyFullscreenAutoShrink = 'fs_auto_shrink';
  static const _keyIsGeminiEnabled = 'is_gemini_enabled';
  static const _keyAutoApplyUploadAdjustments = 'auto_apply_upload_adjustments';
  static const _keyAutoApplyAiRecommendations = 'auto_apply_ai_recommendations';
  static const _keyCleanBracketsDefault = 'clean_brackets_default';

  static const _keyAnkiConnectUrl = 'anki_connect_url';
  static const _keyAnkiDeckName = 'anki_deck_name';
  static const _keyAnkiNoteType = 'anki_note_type';
  static const _keyAppLanguage = 'app_language';
  static const _keyTokenizeWithAi = 'tokenize_with_ai';
  static const _keyHasCompletedStartup = 'has_completed_startup';

  // --- Getters & Setters ---

  Future<void> setSecondsAhead(int value) async {
    await _prefs.setInt(_keySecondsAhead, value);
  }

  Future<void> setNumberOfPhrases(int value) async {
    await _prefs.setInt(_keyNumberOfPhrases, value);
  }

  Future<void> setMaxConcurrentProcesses(int value) async {
    await _prefs.setInt(_keyMaxConcurrentProcesses, value);
  }

  Future<void> setBatchSizeTranslate(int value) async {
    await _prefs.setInt(_keyBatchSizeTranslate, value);
  }

  Future<void> setBatchSizeTokenize(int value) async {
    await _prefs.setInt(_keyBatchSizeTokenize, value);
  }

  Future<void> setBatchSizeMorphemes(int value) async {
    await _prefs.setInt(_keyBatchSizeMorphemes, value);
  }

  Future<void> setBatchSizeGrammarRole(int value) async {
    await _prefs.setInt(_keyBatchSizeGrammarRole, value);
  }

  Future<void> setSyncSkipMinutes(int value) async {
    await _prefs.setInt(_keySyncSkipMinutes, value);
  }

  Future<void> setSyncPointDurationMinutes(int value) async {
    await _prefs.setInt(_keySyncPointDurationMinutes, value);
  }

  Future<void> setAudioChunkDurationMinutes(int value) async {
    await _prefs.setInt(_keyAudioChunkDurationMinutes, value);
  }

  Future<void> setTranscriptionOverlapSeconds(int value) async {
    await _prefs.setInt(_keyTranscriptionOverlapSeconds, value);
  }

  Future<void> setAutoTranslateOnImport(bool value) async {
    await _prefs.setBool(_keyAutoTranslateOnImport, value);
  }

  Future<void> setIsAdaptiveChunkSizeEnabled(bool value) async {
    await _prefs.setBool(_keyIsAdaptiveChunkSizeEnabled, value);
  }

  Future<void> setIsAutoLockEnabled(bool value) async {
    await _prefs.setBool(_keyIsAutoLockEnabled, value);
  }

  Future<void> setHideParenthesesContent(bool value) async {
    await _prefs.setBool(_keyHideParenthesesContent, value);
  }

  Future<void> setFullscreenAutoShrink(bool value) async {
    await _prefs.setBool(_keyFullscreenAutoShrink, value);
  }

  Future<void> setIsGeminiEnabled(bool value) async {
    await _prefs.setBool(_keyIsGeminiEnabled, value);
  }

  Future<void> setAutoApplyUploadAdjustments(bool value) async {
    await _prefs.setBool(_keyAutoApplyUploadAdjustments, value);
    await _prefs.setBool(_keyAutoApplyAiRecommendations, value);
    await _prefs.setBool(_keyCleanBracketsDefault, value);
  }

  Future<void> setVideoCachingEnabled(bool value) async {
    await _prefs.setBool(_keyVideoCachingEnabled, value);
  }

  Future<void> setTokenizeWithAi(bool value) async {
    await _prefs.setBool(_keyTokenizeWithAi, value);
  }

  Future<void> setAppLanguage(String langCode) async {
    await _prefs.setString(_keyAppLanguage, langCode);
  }

  int get getSecondsAhead =>
      _prefs.getInt(_keySecondsAhead) ?? defaultSecondsAhead;

  int get getNumberOfPhrases =>
      _prefs.getInt(_keyNumberOfPhrases) ?? defaultPhrasesPerRequest;

  int get getMaxConcurrentProcesses =>
      _prefs.getInt(_keyMaxConcurrentProcesses) ??
      defaultMaxConcurrentProcesses;

  int get getBatchSizeTranslate => _prefs.getInt(_keyBatchSizeTranslate) ?? 70;
  int get getBatchSizeTokenize => _prefs.getInt(_keyBatchSizeTokenize) ?? 70;
  int get getBatchSizeMorphemes => _prefs.getInt(_keyBatchSizeMorphemes) ?? 70;
  int get getBatchSizeGrammarRole =>
      _prefs.getInt(_keyBatchSizeGrammarRole) ?? 70;

  int get getSyncSkipMinutes =>
      _prefs.getInt(_keySyncSkipMinutes) ?? defaultSyncSkipMinutes;
  int get getSyncPointDurationMinutes =>
      _prefs.getInt(_keySyncPointDurationMinutes) ??
      defaultSyncPointDurationMinutes;
  int get getAudioChunkDurationMinutes =>
      _prefs.getInt(_keyAudioChunkDurationMinutes) ??
      defaultAudioChunkDurationMinutes;
  int get getTranscriptionOverlapSeconds =>
      _prefs.getInt(_keyTranscriptionOverlapSeconds) ??
      defaultTranscriptionOverlapSeconds;

  bool get getAutoTranslateOnImport =>
      _prefs.getBool(_keyAutoTranslateOnImport) ?? false;

  bool get getIsAdaptiveChunkSizeEnabled =>
      _prefs.getBool(_keyIsAdaptiveChunkSizeEnabled) ?? true;

  bool get getIsAutoLockEnabled =>
      _prefs.getBool(_keyIsAutoLockEnabled) ?? true;

  bool get getHideParenthesesContent =>
      _prefs.getBool(_keyHideParenthesesContent) ?? false;

  bool get getFullscreenAutoShrink =>
      _prefs.getBool(_keyFullscreenAutoShrink) ?? false;

  bool get getIsGeminiEnabled => _prefs.getBool(_keyIsGeminiEnabled) ?? true;

  bool get getAutoApplyUploadAdjustments =>
      _prefs.getBool(_keyAutoApplyUploadAdjustments) ??
      ((_prefs.getBool(_keyAutoApplyAiRecommendations) ?? false) ||
          (_prefs.getBool(_keyCleanBracketsDefault) ?? false));

  bool get getVideoCachingEnabled {
    final def = Platform.isWindows || Platform.isLinux || Platform.isMacOS;
    return _prefs.getBool(_keyVideoCachingEnabled) ?? def;
  }

  String? get getLastResetDate => _prefs.getString(_keyLastResetDate);

  bool get getUseAiStreaming => _prefs.getBool(_keyUseAiStreaming) ?? true;

  Future<void> setUseAiStreaming(bool value) async {
    await _prefs.setBool(_keyUseAiStreaming, value);
  }

  Future<void> setLastResetDate(String dateStr) async {
    await _prefs.setString(_keyLastResetDate, dateStr);
  }

  bool get getTokenizeWithAi => _prefs.getBool(_keyTokenizeWithAi) ?? false;

  String get getAppLanguage => _prefs.getString(_keyAppLanguage) ?? 'en';

  bool get getHasCompletedStartup =>
      _prefs.getBool(_keyHasCompletedStartup) ?? false;

  Future<void> setHasCompletedStartup(bool value) async {
    await _prefs.setBool(_keyHasCompletedStartup, value);
  }

  Future<void> resetToDefault() async {
    await _prefs.remove(_keySecondsAhead);
    await _prefs.remove(_keyNumberOfPhrases);
    await _prefs.remove(_keyUseAiStreaming);
    await _prefs.remove(_keyIsAdaptiveChunkSizeEnabled);
    await _prefs.remove(_keyIsAutoLockEnabled);
    await _prefs.remove(_keyLastResetDate);
    await _prefs.remove(_keyMaxConcurrentProcesses);

    await _prefs.remove(_keyVideoCachingEnabled);
    await _prefs.remove(_keyBatchSizeTranslate);
    await _prefs.remove(_keyBatchSizeTokenize);
    await _prefs.remove(_keyBatchSizeMorphemes);
    await _prefs.remove(_keyBatchSizeGrammarRole);
    await _prefs.remove(_keySyncSkipMinutes);
    await _prefs.remove(_keySyncPointDurationMinutes);
    await _prefs.remove(_keyAudioChunkDurationMinutes);
    await _prefs.remove(_keyTranscriptionOverlapSeconds);
    await _prefs.remove(_keyAutoTranslateOnImport);
    await _prefs.remove(_keyHideParenthesesContent);
    await _prefs.remove(_keyFullscreenAutoShrink);
    await _prefs.remove(_keyIsGeminiEnabled);
    await _prefs.remove(_keyAutoApplyUploadAdjustments);
    await _prefs.remove(_keyAutoApplyAiRecommendations);
    await _prefs.remove(_keyCleanBracketsDefault);

    await _prefs.remove(_keyAnkiConnectUrl);
    await _prefs.remove(_keyAnkiDeckName);
    await _prefs.remove(_keyAnkiNoteType);
    await _prefs.remove(_keyAppLanguage);
    await _prefs.remove(_keyTokenizeWithAi);
    await _prefs.remove(_keyHasCompletedStartup);
  }

  String get getAnkiConnectUrl =>
      _prefs.getString(_keyAnkiConnectUrl) ?? 'http://localhost:8765';
  Future<void> setAnkiConnectUrl(String value) async =>
      await _prefs.setString(_keyAnkiConnectUrl, value);

  String get getAnkiDeckName => _prefs.getString(_keyAnkiDeckName) ?? 'Eiga';
  Future<void> setAnkiDeckName(String value) async =>
      await _prefs.setString(_keyAnkiDeckName, value);

  String get getAnkiNoteType => _prefs.getString(_keyAnkiNoteType) ?? 'Basic';
  Future<void> setAnkiNoteType(String value) async =>
      await _prefs.setString(_keyAnkiNoteType, value);

  Future<void> resetBatchSettings() async {
    await _prefs.remove(_keyNumberOfPhrases);
    await _prefs.remove(_keyBatchSizeTranslate);
    await _prefs.remove(_keyBatchSizeTokenize);
    await _prefs.remove(_keyBatchSizeMorphemes);
    await _prefs.remove(_keyBatchSizeGrammarRole);
    await _prefs.remove(_keyAudioChunkDurationMinutes);
    await _prefs.remove(_keyTranscriptionOverlapSeconds);
    await _prefs.remove(_keyAutoTranslateOnImport);
  }
}

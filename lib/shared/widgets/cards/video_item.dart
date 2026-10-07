import 'package:flutter/material.dart';

enum ProcessStage { transcribing, translating }

enum VideoMenuAction {
  cache,
  translateAll,
  restoreSubtitles,
  createSubtitles,
  details,
  rerender,
  delete,
  edit,
  info,
}

class VideoItem {
  final String id;
  final String title;
  final String? coverUrl;
  final String? episode;
  final String date;
  final bool cached;
  final bool isBusy;
  final bool hasSubtitles;
  final ProcessStage? stage;
  final double progress;
  final String sourceLang;
  final String targetLang;

  const VideoItem({
    required this.id,
    required this.title,
    this.coverUrl,
    this.episode,
    required this.date,
    this.cached = false,
    this.isBusy = false,
    this.hasSubtitles = false,
    this.stage,
    this.progress = 0,
    required this.sourceLang,
    required this.targetLang,
  });
}

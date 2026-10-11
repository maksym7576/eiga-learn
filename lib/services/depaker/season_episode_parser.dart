class SeasonEpisodeInfo {
  final String? season;
  final String? episode;

  const SeasonEpisodeInfo({this.season, this.episode});
}

SeasonEpisodeInfo parseSeasonEpisode(String fileName) {
  // 1. S01E01 format
  final seMatch = RegExp(r'[Ss](\d{1,2})[Ee](\d{1,3})').firstMatch(fileName);
  if (seMatch != null) {
    return SeasonEpisodeInfo(
      season: seMatch.group(1),
      episode: seMatch.group(2),
    );
  }

  // 2. 'karteX' format (e.g. karte1, karte 01)
  final karteMatch = RegExp(r'karte\s*(\d{1,3})', caseSensitive: false).firstMatch(fileName);
  if (karteMatch != null) {
    return SeasonEpisodeInfo(episode: karteMatch.group(1));
  }

  // 3. Japanese format: 第X話 / 第X
  final jpEpMatch = RegExp(r'第\s*(\d{1,3})\s*[話화]').firstMatch(fileName);
  if (jpEpMatch != null) {
    return SeasonEpisodeInfo(episode: jpEpMatch.group(1));
  }

  // 4. 'Episode X' or 'Ep. X'
  final epWordMatch = RegExp(r'(?:episode|ep\.?)\s*(\d{1,3})', caseSensitive: false).firstMatch(fileName);
  if (epWordMatch != null) {
    return SeasonEpisodeInfo(episode: epWordMatch.group(1));
  }

  // 5. - E01 / E1
  final eOnlyMatch = RegExp(r'[-\s]E(\d{1,3})[-\s]').firstMatch(fileName);
  if (eOnlyMatch != null) {
    return SeasonEpisodeInfo(episode: eOnlyMatch.group(1));
  }

  // 6. - 01 [ or - 01 (
  final dashNumMatch = RegExp(r'-\s*(\d{1,3})\s*[\[\(]').firstMatch(fileName);
  if (dashNumMatch != null) {
    return SeasonEpisodeInfo(episode: dashNumMatch.group(1));
  }

  // 7. - 01 at word boundary
  final dashNumEndMatch = RegExp(r'[-\s_](\d{1,3})\b').firstMatch(fileName);
  if (dashNumEndMatch != null) {
    final epStr = dashNumEndMatch.group(1)!;
    final epNum = int.tryParse(epStr);
    if (epNum != null && epNum > 0 && epNum <= 150) {
      final matchStart = dashNumEndMatch.start;
      final preceding = matchStart > 0 ? fileName.substring(matchStart > 3 ? matchStart - 3 : 0, matchStart).toLowerCase() : '';
      if (!preceding.contains('v') && !preceding.contains('p') && !preceding.contains('kbps')) {
        return SeasonEpisodeInfo(episode: epNum.toString());
      }
    }
  }

  // 8. General number search fallback with strict checks against version/resolution tags (v1, 1080p, etc.)
  final generalMatch = RegExp(r'(?:[_\-\s]|^)0*(\d{1,2})(?:[_\-\s.]|$)').allMatches(fileName);
  for (final m in generalMatch) {
    final epStr = m.group(1)!;
    final epNum = int.tryParse(epStr);
    if (epNum != null && epNum > 0 && epNum <= 100) {
      final matchIdx = m.start;
      final subStr = matchIdx >= 3 ? fileName.substring(matchIdx - 3, matchIdx).toLowerCase() : '';
      if (subStr.contains('v') || subStr.contains('p') || subStr.contains('x') || subStr.contains('ver')) {
        continue;
      }
      return SeasonEpisodeInfo(episode: epNum.toString());
    }
  }

  return const SeasonEpisodeInfo();
}

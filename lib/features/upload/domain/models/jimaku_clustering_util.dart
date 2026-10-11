import 'jimaku_metadata_models.dart';

class JimakuClusteringUtil {
  /// Групує файли за схожими назвами (спільними префіксами перед індикаторами епізодів/версій).
  static List<JimakuGroup> groupFiles(List<FileJimakuDTO> files) {
    if (files.isEmpty) return [];

    final Map<String, List<FileJimakuDTO>> clusters = {};

    for (var file in files) {
      final String baseName = _extractBaseName(file.name);
      clusters.putIfAbsent(baseName, () => []).add(file);
    }

    final List<JimakuGroup> result = [];
    clusters.forEach((name, clusterFiles) {
      clusterFiles.sort((a, b) => a.name.compareTo(b.name));
      result.add(JimakuGroup(name: name, files: clusterFiles));
    });

    result.sort((a, b) => a.name.compareTo(b.name));
    return result;
  }

  static String _extractBaseName(String name) {
    String base = name;
    if (base.contains('.')) {
      final lastDot = base.lastIndexOf('.');
      final ext = base.substring(lastDot + 1).toLowerCase();
      if (ext == 'ass' || ext == 'srt' || ext == 'zip' || ext == 'rar' || ext == '7z') {
        base = base.substring(0, lastDot);
      }
    }

    final epRegex = RegExp(r'(?:[Ss]\d+[Ee]|[Ee][Pp][.\s]*)?(\d+)', caseSensitive: false);
    
    final match = epRegex.firstMatch(base);
    if (match != null) {
      final prefix = base.substring(0, match.start).trim();
      if (prefix.isNotEmpty) {
        return prefix.replaceAll(RegExp(r'[\s\-_.\[\]()]+$'), '');
      }
    }

    return base.trim();
  }

  static List<JimakuFileOrGroupDTO> flatten(List<JimakuGroup> groups, Set<String> expanded) {
    final List<JimakuFileOrGroupDTO> result = [];
    for (var group in groups) {
      final bool isExpanded = expanded.contains(group.name);

      if (group.files.length == 1) {
        result.add(JimakuFileOrGroupDTO(file: group.files.first));
        continue;
      }

      result.add(JimakuFileOrGroupDTO(group: group..isExpanded = isExpanded));

      if (isExpanded) {
        for (var file in group.files) {
          result.add(JimakuFileOrGroupDTO(file: file));
        }
      }
    }
    return result;
  }
}

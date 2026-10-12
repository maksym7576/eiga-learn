import 'package:eiga/database/embedded/align_group.dart';
import 'package:eiga/shared/phrase/core/domain/token.dart';

class TokenAligner {
  /// Знаходить groupId для заданої позиції джерела в AlignGroups
  static int? findGroupIdForSourcePos(int sourcePos, List<AlignGroup> groups) {
    for (final group in groups) {
      if (group.sourcePositions.contains(sourcePos)) {
        return group.groupId;
      }
    }
    return null;
  }

  /// Знаходить groupId для заданої позиції цілі в AlignGroups
  static int? findGroupIdForTargetPos(int targetPos, List<AlignGroup> groups) {
    for (final group in groups) {
      if (group.targetPositions.contains(targetPos)) {
        return group.groupId;
      }
    }
    return null;
  }

  /// Повертає список токенів оригіналу, пов'язаних з даним groupId
  static List<Token> getTokensForGroup(int groupId, List<Token> tokens) {
    return tokens.where((t) => t.groupId == groupId).toList();
  }
}

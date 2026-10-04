import 'package:isar_community/isar.dart';
import '../embedded/sync_meta.dart';

part 'user_lemma_state.g.dart';

@collection
class UserLemmaState {
  Id id = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  late String lemmaKey;
  late String status; // unknown, learning, known etc.
  DateTime? updatedAt;
  late SyncMeta sync;
}

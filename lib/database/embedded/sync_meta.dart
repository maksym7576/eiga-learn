import 'package:isar_community/isar.dart';

part 'sync_meta.g.dart';

@embedded
class SyncMeta {
  late String syncId;
  late String ownerId;
  late DateTime updatedAt;
  DateTime? lastSyncedAt;
  bool isSynced = false;
  bool isDeleted = false;
}

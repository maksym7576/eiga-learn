import 'package:isar_community/isar.dart';
import '../embedded/model_capabilities.dart';
import '../embedded/model_settings.dart';

part 'ai_model.g.dart';

@collection
class AiModel {
  Id id = Isar.autoIncrement;

  late String provider;
  @Index(unique: true, replace: true)
  late String name;
  String? url;

  bool isEnabled = true;

  late ModelCapabilities capabilities;
  late ModelSettings settings;
}

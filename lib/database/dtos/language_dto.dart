import 'package:isar_community/isar.dart';

part 'language_dto.g.dart';

@embedded
class LanguageDto {
  late String name;
  bool tokenizeWithAi = false;
}

import '../../data/repositories/api_token_repository.dart';
import '../../database/dtos/api_token_dto.dart';

class ApiTokenService {
  ApiTokenService(this.repository);

  final ApiTokenRepository repository;

  /// Отримати всі доступні API токен DTO
  List<ApiTokenDto> getAllTokens() => repository.getAllTokens();

  /// Знайти токен DTO за ID
  ApiTokenDto? getTokenById(String id) => repository.getTokenById(id);

  /// Отримати токен за DTO
  Future<String> getToken(ApiTokenDto tokenDto) => repository.getToken(tokenDto);

  /// Зберегти токен з валідацією (trim)
  Future<void> setToken(ApiTokenDto tokenDto, String apiKey) async {
    final trimmed = apiKey.trim();
    if (trimmed.isEmpty) return;
    await repository.setToken(tokenDto, trimmed);
  }

  /// Видалити токен за DTO
  Future<void> deleteToken(ApiTokenDto tokenDto) => repository.deleteToken(tokenDto);
}

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../../database/dtos/api_token_dto.dart';
import '../../database/seeds/api_token_seed.dart';

class ApiTokenRepository {
  static const _storage = FlutterSecureStorage();

  /// Отримати список усіх токен-об'єктів з сіду
  List<ApiTokenDto> getAllTokens() {
    return ApiTokenSeed.tokens;
  }

  /// Знайти токен DTO за ID
  ApiTokenDto? getTokenById(String id) {
    try {
      return ApiTokenSeed.tokens.firstWhere(
        (t) => t.id.toLowerCase() == id.toLowerCase(),
      );
    } catch (_) {
      return null;
    }
  }

  /// Отримати токен за ApiTokenDto з FlutterSecureStorage
  Future<String> getToken(ApiTokenDto tokenDto) async {
    final token = await _storage.read(key: tokenDto.storageKey);
    return token ?? '';
  }

  /// Зберегти токен у FlutterSecureStorage
  Future<void> setToken(ApiTokenDto tokenDto, String apiKey) async {
    await _storage.write(key: tokenDto.storageKey, value: apiKey);
  }

  /// Видалити токен з FlutterSecureStorage
  Future<void> deleteToken(ApiTokenDto tokenDto) async {
    await _storage.delete(key: tokenDto.storageKey);
  }
}

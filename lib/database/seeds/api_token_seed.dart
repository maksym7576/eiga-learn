import '../dtos/api_token_dto.dart';

class ApiTokenSeed {
  static const List<ApiTokenDto> tokens = [
    ApiTokenDto(id: 'gemini', storageKey: 'gemini_api_key', name: 'Gemini'),
    ApiTokenDto(id: 'openai', storageKey: 'openai_api_key', name: 'OpenAI'),
    ApiTokenDto(id: 'anthropic', storageKey: 'anthropic_api_key', name: 'Anthropic'),
    ApiTokenDto(id: 'jimaku', storageKey: 'jimaku_api_key', name: 'Jimaku'),
  ];
}

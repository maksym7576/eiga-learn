import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../data/repositories/api_token_repository.dart';
import '../../services/database/api_token_service.dart';

final apiTokenRepositoryProvider = Provider<ApiTokenRepository>((ref) {
  return ApiTokenRepository();
});

final apiTokenServiceProvider = Provider<ApiTokenService>((ref) {
  final repo = ref.watch(apiTokenRepositoryProvider);
  return ApiTokenService(repo);
});

final hasTokenProvider = FutureProvider.family<bool, String>((ref, tokenId) async {
  final tokenService = ref.watch(apiTokenServiceProvider);
  final tokenDto = tokenService.getTokenById(tokenId);
  if (tokenDto == null) return false;
  final token = await tokenService.getToken(tokenDto);
  return token.trim().isNotEmpty;
});

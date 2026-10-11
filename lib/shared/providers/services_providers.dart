import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../data/repositories/api_token_repository.dart';
import '../../services/database/api_token_service.dart';
import '../../services/cache/cache_service.dart';
import 'language_profile_providers.dart';

final apiTokenRepositoryProvider = Provider<ApiTokenRepository>((ref) {
  return ApiTokenRepository();
});

final apiTokenServiceProvider = Provider<ApiTokenService>((ref) {
  final repo = ref.watch(apiTokenRepositoryProvider);
  return ApiTokenService(repo);
});

final cacheServiceProvider = Provider<CacheService>((ref) {
  final activeProfile = ref.watch(activeProfileProvider);
  final profileId = activeProfile?.dbName ?? activeProfile?.id.toString() ?? 'default';
  return CacheService(profileId: profileId);
});

final hasTokenProvider = FutureProvider.family<bool, String>((ref, tokenId) async {
  final tokenService = ref.watch(apiTokenServiceProvider);
  final tokenDto = tokenService.getTokenById(tokenId);
  if (tokenDto == null) return false;
  final token = await tokenService.getToken(tokenDto);
  return token.trim().isNotEmpty;
});

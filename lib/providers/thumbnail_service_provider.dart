
import 'package:nihongona/services/thumbnail_service.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final thumbnail_service_provider = Provider<thumbnail_service>((ref) {
  return thumbnail_service();
});
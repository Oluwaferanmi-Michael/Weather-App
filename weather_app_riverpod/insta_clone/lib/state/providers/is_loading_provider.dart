

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:insta_clone/state/auth/providers/auth_state_provider.dart';

import '../image_upload/providers/image_upload_provider.dart';

final isLoadingProvider = Provider<bool>((ref) {
  final authState = ref.watch(authStateProvider).isLoading;
  final imageUploadState = ref.watch(imageUploadProvider);
  return authState || imageUploadState;
});
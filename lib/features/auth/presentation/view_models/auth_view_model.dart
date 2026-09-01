import 'dart:async';
import 'package:Expenza/features/auth/data/models/user_model.dart';
import 'package:Expenza/features/auth/data/repository/auth_repositiory_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthViewModel extends AsyncNotifier<UserModel?> {
  @override
  UserModel? build() => ref.read(authRepositoryProvider).getCurrentUser();

  Future<void> signIn(String email, String password) async {
    state = const AsyncLoading();
    try {
      final user = await ref
          .read(authRepositoryProvider)
          .signInStandard(email, password);
      state = AsyncData(user);
    } catch (e, s) {
      state = AsyncError(e, s);
    }
  }
  Future<void> signInWithGoogle() async {
    state = const AsyncLoading();
    try {
      final user = await ref
          .read(authRepositoryProvider)
          .signInWithGoogle();
      state = AsyncData(user);
    } catch (e, s) {
      state = AsyncError(e, s);
    }
  }
}

import 'dart:async';
import 'package:Expenza/features/auth/data/models/user_model.dart';
import 'package:Expenza/features/auth/data/repository/auth_repositiory_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authNotifierProvider = AsyncNotifierProvider(AuthNotifier.new);

class AuthNotifier extends AsyncNotifier<UserModel?> {
  @override
  Future<UserModel?> build() async =>
      ref.read(authRepositoryProvider).getCurrentUser();

  void errorToNull() => state = const AsyncData(null);

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
      final user = await ref.read(authRepositoryProvider).signInWithGoogle();
      state = AsyncData(user);
    } catch (e, s) {
      state = AsyncError(e, s);
    }
  }

  Future<void> signUp({
    required String email,
    required String password,
    required String name,
  }) async {
    state = const AsyncLoading();
    try {
      final user = await ref
          .read(authRepositoryProvider)
          .createAccount(email: email, password: password, name: name);
      state = AsyncData(user);
    } catch (e, s) {
      state = AsyncError(e, s);
    }
  }
}

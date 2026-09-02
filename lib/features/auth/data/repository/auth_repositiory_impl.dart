import 'package:Expenza/features/auth/data/models/user_model.dart';
import 'package:Expenza/features/auth/data/service/auth_service.dart';
import 'package:Expenza/features/auth/domain/repository/auth_repositiory.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authRepositoryProvider = Provider(
  (ref) => AuthRepositoryImpl(ref.read(authServiceProvider)),
);

class AuthRepositoryImpl implements AuthRepository {
  AuthService service;

  AuthRepositoryImpl(this.service);

  @override
  Future<UserModel> signInStandard(String email, String password) async {
    final credential = await service.signInStandard(email, password);
    if (credential.user != null) {
      return UserModel.fromAuth(credential.user!);
    } else {
      throw "An unexpected error occured.";
    }
  }

  @override
  Future<UserModel> signInWithGoogle() async {
    final credential = await service.signInWithGoogle();
    if (credential.user != null) {
      return UserModel.fromAuth(credential.user!);
    } else {
      throw "An unexpected error occured.";
    }
  }

  @override
  Future<UserModel> createAccount({
    required String email,
    required String password,
    required String name,
  }) async {
    final UserCredential credential = await service.createAccount(
      email,
      password,
    );
    if (credential.user != null) {
      await credential.user!.updateDisplayName(name);
      return UserModel.fromAuth(credential.user!);
    } else {
      throw "An unexpected error occured.";
    }
  }

  @override
  Future<UserModel?> getCurrentUser() async {
    User? user = await service.getCurrentUser();
    return user != null ? UserModel.fromAuth(user) : null;
  }

  @override
  Future<void> signOut() async {
    return await service.signOut();
  }

  @override
  Future<void> updateName(String name) async {
    return await service.updateAccountName(name);
  }

  @override
  Future<void> updatePassword({
    required String oldPassword,
    required String newPassword,
  }) async {
    final UserCredential userCredential = await service.reAuthenticate(
      oldPassword,
    );
    return await service.updatePassword(newPassword, userCredential.user!);
  }
}

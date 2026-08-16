import 'package:Expenza/features/auth/data/models/user_mode.dart';
import 'package:Expenza/features/auth/data/service/auth_service.dart';
import 'package:Expenza/features/auth/domain/repository/auth_repositiory.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthService service;

  AuthRepositoryImpl(this.service);

  @override
  Future<UserCredential> signInStandard(String email, String password) async {
    return await service.signInStandard(email, password);
  }

  @override
  Future<UserCredential> signInWithGoogle() async {
    return await service.signInWithGoogle();
  }

  @override
  Future<UserCredential> createAccount({
    required String email,
    required String password,
    required String name,
  }) async {
    final UserCredential userCredential = await service.createAccount(
      email,
      password,
    );
    await userCredential.user!.updateDisplayName(name);
    return userCredential;
  }

  @override
  UserModel? getCurrentUser(){
    User? user = service.getCurrentUser();
    return UserModel.fromAuth(user!);
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

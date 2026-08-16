import 'package:Expenza/features/auth/data/models/user_mode.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthRepository {
  Future<UserCredential> signInStandard(String email, String password);

  Future<UserCredential> signInWithGoogle();

  Future<UserCredential> createAccount({
    required String email,
    required String password,
    required String name,
  });

  UserModel? getCurrentUser();

  Future<void> signOut();

  Future<void> updateName(String name);

  Future<void> updatePassword({
    required String oldPassword,
    required String newPassword,
  });
}

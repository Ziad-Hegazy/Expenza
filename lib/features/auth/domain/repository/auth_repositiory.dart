import 'package:Expenza/features/auth/data/models/user_model.dart';

abstract class AuthRepository {
  Future<UserModel> signInStandard(String email, String password);

  Future<UserModel> signInWithGoogle();

  Future<UserModel> createAccount({
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

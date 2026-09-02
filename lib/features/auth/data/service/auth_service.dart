import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';

final authServiceProvider = Provider((ref) => AuthService());

class AuthService {
  final GoogleSignIn _googleSignIn = GoogleSignIn.instance;
  Future<UserCredential> signInStandard(String email, String password) async {
    return await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<UserCredential> signInWithGoogle() async {
    final GoogleSignInAccount googleUser = await _googleSignIn
        .authenticate();
    final OAuthCredential credential = GoogleAuthProvider.credential(
      idToken: googleUser.authentication.idToken,
    );
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  Future<UserCredential> createAccount(String email, String password) async {
    return await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<User?> getCurrentUser() async {
    await FirebaseAuth.instance.currentUser?.reload();
    return FirebaseAuth.instance.currentUser;
  }

  Future<UserCredential> reAuthenticate(String password) {
    final AuthCredential credential = EmailAuthProvider.credential(
      email: FirebaseAuth.instance.currentUser!.email!,
      password: password,
    );
    return FirebaseAuth.instance.currentUser!.reauthenticateWithCredential(
      credential,
    );
  }

  Future<void> signOut() async {
    return await FirebaseAuth.instance.signOut();
  }

  Future<void> updateAccountName(String name) async {
    User? user = FirebaseAuth.instance.currentUser;
    await user?.updateDisplayName(name);
  }

  Future<void> updatePassword(String newPassword, User user) async {
    await user.updatePassword(newPassword);
  }
}

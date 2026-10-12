import 'package:flutter_riverpod/flutter_riverpod.dart';

final authFormTypeProvider = NotifierProvider(AuthFormTypeNotifier.new);

class AuthFormTypeNotifier extends Notifier<AuthFormTypes> {
  @override
  AuthFormTypes build() => AuthFormTypes.login;

  void setScreen(AuthFormTypes screen) => state = screen;
}
enum AuthFormTypes { login, signup }

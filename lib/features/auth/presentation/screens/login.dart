import 'package:Expenza/features/auth/presentation/base_auth_screen.dart';
import 'package:Expenza/features/auth/presentation/widgets/login_body.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseAuthScreen(
      title: 'Hello',
      subtitle: 'Sign in to continue',
      body: LoginBody(),
    );
  }
}

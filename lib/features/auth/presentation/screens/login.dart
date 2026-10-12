import 'package:Expenza/features/auth/presentation/providers/auth_form_type_notifier.dart';
import 'package:Expenza/features/auth/presentation/screens/base_auth_screen.dart';
import 'package:Expenza/features/auth/presentation/screens/signup.dart';
import 'package:Expenza/features/auth/presentation/widgets/login_body.dart';
import 'package:adaptive_platform_ui/adaptive_platform_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Login extends ConsumerWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return BaseAuthScreen(
      title: 'Hello',
      subtitle: 'Sign in to continue',
      body: LoginBody(),
      footer: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("No account?"),
          TextButton(
            onPressed: () {
              ref
                  .read<AuthFormTypeNotifier>(authFormTypeProvider.notifier)
                  .setScreen(AuthFormTypes.signup);
            },
            child: Text('Sign up'),
          ),
        ],
      ),
    );
  }
}

import 'package:Expenza/features/auth/presentation/providers/auth_form_type_notifier.dart';
import 'package:Expenza/features/auth/presentation/screens/base_auth_screen.dart';
import 'package:Expenza/features/auth/presentation/widgets/signup_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Signup extends ConsumerWidget {
  const Signup({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return BaseAuthScreen(
      title: 'Welcome',
      subtitle: 'Sign up to continue',
      body: SignupBody(),
      footer: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Already have an account?"),
          TextButton(
            onPressed: () {
              ref
                  .read<AuthFormTypeNotifier>(authFormTypeProvider.notifier)
                  .setScreen(AuthFormTypes.login);
            },
            child: Text('Login'),
          ),
        ],
      ),
    );
  }
}

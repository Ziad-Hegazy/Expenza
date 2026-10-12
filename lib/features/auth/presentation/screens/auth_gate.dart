import 'package:Expenza/core/base_screen.dart';
import 'package:Expenza/features/auth/presentation/providers/auth_notifier.dart';
import 'package:Expenza/features/auth/presentation/providers/auth_form_type_notifier.dart';
import 'package:Expenza/features/auth/presentation/screens/login.dart';
import 'package:Expenza/features/auth/presentation/screens/signup.dart';
import 'package:Expenza/features/auth/presentation/widgets/auth_loading_animation.dart';
import 'package:adaptive_platform_ui/adaptive_platform_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthGate extends ConsumerWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(authNotifierProvider, (previous, next) {
      if (next.hasError && !(previous?.hasError ?? false)) {
        WidgetsBinding.instance.addPostFrameCallback((_) async {
          await AdaptiveAlertDialog.show(
            context: context,
            title: 'Error',
            actions: [
              AlertAction(
                title: 'ok',
                onPressed: () =>
                    ref.read(authNotifierProvider.notifier).errorToNull(),
              ),
            ],
          );
        });
      }
    });
    final authState = ref.watch(authNotifierProvider);
    final authFormState = ref.watch(authFormTypeProvider);
    return authState.when(
      data: (data) => data == null
          ? switch (authFormState) {
              .login => const Login(),
              .signup => const Signup(),
            }
          : const BaseScreen(),
      error: (error, stackTrace) => const AuthLoadingAnimation(),
      loading: () => const AuthLoadingAnimation(),
    );
  }
}

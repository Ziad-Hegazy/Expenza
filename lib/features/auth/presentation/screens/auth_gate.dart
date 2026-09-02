import 'package:Expenza/core/base_screen.dart';
import 'package:Expenza/features/auth/presentation/screens/login.dart';
import 'package:Expenza/features/auth/presentation/view_models/auth_view_model.dart';
import 'package:Expenza/features/auth/presentation/widgets/auth_loading_animation.dart';
import 'package:adaptive_platform_ui/adaptive_platform_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthGate extends ConsumerWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(authViewModelProvider, (previous, next) {
      if (next.hasError && !(previous?.hasError ?? false)) {
        AdaptiveAlertDialog.show(
          context: context,
          title: 'Error',
          actions: [
            AlertAction(
              title: 'ok',
              onPressed: () =>
                  ref.read(authViewModelProvider.notifier).errorToNull(),
            ),
          ],
        );
      }
    });
    final authState = ref.watch(authViewModelProvider);
    return authState.when(
      data: (data) => data == null ? const Login() : const BaseScreen(),
      error: (error, stackTrace) => const Login(),
      loading: () => AuthLoadingAnimation(),
    );
  }
}

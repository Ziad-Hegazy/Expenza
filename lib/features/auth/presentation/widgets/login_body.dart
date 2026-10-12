import 'package:Expenza/core/utils/enums/icons.dart';
import 'package:Expenza/core/utils/validators/mandatory_validator.dart';
import 'package:Expenza/core/widgets/app_icon.dart';
import 'package:Expenza/core/widgets/appTextField.dart';
import 'package:Expenza/features/auth/presentation/providers/auth_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginBody extends ConsumerStatefulWidget {
  const LoginBody({super.key});

  @override
  ConsumerState<LoginBody> createState() => _LoginBodyState();
}

class _LoginBodyState extends ConsumerState<LoginBody> {
  bool showPass = false;

  late final TextEditingController emailController;
  late final TextEditingController passwordController;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        spacing: 33.h,
        children: [
          AppTextField(
            hintText: 'email',
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.emailAddress,
            controller: emailController,
            validator: (value) => MandatoryValidator.validate('Email', value),
            onChanged: (_) => _formKey.currentState?.clearError(),
          ),
          AppTextField(
            hintText: 'Password',
            obscureText: !showPass,
            textInputAction: TextInputAction.done,
            keyboardType: TextInputType.visiblePassword,
            controller: passwordController,
            validator: (value) => MandatoryValidator.validate('Email', value),
            onChanged: (_) => _formKey.currentState?.clearError(),
          ),
          _buttons(),
          _socialButtons(),
        ],
      ),
    );
  }

  Row _buttons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextButton(onPressed: () {}, child: Text('Forgot\npassword')),
        FilledButton(
          onPressed: () {
            if (_formKey.currentState?.validate() ?? false) {
              ref
                  .read(authNotifierProvider.notifier)
                  .signIn(emailController.text, passwordController.text);
            }
          },
          child: Text('Login'),
        ),
      ],
    );
  }

  Column _socialButtons() {
    final authState = ref.watch(authNotifierProvider);
    final authViewModel = ref.read(authNotifierProvider.notifier);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 15.w,
          children: [
            IconButton(
              onPressed: authState.isLoading
                  ? null
                  : authViewModel.signInWithGoogle,
              icon: const AppIcon(AppIcons.google_logo),
            ),
          ],
        ),
      ],
    );
  }
}

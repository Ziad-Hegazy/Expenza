import 'package:Expenza/core/utils/enums/icons.dart';
import 'package:Expenza/core/utils/validators/mandatory_validator.dart';
import 'package:Expenza/core/widgets/app_icon.dart';
import 'package:Expenza/core/widgets/appTextField.dart';
import 'package:Expenza/features/auth/presentation/validators/email_validator.dart';
import 'package:Expenza/features/auth/presentation/validators/password_validator.dart';
import 'package:Expenza/features/auth/presentation/providers/auth_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignupBody extends ConsumerStatefulWidget {
  const SignupBody({super.key});

  @override
  ConsumerState<SignupBody> createState() => _SignupBodyState();
}

class _SignupBodyState extends ConsumerState<SignupBody> {
  bool showPass = false;
  bool showConfirm = false;
  final _formKey = GlobalKey<FormState>();

  late final TextEditingController firstNameController;
  late final TextEditingController lastNameController;
  late final TextEditingController emailController;
  late final TextEditingController passwordController;
  late final TextEditingController confirmController;

  @override
  void initState() {
    super.initState();
    firstNameController = TextEditingController();
    lastNameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    confirmController = TextEditingController();
  }

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmController.dispose();
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
            hintText: 'Email',
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.emailAddress,
            controller: emailController,
            validator: EmailValidator.validate,
            onChanged: (_) => _formKey.currentState?.clearError(),
          ),
          Row(
            spacing: 15,
            children: [
              Expanded(
                child: AppTextField(
                  hintText: 'First Name',
                  textInputAction: TextInputAction.next,
                  controller: firstNameController,
                  validator: (value) =>
                      MandatoryValidator.validate("First Name", value),
                  onChanged: (_) => _formKey.currentState?.clearError(),
                ),
              ),
              Expanded(
                child: AppTextField(
                  hintText: 'Last Name',
                  textInputAction: TextInputAction.next,
                  controller: lastNameController,
                  validator: (value) =>
                      MandatoryValidator.validate("Last Name", value),
                  onChanged: (_) => _formKey.currentState?.clearError(),
                ),
              ),
            ],
          ),
          AppTextField(
            hintText: 'Password',
            obscureText: !showPass,
            keyboardType: TextInputType.visiblePassword,
            textInputAction: TextInputAction.next,
            controller: passwordController,
            validator: PasswordValidator.validate,
            onChanged: (_) => _formKey.currentState?.clearError(),
          ),
          AppTextField(
            hintText: 'Confirm Password',
            obscureText: !showConfirm,
            keyboardType: TextInputType.visiblePassword,
            textInputAction: TextInputAction.done,
            controller: confirmController,
            validator: (value) => PasswordValidator.validateConfirm(
              passwordController.text,
              value,
            ),
            onChanged: (_) => _formKey.currentState?.clearError(),
          ),
          _buttons(),
        ],
      ),
    );
  }

  Row _buttons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _socialButtons(),
          FilledButton(
            onPressed: () {
              if (_formKey.currentState?.validate() ?? false) {
                ref
                    .read(authNotifierProvider.notifier)
                    .signUp(
                      email: emailController.text,
                      password: passwordController.text,
                      name: firstNameController.text,
                    );
              }
            },
            child: Text('Sign up'),
          ),

      ],
    );
  }

  Row _socialButtons() {
    final authState = ref.watch(authNotifierProvider);
    final authViewModel = ref.read(authNotifierProvider.notifier);
    return Row(
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
    );
  }
}

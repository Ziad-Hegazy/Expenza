import 'package:expenza/core/utils/enums/icons.dart';
import 'package:expenza/core/widgets/app_icon.dart';
import 'package:expenza/core/widgets/appTextField.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginBody extends StatefulWidget {
  const LoginBody({super.key});

  @override
  State<LoginBody> createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  bool showPass = false;

  late final TextEditingController emailController;
  late final TextEditingController passwordController;

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
      child: Column(
        spacing: 33.h,
        children: [
          AppTextField(
            hintText: 'email',
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.emailAddress,
          ),
          AppTextField(
            hintText: 'Password',
            suffixIcon: _showIcon(),
            obscureText: !showPass,
            textInputAction: TextInputAction.done,
          ),
          _buttons(),
          _socialButtons(),
        ],
      ),
    );
  }

  Padding _showIcon() {
    return Padding(
      padding: EdgeInsetsDirectional.only(end: 5.w),
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          customBorder: CircleBorder(),
          onTap: () => setState(() => showPass = !showPass),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: AppIcon(showPass ? AppIcons.hide : AppIcons.show),
          ),
        ),
      ),
    );
  }
}

Row _buttons() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      TextButton(onPressed: () {}, child: Text('Forgot\npassword')),
      FilledButton(onPressed: () {}, child: Text('Login')),
    ],
  );
}

Column _socialButtons() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    spacing: 10.h,
    children: [
      Text('or sign in with'),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 15.w,
        children: [AppIcon(AppIcons.google_logo)],
      ),
    ],
  );
}

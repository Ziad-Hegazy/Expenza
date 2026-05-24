import 'package:expenza/features/auth/presentation/base_auth_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseAuthScreen(
      title: 'Hello',
      subtitle: 'Sign in to continue',
      body: _body(),
    );
  }

  Column _body() {
    return Column(
      spacing: 33.h,
      children: [
        TextField(decoration: InputDecoration(hintText: 'Email')),
        TextField(
          decoration: InputDecoration(hintText: 'Password'),
          obscureText: true,
        ),
        _buttons(),
        _socialButtons(),
      ],
    );
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
      children: [Text('or sign in with'), Icon(Icons.facebook_rounded)],
    );
  }

}

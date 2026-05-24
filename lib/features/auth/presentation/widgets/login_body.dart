import 'package:expenza/core/utils/enums/icons.dart';
import 'package:expenza/core/widgets/app_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginBody extends StatefulWidget {
  const LoginBody({super.key});

  @override
  State<LoginBody> createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  bool showPass = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 33.h,
      children: [
        TextField(decoration: InputDecoration(hintText: 'Email')),
        TextField(
          decoration: InputDecoration(
            hintText: 'Password',
            suffixIcon: Padding(
              padding: EdgeInsetsDirectional.only(end: 20.w),
              child: _showIcon(),
            ),
          ),
          obscureText: !showPass,
        ),
        _buttons(),
        _socialButtons(),
      ],
    );
  }

  Material _showIcon() {
    return Material(
      type: MaterialType.transparency,
      child: InkWell(
        customBorder: CircleBorder(),
        radius: 50.w,
        onTap: () => setState(() => showPass = !showPass),
        child: AppIcon(showPass ? AppIcons.hide : AppIcons.show),
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

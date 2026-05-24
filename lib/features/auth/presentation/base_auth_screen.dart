import 'package:expenza/core/utils/constants/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BaseAuthScreen extends StatelessWidget {
  const BaseAuthScreen({
    super.key,
    this.title = '',
    this.subtitle = '',
    this.body,
    this.footer,
    this.showBack = true,
  });

  final String title;
  final String subtitle;
  final Widget? body;
  final Widget? footer;
  final bool showBack;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=>FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Stack(
          alignment: AlignmentDirectional.topEnd,
          children: [
            PositionedDirectional(
              end: -65.w,
              top: 61.h,
              child: Image.asset(blueBlur, width: 400.w, height: 400.h),
            ),
            SingleChildScrollView(
              child: SizedBox(
                height: MediaQuery.heightOf(context),
                child: Padding(
                  padding: EdgeInsets.only(left: 40.w, right: 40.w, bottom: 20.h),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    spacing: 39.h,
                    children: [
                      _header(
                        title: 'Welcome',
                        subtitle: 'Sign in to continue',
                        showBack: showBack,
                        context: context,
                      ),
                      body ?? SizedBox.shrink(),
                      footer ?? SizedBox.shrink(),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Row _header({
    required String title,
    required String subtitle,
    required bool showBack,
    required BuildContext context,
  }) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            showBack
                ? IconButton(
                    onPressed: () async {
                      Navigator.maybePop(context);
                    },
                    icon: Icon(Icons.arrow_back),
                  )
                : SizedBox.shrink(),
            SizedBox(height: 15.h),
            Text(title, style: Theme.of(context).textTheme.titleLarge),
            Text(subtitle, style: Theme.of(context).textTheme.titleMedium),
          ],
        ),
      ],
    );
  }
}

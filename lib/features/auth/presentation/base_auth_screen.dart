import 'package:Expenza/core/utils/constants/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BaseAuthScreen extends StatelessWidget {
  const BaseAuthScreen({
    super.key,
    this.title = '',
    this.subtitle = '',
    this.body,
    this.footer,
    this.showBack = false,
  });

  final String title;
  final String subtitle;
  final Widget? body;
  final Widget? footer;
  final bool showBack;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Stack(
          alignment: AlignmentDirectional.topEnd,
          children: [_blurredDecoration(), _body(context)],
        ),
      ),
    );
  }

  SingleChildScrollView _body(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        top: false,
        child: SizedBox(
          height:
              MediaQuery.heightOf(context) -
              MediaQuery.viewPaddingOf(context).bottom,
          child: Padding(
            padding: EdgeInsets.only(
              left: 40.w,
              right: 40.w,
              //bottom: 20.h,
            ),
            child: _bodyContent(context),
          ),
        ),
      ),
    );
  }

  Column _bodyContent(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      spacing: 39.h,
      children: [
        _header(
          title: title,
          subtitle: subtitle,
          showBack: showBack,
          context: context,
        ),
        ?body,
        ?footer,
      ],
    );
  }

  PositionedDirectional _blurredDecoration() {
    return PositionedDirectional(
      end: -65.w,
      top: 0.h,
      child: RepaintBoundary(
        child: Image.asset(blueBlur, width: 400.w, height: 400.h),
      ),
    );
  }

  Row _header({
    required final String title,
    required final String subtitle,
    required final bool showBack,
    required BuildContext context,
  }) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (showBack)
              IconButton(
                onPressed: () async {
                  Navigator.maybePop(context);
                },
                icon: const Icon(Icons.arrow_back),
              ),
            SizedBox(height: 15.h),
            Text(title, style: Theme.of(context).textTheme.titleLarge),
            Text(subtitle, style: Theme.of(context).textTheme.titleMedium),
          ],
        ),
      ],
    );
  }
}

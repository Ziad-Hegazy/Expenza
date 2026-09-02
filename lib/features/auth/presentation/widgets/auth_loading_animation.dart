import 'dart:math' as math;

import 'package:Expenza/core/utils/constants/images.dart';
import 'package:Expenza/core/utils/styles/themes/widget_themes/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AuthLoadingAnimation extends StatefulWidget {
  const AuthLoadingAnimation({super.key});

  @override
  State<AuthLoadingAnimation> createState() => _AuthLoadingAnimationState();
}

class _AuthLoadingAnimationState extends State<AuthLoadingAnimation>
    with TickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final radius = 75;
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                final double t = _controller.value * 2 * math.pi;
                final double dy = radius * math.sin(t);
                final double dx = radius * math.sin(2 * t) / 2;
                return Transform.translate(
                  offset: Offset(dx, dy),
                  child: Transform.scale(
                    scale: 1.5,
                    child: Image.asset(blueBlur, width: 800.w, height: 800.h),
                  ),
                );
              },
            ),
            Center(
              child: Text(
                'Just a second...',
                style: AppTextTheme.values.titleMedium,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

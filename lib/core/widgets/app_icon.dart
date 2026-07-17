import 'package:Expenza/core/utils/enums/icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppIcon extends StatelessWidget {
  const AppIcon(
    this.icon, {
    super.key,
    this.style = IconStyles.bold,
    this.size = 30,
  });

  final AppIcons icon;
  final IconStyles style;
  final double size;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(icon.path(style), width: size, height: size);
  }
}

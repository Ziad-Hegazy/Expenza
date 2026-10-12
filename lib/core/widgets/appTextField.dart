import 'package:Expenza/core/utils/enums/icons.dart';
import 'package:Expenza/core/widgets/app_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextField extends StatefulWidget {
  const AppTextField({
    super.key,
    this.hintText,
    this.suffixIcon,
    this.enabled,
    this.textInputAction,
    this.controller,
    this.obscureText = false,
    this.keyboardType,
    this.validator,
    this.onChanged,
  });

  final TextInputType? keyboardType;
  final bool obscureText;
  final TextEditingController? controller;
  final String? hintText;
  final Widget? suffixIcon;
  final bool? enabled;
  final TextInputAction? textInputAction;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField>
    with WidgetsBindingObserver {
  final FocusNode _focusNode = FocusNode();
  late bool _hideText;

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    _hideText = widget.obscureText;
    super.initState();
  }

  @override
  void didChangeMetrics() {
    if (!_focusNode.hasFocus || !mounted) return;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeOut,
        alignment: 0.55,
      );
    });

    super.didChangeMetrics();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: widget.key,
      keyboardType: widget.keyboardType,
      obscureText: _hideText,
      controller: widget.controller,
      textInputAction: widget.textInputAction,
      enabled: widget.enabled,
      validator: widget.validator,
      decoration: InputDecoration(
        hintText: widget.hintText,
        suffixIcon: widget.keyboardType == TextInputType.visiblePassword
            ? _showIcon()
            : widget.suffixIcon,
      ),
      focusNode: _focusNode,
      onChanged: widget.onChanged,
    );
  }

  Padding _showIcon() {
    return Padding(
      padding: EdgeInsetsDirectional.only(end: 5.w),
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          customBorder: CircleBorder(),
          onTap: () => setState(() => _hideText = !_hideText),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: AppIcon(_hideText ? AppIcons.show : AppIcons.hide),
          ),
        ),
      ),
    );
  }
}

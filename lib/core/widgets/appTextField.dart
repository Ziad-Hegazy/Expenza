import 'package:flutter/material.dart';

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
  });

  final TextInputType? keyboardType;
  final bool obscureText;
  final TextEditingController? controller;
  final String? hintText;
  final Widget? suffixIcon;
  final bool? enabled;
  final TextInputAction? textInputAction;
  final String? Function(String?)? validator;

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField>
    with WidgetsBindingObserver {
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
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
    MediaQuery.viewInsetsOf(context).bottom;
    MediaQuery.viewPaddingOf(context).bottom;
    MediaQuery.paddingOf(context).bottom;
    return TextFormField(
      key: widget.key,
      keyboardType: widget.keyboardType,
      obscureText: widget.obscureText,
      controller: widget.controller,
      textInputAction: widget.textInputAction,
      enabled: widget.enabled,
      validator: widget.validator,
      decoration: InputDecoration(
        hintText: widget.hintText,
        suffixIcon: widget.suffixIcon,
      ),
      focusNode: _focusNode,
    );
  }
}

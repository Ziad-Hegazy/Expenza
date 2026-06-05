import 'dart:async';

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
  Timer? _keyboardTimer;

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void didChangeMetrics() {
    if (!_focusNode.hasFocus) return;

    _keyboardTimer?.cancel();

    _keyboardTimer = Timer(const Duration(milliseconds: 50), () {
      if (!mounted) return;

      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
        alignment: 0.5,
      );
    });
    super.didChangeMetrics();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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

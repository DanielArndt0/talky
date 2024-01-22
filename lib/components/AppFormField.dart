// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:talky_chat/ComponentDecoration.dart';

class AppFormField extends StatefulWidget {
  const AppFormField({
    super.key,
    this.isVisible,
    this.iconOnPressed,
    this.label,
    this.hint,
    this.icon,
    this.validator,
    this.controller,
    this.initialValue,
  });

  final void Function()? iconOnPressed;
  final bool? isVisible;
  final String? label;
  final String? hint;
  final String? initialValue;
  final Widget? icon;
  final String? Function(String?)? validator;
  final TextEditingController? controller;

  @override
  State<AppFormField> createState() => _AppFormFieldState();
}

class _AppFormFieldState extends State<AppFormField> {
  late bool viewText;

  @override
  void initState() {
    super.initState();
    viewText = widget.isVisible ?? true;
  }

  Widget suffixIcon() {
    Widget wid = const SizedBox();
    if (widget.icon == null) {
      if (widget.isVisible ?? true) {
        wid = const SizedBox();
      } else {
        wid = IconButton(
          onPressed: () => setState(() => viewText = !viewText),
          icon: viewText
              ? const Icon(Icons.visibility_off)
              : const Icon(Icons.visibility),
        );
      }
    } else {
      wid = IconButton(
        onPressed: widget.iconOnPressed,
        icon: widget.icon!,
      );
    }
    return wid;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      validator: widget.validator,
      obscureText: !viewText,
      decoration: ComponentDecoration.inputDecoration(
        suffixIcon: suffixIcon(),
        label: widget.label,
        hint: widget.hint,
      ),
    );
  }
}

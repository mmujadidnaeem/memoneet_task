import 'package:flutter/material.dart';

import '../../constants/app_colors.dart';

class AppPasswordField extends StatefulWidget {
  const AppPasswordField({
    super.key,
    this.hintText,
    this.labelText,
    this.prefixIcon,
    this.readOnly = false,
    this.validator,
    this.controller,
    this.textInputAction,
    this.keyboardType = TextInputType.text,
    this.onChange,
    this.onTap,
    this.initialValue,
  });

  final bool readOnly;
  final FormFieldValidator<String?>? validator;
  final TextEditingController? controller;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;

  final Function(String value)? onChange;
  final Function()? onTap;

  final String? initialValue;
  final String? hintText;
  final String? labelText;
  final IconData? prefixIcon;

  @override
  State<AppPasswordField> createState() => _AppPasswordFieldState();
}

class _AppPasswordFieldState extends State<AppPasswordField> {
  InputBorder inputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(20),
    borderSide: const BorderSide(color: AppColors.primaryColor),
  );

  final InputBorder errorInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(20),
    borderSide: const BorderSide(color: Colors.white),
  );
  bool _showPassword = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: widget.readOnly,
      onTap: widget.onTap,
      validator: widget.validator,
      keyboardType: widget.keyboardType,
      controller: widget.controller,
      initialValue: widget.initialValue,
      onChanged: widget.onChange,
      textInputAction: widget.textInputAction,
      obscureText: _showPassword,
      decoration: InputDecoration(
        filled: true,
        isDense: true,
        contentPadding: const EdgeInsets.all(15),
        fillColor: AppColors.backgroundColor,
        prefixIcon: widget.prefixIcon != null
            ? Icon(
                widget.prefixIcon,
                size: 22,
              )
            : null,
        labelText: widget.labelText,
        hintText: widget.hintText,
        enabledBorder: inputBorder,
        focusedBorder: inputBorder,
        border: inputBorder,
        errorBorder: errorInputBorder,
        suffixIcon: GestureDetector(
          onTap: () {
            _showPassword = !_showPassword;
            setState(() {});
          },
          child: Icon(
            _showPassword ? Icons.visibility_off_outlined : Icons.visibility,
            size: 22,
          ),
        ),
      ),
    );
  }
}

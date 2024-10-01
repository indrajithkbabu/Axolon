import 'package:contactapp/app/utils/colors.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final bool obscureText;
  final IconData? prefixIcon;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final String? labelText;
  final EdgeInsetsGeometry? contentPadding;
  final FocusNode? focusNode;
  final TextStyle? hintStyle;

  const CustomTextFormField({
    super.key,
    required this.hintText,
    required this.controller,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.prefixIcon,
    this.validator,
    this.onChanged,
    this.labelText,
    this.contentPadding,
    this.focusNode,
    this.hintStyle,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      focusNode: focusNode,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        hintStyle: hintStyle,
        prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
        errorBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.errorColor,
            width: 2.0,
          ),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.primaryColor,
            width: 2.0,
          ),
        ),
        border: const UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.greyColor),
        ),
        contentPadding: contentPadding ??
            const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
      ),
      validator: validator,
      onChanged: onChanged,
      cursorColor: AppColors.primaryColor,
    );
  }
}

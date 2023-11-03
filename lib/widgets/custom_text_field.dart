import 'package:flutter/material.dart';
import 'package:unjuk_keterampilan_fg/resources/colors.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.prefixIcon,
    required this.hintText,
    this.suffixIcon,
    required this.padding,
    this.contentPadding,
  });

  final Widget? prefixIcon;
  final String hintText;
  final Widget? suffixIcon;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry? contentPadding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color: ColorPalette().iconBackgroundColor,
        ),
        child: TextField(
          textAlignVertical: TextAlignVertical.center,
          decoration: InputDecoration(
            contentPadding: contentPadding,
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
            border: InputBorder.none,
            hintText: hintText,
          ),
        ),
      ),
    );
  }
}

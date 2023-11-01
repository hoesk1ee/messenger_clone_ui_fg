import 'package:flutter/material.dart';
import 'package:unjuk_keterampilan_fg/resources/colors.dart';

class IconBackgroundWidget extends StatelessWidget {
  const IconBackgroundWidget(
      {super.key, required this.child, this.width, this.height});

  final Widget child;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 12),
      width: width,
      height: height,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: ColorPalette().iconBackgroundColor,
      ),
      child: child,
    );
  }
}

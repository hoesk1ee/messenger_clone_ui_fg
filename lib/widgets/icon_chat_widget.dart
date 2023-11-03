import 'package:flutter/material.dart';
import 'package:unjuk_keterampilan_fg/resources/colors.dart';

class IconChat extends StatelessWidget {
  const IconChat({
    super.key,
    required this.icons,
    required this.onTap,
  });

  final IconData icons;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(left: 16.0),
        child: Icon(
          icons,
          color: ColorPalette().iconChatColor,
        ),
      ),
    );
  }
}

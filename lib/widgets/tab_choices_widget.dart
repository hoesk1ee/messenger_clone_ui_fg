import 'package:flutter/material.dart';
import 'package:unjuk_keterampilan_fg/resources/colors.dart';

class TabChoicesWidget extends StatelessWidget {
  const TabChoicesWidget({
    super.key,
    required this.onTap,
    required this.isSelected,
    required this.label,
  });

  final Function() onTap;
  final bool isSelected;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        splashColor: Colors.transparent,
        onTap: onTap,
        child: Container(
          height: 32,
          decoration: BoxDecoration(
            color: isSelected
                ? ColorPalette().iconBackgroundColor
                : Colors.transparent,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Center(
            child: Text(
              label,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                  color: isSelected
                      ? ColorPalette().mainBlackColor
                      : ColorPalette().unselectedColor),
            ),
          ),
        ),
      ),
    );
  }
}

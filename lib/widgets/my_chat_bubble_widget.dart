import 'package:flutter/material.dart';
import 'package:unjuk_keterampilan_fg/resources/colors.dart';
import 'package:unjuk_keterampilan_fg/resources/colors.dart';

class MyChatBubbleWidget extends StatelessWidget {
  const MyChatBubbleWidget({
    super.key,
    required this.message,
  });

  final String message;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        margin: const EdgeInsets.fromLTRB(0, 4, 16, 0),
        padding: const EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          color: ColorPalette().myChatBubbleColor,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(24),
            bottomLeft: Radius.circular(24),
            topRight: Radius.circular(24),
            bottomRight: Radius.circular(4),
          ),
        ),
        child: Wrap(
          children: [
            ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * 0.4,
              ),
              child: Text(
                message,
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:unjuk_keterampilan_fg/resources/colors.dart';

class UserChatBubbleWidget extends StatelessWidget {
  const UserChatBubbleWidget({
    super.key,
    required this.message,
  });

  final String message;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(16, 4, 0, 0),
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: ColorPalette().iconBackgroundColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Wrap(
        children: [
          ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width * 0.4,
            ),
            child: Text(
              message,
            ),
          ),
        ],
      ),
    );
  }
}

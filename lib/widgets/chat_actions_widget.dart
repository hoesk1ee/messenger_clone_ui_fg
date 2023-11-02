import 'package:flutter/material.dart';

class ChatActionButton extends StatelessWidget {
  const ChatActionButton({
    super.key,
    required this.onPressed,
    required this.icon,
  });

  final Function() onPressed;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 12),
      width: 42,
      height: 42,
      child: IconButton(
        splashRadius: 24,
        onPressed: onPressed,
        icon: icon,
      ),
    );
  }
}

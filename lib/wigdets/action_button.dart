import 'package:flutter/material.dart';

import 'animated_button.dart';

class ActionButton extends StatelessWidget {
  final String actionText;
  final VoidCallback onTap;
  const ActionButton({Key? key, required this.actionText, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedButton(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 18),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: const Color(0xFFF5D973),
            borderRadius: BorderRadius.circular(12)
        ),
        child: Text(actionText,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
          ),
        ),
      ),
    );
  }
}

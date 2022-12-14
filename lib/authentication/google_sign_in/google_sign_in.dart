import 'package:flutter/material.dart';
import 'package:flutter_alm_quiz/wigdets/animated_button.dart';

class GoogleSignIn extends StatelessWidget {
  const GoogleSignIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedButton(
        onTap: () {},
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 18.0),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: Colors.black.withOpacity(0.2),
                width: 1.5,
              )),
          child: const Text(
            "Sign In With Google",
            style: TextStyle(
                color: Color(0xFF9A9A9A),
                fontWeight: FontWeight.bold,
                fontSize: 18),
          ),
        ));
  }
}

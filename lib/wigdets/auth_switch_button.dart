import 'package:flutter/material.dart';

import 'slide_fade_in_switcher.dart';

const kTextStyle = TextStyle(
  fontWeight: FontWeight.w500,
  color: Color(0xFF9A9A9A),
);

class AuthSwitchButton extends StatelessWidget {
  final VoidCallback? onTap;
  final String label;
  final bool showSignIn;
  const AuthSwitchButton(
      {Key? key, this.onTap, required this.label, required this.showSignIn})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 30,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(16.0),
          alignment: Alignment.center,
          child: SlideFadeSwitcher(
            child: showSignIn
                ? Text(
                    "Don't have account? Sign Up",
                    key: UniqueKey(),
                    style: kTextStyle,
                  )
                : Text(
                    'Already have account? Sign In',
                    key: UniqueKey(),
                    style: kTextStyle,
                  ),
          ),
        ),
      ),
    );
  }
}

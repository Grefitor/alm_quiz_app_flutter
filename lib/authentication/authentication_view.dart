import 'package:flutter/material.dart';
import '../wigdets/auth_switch_button.dart';
import './sign_up/sign_up.dart';
import './sign_in/sign_in.dart';
import '../wigdets/slide_fade_in_switcher.dart';

class AuthenticationView extends StatefulWidget {
  const AuthenticationView({Key? key}) : super(key: key);

  @override
  State<AuthenticationView> createState() => _AuthenticationViewState();
}

class _AuthenticationViewState extends State<AuthenticationView> {
  bool showSignIn = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        fit: StackFit.loose,
        children: [
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 16),
              child: showSignIn
                  ? const Text(
                "Welcome Back.",
                style: TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              )
                  : const Text(
                "Create Account.",
                style: TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 250, 16, 0),
            child: SlideFadeSwitcher(child: showSignIn ? const SignIn(): const SignUp())
          ),
          AuthSwitchButton(showSignIn: showSignIn, label: showSignIn ? 'Sign Up': 'Sign In', onTap: () {
            setState(() {
              showSignIn = !showSignIn;
            });
          },)
        ],
      ),
    );
  }
}

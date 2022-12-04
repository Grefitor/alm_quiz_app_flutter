import 'package:flutter/material.dart';
import 'package:flutter_alm_quiz/wigdets/custom_text_input.dart';

class ForgotPasswordView extends StatelessWidget {
  const ForgotPasswordView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomTextInput(
              onChanged: (_) {},
              hintText: 'Please Enter Your Email',
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text(
                      'Cancel',
                      style: TextStyle(
                        color: Color(0xFF6574FF),
                      ),
                    ),
                ),
                TextButton(
                    onPressed: () {},
                    child: const Text('Request',
                        style: TextStyle(
                          color: Color(0xFF6574FF),
                        ),
                    ),
                ),
              ],
            )
          ],
        ),
      )),
    );
  }
}

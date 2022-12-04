import 'package:flutter/material.dart';
import 'package:flutter_alm_quiz/authentication/sign_in/controller/signin_controller.dart';
import 'package:flutter_alm_quiz/authentication/sign_up/controller/signup_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_validators/form_validators.dart';

import 'custom_text_input.dart';

class EmailField extends ConsumerWidget {
  final bool isSignIn;
  const EmailField({Key? key, this.isSignIn = false}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dynamic signState = !isSignIn ? ref.watch(signUpProvider): ref.watch(signInProvider);
    final showError = signState.email.invalid;
    final dynamic signController = !isSignIn ? ref.read(signUpProvider.notifier): ref.read(signInProvider.notifier);
    return CustomTextInput(
      hintText: 'Email',
      errorText: showError
          ? Email.showEmailErrorMessage(signState.email.error)
          : null,
        onChanged: (email) => signController.onEmailChange(email),
    );
  }
}

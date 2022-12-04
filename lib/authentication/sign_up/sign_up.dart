import 'package:flutter/material.dart';
import 'package:flutter_alm_quiz/authentication/sign_up/controller/signup_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_validators/form_validators.dart';
import '../../wigdets/name.dart';
import '../../wigdets/email.dart';
import '../../wigdets/password.dart';

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        NameField(),
        SizedBox(height: 18,),
        EmailField(),
        SizedBox(height: 18,),
        PasswordField(),
        SizedBox(height: 24,),
        SignUpButton(),
      ],
    );
  }
}

class SignUpButton extends ConsumerWidget {
  const SignUpButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final signUpState = ref.watch(signUpProvider);
    final signUpController = ref.read(signUpProvider.notifier);
    final bool isValidated = signUpState.status.isValidated;
    return ElevatedButton(
      onPressed: isValidated
          ? () => signUpController.signUpWithEmailAndPassword()
          : null,
      child: const Text(
        "Sign Up",
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_alm_quiz/authentication/forgot_password/forgot_passoword.dart';
import 'package:flutter_alm_quiz/authentication/google_sign_in/google_sign_in.dart';
import 'package:flutter_alm_quiz/authentication/sign_in/controller/signin_controller.dart';
import 'package:flutter_alm_quiz/wigdets/divider.dart';
import 'package:flutter_alm_quiz/wigdets/forgot_password_button.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_validators/form_validators.dart';
import '../../wigdets/action_button.dart';
import '../../wigdets/email.dart';
import '../../wigdets/password.dart';
import '../../wigdets/loading_error_alert.dart';
class SignIn extends StatelessWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const EmailField(isSignIn: true),
        const SizedBox(height: 18,),
        const PasswordField(),
        ForgotPasswordButton(onTap: () {
          Navigator.of(context).push(
            DialogRoute(context: context, builder: (_) {
              return const ForgotPasswordView();
            })
            // CupertinoDialogRoute(builder: (_) {
            //   return const ForgotPasswordView();
            // }, context: context)
          );
        }),
        const SizedBox(height: 24,),
        // ActionButton(
        //   actionText: 'Sign In',
        //   onTap: () {
        //     LoadingSheet.show(context,);
        //   },
        // ),
        const SignInButton(),
        const ContentDivider(),
        const GoogleSignIn()
      ],
    );
  }
}


class SignInButton extends ConsumerWidget {
  const SignInButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final signInState = ref.watch(signInProvider);
    final bool isValidated = signInState.status.isValidated;
    final signInController = ref.read(signInProvider.notifier);
    return ElevatedButton(
      onPressed: isValidated
          ? () => signInController.signInWithEmailAndPassword()
          : null,
      child: const Text(
        "Sign In",
      ),
    );
  }
}


import 'package:flutter/material.dart';
import 'package:flutter_alm_quiz/authentication/sign_up/controller/signup_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_validators/form_validators.dart';
import 'custom_text_input.dart';

class NameField extends ConsumerWidget {
  const NameField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final signUpState = ref.watch(signUpProvider);
    final showError = signUpState.name.invalid;
    final signUpController = ref.read(signUpProvider.notifier);
    return CustomTextInput(
      hintText: 'Name',
      errorText: showError ?
      Name.showNameErrorMessage(signUpState.name.error)
      : null,
      onChanged: (String val) {
        ref.read(signUpProvider.notifier).onNameChange(val);
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../controllers/quiz/quiz.controller.dart';
import '../controllers/quiz/quiz.state.dart';
import '../models/question.model.dart';
import '../repositories/quiz.repository.dart';
import 'custom_button.dart';

class QuizResults extends ConsumerWidget {
  final QuizState state;
  final List<Question> questions;
  const QuizResults({
    Key? key,
    required this.state,
    required this.questions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          '${state.correct.length} / ${questions.length}',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 60.0,
            fontWeight: FontWeight.w600,
          ),
          textAlign: TextAlign.center,
        ),
        const Text(
          'CORRECT',
          style: TextStyle(
            color: Colors.white,
            fontSize: 48.0,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 40.0),
        CustomButton(
          title: 'New Quiz',
          onTap: () {
            ref.invalidate(quizRepositoryProvider);
            ref.read(quizControllerProvider.notifier).reset();
          },
        ),
      ],
    );
  }
}

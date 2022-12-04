
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_alm_quiz/authentication/controller/authentication_controller.dart';
import 'package:flutter_alm_quiz/controllers/quiz/quiz.state.dart';
import 'package:flutter_alm_quiz/models/question.model.dart';
import 'package:flutter_alm_quiz/notificaiton_service.dart';
import 'package:flutter_alm_quiz/wigdets/quiz_error.dart';
import 'package:flutter_alm_quiz/wigdets/quiz_questions.dart';
import 'package:flutter_alm_quiz/wigdets/quiz_result.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../controllers/quiz/quiz.controller.dart';
import '../enums/question_difficulty.enum.dart';
import '../repositories/quiz.repository.dart';
import '../models/failure.dart';
import 'custom_button.dart';

const kGradient = [Color(0xFFD4418E), Color(0xFF0652C5)];

final quizQuestionsProvider = FutureProvider.autoDispose<List<Question>>((ref) => ref.read(quizRepositoryProvider).getQuestions(
  numQuestions: 5,
  categoryId: 18,
  difficulty: QuestionDifficulty.any
),);


class QuizScreen extends HookConsumerWidget {
  const QuizScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {


    final authController = ref.read(authProvider.notifier);
    final quizQuestions = ref.watch(quizQuestionsProvider);
    final pageController = usePageController();
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            colors: kGradient,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Positioned(
              right: 18,
              top: 30,
              child: ElevatedButton(
                onPressed: () {
                  authController.onSignOut();
                },
                child: Container(
                  child: Icon(
                    Icons.logout,
                    color: Colors.pink,
                    size: 24.0,
                    semanticLabel: 'Text to announce in accessibility modes',
                  )
                ),
              ),
            ),
            quizQuestions.when(
          data: (questions) =>
              _buildBody(context, pageController, questions, ref),
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error, _) => QuizError(
            message: error is Failure ? error.message : error.toString(),
          ),
        )]),
        bottomSheet: quizQuestions.maybeWhen(
          data: (questions) {
            final quizState = ref.watch(quizControllerProvider);
            if (!quizState.answered) return const SizedBox.shrink();
            return CustomButton(
              title: pageController.page!.toInt() + 1 < questions.length
                  ? 'Next Question'
                  : 'See Results',
              onTap: () {
                ref.watch(quizControllerProvider.notifier)
                    .nextQuestion(questions, pageController.page!.toInt() + 1);
                if (pageController.page!.toInt() + 1 < questions.length) {
                  pageController.nextPage(
                    duration: const Duration(milliseconds: 250),
                    curve: Curves.linear,
                  );
                }
              },
            );
          },
          orElse: () => const SizedBox.shrink(),
        ),
      ),
    );
  }

  Widget _buildBody(BuildContext context, PageController pageController,
      List<Question> questions, WidgetRef ref) {
    if (questions.isEmpty) {
      return const QuizError(
        message: 'No questions found.'
      );
    }
    final quizState = ref.watch(quizControllerProvider);
    return quizState.status == QuizStatus.complete
        ? QuizResults(state: quizState, questions: questions)
        : QuizQuestions(
            pageController: pageController,
            questions: questions,
          );
  }
}

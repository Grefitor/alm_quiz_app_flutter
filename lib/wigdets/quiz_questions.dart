import 'package:flutter/material.dart';
import 'package:flutter_alm_quiz/controllers/quiz/quiz.controller.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:html_character_entities/html_character_entities.dart';

import '../controllers/quiz/quiz.state.dart';
import '../models/question.model.dart';
import 'answer_card.dart';

class QuizQuestions extends ConsumerWidget {
  final PageController pageController;
  final List<Question> questions;
  const QuizQuestions({
    Key? key,
    required this.pageController,
    required this.questions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(quizControllerProvider);
    return PageView.builder(
      controller: pageController,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: questions.length,
      itemBuilder: (BuildContext context, int index) {
        final question = questions[index];
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Question ${index + 1} of ${questions.length}',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20.0, 16.0, 20.0, 12.0),
              child: Text(
                HtmlCharacterEntities.decode(question.question),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 28.0,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Divider(
              color: Colors.grey[200],
              height: 32.0,
              thickness: 2.0,
              indent: 20.0,
              endIndent: 20.0,
            ),
            Column(
              children: question.answers
                  .map(
                    (e) => AnswerCard(
                  answer: e,
                  isSelected: e == state.selectedAnswer,
                  isCorrect: e == question.correctAnswer,
                  isDisplayingAnswer: state.answered,
                  onTap: () => {
                    ref.read(quizControllerProvider.notifier)
                    .submitAnswer(question, e)
                  }
                ),
              )
                  .toList(),
            ),
          ],
        );
      },
    );
  }
}
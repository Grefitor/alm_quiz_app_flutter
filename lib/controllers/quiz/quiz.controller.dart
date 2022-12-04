import 'package:flutter_alm_quiz/controllers/quiz/quiz.state.dart';
import 'package:flutter_alm_quiz/models/question.model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final quizControllerProvider = StateNotifierProvider<QuizController, QuizState>((ref) => QuizController());

class QuizController extends StateNotifier<QuizState> {
  QuizController(): super(QuizState.initial());

  void submitAnswer(Question currentQues, String ans) {
    if (state.answered) return;
    if (currentQues.correctAnswer == ans) {
      state = state.copyWith(selectedAnswer: ans,
          correct: [...state.correct, currentQues],
          status: QuizStatus.correct);
    } else {

      state = state.copyWith(selectedAnswer: ans,
          incorrect: [...state.incorrect, currentQues],
          status: QuizStatus.incorrect);
    }
  }
  void nextQuestion(List<Question> questions, int currentIndex) {
    state = state.copyWith(selectedAnswer: '', status: currentIndex + 1 < questions.length ? QuizStatus.incomplete: QuizStatus.complete, questionNo: currentIndex);
  }

  void reset() {
    state = QuizState.initial();
  }
}
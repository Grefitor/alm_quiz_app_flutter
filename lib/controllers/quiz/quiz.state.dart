import 'package:equatable/equatable.dart';
import 'package:flutter_alm_quiz/models/question.model.dart';

enum QuizStatus { initial, correct, incorrect, complete, incomplete }

class QuizState extends Equatable {
  final String selectedAnswer;
  final List<Question> correct;
  final List<Question> incorrect;
  final QuizStatus status;
  final bool? isQuizCompleted;
  final int? questionNo;

  const QuizState(
      {required this.selectedAnswer,
      required this.correct,
      required this.incorrect,
      required this.status,
      this.isQuizCompleted,this.questionNo});

  factory QuizState.initial() {
    return const QuizState(selectedAnswer: '', correct: [], incorrect: [], status: QuizStatus.initial, isQuizCompleted: false, questionNo: 1);
  }

  bool get answered => status == QuizStatus.incorrect || status == QuizStatus.correct;

  @override
  List<Object?> get props => [selectedAnswer, correct, incorrect, status];

  QuizState copyWith({
    String? selectedAnswer,
    List<Question>? correct,
    List<Question>? incorrect,
    QuizStatus? status,
    bool? isQuizCompleted,
    int? questionNo
}) {
    return QuizState(selectedAnswer: selectedAnswer ?? this.selectedAnswer, correct: correct ?? this.correct, incorrect: incorrect ?? this.incorrect, status: status ?? this.status, isQuizCompleted: this.isQuizCompleted, questionNo: this.questionNo);
  }

}

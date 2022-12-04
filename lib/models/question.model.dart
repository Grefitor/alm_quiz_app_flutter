import 'package:equatable/equatable.dart';
import 'package:flutter_alm_quiz/enums/question_difficulty.enum.dart';
import 'package:flutter_alm_quiz/enums/question_types.enum.dart';

class QuestionsResponse extends Equatable {
  final int responseCode;
  final List<Question> questions;

  const QuestionsResponse({
    required this.responseCode,
    required this.questions
  });

  @override
  List<Object?> get props => [
    responseCode,
    questions
  ];

  factory QuestionsResponse.fromMap(Map<String, dynamic> map){
    return QuestionsResponse(
      responseCode: map['responseCode'],
      questions: map['questions'] ?? []
      );
  }

}

class Question extends Equatable {

  final String category;
  final String type;
  final String difficulty;
  final String question;
  final String correctAnswer;
  final List<String> answers;

  const Question({
    required this.category,
    required this.type,
    required this.difficulty,
    required this.question,
    required this.correctAnswer,
    required this.answers,
  });

  @override
  List<Object> get props => [
    category,
    type,
    difficulty,
    question,
    correctAnswer,
    answers,
  ];

  factory Question.fromMap(Map<String, dynamic> map) {
    return Question(
      category: map['category'] ?? '',
      type: map['type'] ?? '',
      difficulty: map['difficulty'] ?? '',
      question: map['question'] ?? '',
      correctAnswer: map['correct_answer'] ?? '',
      answers:
      List<String>.from(map['incorrect_answers'] ?? [])
        ..add(map['correct_answer'] ?? '')
        ..shuffle(),
    );
  }
}




import 'package:flutter_alm_quiz/enums/question_difficulty.enum.dart';
import 'package:flutter_alm_quiz/models/question.model.dart';

abstract class BaseQuizRepository {
  Future<List<Question>> getQuestions({
    required int numQuestions,
    required int categoryId,
    required QuestionDifficulty difficulty
});
}
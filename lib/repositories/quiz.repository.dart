import 'dart:io';
import 'package:dio/dio.dart';
import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter/material.dart';
import 'package:flutter_alm_quiz/enums/question_difficulty.enum.dart';
import 'package:flutter_alm_quiz/models/failure.dart';
import 'package:flutter_alm_quiz/models/question.model.dart';
import 'package:flutter_alm_quiz/repositories/base_quiz.repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final dioProvider = Provider<Dio>((ref) => Dio());
const kAPIEndPoint = 'https://opentdb.com/api.php';
const kFixAPI = 'https://opentdb.com/api.php?amount=10&category=18&type=multiple';
final quizRepositoryProvider =
    Provider<QuizRepository>((ref) => QuizRepository(ref));

class QuizRepository extends BaseQuizRepository {
  final Ref _ref;

  QuizRepository(this._ref);

  @override
  Future<List<Question>> getQuestions(
      {required int numQuestions,
      required int categoryId,
      required QuestionDifficulty difficulty}) async {
    try {
      final queryParams = {
        'type': 'any',
        'amount': numQuestions,
        'category': categoryId
      };
      // if (difficulty != QuestionDifficulty.any) {
      //   queryParams
      //       .addAll({'difficulty': EnumToString.convertToString(difficulty)});
      // }

      final response = await _ref
          .read(dioProvider)
          .get(kFixAPI);
          // .get(kAPIEndPoint, queryParameters: queryParams);
      if (response.statusCode != 200) {
        return [] as List<Question>;
      }
      final data = Map<String, dynamic>.from(response.data);
      final results = List<Map<String, dynamic>>.from(data['results'] ?? []);
      if (results.isEmpty) {
        return [] as List<Question>;
      }
      return results.map((e) => Question.fromMap(e)).toList();
    } on DioError catch (err){
      throw Failure(message: err.response?.statusMessage ?? '');
    } on SocketException catch (err) {
      throw Failure(message: err.message);
    }
  }
}

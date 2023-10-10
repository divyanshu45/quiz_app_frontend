import 'package:dio/dio.dart';
import 'package:quiz_app/modules/quiz/models/question_model.dart';

import '../../../services/network_service.dart';

class QuizRepository {

  final RemoteService remoteService = RemoteService();

  Future<List<QuestionModel>> getAllQuiz({required int id}) async {
    Response response = await remoteService.get(path: 'http://62.72.57.242/quiz_question_bulk/', token: 'J5uE1k9hX3yV7sN6i2wQ', queryParams: {'quiz_id': 2});
    List<QuestionModel> list = <QuestionModel>[];
    for(Map<String, dynamic> element in response.data?['data'] ?? [] as List<Map<String, dynamic>>) {
      list.add(QuestionModel.fromJson(element));
    }
    return list;
  }
}
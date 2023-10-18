import 'package:dio/dio.dart';
import 'package:quiz_app/modules/home/models/all_practice_model.dart';
import '../../../services/network_service.dart';
import '../models/all_quiz_model.dart';
import 'package:quiz_app/modules/home/models/all_quiz_model.dart';
import 'package:quiz_app/modules/home/models/all_state_model.dart';
import 'package:quiz_app/modules/home/models/all_exam_model.dart';

class HomeRepository {
  final RemoteService remoteService = RemoteService();

  Future<AllQuizModel> getAllQuiz() async {
    final response = await remoteService.get(
        path: 'http://62.72.57.242/all_quiz/', token: 'J5uE1k9hX3yV7sN6i2wQ');
    final allQuizModel = AllQuizModel.fromJson(response.data);
    return allQuizModel;
  }

  Future<AllPracticeModel> getAllPractice() async {
    final response = await remoteService.get(
        path: 'http://62.72.57.242/all_practice/',
        token: 'J5uE1k9hX3yV7sN6i2wQ');
    final allPracticeModel = AllPracticeModel.fromJson(response.data);
    return allPracticeModel;
  }

  Future<AllStateModel> getAllState() async {
    final response = await remoteService.get(
        path: 'http://62.72.57.242/all_state/', token: 'J5uE1k9hX3yV7sN6i2wQ');
    final allStateModel = AllStateModel.fromJson(response.data);
    return allStateModel;
  }

  Future<AllExamModel> getAllExam() async {
    final response = await remoteService.get(
        path: 'http://62.72.57.242/all_exam/', token: 'J5uE1k9hX3yV7sN6i2wQ');
    final allExamModel = AllExamModel.fromJson(response.data);
    return allExamModel;
  }
}

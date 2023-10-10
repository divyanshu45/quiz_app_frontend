import 'package:dio/dio.dart';
import 'package:quiz_app/modules/home/models/all_practice_model.dart';
import 'package:quiz_app/modules/home/models/all_state_model.dart';
import '../../../services/network_service.dart';
import '../models/all_exam_model.dart';
import '../models/all_quiz_model.dart';

class HomeRepository {

  final RemoteService remoteService = RemoteService();

   Future<List<AllQuizModel>> getAllQuiz() async {
     Response response = await remoteService.get(path: 'http://62.72.57.242/all_quiz/', token: 'J5uE1k9hX3yV7sN6i2wQ');
     List<AllQuizModel> list = <AllQuizModel>[];
     for(Map<String, dynamic> element in response.data?['data'] ?? [] as List<Map<String, dynamic>>) {
       list.add(AllQuizModel.fromJson(element));
     }
     return list;
   }

  Future<List<AllPracticeModel>> getAllPractice() async {
    Response response = await remoteService.get(path: 'http://62.72.57.242/all_practice/', token: 'J5uE1k9hX3yV7sN6i2wQ');
    List<AllPracticeModel> list = <AllPracticeModel>[];
    for(Map<String, dynamic> element in response.data?['data'] ?? [] as List<Map<String, dynamic>>) {
      list.add(AllPracticeModel.fromJson(element));
    }
    return list;
  }

  Future<List<AllStateModel>> getAllState() async {
    Response response = await remoteService.get(path: 'http://62.72.57.242/all_state/', token: 'J5uE1k9hX3yV7sN6i2wQ');
    List<AllStateModel> list = <AllStateModel>[];
    for(Map<String, dynamic> element in response.data?['data'] ?? [] as List<Map<String, dynamic>>) {
      list.add(AllStateModel.fromJson(element));
    }
    return list;
  }

  Future<List<AllExamModel>> getAllExam() async {
    Response response = await remoteService.get(path: 'http://62.72.57.242/all_exam/', token: 'J5uE1k9hX3yV7sN6i2wQ');
    List<AllExamModel> list = <AllExamModel>[];
    for(Map<String, dynamic> element in response.data?['data'] ?? [] as List<Map<String, dynamic>>) {
      list.add(AllExamModel.fromJson(element));
    }
    return list;
  }
}
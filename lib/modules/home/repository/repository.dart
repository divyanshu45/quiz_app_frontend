import 'package:quiz_app/modules/home/models/Question/exam_question.dart';
import 'package:quiz_app/modules/home/models/Question/learning_questions.dart';
import 'package:quiz_app/modules/home/models/Question/quiz_questions.dart';
import 'package:quiz_app/modules/home/models/Question/state_questions.dart';
import 'package:quiz_app/modules/home/models/quiztypes/exam_model.dart';
import 'package:quiz_app/modules/home/models/quiztypes/learning_model.dart';
import 'package:quiz_app/modules/home/models/quiztypes/quiz_model.dart';
import 'package:quiz_app/modules/home/models/quiztypes/state_model.dart';

import '../../../services/network_service.dart';

class Repository {
  final RemoteService remoteService = RemoteService();

  Future<QuizModel> getAllQuiz() async {
    final response = await remoteService.get(
        path: 'http://62.72.57.242/all_quiz/', token: 'J5uE1k9hX3yV7sN6i2wQ');
    final allQuizModel = QuizModel.fromJson(response.data);
    return allQuizModel;
  }

  Future<LearningModel> getAllPractice() async {
    final response = await remoteService.get(
        path: 'http://62.72.57.242/all_learning/',
        token: 'J5uE1k9hX3yV7sN6i2wQ');
    final allPracticeModel = LearningModel.fromJson(response.data);
    return allPracticeModel;
  }

  Future<StateModel> getAllState() async {
    final response = await remoteService.get(
        path: 'http://62.72.57.242/all_state/', token: 'J5uE1k9hX3yV7sN6i2wQ');
    final allStateModel = StateModel.fromJson(response.data);
    return allStateModel;
  }

  Future<ExamModel> getAllExam() async {
    final response = await remoteService.get(
        path: 'http://62.72.57.242/all_exam/', token: 'J5uE1k9hX3yV7sN6i2wQ');
    final allExamModel = ExamModel.fromJson(response.data);
    return allExamModel;
  }

  Future<QuizQuestions> quizQuestions(int id) async {
    final response = await remoteService.get(
        path: 'http://62.72.57.242/quiz_question_bulk/',
        queryParams: {"quiz_id": id},
        token: 'J5uE1k9hX3yV7sN6i2wQ');
    final data = QuizQuestions.fromJson(response.data);
    return data;
  }

  Future<LeaningQuestions> learningQuestions(int id) async {
    final response = await remoteService.get(
        path: 'http://62.72.57.242/learning_question_bulk/',
        queryParams: {"practice_id": id},
        token: 'J5uE1k9hX3yV7sN6i2wQ');
    final data = LeaningQuestions.fromJson(response.data);
    return data;
  }

  Future<StateQuestions> stateQuestions(int id) async {
    final response = await remoteService.get(
        path: 'http://62.72.57.242/state_question_bulk/',
        queryParams: {"state_set_id": id},
        token: 'J5uE1k9hX3yV7sN6i2wQ');
    final data = StateQuestions.fromJson(response.data);
    return data;
  }

  Future<ExamQuestions> examQuestions(int id) async {
    final response = await remoteService.get(
        path: 'http://62.72.57.242/exam_question_bulk/',
        queryParams: {"exam_set_id": id},
        token: 'J5uE1k9hX3yV7sN6i2wQ');
    final data = ExamQuestions.fromJson(response.data);
    return data;
  }
}

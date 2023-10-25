import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';
import 'package:quiz_app/modules/home/models/history_model.dart';
import 'package:quiz_app/modules/home/models/quiztypes/exam_model.dart';
import 'package:quiz_app/modules/home/models/quiztypes/mixin/topics_mixin.dart';
import 'package:quiz_app/modules/home/models/quiztypes/quiz_model.dart';
import 'package:quiz_app/modules/home/models/quiztypes/state_model.dart';

class HistoryService extends ChangeNotifier {
  HistoryModel historyModel = HistoryModel(data: []);
  final LocalStorage storage = LocalStorage('quiz_history_storage');

  HistoryService.initialize() {
    initializeHistory();
  }

  initializeHistory() {
    readHistory();
  }

  readHistory() {
    storage.ready.then((value) {
      historyModel = HistoryModel.fromJson(
          jsonDecode(storage.getItem('quiz_history') ?? '{"data": []}'));
      notifyListeners();
    });
  }

  void addHistory(HistoryData data) {
    // Remove last history if it's the same type and quiz id
    for (int i = 0; i < historyModel.data!.length; i++) {
      if (historyModel.data![i].quizType == data.quizType &&
          historyModel.data![i].quizId == data.quizId) {
        historyModel.data!.removeAt(i);
      }
    }

    historyModel.data!.add(data);

    writeHistory();
    notifyListeners();
  }

  void writeHistory() {
    storage.setItem('quiz_history', jsonEncode(historyModel.toJson()));
  }

  static String getQuizType(GetTopicView dataModel) {
    if (dataModel is ExamModel) {
      return "exam-quiz-type";
    }

    if (dataModel is QuizData) {
      return "quiz-quiz-type";
    }

    if (dataModel is StateModel) {
      return "state-quiz-type";
    }

    return "unknown";
  }
}

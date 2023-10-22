import 'dart:convert';

import 'package:localstorage/localstorage.dart';
import 'package:quiz_app/modules/home/models/history_model.dart';
import 'package:quiz_app/modules/home/models/quiztypes/exam_model.dart';
import 'package:quiz_app/modules/home/models/quiztypes/mixin/topics_mixin.dart';
import 'package:quiz_app/modules/home/models/quiztypes/quiz_model.dart';
import 'package:quiz_app/modules/home/models/quiztypes/state_model.dart';

class HistoryService {
  static final instance = HistoryService._initialize();
  HistoryModel historyModel = HistoryModel(data: []);
  final LocalStorage storage = LocalStorage('quiz_history_storage');

  HistoryService._initialize() {
    initializeHistory();
  }

  initializeHistory() {
    readHistory();
  }

  readHistory() {
    storage.ready.then((value) {
      historyModel = HistoryModel.fromJson(
          jsonDecode(storage.getItem('quiz_test_history')));
    });
  }

  void addHistory(HistoryData data) {
    historyModel.data!.add(data);

    writeHistory();
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

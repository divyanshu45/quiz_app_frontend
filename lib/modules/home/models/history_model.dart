class HistoryModel {
  List<HistoryData>? data;

  HistoryModel({this.data});

  HistoryModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <HistoryData>[];
      json['data'].forEach((v) {
        data!.add(HistoryData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class HistoryData {
  late int quizId;
  late String quizType;
  late int correctQuestions;
  late int wrongQuestions;
  late int missedQuestions;
  late int totalQuestions;
  late List<int> selectedAnswers;

  HistoryData(
      {required this.quizId,
      required this.quizType,
      required this.correctQuestions,
      required this.wrongQuestions,
      required this.missedQuestions,
      required this.selectedAnswers,
      required this.totalQuestions});

  HistoryData.fromJson(Map<String, dynamic> json) {
    quizId = json['quiz_id'];
    quizType = json['quiz_type'];
    correctQuestions = json['correct_questions'];
    wrongQuestions = json['wrong_questions'];
    totalQuestions = json['total_questions'];
    missedQuestions = json['missed_questions'];
    selectedAnswers = json['selected_answers'].cast<int>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['quiz_id'] = quizId;
    data['quiz_type'] = quizType;
    data['correct_questions'] = correctQuestions;
    data['wrong_questions'] = wrongQuestions;
    data['total_questions'] = totalQuestions;
    data['selected_answers'] = selectedAnswers;
    data['missed_questions'] = missedQuestions;
    return data;
  }
}

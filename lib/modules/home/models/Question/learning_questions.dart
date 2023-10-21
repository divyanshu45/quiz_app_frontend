class LeaningQuestions {
  List<LeaningQuestion>? data;

  LeaningQuestions({this.data});

  LeaningQuestions.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <LeaningQuestion>[];
      json['data'].forEach((v) {
        data!.add(LeaningQuestion.fromJson(v));
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

class LeaningQuestion {
  int? practiceQuestionId;
  String? questionName;
  String? answerName;
  String? answerExplanation;
  int? practiceId;

  LeaningQuestion(
      {this.practiceQuestionId,
      this.questionName,
      this.answerName,
      this.answerExplanation,
      this.practiceId});

  LeaningQuestion.fromJson(Map<String, dynamic> json) {
    practiceQuestionId = json['practice_question_id'];
    questionName = json['question_name'];
    answerName = json['answer_name'];
    answerExplanation = json['answer_explanation'];
    practiceId = json['practice_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['practice_question_id'] = practiceQuestionId;
    data['question_name'] = questionName;
    data['answer_name'] = answerName;
    data['answer_explanation'] = answerExplanation;
    data['practice_id'] = practiceId;
    return data;
  }
}

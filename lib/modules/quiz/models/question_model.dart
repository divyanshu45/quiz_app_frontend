class QuestionModel {
  int? quizQuestionId;
  String? questionName;
  String? optionA;
  String? optionB;
  String? optionC;
  String? optionD;
  String? correctOption;
  int? quizId;
  bool? isLocked;

  QuestionModel(
      {this.quizQuestionId,
        this.questionName,
        this.optionA,
        this.optionB,
        this.optionC,
        this.optionD,
        this.correctOption,
        this.quizId,
        this.isLocked = false});

  QuestionModel.fromJson(Map<String, dynamic> json) {
    quizQuestionId = json['quiz_question_id'];
    questionName = json['question_name'];
    optionA = json['option_a'];
    optionB = json['option_b'];
    optionC = json['option_c'];
    optionD = json['option_d'];
    correctOption = json['correct_option'];
    quizId = json['quiz_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['quiz_question_id'] = this.quizQuestionId;
    data['question_name'] = this.questionName;
    data['option_a'] = this.optionA;
    data['option_b'] = this.optionB;
    data['option_c'] = this.optionC;
    data['option_d'] = this.optionD;
    data['correct_option'] = this.correctOption;
    data['quiz_id'] = this.quizId;
    return data;
  }
}
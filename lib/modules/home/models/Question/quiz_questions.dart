import 'package:quiz_app/modules/home/models/Question/mixin/questions.dart';

class QuizQuestions with GetQuestionsForQuizView {
  List<QuizQuestion>? data;

  QuizQuestions({this.data});

  QuizQuestions.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <QuizQuestion>[];
      json['data'].forEach((v) {
        data!.add(QuizQuestion.fromJson(v));
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

  @override
  List<QuestionsForQuizView> questions() {
    List<QuestionsForQuizView> questions = [];
    data!.forEach((element) {
      questions.add(QuestionsForQuizView(
          questionName: element.questionName!,
          optionA: element.optionA!,
          optionB: element.optionB!,
          optionC: element.optionC!,
          optionD: element.optionD!,
          correctOption: element.correctOption!));
    });

    return questions;
  }
}

class QuizQuestion {
  int? quizQuestionId;
  String? questionName;
  String? optionA;
  String? optionB;
  String? optionC;
  String? optionD;
  String? correctOption;
  int? quizId;

  QuizQuestion(
      {this.quizQuestionId,
      this.questionName,
      this.optionA,
      this.optionB,
      this.optionC,
      this.optionD,
      this.correctOption,
      this.quizId});

  QuizQuestion.fromJson(Map<String, dynamic> json) {
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
    final Map<String, dynamic> data = {};
    data['quiz_question_id'] = quizQuestionId;
    data['question_name'] = questionName;
    data['option_a'] = optionA;
    data['option_b'] = optionB;
    data['option_c'] = optionC;
    data['option_d'] = optionD;
    data['correct_option'] = correctOption;
    data['quiz_id'] = quizId;
    return data;
  }
}

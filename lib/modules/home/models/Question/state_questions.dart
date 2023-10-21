import 'package:quiz_app/modules/home/models/Question/mixin/questions.dart';

class StateQuestions with GetQuestionsForQuizView {
  List<StateQuestion>? data;

  StateQuestions({this.data});

  StateQuestions.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <StateQuestion>[];
      json['data'].forEach((v) {
        data!.add(StateQuestion.fromJson(v));
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

class StateQuestion {
  int? stateQuestionId;
  String? questionName;
  String? optionA;
  String? optionB;
  String? optionC;
  String? optionD;
  String? correctOption;
  String? explanation;
  int? stateSetId;

  StateQuestion(
      {this.stateQuestionId,
      this.questionName,
      this.optionA,
      this.optionB,
      this.optionC,
      this.optionD,
      this.correctOption,
      this.explanation,
      this.stateSetId});

  StateQuestion.fromJson(Map<String, dynamic> json) {
    stateQuestionId = json['state_question_id'];
    questionName = json['question_name'];
    optionA = json['option_a'];
    optionB = json['option_b'];
    optionC = json['option_c'];
    optionD = json['option_d'];
    correctOption = json['correct_option'];
    explanation = json['explanation'];
    stateSetId = json['state_set_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['state_question_id'] = stateQuestionId;
    data['question_name'] = questionName;
    data['option_a'] = optionA;
    data['option_b'] = optionB;
    data['option_c'] = optionC;
    data['option_d'] = optionD;
    data['correct_option'] = correctOption;
    data['explanation'] = explanation;
    data['state_set_id'] = stateSetId;
    return data;
  }
}

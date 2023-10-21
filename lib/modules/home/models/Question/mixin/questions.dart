class QuestionsForQuizView {
  String questionName;
  String optionA;
  String optionB;
  String optionC;
  String optionD;
  String correctOption;
  QuestionsForQuizView({
    required this.questionName,
    required this.optionA,
    required this.optionB,
    required this.optionC,
    required this.optionD,
    required this.correctOption,
  });
}

mixin GetQuestionsForQuizView {
  List<QuestionsForQuizView> questions();
}

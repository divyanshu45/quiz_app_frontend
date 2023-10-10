class Question{
  final String question;
  final List<Option> options;
  bool isLocked;
  Option? selectedOption;

  Question({
    required this.question,
    required this.options,
    this.isLocked = false,
    this.selectedOption
  });
}

class Option{
  final String text;
  final bool isCorrect;

  Option({
    required this.text,
    required this.isCorrect
  });
}
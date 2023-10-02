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

final List<Question> questions = [
  Question(
    question: 'text for the question',
    options: [
      Option(text: 'Option 1', isCorrect: false),
      Option(text: 'Option 2', isCorrect: false),
      Option(text: 'Option 3', isCorrect: false),
      Option(text: 'Option 4', isCorrect: true),
    ]
  ),
  Question(
    question: 'text for the question',
    options: [
      Option(text: 'Option 1', isCorrect: false),
      Option(text: 'Option 2', isCorrect: false),
      Option(text: 'Option 3', isCorrect: false),
      Option(text: 'Option 4', isCorrect: true),
    ]
  ),
  Question(
    question: 'text for the question',
    options: [
      Option(text: 'Option 1', isCorrect: false),
      Option(text: 'Option 2', isCorrect: true),
      Option(text: 'Option 3', isCorrect: false),
      Option(text: 'Option 4', isCorrect: false),
    ]
  ),
  Question(
    question: 'text for the question',
    options: [
      Option(text: 'Option 1', isCorrect: true),
      Option(text: 'Option 2', isCorrect: false),
      Option(text: 'Option 3', isCorrect: false),
      Option(text: 'Option 4', isCorrect: false),
    ]
  ),
  Question(
    question: 'text for the question',
    options: [
      Option(text: 'Option 1', isCorrect: false),
      Option(text: 'Option 2', isCorrect: false),
      Option(text: 'Option 3', isCorrect: true),
      Option(text: 'Option 4', isCorrect: false),
    ]
  ),
];
import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quiz_app/modules/home/models/Question/mixin/questions.dart';
import 'package:quiz_app/modules/home/models/history_model.dart';
import 'package:quiz_app/modules/home/models/quiztypes/exam_model.dart';
import 'package:quiz_app/modules/home/models/quiztypes/mixin/topics_mixin.dart';
import 'package:quiz_app/modules/home/models/quiztypes/quiz_model.dart';
import 'package:quiz_app/modules/home/models/quiztypes/state_model.dart';
import 'package:quiz_app/modules/home/repository/repository.dart';
import 'package:quiz_app/modules/result/ui/result_screen.dart';
import 'package:quiz_app/services/local_history_service.dart';

class QuizScreen extends StatefulWidget {
  final bool isLocked;
  final GetTopicView dataModel;
  final int quizID;
  final int time;
  const QuizScreen(
      {super.key,
      this.isLocked = false,
      required this.dataModel,
      required this.quizID,
      required this.time});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  Future<GetQuestionsForQuizView>? question;
  bool isLocked = false;
  int currentQuestion = 0;
  late int secondsLeft;
  Timer? timer;

  AudioPlayer audioPlayer = AudioPlayer();

  // -1 means not selected
  List<int>? selectedAnswers;

  void setFutureAndFetchQuiz() {
    final repository = Repository();

    if (widget.dataModel is ExamModel) {
      question = repository.examQuestions(widget.quizID);
      return;
    }

    if (widget.dataModel is QuizData) {
      question = repository.quizQuestions(widget.quizID);
      return;
    }

    if (widget.dataModel is StateModel) {
      question = repository.stateQuestions(widget.quizID);
      return;
    }
  }

  HistoryData saveHistory(List<QuestionsForQuizView> questions) {
    int totalQuestions = questions.length;
    if (totalQuestions <= 0) {
      return HistoryData(
          quizId: widget.quizID,
          quizType: HistoryService.getQuizType(widget.dataModel),
          correctQuestions: 0,
          wrongQuestions: 0,
          missedQuestions: 0,
          selectedAnswers: [],
          totalQuestions: 0);
    }

    int quizId = widget.quizID;
    String quizType = HistoryService.getQuizType(widget.dataModel);
    int correctQuestions = 0;
    int wrongQuestions = 0;
    int missedQuestions = 0;
    for (int i = 0; i < totalQuestions; i++) {
      if (selectedAnswers![i] == getOptionInt(questions[i].correctOption)) {
        correctQuestions++;
      } else if (selectedAnswers![i] == 5) {
        missedQuestions++;
      } else {
        wrongQuestions++;
      }
    }
    final historyService = HistoryService.instance;

    final historyData = HistoryData(
        quizId: quizId,
        quizType: quizType,
        correctQuestions: correctQuestions,
        wrongQuestions: wrongQuestions,
        missedQuestions: missedQuestions,
        selectedAnswers: selectedAnswers ?? [],
        totalQuestions: totalQuestions);

    historyService.addHistory(historyData);

    return historyData;
  }

  void moveToNextQuestion(List<QuestionsForQuizView> questions) {
    if (currentQuestion + 1 < questions.length) {
      _pageController.nextPage(
          duration: Duration(milliseconds: 500), curve: Curves.easeInExpo);
      setState(() {
        currentQuestion++;
        secondsLeft = widget.time;
      });
      startTimer(questions);
      return;
    }
    if (timer != null) {
      timer?.cancel();
    }
    // Save History.
    final result = saveHistory(questions);

    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => ResultScreen(
                  result: result,
                )));
  }

  void startTimer(List<QuestionsForQuizView> questions) {
    if (timer != null) {
      timer?.cancel();
    }

    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (secondsLeft - 1 < 0) {
        audioPlayer.play(AssetSource('sounds/quiz-error.mp3'));
        selectedAnswers![currentQuestion] = 5;
        moveToNextQuestion(questions);
        return;
      }
      setState(() {
        secondsLeft--;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    setFutureAndFetchQuiz();
    secondsLeft = widget.time;
  }

  final PageController _pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: FutureBuilder(
            future: question,
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: Center(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Center(
                        child: CircularProgressIndicator(),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Text("Loading..."),
                    ],
                  )),
                );
              }

              final questions = snapshot.data!.questions();

              if (selectedAnswers == null) {
                startTimer(questions);
                selectedAnswers = List.filled(questions.length, -1);

                WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                  if (selectedAnswers!.isEmpty) {
                    moveToNextQuestion(questions);
                  }
                });
              }

              return Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: IconButton(
                          icon: Icon(Icons.close),
                          onPressed: () {
                            // Show dialog to cancel.
                            showDialog(
                                context: context,
                                builder: (_) {
                                  return AlertDialog(
                                    title: Text('Do you want to exit quiz?'),
                                    actions: [
                                      TextButton(
                                        onPressed: () =>
                                            Navigator.pop(context, false),
                                        child: Text('No'),
                                      ),
                                      TextButton(
                                        onPressed: () =>
                                            Navigator.pop(context, true),
                                        child: Text('Yes'),
                                      ),
                                    ],
                                  );
                                }).then((exit) {
                              if (exit == null) return;
                              if (exit) {
                                Navigator.pop(context);
                              }
                            });
                          },
                        ),
                      ),
                      Text(
                        '${currentQuestion + 1}/ ${questions.length}',
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: Text('$secondsLeft seconds'),
                      ),
                    ],
                  ),
                  Divider(),
                  Flexible(
                      child: PageView.builder(
                    controller: _pageController,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: questions.length,
                    itemBuilder: (context, index) {
                      return buildQuestion(questions, index);
                    },
                  )),
                ],
              );
            }),
      ),
    );
  }

  Widget buildQuestion(
      List<QuestionsForQuizView> questions, int questionIndex) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            questions[questionIndex].questionName,
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Expanded(
            child: SingleChildScrollView(
                child: Column(
          children: [
            buildOptionWidget(questions, questionIndex, 1),
            buildOptionWidget(questions, questionIndex, 2),
            buildOptionWidget(questions, questionIndex, 3),
            buildOptionWidget(questions, questionIndex, 4),
            if (selectedAnswers![questionIndex] == 5) Text("Time's up!"),
            isQuestionAnswered(currentQuestion)
                ? Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: ElevatedButton(
                        onPressed: () => moveToNextQuestion(questions),
                        child: Text(currentQuestion + 1 < questions.length
                            ? 'Next'
                            : 'Finish')),
                  )
                : const SizedBox.shrink()
          ],
        )))
      ],
    );
  }

  bool isQuestionAnswered(int questionIndex) {
    return selectedAnswers![questionIndex] != -1;
  }

  String getOptionText(QuestionsForQuizView question, int option) {
    switch (option) {
      case 1:
        return question.optionA;
      case 2:
        return question.optionB;
      case 3:
        return question.optionC;
      case 4:
      default:
        return question.optionD;
    }
  }

  int getOptionInt(String option) {
    switch (option) {
      case "option_a":
        return 1;
      case "option_b":
        return 2;
      case "option_c":
        return 3;
      case "option_d":
      default:
        return 4;
    }
  }

  Widget buildOptionWidget(
      List<QuestionsForQuizView> question, int questionIndex, int option) {
    final optionText = getOptionText(question[questionIndex], option);
    final color = getColorOption(question, questionIndex, option);
    return InkWell(
      onTap: () {
        final isSelected = isQuestionAnswered(questionIndex);
        if (isSelected) return;
        if (timer != null) {
          timer?.cancel();
        }
        setState(() {
          selectedAnswers![questionIndex] = option;
        });

        final correctOptionIndex =
            getOptionInt(question[questionIndex].correctOption);

        audioPlayer.stop();
        if (correctOptionIndex == option) {
          audioPlayer.play(AssetSource('sounds/quiz-correct.mp3'));
        } else {
          audioPlayer.play(AssetSource('sounds/quiz-error.mp3'));
        }
        HapticFeedback.heavyImpact();
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        margin: EdgeInsets.symmetric(vertical: 4, horizontal: 6),
        decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: color)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                optionText,
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            getIconForOption(question, questionIndex, option)
          ],
        ),
      ),
    );
  }

  Color getColorOption(
      List<QuestionsForQuizView> question, int questionIndex, int option) {
    final isSelected = isQuestionAnswered(questionIndex);
    if (!isSelected) return Colors.grey.shade300;
    final selectedOption = selectedAnswers![questionIndex];
    final correctOptionIndex =
        getOptionInt(question[questionIndex].correctOption);
    if (correctOptionIndex == option) {
      return Colors.green;
    }
    if ((selectedOption == option) && (correctOptionIndex != option)) {
      return Colors.red;
    }
    return Colors.grey.shade300;
  }

  Widget getIconForOption(
    List<QuestionsForQuizView> question,
    int questionIndex,
    int option,
  ) {
    final isSelected = isQuestionAnswered(questionIndex);
    if (!isSelected) return const SizedBox.shrink();
    final selectedOption = selectedAnswers![questionIndex];
    final correctOptionIndex =
        getOptionInt(question[questionIndex].correctOption);
    if (correctOptionIndex == option) {
      return const Icon(
        Icons.check,
        color: Colors.green,
      );
    }
    if ((selectedOption == option) && (correctOptionIndex != option)) {
      return const Icon(
        Icons.close,
        color: Colors.red,
      );
    }
    return const SizedBox.shrink();
  }
}

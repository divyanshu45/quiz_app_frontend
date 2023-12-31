import 'package:flutter/material.dart';
import 'package:quiz_app/modules/home/models/history_model.dart';
import 'package:quiz_app/modules/home/models/quiztypes/mixin/topics_mixin.dart';
import 'package:quiz_app/modules/quiz/ui/quiz_screen.dart';
import 'package:share_plus/share_plus.dart';

class ResultScreen extends StatefulWidget {
  final HistoryData result;
  final GetTopicView dataModel;
  final int quizID;
  final int time;
  const ResultScreen({
    super.key,
    required this.result,
    required this.dataModel,
    required this.quizID,
    required this.time,
  });

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  double getCorrectScore() {
    int questions = widget.result.totalQuestions;
    if (widget.result.totalQuestions == 0) questions = 1;
    return (widget.result.correctQuestions * 100) / questions;
  }

  String message() {
    if (getCorrectScore() > 80) {
      return 'You are doing great!';
    }
    if (getCorrectScore() > 60) {
      return 'You are doing good!';
    }
    if (getCorrectScore() > 40) {
      return 'You need to improve!\nyou will improve your GK knowledge';
    }

    return 'Keep trying! With more study and practice,\nyou will improve your GK knowledge';
  }

  double getWrongScore() {
    int questions = widget.result.totalQuestions;
    if (widget.result.totalQuestions == 0) questions = 1;
    return (widget.result.wrongQuestions * 100) / questions;
  }

  double getTimeUpScore() {
    int questions = widget.result.totalQuestions;
    if (widget.result.totalQuestions == 0) questions = 1;
    return ((widget.result.missedQuestions) * 100) / questions;
  }

  IconData iconResult() {
    if (getCorrectScore() > 80) {
      return Icons.sentiment_very_satisfied;
    }
    if (getCorrectScore() > 60) {
      return Icons.sentiment_very_satisfied;
    }
    if (getCorrectScore() > 40) {
      return Icons.sentiment_very_dissatisfied_sharp;
    }
    return Icons.sentiment_very_dissatisfied_sharp;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Result'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Icon(
                iconResult(),
                size: 80,
              ),
              SizedBox(
                height: 20,
              ),
              Text('Your score'),
              SizedBox(
                height: 10,
              ),
              Text(
                '${widget.result.correctQuestions} / ${widget.result.totalQuestions}',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                message(),
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          Text(getCorrectScore().toStringAsFixed(0) + '%'),
                          Container(
                            height: 80,
                            width: 80,
                            margin: EdgeInsets.symmetric(horizontal: 10),
                            child: CircularProgressIndicator(
                              value: getCorrectScore() / 100,
                              strokeWidth: 14,
                              backgroundColor: Colors.grey.shade200,
                              color: Colors.green,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text('Correct')
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          Text(getCorrectScore().toStringAsFixed(0) + '%'),
                          Container(
                            height: 80,
                            width: 80,
                            margin: EdgeInsets.symmetric(horizontal: 10),
                            child: CircularProgressIndicator(
                              value: getTimeUpScore() / 100,
                              strokeWidth: 14,
                              backgroundColor: Colors.grey.shade200,
                              color: Colors.indigo,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text('Time up')
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          Text(getWrongScore().toStringAsFixed(0) + '%'),
                          Container(
                            height: 80,
                            width: 80,
                            margin: EdgeInsets.symmetric(horizontal: 10),
                            child: CircularProgressIndicator(
                              value: getWrongScore() / 100,
                              strokeWidth: 14,
                              backgroundColor: Colors.grey.shade200,
                              color: Colors.red,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text('Wrong')
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  OutlinedButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => QuizScreen(
                                      dataModel: widget.dataModel,
                                      quizID: widget.quizID,
                                      time: widget.time,
                                    )));
                      },
                      style: OutlinedButton.styleFrom(
                          side: BorderSide(color: Colors.blue),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8))),
                      child: Text(
                        'RESTART',
                        style: TextStyle(color: Colors.blue),
                      )),
                  OutlinedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => QuizScreen(
                                      dataModel: widget.dataModel,
                                      quizID: widget.quizID,
                                      time: widget.time,
                                      selectedAnswers:
                                          widget.result.selectedAnswers,
                                    )));
                      },
                      style: OutlinedButton.styleFrom(
                          side: BorderSide(color: Colors.purple),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8))),
                      child: Text(
                        'REVIEW',
                        style: TextStyle(color: Colors.purple),
                      )),
                  OutlinedButton(
                      onPressed: () {
                        final topics = widget.dataModel.topicViews();
                        String topicName = '';
                        String setName = '';

                        outerLoop:
                        for (var topic in topics) {
                          for (var sets in topic.sets) {
                            if (widget.quizID == sets.setId) {
                              topicName = topic.title;
                              setName = sets.title;
                              break outerLoop;
                            }
                          }
                        }

                        Share.share(
                            'I score ${getCorrectScore().toStringAsFixed(0)}% in $topicName quiz: $setName, Checkout the App: <link of app>.');
                      },
                      style: OutlinedButton.styleFrom(
                          side: BorderSide(color: Colors.orange),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8))),
                      child: Text(
                        'SHARE',
                        style: TextStyle(color: Colors.orange),
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

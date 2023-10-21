import 'package:flutter/material.dart';
import 'package:quiz_app/modules/home/models/Question/learning_questions.dart';
import 'package:quiz_app/modules/home/repository/repository.dart';

class LearningScreen extends StatefulWidget {
  final String pageTitle;
  final int learningId;
  const LearningScreen(
      {super.key, required this.pageTitle, required this.learningId});

  @override
  State<LearningScreen> createState() => _LearningScreenState();
}

class _LearningScreenState extends State<LearningScreen> {
  late Future<LeaningQuestions> learningQuestion;
  @override
  void initState() {
    super.initState();
    learningQuestion = Repository().learningQuestions(widget.learningId);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.pageTitle),
        ),
        body: FutureBuilder(
            future: learningQuestion,
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

              final question = snapshot.data!.data!;

              return ListView.builder(
                physics: ClampingScrollPhysics(),
                itemCount: question.length,
                itemBuilder: (context, index) {
                  return LearningQuestionView(
                    learningQuestion: question[index],
                  );
                },
              );
            }),
      ),
    );
  }
}

class LearningQuestionView extends StatelessWidget {
  final LeaningQuestion learningQuestion;
  const LearningQuestionView({super.key, required this.learningQuestion});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey,
          ),
          borderRadius: BorderRadius.circular(6)),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "Question:",
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
            ),
            Text(
              learningQuestion.questionName ?? " ",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 12,
            ),
            Text(
              "Answer:",
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
            ),
            Text(
              learningQuestion.answerName ?? " ",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(
              height: 12,
            ),
            Text(
              "Explanation:",
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
            ),
            Text(
              learningQuestion.answerExplanation ?? " ",
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}

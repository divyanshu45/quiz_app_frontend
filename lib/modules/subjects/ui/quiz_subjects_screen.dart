import 'package:flutter/material.dart';
import 'package:quiz_app/modules/home/models/quiztypes/quiz_model.dart';
import 'package:quiz_app/modules/topic/ui/topic_screen.dart';

class QuizSubjectScreen extends StatefulWidget {
  final String pageTitle;
  final QuizModel quizModel;
  const QuizSubjectScreen(
      {super.key, required this.pageTitle, required this.quizModel});

  @override
  State<QuizSubjectScreen> createState() => _QuizSubjectScreenState();
}

class _QuizSubjectScreenState extends State<QuizSubjectScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Text(widget.pageTitle),
          ),
          body: ListView.builder(
            itemCount: widget.quizModel.data!.length,
            itemBuilder: (context, index) {
              return QuizHolder(
                quizData: widget.quizModel.data![index],
              );
            },
          )),
    );
  }
}

class QuizHolder extends StatelessWidget {
  final QuizData quizData;
  const QuizHolder({super.key, required this.quizData});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(4),
      decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey,
          ),
          borderRadius: BorderRadius.circular(6)),
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => TopicScreen(
                        pageTitle: quizData.subjectName ?? "",
                        topicView: quizData,
                      )));
        },
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              FlutterLogo(
                size: 80,
              ),
              SizedBox(
                width: 12,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    quizData.subjectName ?? " ",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Text(
                    "${quizData.topic!.length} Topics",
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w300),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

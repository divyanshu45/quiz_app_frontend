import 'package:flutter/material.dart';
import 'package:quiz_app/modules/home/models/quiztypes/quiz_model.dart';
import 'package:quiz_app/modules/subjects/ui/quiz_subjects_screen.dart';
import 'package:quiz_app/modules/topic/ui/topic_screen.dart';

class QuizCard extends StatefulWidget {
  final QuizModel quizModel;
  const QuizCard({super.key, required this.quizModel});

  @override
  State<QuizCard> createState() => _QuizCardState();
}

class _QuizCardState extends State<QuizCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.quizModel.modelName ?? 'Quizzes',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
              ),
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6)),
                    side: BorderSide(color: Theme.of(context).primaryColor),
                    padding: EdgeInsets.all(6)),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => QuizSubjectScreen(
                                pageTitle:
                                    widget.quizModel.modelName ?? 'Quizzes',
                                quizModel: widget.quizModel,
                              )));
                },
                child: Text('View All'),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: List.generate(
                    widget.quizModel.data!.length,
                    (index) => QuizTopicView(
                          dataModel: widget.quizModel.data![index],
                        )),
              )),
        ],
      ),
    );
  }
}

class QuizTopicView extends StatelessWidget {
  final QuizData? dataModel;
  const QuizTopicView({super.key, required this.dataModel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print(dataModel!.toJson().toString());
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => TopicScreen(
                      pageTitle: dataModel?.subjectName ?? "",
                      topicView: dataModel!,
                    )));
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 6),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            FlutterLogo(
              size: 80,
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              dataModel?.subjectName ?? '',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 2,
            ),
            Text(
              (dataModel?.topic?.length ?? 0).toString(),
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w300),
            ),
          ],
        ),
      ),
    );
  }
}

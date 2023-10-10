import 'package:flutter/material.dart';
import 'package:quiz_app/modules/home/models/all_quiz_model.dart';
import 'package:quiz_app/modules/set/ui/set_screen.dart';
import 'package:quiz_app/modules/topic/ui/topic_screen.dart';

class AllQuizModelHolder extends StatelessWidget {
  final AllQuizModel allQuizModel;
  const AllQuizModelHolder({super.key, required this.allQuizModel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => TopicScreen(title: allQuizModel.subjectName ?? '', topics: allQuizModel.topics ?? [],)));
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
            SizedBox(height: 8,),
            Text(
              allQuizModel.subjectName ?? '',
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500
              ),
            ),
            SizedBox(height: 2,),
            Text(
              (allQuizModel.topics?.length ?? 0).toString(),
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w300
              ),
            ),
          ],
        ),
      ),
    );
  }
}

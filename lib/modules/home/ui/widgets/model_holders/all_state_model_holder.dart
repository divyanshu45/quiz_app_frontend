import 'package:flutter/material.dart';
import 'package:quiz_app/modules/home/models/all_quiz_model.dart';
import 'package:quiz_app/modules/topic/ui/topic_screen.dart';
import '../../../../set/ui/set_screen.dart';

class AllStateModelHolder extends StatelessWidget {
  final AllQuizModel allQuizModel;
  const AllStateModelHolder({super.key, required this.allQuizModel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => TopicScreen(title: allQuizModel.subjectName ?? '', topics: allQuizModel.topics ?? [],)));
      },
      child: Container(
        padding: EdgeInsets.all(8),
        margin: EdgeInsets.symmetric(horizontal: 6),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey,
          ),
          borderRadius: BorderRadius.circular(6)
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FlutterLogo(
              size: 80,
            ),
            SizedBox(width: 12,),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
            )
          ],
        ),
      ),
    );
  }
}

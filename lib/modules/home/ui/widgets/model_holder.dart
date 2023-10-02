import 'package:flutter/material.dart';
import 'package:quiz_app/modules/home/models/all_practice_model.dart';
import 'package:quiz_app/modules/home/models/all_quiz_model.dart';
import 'package:quiz_app/modules/set/ui/set_screen.dart';
import 'package:quiz_app/modules/topic/ui/topic_screen.dart';

class ModelHolder extends StatelessWidget {
  final Data? dataModel;
  final PracticeData? practiceData;
  const ModelHolder({super.key, this.dataModel, this.practiceData});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => TopicScreen()));
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
              dataModel?.subjectName ?? '',
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500
              ),
            ),
            SizedBox(height: 2,),
            Text(
              (dataModel?.topic?.length ?? 0).toString(),
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

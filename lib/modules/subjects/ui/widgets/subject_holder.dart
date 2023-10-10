import 'package:flutter/material.dart';
import 'package:quiz_app/modules/home/models/all_quiz_model.dart';
import 'package:quiz_app/modules/topic/ui/topic_screen.dart';

class SubjectHolder extends StatelessWidget {
  final AllQuizModel subject;
  const SubjectHolder({super.key, required this.subject});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(4),
      decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey,
          ),
          borderRadius: BorderRadius.circular(6)
      ),
      child: InkWell(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => TopicScreen(title: subject.subjectName ?? '', topics: subject.topics ?? [])));
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
              SizedBox(width: 12,),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    subject.subjectName ?? '',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500
                    ),
                  ),
                  SizedBox(height: 2,),
                  Text(
                    (subject.topics?.length ?? 0).toString(),
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
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:quiz_app/modules/set/ui/set_screen.dart';
import '../../../home/models/all_quiz_model.dart';

class TopicHolder extends StatelessWidget {
  final Topic topic;
  const TopicHolder({super.key, required this.topic});

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
          Navigator.push(context, MaterialPageRoute(builder: (context) => SetScreen(title: topic.topicName ?? '', sets: topic.quiz ?? [])));
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
                    topic.topicName ?? '',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500
                    ),
                  ),
                  SizedBox(height: 2,),
                  Text(
                    (topic.quiz?.length ?? 0).toString(),
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

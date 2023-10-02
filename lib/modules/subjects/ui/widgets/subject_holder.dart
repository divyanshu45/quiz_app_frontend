import 'package:flutter/material.dart';
import 'package:quiz_app/modules/topic/ui/topic_screen.dart';

class SubjectHolder extends StatelessWidget {
  const SubjectHolder({super.key});

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
          Navigator.push(context, MaterialPageRoute(builder: (context) => TopicScreen()));
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
                    'Subject Title',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500
                    ),
                  ),
                  SizedBox(height: 2,),
                  Text(
                    'Subject Topics no',
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

import 'package:flutter/material.dart';
import 'package:quiz_app/modules/set/ui/set_screen.dart';

class TopicHolder extends StatelessWidget {
  const TopicHolder({super.key});

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
          Navigator.push(context, MaterialPageRoute(builder: (context) => SetScreen()));
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
                    'Topic Title',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500
                    ),
                  ),
                  SizedBox(height: 2,),
                  Text(
                    'Topic Sets no',
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

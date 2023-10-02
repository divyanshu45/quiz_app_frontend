import 'package:flutter/material.dart';
import 'package:quiz_app/modules/quiz/ui/quiz_screen.dart';

class SetHolder extends StatelessWidget {
  const SetHolder({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 6, horizontal: 10),
      decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey,
          ),
          borderRadius: BorderRadius.circular(6)
      ),
      child: InkWell(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => QuizScreen()));
        },
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  FlutterLogo(
                    size: 50,
                  ),
                  SizedBox(width: 12,),
                  Expanded(
                    child: Column(
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
                          'Sets no',
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w300
                          ),
                        ),
                      ],
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward_ios_rounded
                  )
                ],
              ),
              SizedBox(height: 2,),
              Divider(),
              SizedBox(height: 2,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 2, horizontal: 4),
                    decoration: BoxDecoration(
                      color: Colors.redAccent,
                      borderRadius: BorderRadius.circular(4)
                    ),
                    child: Text(
                      'Not Attempted',
                      style: TextStyle(
                        fontSize: 10,
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

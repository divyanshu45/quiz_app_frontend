import 'package:flutter/material.dart';
import 'package:quiz_app/modules/home/models/quiztypes/learning_model.dart';
import 'package:quiz_app/modules/home/models/quiztypes/mixin/topics_mixin.dart';
import 'package:quiz_app/modules/learning/ui/learningScreen.dart';
import 'package:quiz_app/modules/quiz/ui/quiz_screen.dart';

class SetScreen extends StatefulWidget {
  final String pageTitle;
  final GetTopicView mainTopicViewObj;
  final int topicIndex;
  const SetScreen(
      {super.key,
      required this.mainTopicViewObj,
      required this.pageTitle,
      required this.topicIndex});

  @override
  State<SetScreen> createState() => _SetScreenState();
}

class _SetScreenState extends State<SetScreen> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    final topicView = widget.mainTopicViewObj.topicViews()[widget.topicIndex];
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.pageTitle),
        ),
        body: ListView.builder(
          itemCount: topicView.sets.length,
          itemBuilder: (context, index) {
            return SetHolder(
              mainTopicViewObj: widget.mainTopicViewObj,
              setData: topicView.sets[index],
            );
          },
        ),
      ),
    );
  }
}

class SetHolder extends StatelessWidget {
  final SetsDataView setData;
  final GetTopicView mainTopicViewObj;
  const SetHolder(
      {super.key, required this.setData, required this.mainTopicViewObj});

  bool isLearning() {
    return mainTopicViewObj is LearningModel;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 6, horizontal: 10),
      decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey,
          ),
          borderRadius: BorderRadius.circular(6)),
      child: InkWell(
        onTap: () {
          if (isLearning()) {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => LearningScreen(
                          pageTitle: setData.title,
                          learningId: setData.setId,
                        )));
            return;
          }

          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => QuizScreen(
                        dataModel: mainTopicViewObj,
                        quizID: setData.setId,
                        time: setData.timeLimit,
                      )));
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
                  SizedBox(
                    width: 12,
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          setData.title,
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        if (!isLearning())
                          Text(
                            '${setData.timeLimit} Minutes',
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.w300),
                          ),
                      ],
                    ),
                  ),
                  Icon(Icons.arrow_forward_ios_rounded)
                ],
              ),
              SizedBox(
                height: 2,
              ),
              if (!isLearning())
                if (!isLearning()) ...[
                  Divider(),
                  SizedBox(
                    height: 2,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 2, horizontal: 4),
                        decoration: BoxDecoration(
                            color: Colors.redAccent,
                            borderRadius: BorderRadius.circular(4)),
                        child: Text(
                          'Not Attempted',
                          style: TextStyle(
                            fontSize: 10,
                          ),
                        ),
                      )
                    ],
                  )
                ]
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:quiz_app/modules/home/models/quiztypes/exam_model.dart';
import 'package:quiz_app/modules/home/models/quiztypes/learning_model.dart';
import 'package:quiz_app/modules/home/models/quiztypes/state_model.dart';
import 'package:quiz_app/modules/home/models/quiztypes/mixin/topics_mixin.dart';
import 'package:quiz_app/modules/set/ui/set_screen.dart';
import 'package:quiz_app/modules/topic/ui/topic_screen.dart';

class TopicSliderContainer extends StatefulWidget {
  final GetTopicView dataModel;
  final bool useHorizontalView;

  const TopicSliderContainer(
      {super.key, required this.dataModel, this.useHorizontalView = false});

  @override
  State<TopicSliderContainer> createState() => _TopicSliderContainerState();
}

class _TopicSliderContainerState extends State<TopicSliderContainer> {
  String getDefaultTitle() {
    if (widget.dataModel is ExamModel) return "Exams";
    if (widget.dataModel is StateModel) return "State Exams";
    if (widget.dataModel is LearningModel) return "Learning";
    return "Unknown";
  }

  @override
  Widget build(BuildContext context) {
    final data = widget.dataModel.topicViews();
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
                getDefaultTitle(),
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
                          builder: (context) => TopicScreen(
                                pageTitle: getDefaultTitle(),
                                topicView: widget.dataModel,
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
                  children: List.generate(data.length, (index) {
                    if (widget.useHorizontalView) {
                      return HorizontalTopicItemSliderView(
                          dataModel: widget.dataModel, topicItemIndex: index);
                    }

                    return TopicItemSliderView(
                      dataModel: widget.dataModel,
                      topicItemIndex: index,
                    );
                  }))),
        ],
      ),
    );
  }
}

class TopicItemSliderView extends StatelessWidget {
  final GetTopicView dataModel;
  final int topicItemIndex;

  const TopicItemSliderView(
      {super.key, required this.dataModel, required this.topicItemIndex});

  @override
  Widget build(BuildContext context) {
    final data = dataModel.topicViews()[topicItemIndex];
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => SetScreen(
                    mainTopicViewObj: dataModel,
                    pageTitle: data.title,
                    topicIndex: topicItemIndex)));
      },
      child: Container(
        padding: EdgeInsets.all(8),
        margin: EdgeInsets.symmetric(horizontal: 6),
        decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey,
            ),
            borderRadius: BorderRadius.circular(6)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FlutterLogo(
              size: 80,
            ),
            SizedBox(
              width: 12,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data.title,
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 2,
                ),
                Text(
                  "${data.sets.length} Sets",
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w300),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class HorizontalTopicItemSliderView extends StatelessWidget {
  final GetTopicView dataModel;
  final int topicItemIndex;

  const HorizontalTopicItemSliderView(
      {super.key, required this.dataModel, required this.topicItemIndex});

  @override
  Widget build(BuildContext context) {
    final data = dataModel.topicViews()[topicItemIndex];
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => SetScreen(
                    mainTopicViewObj: dataModel,
                    pageTitle: data.title,
                    topicIndex: topicItemIndex)));
      },
      child: Container(
        padding: EdgeInsets.all(8),
        margin: EdgeInsets.symmetric(horizontal: 6),
        decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey,
            ),
            borderRadius: BorderRadius.circular(6)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FlutterLogo(
              size: 80,
            ),
            SizedBox(
              width: 12,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data.title,
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 2,
                ),
                Text(
                  "${data.sets.length} Sets",
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w300),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:quiz_app/modules/home/models/quiztypes/mixin/topics_mixin.dart';
import 'package:quiz_app/modules/set/ui/set_screen.dart';

class TopicScreen extends StatefulWidget {
  final GetTopicView topicView;
  final String pageTitle;
  const TopicScreen({
    super.key,
    required this.pageTitle,
    required this.topicView,
  });

  @override
  State<TopicScreen> createState() => _TopicScreenState();
}

class _TopicScreenState extends State<TopicScreen> {
  @override
  Widget build(BuildContext context) {
    final topicViews = widget.topicView.topicViews();
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Text(widget.pageTitle),
          ),
          body: ListView.builder(
            itemCount: topicViews.length,
            itemBuilder: (context, index) {
              return _SetsHolder(
                topicView: widget.topicView,
                topicIndex: index,
              );
            },
          )),
    );
  }
}

class _SetsHolder extends StatelessWidget {
  final GetTopicView topicView;
  final int topicIndex;
  const _SetsHolder(
      {super.key, required this.topicView, required this.topicIndex});

  @override
  Widget build(BuildContext context) {
    final sets = topicView.topicViews();
    return Container(
      margin: EdgeInsets.all(4),
      decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey,
          ),
          borderRadius: BorderRadius.circular(6)),
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => SetScreen(
                        mainTopicViewObj: topicView,
                        pageTitle: sets[topicIndex].title,
                        topicIndex: topicIndex,
                      )));
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
              SizedBox(
                width: 12,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    sets[topicIndex].title,
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Text(
                    "${sets[topicIndex].sets.length} Sets",
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w300),
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

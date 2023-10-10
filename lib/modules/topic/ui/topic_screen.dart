import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_app/modules/topic/ui/widgets/topic_holder.dart';
import '../../home/models/all_quiz_model.dart';

class TopicScreen extends StatelessWidget {
  final String title;
  final List<Topic> topics;
  const TopicScreen({super.key, required this.topics, required this.title});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            title
          ),
        ),
        body: ListView.builder(
          itemCount: topics.length,
          itemBuilder: (context, index) {
            return TopicHolder(topic: topics[index],);
          },
        )
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:quiz_app/modules/topic/ui/widgets/topic_holder.dart';

class TopicScreen extends StatefulWidget {
  const TopicScreen({super.key});

  @override
  State<TopicScreen> createState() => _TopicscreenState();
}

class _TopicscreenState extends State<TopicScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Topics Screen'
          ),
        ),
        body: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return TopicHolder();
          },
        )
      ),
    );
  }
}

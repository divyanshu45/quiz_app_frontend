import 'package:flutter/material.dart';
import 'package:quiz_app/modules/subjects/ui/widgets/subject_holder.dart';
import '../../home/models/all_quiz_model.dart';

class SubjectsScreen extends StatelessWidget {
  final String title;
  final List<AllQuizModel> subjects;
  const SubjectsScreen({super.key, required this.subjects, required this.title});

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
            itemCount: subjects.length,
            itemBuilder: (context, index) {
              return SubjectHolder(subject: subjects[index]);
            },
          )
      ),
    );
  }
}

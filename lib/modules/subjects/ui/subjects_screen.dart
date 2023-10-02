import 'package:flutter/material.dart';
import 'package:quiz_app/modules/subjects/ui/widgets/subject_holder.dart';

class SubjectsScreen extends StatefulWidget {
  const SubjectsScreen({super.key});

  @override
  State<SubjectsScreen> createState() => _SubjectsScreenState();
}

class _SubjectsScreenState extends State<SubjectsScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Text(
              'Subjects Screen'
            ),
          ),
          body: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              return SubjectHolder();
            },
          )
      ),
    );
  }
}

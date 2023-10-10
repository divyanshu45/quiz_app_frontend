import 'package:flutter/material.dart';
import 'package:quiz_app/modules/set/ui/widgets/set_holder.dart';
import '../../home/models/all_quiz_model.dart';

class SetScreen extends StatelessWidget {
  final String title;
  final List<Quiz> sets;
  const SetScreen({super.key, required this.sets, required this.title});

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
          itemCount: sets.length,
          itemBuilder: (context, index) {
            return SetHolder(set: sets[index]);
          }
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:quiz_app/modules/home/ui/widgets/model_holders/all_quiz_model_holder.dart';
import 'package:quiz_app/modules/subjects/ui/subjects_screen.dart';
import 'package:quiz_app/modules/topic/ui/topic_screen.dart';

import '../../../models/all_quiz_model.dart';
import '../model_holders/all_exam_model_holder.dart';

class AllExamCard extends StatefulWidget {
  final List<AllQuizModel> allQuizModel;
  const AllExamCard({super.key, required this.allQuizModel});

  @override
  State<AllExamCard> createState() => _AllExamCardState();
}

class _AllExamCardState extends State<AllExamCard> {
  @override
  Widget build(BuildContext context) {
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
                widget.allQuizModel[0].modelName ?? '',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700
                ),
              ),
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6)
                  ),
                  side: BorderSide(
                    color: Theme.of(context).primaryColor),
                  padding: EdgeInsets.all(6)
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => SubjectsScreen(title: widget.allQuizModel[0].modelName ?? '', subjects: widget.allQuizModel,)));
                },
                child: Text('View All'),
              ),
            ],
          ),
          SizedBox(height: 10,),
          SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: List.generate(widget.allQuizModel.length ?? 0, (index) => AllExamModelHolder(allQuizModel: widget.allQuizModel[index])
              ),
            ),
          )
        ],
      ),
    );
  }
}

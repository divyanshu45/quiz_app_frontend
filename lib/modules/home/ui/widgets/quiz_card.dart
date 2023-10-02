import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:quiz_app/modules/home/models/all_practice_model.dart';
import 'package:quiz_app/modules/home/ui/widgets/model_holder.dart';
import 'package:quiz_app/modules/subjects/ui/subjects_screen.dart';
import 'package:quiz_app/modules/topic/ui/topic_screen.dart';

import '../../models/all_quiz_model.dart';
import 'model_holder_II.dart';

class QuizCard extends StatefulWidget {
  final bool isFirst;
  final AllQuizModel? allQuizModel;
  final AllPracticeModel? allPracticeModel;
  const QuizCard({super.key, required this.isFirst, this.allQuizModel, this.allPracticeModel});

  @override
  State<QuizCard> createState() => _QuizCardState();
}

class _QuizCardState extends State<QuizCard> {
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
                widget.allQuizModel?.modelName ?? '',
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
                  Navigator.push(context, MaterialPageRoute(builder: (context) => SubjectsScreen()));
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
              children: List.generate(widget.allQuizModel?.data?.length ?? 0, (index) => widget.allQuizModel != null
                  
                  ? widget.isFirst
                    ? ModelHolder(dataModel: widget.allQuizModel!.data![index])
                    : ModelHolderII(dataModel: widget.allQuizModel!.data![index])
                  : widget.isFirst
                    ? ModelHolder(practiceData: widget.allPracticeModel!.practiceData![index])
                    : ModelHolderII(practiceData: widget.allPracticeModel!.practiceData![index])
              ),
            ),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:quiz_app/modules/quiz/models/question.dart';
import 'package:quiz_app/modules/result/ui/result_screen.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {

  int question_number = 1;

  final PageController _pageController = PageController(initialPage: 0);

  bool isLocked = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            SizedBox(height: 10,),
            Text(
              '$question_number / ${questions.length}',
            ),
            SizedBox(height: 10,),
            Divider(),
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                physics: NeverScrollableScrollPhysics(),
                itemCount: 10,
                itemBuilder: (context, index) {
                  return buildQuestion(questions[index]);
                },
              )
            ),
            isLocked ? ElevatedButton(
              onPressed: (){
                if(question_number < questions.length) {
                  _pageController.nextPage(
                    duration: Duration(milliseconds: 500),
                    curve: Curves.easeInExpo
                  );
                  setState(() {
                    question_number++;
                    isLocked = false;
                  });
                } else {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => ResultScreen(correct: 8, total: 10,))
                  );
                }
              },
              child: Text(
                question_number < questions.length
                  ? 'Next'
                  : 'Finish'
              )
            ) : const SizedBox.shrink()
          ],
        ),
      ),
    );
  }

  Widget buildQuestion(Question question) {
    return Column(
      children: [
        SizedBox(height: 20,)  ,
        Text(
          question.question,
          style: TextStyle(
            fontSize: 20,
          ),
        ),
        SizedBox(height: 10,),
        Expanded(
          child: OptionsWidget(
            question: question,
            onClickedOption: (option) {
              if(question.isLocked) {
                return;
              } else {
                setState(() {
                  question.isLocked = true;
                  question.selectedOption = option;
                });
                isLocked = question.isLocked;
              }
            },
          ),
        )
      ],
    );
  }
}

class OptionsWidget extends StatelessWidget {
  final Question question;
  final ValueChanged<Option> onClickedOption;
  const OptionsWidget({super.key, required this.question, required this.onClickedOption});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: question.options
            .map((option) => buildOptionWidget(context, option))
            .toList()
      ),
    );
  }

  Widget buildOptionWidget(BuildContext context, Option option) {
    final color = getColorOption(option, question);
    return InkWell(
      onTap: () {
        onClickedOption(option);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        margin: EdgeInsets.symmetric(vertical: 4, horizontal: 6),
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: color)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              option.text,
              style: TextStyle(
                fontSize: 20
              ),
            ),
            getIconForOption(option, question)
          ],
        ),
      ),
    );
  }

  Color getColorOption(Option option, Question question) {
    final isSelected = option == question.selectedOption;
    if(question.isLocked) {
      if(isSelected) {
        return option.isCorrect ? Colors.green : Colors.red;
      } else if(option.isCorrect) {
        return Colors.green;
      }
    }
    return Colors.grey.shade300;
  }

  Widget getIconForOption(Option option, Question question) {
    final isSelected = option == question.selectedOption;
    if(question.isLocked) {
      if(isSelected) {
        return option.isCorrect
            ? Icon(Icons.check_circle, color: Colors.green,)
            : Icon(Icons.cancel, color: Colors.red,);
      } else if(option.isCorrect) {
        return Icon(Icons.check_circle, color: Colors.green,);
      }
    }
    return const SizedBox.shrink();
  }
}
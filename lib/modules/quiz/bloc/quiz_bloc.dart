import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:quiz_app/modules/quiz/repository/quiz_repository.dart';

import '../models/question.dart';
import '../models/question_model.dart';

part 'quiz_event.dart';
part 'quiz_state.dart';

class QuizBloc extends Bloc<QuizEvent, QuizState> {
  QuizBloc() : super(QuizInitial()) {

    final QuizRepository quizRepository = QuizRepository();

    on<FetchQuizQuestion>((event, emit) async {
      emit(QuizLoadingState());
      try {
        final questions = await quizRepository.getAllQuiz(id: event.id);

        List<Question> questionsList = [];
        for (var element in questions) {
          questionsList.add(
            Question(
              question: element.questionName ?? '',
              options: [
                Option(text: element.optionA ?? '', isCorrect: element.correctOption == 'option_a'),
                Option(text: element.optionB ?? '', isCorrect: element.correctOption == 'option_b'),
                Option(text: element.optionC ?? '', isCorrect: element.correctOption == 'option_c'),
                Option(text: element.optionD ?? '', isCorrect: element.correctOption == 'option_d'),
              ]
            )
          );
        }

        emit(QuizSuccessState(questions: questionsList));
      } catch(e) {
        emit(QuizErrorState(error: e.toString()));
      }
    });
  }
}

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:quiz_app/modules/home/models/all_exam_model.dart';
import 'package:quiz_app/modules/home/models/all_practice_model.dart';
import 'package:quiz_app/modules/home/models/all_quiz_model.dart';
import 'package:quiz_app/modules/home/models/all_state_model.dart';
import 'package:quiz_app/modules/home/repository/home_repository.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    
    final homeRepository = HomeRepository();

    on<FetchAllQuizEvent>((event, emit) async {
      emit(HomeLoadingState());
      try {

        final allQuizModels = await homeRepository.getAllQuiz();
        final allPracticeModels = await homeRepository.getAllPractice();
        final allStateModels = await homeRepository.getAllState();
        final allExamModels = await homeRepository.getAllExam();

        emit(HomeFetchedState(
          allQuizModel: allQuizModels,
          allPracticeModel: allPracticeModels,
          allExamModel: allExamModels,
          allStateModel: allStateModels
        ));

      } catch(e) {
        emit(HomeErrorState(message: e.toString()));
      }
    });



  }
}

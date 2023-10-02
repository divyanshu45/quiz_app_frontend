import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:quiz_app/modules/home/models/all_practice_model.dart';
import 'package:quiz_app/modules/home/models/all_quiz_model.dart';
import 'package:quiz_app/modules/home/repository/home_repository.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    
    final homeRepository = HomeRepository();

    on<FetchAllQuizEvent>((event, emit) async {
      emit(HomeLoadingState());
      try {
        final allQuizModel = await homeRepository.getAllQuiz();
        final allPracticeModel = await homeRepository.getAllPractice();
        emit(HomeFetchedState(allQuizModel: allQuizModel, allPracticeModel: allPracticeModel));
      } catch(e) {
        emit(HomeErrorState(message: e.toString()));
      }
    });
  }
}

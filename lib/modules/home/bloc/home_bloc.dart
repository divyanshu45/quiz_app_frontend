import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:quiz_app/modules/home/models/quiztypes/exam_model.dart';
import 'package:quiz_app/modules/home/models/quiztypes/learning_model.dart';
import 'package:quiz_app/modules/home/models/quiztypes/links_model.dart';
import 'package:quiz_app/modules/home/models/quiztypes/quiz_model.dart';
import 'package:quiz_app/modules/home/models/quiztypes/state_model.dart';
import 'package:quiz_app/modules/home/repository/repository.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    final homeRepository = Repository();

    on<FetchAllQuizEvent>((event, emit) async {
      emit(HomeLoadingState());
      try {
        final quizModel = homeRepository.getAllQuiz();
        final practiceModel = homeRepository.getAllPractice();
        final stateModel = homeRepository.getAllState();
        final examModel = homeRepository.getAllExam();
        final linksData = homeRepository.getLinks();

        emit(HomeFetchedState(
          quizModel: await quizModel,
          practiceModel: await practiceModel,
          examModel: await examModel,
          stateModel: await stateModel,
          linksData: await linksData,
        ));
      } catch (e) {
        emit(HomeErrorState(message: e.toString()));
      }
    });
  }
}

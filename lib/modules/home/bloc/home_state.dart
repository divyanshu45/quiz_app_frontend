part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();
}

class HomeInitial extends HomeState {
  @override
  List<Object> get props => [];
}

class HomeLoadingState extends HomeState {
  @override
  List<Object?> get props => [];
}

class HomeFetchedState extends HomeState {
  final QuizModel quizModel;
  final LearningModel practiceModel;
  final StateModel stateModel;
  final ExamModel examModel;
  final LinksData linksData;

  const HomeFetchedState(
      {required this.quizModel,
      required this.practiceModel,
      required this.examModel,
      required this.stateModel,
      required this.linksData});

  @override
  List<Object?> get props => [];
}

class HomeErrorState extends HomeState {
  final String message;

  const HomeErrorState({required this.message});

  @override
  List<Object?> get props => [];
}

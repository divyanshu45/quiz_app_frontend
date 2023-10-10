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
  final List<AllQuizModel> allQuizModel;
  final List<AllPracticeModel> allPracticeModel;
  final List<AllStateModel> allStateModel;
  final List<AllExamModel> allExamModel;

  const HomeFetchedState({required this.allQuizModel, required this.allPracticeModel, required this.allExamModel, required this.allStateModel});

  @override
  List<Object?> get props => [];
}

class HomeErrorState extends HomeState {
  final String message;

  const HomeErrorState({required this.message});

  @override
  List<Object?> get props => [];
}

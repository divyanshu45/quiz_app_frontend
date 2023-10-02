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
  final AllQuizModel allQuizModel;
  final AllPracticeModel allPracticeModel;

  const HomeFetchedState({required this.allQuizModel, required this.allPracticeModel});

  @override
  List<Object?> get props => [];
}

class HomeErrorState extends HomeState {
  final String message;

  const HomeErrorState({required this.message});

  @override
  List<Object?> get props => [];
}

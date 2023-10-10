part of 'quiz_bloc.dart';

abstract class QuizState extends Equatable {
  const QuizState();
}

class QuizInitial extends QuizState {
  @override
  List<Object> get props => [];
}

class QuizLoadingState extends QuizState {
  @override
  List<Object?> get props => [];

}

class QuizSuccessState extends QuizState {
  final List<Question> questions;
  const QuizSuccessState({required this.questions});
  @override
  List<Object?> get props => [];
}

class QuizErrorState extends QuizState {
  final String error;
  const QuizErrorState({required this.error});
  @override
  List<Object?> get props => [];
}
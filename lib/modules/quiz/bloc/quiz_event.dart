part of 'quiz_bloc.dart';

abstract class QuizEvent extends Equatable {
  const QuizEvent();
}

class FetchQuizQuestion extends QuizEvent {
  final int id;
  const FetchQuizQuestion({required this.id});
  @override
  List<Object?> get props => [];
}

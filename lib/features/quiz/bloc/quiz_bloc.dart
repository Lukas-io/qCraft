import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qcraft/features/quiz/bloc/quiz_event.dart';
import 'package:qcraft/features/quiz/bloc/quiz_state.dart';

class QuizBloc extends Bloc<QuizEvent, QuizState> {
  QuizBloc() : super(QuizInitial()) {
    on<QuizStarted>(onQuizStarted);
    on<QuizNextQuestion>(onQuizNextQuestion);
    on<QuizPreviousQuestion>(onQuizPreviousQuestion);
    on<QuizFinished>(onQuizFinished);
  }

  Future<void> onQuizStarted(QuizStarted event, Emitter<QuizState> emit) async {
    emit(QuizLoading());
  }

  Future<void> onQuizNextQuestion(
      QuizNextQuestion event, Emitter<QuizState> emit) async {
    emit(QuizLoading());
  }

  Future<void> onQuizPreviousQuestion(
      QuizPreviousQuestion event, Emitter<QuizState> emit) async {
    emit(QuizLoading());
  }

  Future<void> onQuizFinished(
      QuizFinished event, Emitter<QuizState> emit) async {
    emit(QuizLoading());
  }
}

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'answer_and_question_event.dart';
part 'answer_and_question_state.dart';

class AnswerAndQuestionBloc extends Bloc<AnswerAndQuestionEvent, AnswerAndQuestionState> {
  AnswerAndQuestionBloc() : super(AnswerAndQuestionLoadedState()) {
    on<AnswerAndQuestionEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}

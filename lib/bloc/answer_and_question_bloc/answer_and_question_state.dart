part of 'answer_and_question_bloc.dart';

@immutable
abstract class AnswerAndQuestionState {}

// Состояние для отображения скелетона
class AnswerAndQuestionSkeletonState extends AnswerAndQuestionState {}

// Состояние после получения данных
class AnswerAndQuestionLoadedState extends AnswerAndQuestionState {}


/// Не нужные

class AnswerAndQuestionFAQ extends AnswerAndQuestionState {}

class AnswerAndQuestionCustomerQuestions extends AnswerAndQuestionState {}

class AnswerAndQuestionSearch extends AnswerAndQuestionState {}



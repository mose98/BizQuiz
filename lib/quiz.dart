import 'package:bizcheck_quiz/staticvariables.dart';
import 'package:flutter/material.dart';

class Quiz{

}

class SingleQuiz{
  final int QuestionIndex;
  final BizQuestionType QuestionType;
  final List<AnswerClass> QuestionsList;
  final String QuestionTitle;
  String Answer;
  List<String> Answers = <String>[];

  SingleQuiz(this.QuestionIndex, this.QuestionType, this.QuestionsList, this.QuestionTitle);
}

class Section{
  final int SectionIndex;
  final String SectionName;
  final Color SectionColor;
  List<SingleQuiz> QuestionList;

  Section(this.SectionIndex, this.SectionName, this.SectionColor);
}

class AnswerClass{
  final String SingleQuestion;
  String SingleAnswer;

  AnswerClass(this.SingleQuestion);
}

enum BizQuestionType{
  TEXT_ANSWER,
  RADIO_SINGLE_CHOICE,
  RADIO_MULTIPLE_CHOICE,
  RADIO_YES_NO
}


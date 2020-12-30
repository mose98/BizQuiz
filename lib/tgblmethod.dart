import 'dart:ui';

import 'package:bizcheck_quiz/quiz.dart';
import 'package:bizcheck_quiz/radiomultiple.dart';
import 'package:bizcheck_quiz/radiosingle.dart';
import 'package:bizcheck_quiz/screens/generalcanvas.dart';
import 'package:bizcheck_quiz/staticvariables.dart';
import 'package:bizcheck_quiz/table.dart';
import 'package:bizcheck_quiz/text.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class TGBLMethod{
  static showToast(String text, Color backColor, Color textColor){
    Fluttertoast.showToast(
      textColor: textColor,
      backgroundColor: backColor,
      msg: text,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
    );
  }

  static createQuizList(){
    StaticVariables.QuizList.clear();
    String q = 'In che città ti trovi?';
    List<AnswerClass> qyn = <AnswerClass>[new AnswerClass('C#'), new AnswerClass('Python'), new AnswerClass('Dart/Flutter'), new AnswerClass('Java'), new AnswerClass('C'), new AnswerClass('C++')];
    List<AnswerClass> qsc = <AnswerClass>[new AnswerClass('Brescia'), new AnswerClass('Milano')];
    List<AnswerClass> qmc = <AnswerClass>[new AnswerClass('Calcio'), new AnswerClass('Karate'), new AnswerClass('Ciclismo')];
    StaticVariables.QuizList.add(new SingleQuiz(1, BizQuestionType.TEXT_ANSWER, null, q));
    StaticVariables.QuizList.add(new SingleQuiz(2, BizQuestionType.RADIO_YES_NO, qyn, 'Che linguaggi sai usare'));
    StaticVariables.QuizList.add(new SingleQuiz(3, BizQuestionType.RADIO_SINGLE_CHOICE, qsc, 'Residenza'));
    StaticVariables.QuizList.add(new SingleQuiz(4, BizQuestionType.RADIO_MULTIPLE_CHOICE, qmc, 'Sport praticati'));
    Section s = new Section(1, 'GeneralCanvas', Colors.teal);
    s.QuestionList = StaticVariables.QuizList;
    StaticVariables.SectionList.add(s);

    Section s1 = new Section(2, 'Flutter', Colors.deepOrange);
    s1.QuestionList = StaticVariables.QuizList.reversed.toList().sublist(0,3).toList();
    StaticVariables.SectionList.add(s1);

    Section s2 = new Section(3, 'Visual Studio', Colors.blueAccent);
    s2.QuestionList = StaticVariables.QuizList.sublist(0,2).toList();
    StaticVariables.SectionList.add(s2);
  }

  static createStepList(Section section){
    section.QuestionList?.toList()?.forEach((element) {
      StaticVariables.StepList.add(new Step(
          title: Text(element.QuestionTitle),
          content: element.QuestionType == BizQuestionType.TEXT_ANSWER ? TextWrite(quiz: element, color: section.SectionColor) : element.QuestionType == BizQuestionType.RADIO_YES_NO ? TableChoice(quiz: element, color: section.SectionColor) : element.QuestionType == BizQuestionType.RADIO_SINGLE_CHOICE ? RadioSingle(quiz: element, color: section.SectionColor) : RadioMultiple(quiz: element, color: section.SectionColor)

      ));
    });
  }

  static List<TableRow> createTableRow(List<AnswerClass> list, SingleQuiz quiz){
    list?.forEach((element) {
      StaticVariables.QuestionsListYesOrNo.add(new TableRow(children: [
        Container(
          child: Text(element.SingleQuestion),
          padding: EdgeInsets.all(10),
        ),
        RadioButtonChoice(quiz: quiz, questString: element.SingleQuestion,)
      ]),);
    });
  }

  static Route createRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => GeneralCanvas(section: StaticVariables.ActualSection,),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = Offset(0.0, 1.0);
        var end = Offset.zero;
        var curve = Curves.easeOut;

        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }
}
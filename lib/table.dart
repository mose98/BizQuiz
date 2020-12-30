import 'package:bizcheck_quiz/quiz.dart';
import 'package:bizcheck_quiz/staticvariables.dart';
import 'package:bizcheck_quiz/tgblmethod.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class TableChoice extends StatefulWidget{
  final SingleQuiz quiz;
  final Color color;

  const TableChoice({Key key, this.quiz, this.color}) : super(key: key);
  _TableChoiceState createState() => new _TableChoiceState();
}

class _TableChoiceState extends State<TableChoice>{
  SingleQuiz quiz;
  Color color;

  @override
  void didUpdateWidget(covariant TableChoice oldWidget) {
    quiz = oldWidget.quiz;
    color = oldWidget.color;
    TGBLMethod.createTableRow(quiz?.QuestionsList, quiz);
    super.didUpdateWidget(oldWidget);
  }

  @override
  void initState() {
    quiz = widget.quiz;
    color = widget.color;
    TGBLMethod.createTableRow(quiz?.QuestionsList, quiz);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50.0.w,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          border: Border.all(width: 1)),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            width: 50.0.w,
            child: Text(quiz.QuestionTitle, style: TextStyle(color: color, fontWeight: FontWeight.bold),),
            decoration: BoxDecoration(
              border: Border(bottom: BorderSide(width: 1)),
            ),
          ),
          Table(
            textDirection: TextDirection.ltr,
            defaultVerticalAlignment: TableCellVerticalAlignment.middle,
            border: TableBorder.symmetric(inside: BorderSide(width: 1)),
            children: StaticVariables.QuestionsListYesOrNo,
          ),
        ],
      ),
    );
  }
}

class RadioButtonChoice extends StatefulWidget {
  final String questString;
  final SingleQuiz quiz;

  const RadioButtonChoice({Key key, this.questString, this.quiz}) : super(key: key);

  @override
  _RadioButtonChoiceState createState() => _RadioButtonChoiceState();
}

class _RadioButtonChoiceState extends State<RadioButtonChoice> {
  String questString;
  SingleQuiz quiz;
  YesOrNo _choice;

  @override
  void didUpdateWidget(covariant RadioButtonChoice oldWidget) {
    questString = oldWidget.questString;
    quiz = oldWidget.quiz;
    super.didUpdateWidget(oldWidget);
  }

  @override
  void initState() {
    questString = widget.questString;
    quiz = widget.quiz;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          children: [
            Text('NO', style: TextStyle(fontSize: 12)),
            Radio(
              toggleable: true,
              value: YesOrNo.No,
              groupValue: _choice,
              onChanged: (YesOrNo value) {
                setState(() {
                  _choice = value;
                  value == null ? quiz.QuestionsList[quiz.QuestionsList.indexWhere((element) => element.SingleQuestion == questString)].SingleAnswer = null :  quiz.QuestionsList[quiz.QuestionsList.indexWhere((element) => element.SingleQuestion == questString)].SingleAnswer = value.toString();
                });
              },
            )
          ],
        ),
        Column(
          children: [
            Text('SI', style: TextStyle(fontSize: 12)),
            Radio(
              toggleable: true,
              value: YesOrNo.Si,
              groupValue: _choice,
              onChanged: (YesOrNo value) {
                setState(() {
                  _choice = value;
                  value == null ? quiz.QuestionsList[quiz.QuestionsList.indexWhere((element) => element.SingleQuestion == questString)].SingleAnswer = null :  quiz.QuestionsList[quiz.QuestionsList.indexWhere((element) => element.SingleQuestion == questString)].SingleAnswer = value.toString();
                });
              },
            )
          ],
        ),
      ],
    );
  }
}

enum YesOrNo { Si, No }
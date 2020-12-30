import 'package:bizcheck_quiz/quiz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class RadioSingle extends StatefulWidget {
  final SingleQuiz quiz;
  final Color color;

  const RadioSingle({Key key, this.quiz, this.color}) : super(key: key);

  _RadioSingleState createState() => new _RadioSingleState();
}

class _RadioSingleState extends State<RadioSingle> {
  SingleQuiz quiz;
  String selectedAnswer;
  int selectedRadio;
  int selectedRadioTile;
  Color color;

  setSelectedGamma(String gamma) {
    setState(() {
      selectedAnswer = gamma;
    });
  }

  setSelectedRadio(int val) {
    setState(() {
      selectedRadio = val;
    });
  }

  setSelectedRadioTile(int val) {
    setState(() {
      selectedRadioTile = val;
    });
  }

  List<Widget> createRadioListGamma() {
    List<Widget> widgets = [];
    for (AnswerClass ans in quiz.QuestionsList) {
      widgets.add(
        RadioListTile(
            toggleable: true,
            value: ans.SingleQuestion,
            groupValue: selectedAnswer,
            title: Text(ans.SingleQuestion),
            onChanged: (currentGamma) {
              setState(() {
                setSelectedGamma((currentGamma));
                quiz.Answer = currentGamma;
              });
            },
            selected: selectedAnswer == ans.SingleQuestion,
            activeColor: color),
      );
    }

    return widgets;
  }

  @override
  void didUpdateWidget(covariant RadioSingle oldWidget) {
    quiz = oldWidget.quiz;
    color = oldWidget.color;
    super.didUpdateWidget(oldWidget);
  }

  @override
  void initState() {
    quiz = widget.quiz;
    color = widget.color;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50.0.w,
      height: quiz.QuestionsList.length * 60.0 + 50,
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
          Container(
            height: quiz.QuestionsList.length * 60.toDouble(),
            padding: EdgeInsets.only(left: 10),
            child: Center(
              child: ListView(
                padding: EdgeInsets.all(0),
                children: createRadioListGamma(),
              ),
            ),
          )
        ],
      ),
    );
  }
}

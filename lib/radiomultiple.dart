import 'package:bizcheck_quiz/quiz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class RadioMultiple extends StatefulWidget {
  final SingleQuiz quiz;
  final Color color;

  const RadioMultiple({Key key, this.quiz, this.color}) : super(key: key);

  _RadioMultipleState createState() => new _RadioMultipleState();
}

class _RadioMultipleState extends State<RadioMultiple> {
  SingleQuiz quiz;
  Color color;

  @override
  void didUpdateWidget(covariant RadioMultiple oldWidget) {
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
                children: quiz.QuestionsList.map((e) => CheckboxListTile(
                    title: Text(e.SingleQuestion),
                    value: quiz.Answers.contains(e.SingleQuestion),
                    onChanged: (bool val){
                      if(val){
                        setState(() {
                          quiz.Answers.add(e.SingleQuestion);
                        });
                      }
                      else{
                        setState(() {
                          quiz.Answers.remove(e.SingleQuestion);
                        });
                      }
                    }),
                ).toList(),
              ),
            ),
          )
        ],
      ),
    );
  }
}

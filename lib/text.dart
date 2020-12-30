import 'package:bizcheck_quiz/quiz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';

class TextWrite extends StatefulWidget {
  final SingleQuiz quiz;
  final Color color;

  const TextWrite({Key key, @required this.quiz, @required this.color}) : super(key: key);
  _TextWriteState createState() => new _TextWriteState();
}

class _TextWriteState extends State<TextWrite> {
  SingleQuiz quiz;
  Color color;

  @override
  void didUpdateWidget(covariant TextWrite oldWidget) {
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
    TextEditingController value = new TextEditingController();

    return Container(
      width: 50.0.w,
      height: 12.0.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          border: Border.all(width: 1)),
      child: ConstrainedBox(
        constraints: BoxConstraints(maxHeight: 30.0.h),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              width: 50.0.w,
              child: Text(quiz?.QuestionTitle, style: TextStyle(color: color, fontWeight: FontWeight.bold),),
              decoration: BoxDecoration(
                border: Border(bottom: BorderSide(width: 1)),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: TextField(
                controller: value,
                onChanged: (value){
                  quiz?.Answer = value;
                },
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                  hintText: 'Risposta',
                  border: InputBorder.none,
                ),
                minLines: 1, //Normal textInputField will be displayed
                maxLines: 3,
                //expands: true,// when user presses enter it will adapt to it
              ),
            )
          ],
        ),
      ),
    );
  }
}
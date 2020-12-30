import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MultipleChoiceContent extends StatefulWidget{
  _MultipleChoiceContentState createState() => new _MultipleChoiceContentState();
}

class _MultipleChoiceContentState extends State<MultipleChoiceContent>{
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 100,
        width: 100,
        color: Colors.red,
      ),
    );
  }
}

class SingleChoiceContent extends StatefulWidget{
  _SingleChoiceContentState createState() => new _SingleChoiceContentState();
}

class _SingleChoiceContentState extends State<SingleChoiceContent>{
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 100,
        width: 100,
        color: Colors.green,
      ),
    );
  }
}
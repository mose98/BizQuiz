import 'dart:io';

import 'package:bizcheck_quiz/quiz.dart';
import 'package:bizcheck_quiz/screens/generalcanvas.dart';
import 'package:bizcheck_quiz/staticvariables.dart';
import 'package:bizcheck_quiz/tgblmethod.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ButtonStart extends StatelessWidget{

  bool checkValues(){
    if(StaticVariables.controllerNome.text != StaticVariables.nullValue &&
        StaticVariables.controllerCognome.text != StaticVariables.nullValue &&
        StaticVariables.controllerRagioneSociale.text != StaticVariables.nullValue &&
        StaticVariables.controllerPartitaIVA.text != StaticVariables.nullValue) return true;
    else return false;
  }

  assignVariables(){
    StaticVariables.Nome = StaticVariables.controllerNome.text;
    StaticVariables.Cognome = StaticVariables.controllerCognome.text;
    StaticVariables.RagioneSociale = StaticVariables.controllerRagioneSociale.text;
    StaticVariables.PartitaIVA = StaticVariables.controllerPartitaIVA.text;
  }



  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      heroTag: StaticVariables.uuid.v1(),
      onPressed: () async {
        if(checkValues()) {
          assignVariables();
          StaticVariables.QuizList.clear();
          TGBLMethod.createQuizList();
          StaticVariables.ActualSection = StaticVariables.SectionList.first;
          TGBLMethod.createStepList(StaticVariables.ActualSection);
          Navigator.of(context).push(TGBLMethod.createRoute());
        }
        else TGBLMethod.showToast('Compilare tutti i campi', Colors.red, Colors.white);
      },
      label: Text('INIZIA', style: TextStyle(fontSize: 30, fontWeight: FontWeight.w300),),
      backgroundColor: StaticVariables.ButtonStartColor,
    );
  }
}
import 'package:bizcheck_quiz/quiz.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class StaticVariables{
  static const String nullValue = '';
  static const String TitleHome = 'BizCheck';
  static const String SubTitleHome = 'Benvenuti a';
  static const String HomeDescriptionText = 'Le vostre risposte verranno successivamente analizzate così '
      'da permettermi di comprendere più approfonditamente la vostra società';
  static String Nome = nullValue;
  static String Cognome = nullValue;
  static String RagioneSociale = nullValue;
  static String PartitaIVA = nullValue;
  static const HeaderColor = const Color(0xFFE6B167);
  static const ButtonStartColor = const Color(0xFF00A006);
  static TextEditingController controllerNome = TextEditingController();
  static TextEditingController controllerCognome = TextEditingController();
  static TextEditingController controllerRagioneSociale = TextEditingController();
  static TextEditingController controllerPartitaIVA = TextEditingController();
  static List<SingleQuiz> QuizList = new List<SingleQuiz>();
  static List<Step> StepList = new List<Step>();
  static List<TableRow> QuestionsListYesOrNo = <TableRow>[];
  static Uuid uuid = Uuid();
  static List<Section> SectionList = <Section>[];
  static Section ActualSection;
  static int ActualSectionIndex = 0;
}
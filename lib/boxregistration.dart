import 'package:bizcheck_quiz/staticvariables.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BoxRegistration extends StatefulWidget{
  final String hintText;

  const BoxRegistration({Key key, @required this.hintText}) : super(key: key);
  _BoxRegistrationState createState() => new _BoxRegistrationState();

}

class _BoxRegistrationState extends State<BoxRegistration>{
  String hintText;

  @override
  void initState() {
    hintText = widget.hintText;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLength: hintText.contains('Partita IVA') ? 11 : null,
      keyboardType: hintText.contains('Partita IVA') ? TextInputType.number : TextInputType.text,
      inputFormatters: hintText.contains('Partita IVA') ? <TextInputFormatter>[
        FilteringTextInputFormatter.digitsOnly
      ] : null,
      controller: hintText.contains('Nome') ? StaticVariables.controllerNome : hintText.contains('Cognome') ? StaticVariables.controllerCognome : hintText.contains('Ragione Sociale') ? StaticVariables.controllerRagioneSociale : StaticVariables.controllerPartitaIVA,
      decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: StaticVariables.HeaderColor, width: 3),
            borderRadius: BorderRadius.all(Radius.circular(15.0)),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black45, width: 3),
            borderRadius: BorderRadius.all(Radius.circular(15.0)),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.amber, width: 10),
            borderRadius: BorderRadius.all(Radius.circular(15.0)),
          ),
          filled: true,
          hintStyle: TextStyle(color: Colors.grey[800]),
          hintText: hintText,
          fillColor: Colors.white70),
    );
  }
}
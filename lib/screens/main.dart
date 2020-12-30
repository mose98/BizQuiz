import 'package:bizcheck_quiz/boxregistration.dart';
import 'package:bizcheck_quiz/buttonstart.dart';
import 'package:bizcheck_quiz/staticvariables.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BizCheck',
      theme: ThemeData(primarySwatch: Colors.teal, fontFamily: 'Quicksand'),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: StaticVariables.HeaderColor,
        title: Text(StaticVariables.SubTitleHome, style: TextStyle(
            fontSize: 17,
            color: Colors.white
        ),),
        centerTitle: true,
        bottom: PreferredSize(
            child: Text(StaticVariables.TitleHome, style: TextStyle(
                fontSize: 34,
                fontWeight: FontWeight.bold,
                color: Colors.white
            ),),
            preferredSize: Size(double.infinity, 20)),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
        ),
      ),
      body: Center(
          child: Container(
            width: 300,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(StaticVariables.HomeDescriptionText, textAlign: TextAlign.center, style: TextStyle(fontStyle: FontStyle.italic),),
                SizedBox(height: 50,),
                BoxRegistration(hintText: 'Nome',),
                SizedBox(height: 20),
                BoxRegistration(hintText: 'Cognome',),
                SizedBox(height: 20),
                BoxRegistration(hintText: 'Ragione Sociale',),
                SizedBox(height: 20),
                BoxRegistration(hintText: 'Partita IVA',),
                SizedBox(height: 30,),
                Container(
                    width: 200,
                    height: 50,
                    child: ButtonStart()
                )
              ],
            ),
          )
      ),
    );
  }
}

import 'package:bizcheck_quiz/staticvariables.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../quiz.dart';
import '../tgblmethod.dart';

class GeneralCanvas extends StatelessWidget {
  final Section section;

  const GeneralCanvas({Key key, this.section}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints){
        return OrientationBuilder(
          builder: (context, orientation){
            SizerUtil().init(constraints, orientation);
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: section.SectionName,
              theme: ThemeData(
                  primaryColor: section.SectionColor,
                  primarySwatch: section.SectionColor
              ),
              home: GCHome(section: section),
            );
          },
        );
      },
    );

  }
}

class GCHome extends StatefulWidget {
  final Section section;

  const GCHome({Key key, this.section}) : super(key: key);

  _GCHomeState createState() => _GCHomeState();
}

class _GCHomeState extends State<GCHome> {
  int _currentStep1 = 0;
  Section section;

  @override
  void didUpdateWidget(GCHome oldWidget) {
    section = oldWidget.section;
    super.didUpdateWidget(oldWidget);
  }

  @override
  void initState() {
    section = widget.section;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: FloatingActionButton.extended(
        heroTag: StaticVariables.uuid.v1(),
        label: Text('Sezione successiva'),
        onPressed: (){
          StaticVariables.ActualSection = StaticVariables.SectionList[StaticVariables.ActualSectionIndex++];
          Navigator.of(context).push(TGBLMethod.createRoute());
        },
      ),
        appBar: AppBar(
          backgroundColor: section.SectionColor,
          title: Text(
            'Sezione ' + section.SectionIndex.toString(),
            style: TextStyle(fontSize: 17, color: Colors.white, fontWeight: FontWeight.w300),
          ),
          centerTitle: true,
          bottom: PreferredSize(
              child: Text(
                section.SectionName,
                style: TextStyle(
                    fontSize: 34,
                    fontWeight: FontWeight.w300,
                    color: Colors.white),
              ),
              preferredSize: Size(double.infinity, 20)),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(20),
            ),
          ),
        ),
        body: Center(
          child: Container(
                child: ListView(
                  physics: ClampingScrollPhysics(),
                  padding: EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 3.0),
                  children: <Widget>[
                    ListTile(
                      title: Stepper(
                        currentStep: this._currentStep1,
                        onStepTapped: (step) {
                          setState(() {
                            this._currentStep1 = step;
                          });
                        },
                        onStepContinue: () {
                          setState(() {
                            if (this._currentStep1 < StaticVariables.QuizList.length - 1) {
                              this._currentStep1++;
                            } else {
                              //logika jika komplit
                            }
                          });
                        },
                        onStepCancel: () {
                          setState(() {
                            if (this._currentStep1 > 0) {
                              this._currentStep1--;
                            } else {
                              this._currentStep1 = 0;
                            }
                          });
                        },
                        controlsBuilder: (BuildContext context,
                            {VoidCallback onStepContinue, VoidCallback onStepCancel}) {
                          return Row(children: [
                            Container(
                              height: 40,
                              width: 40,
                              padding: EdgeInsets.only(left: 10),
                              margin: EdgeInsets.only(left: 50.0.w, right: 20, top: 15),
                              child: FloatingActionButton(
                                heroTag: StaticVariables.uuid.v1(),
                                backgroundColor: Colors.blueGrey,
                                onPressed: (() {
                                  //onPreview();

                                  onStepCancel();
                                }),
                                child: Icon(
                                  Icons.arrow_back_ios,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Container(
                              height: 40,
                              margin: EdgeInsets.only(right: 20, top: 15),
                              child: FloatingActionButton.extended(
                                heroTag: StaticVariables.uuid.v1(),
                                backgroundColor: section.SectionColor,
                                onPressed: (() {
                                  onStepContinue();
                                }),
                                icon: (_currentStep1 == StaticVariables.StepList.length - 1)
                                    ? Icon(
                                  Icons.check_circle,
                                  color: Colors.white,
                                )
                                    : Icon(
                                  Icons.arrow_forward_ios,
                                  color: Colors.white,
                                ),
                                label: (_currentStep1 == StaticVariables.StepList.length - 1)
                                    ? Text('INVIA')
                                    : Text('Continua'),
                              ),
                            ),
                          ]);
                        },
                        steps: StaticVariables.StepList,
                      ),
                    ),
                  ],
                ),
              ),
          ),
        );
  }
}

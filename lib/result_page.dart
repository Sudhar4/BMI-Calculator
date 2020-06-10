import 'package:flutter/material.dart';
import 'reusable_card.dart';
import 'input_page.dart';
import 'bmi_result.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

const result_style = TextStyle(fontSize: 50.0, fontWeight: FontWeight.bold);
const cal = TextStyle(
    fontSize: 20.0, fontWeight: FontWeight.bold, color: Color(0xFF21D274));
const bmistyle = TextStyle(fontSize: 100.0, fontWeight: FontWeight.bold);

const normal = TextStyle(
    fontSize: 20.0, fontWeight: FontWeight.bold, color: Color(0xFF8E8F99));

class Result extends StatelessWidget {
  Result({this.bmiresult, this.bmitext, this.bmiins});
  String bmiresult;
  String bmitext;
  String bmiins;
  @override //bg=#1D1F33//green=#21D274
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
              child: Text(
                'Your Result',
                style: result_style,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              colour: valid,
              cardChild: Column(
                //mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
//                  SizedBox(
//                    width: 120.0,
//                    height: 100.0,
//                  ),
                  Expanded(
                    child: Center(
                      child: Text(
                        bmitext.toUpperCase(),
                        style: cal,
                        //textAlign: TextAlign.center,
                        //repeatForever: true,
                        //alignment: AlignmentDirectional.topStart,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      bmiresult,
                      style: result_style,
                    ),
                  ),
                  Expanded(
                    child: TyperAnimatedTextKit(
                      text: [bmiins],
                      textStyle: normal,
                      textAlign: TextAlign.center,
                      //displayFullTextOnTap: true,
                      speed: Duration(milliseconds: 100),
                    ),
                  ),
//                  Expanded(
//                    child: Text(
//                      '18,5-25 kg/m2',
//                      style: TextStyle(
//                        fontSize: 25.0,
//                        fontWeight: FontWeight.bold,
//                      ),
//                    ),
//                  ),
//                  Expanded(
//                    child: Text(
//                      'Your BMI is low',
//                      style: TextStyle(
//                        fontSize: 25.0,
//                        fontWeight: FontWeight.bold,
//                      ),
//                    ),
//                  ),
                ],
              ),
            ),
          ),
          Button_bottom(
            onTap: () {
              Navigator.pop(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return Result();
                  },
                ),
              );
            },
            btitle: 'RE-CALCULATE',
          ),
        ],
      ),
    );
  }
}

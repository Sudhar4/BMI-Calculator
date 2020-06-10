import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'bmi_result.dart';
import 'result_page.dart';
import 'reusable_card.dart';
import 'icon_content.dart';
import 'weighticon.dart';

const Color invalid = Color(0xFF111328);
const Color valid = Color(0xFF1D1F33);
//for height style

const labelStyle = TextStyle(fontSize: 20.0, color: Color(0xFF8f8f9a));

//for textStyle

const textStyle = TextStyle(fontSize: 50.0, fontWeight: FontWeight.bold);

//instead of passing a number in the func i.e update_gender(1)or (2),we can create a enum.
enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender gender;
  int height = 100;
  int weight = 50;
  int age = 18;

  void updateAge(String agepressed) {
    if (agepressed == 'plus') {
      age = age + 1;
    } else {
      age = age - 1;
    }
  }

  void updateWeight(String userpressed) {
    if (userpressed == 'plus') {
      weight = weight + 1;
    } else {
      weight = weight - 1;
    }
  }
//  Color male = invalid;
//  Color female = invalid;
//
//  void update_gender(Gender gender) {
//    if (gender == Gender.male) {
//      if (male == invalid) {
//        male = valid;
//        female = invalid;
//      }
//      /*else {
//        male = invalid;
//      }*/
//    }
//    if (gender == Gender.female) {
//      if (female == invalid) {
//        female = valid;
//        male = invalid;
//      }
//      /*else {
//        female = invalid;
//      }*/
//    }
//  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              child: Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      gender = Gender.male;
                    });
                  },
                  child: ReusableCard(
                    cardChild:
                        IconContent(icon: FontAwesomeIcons.male, label: 'MALE'),
                    colour: gender == Gender.male ? valid : invalid,
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      gender = Gender.female;
                    });
                  },
                  child: ReusableCard(
                    cardChild: IconContent(
                      icon: FontAwesomeIcons.female,
                      label: 'FEMALE',
                    ),
                    colour: gender == Gender.female ? valid : invalid,
                  ),
                ),
              )
            ],
          )),
          Expanded(
            child: ReusableCard(
              colour: Color(0xFF1D1F33),
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'HEIGHT',
                    style: labelStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline
                        .alphabetic, //for c.m in the same number baseline
                    children: [
                      Text(
                        height.toString(),
                        style: textStyle,
                      ),
                      Text(
                        'cm',
                        style: labelStyle,
                      )
                    ],
                  ),
                  SliderTheme(
                    data: SliderThemeData(
                      overlayColor: Color(0xFFe8b7c0),
                      activeTrackColor: Colors.white,
                      inactiveTrackColor: Color(0xFF878895),
                      thumbColor: Color(0xFFEA1556),
                      thumbShape: RoundSliderThumbShape(
                        enabledThumbRadius: 15.0,
                      ),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 50.0,
                      max: 200.0,
                      onChanged: (double value) {
                        setState(() {
                          height = value.round();
                        });
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    colour: Color(0xFF1D1F33),
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'WEIGHT',
                          style: labelStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: textStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            weightIcon(
                              icon: FontAwesomeIcons.minus,
                              onpressed: () {
                                setState(() {
                                  updateWeight('minus');
                                });
                              },
                            ),
                            SizedBox(
                              width: 20.0,
                            ),
                            weightIcon(
                              icon: FontAwesomeIcons.plus,
                              onpressed: () {
                                setState(() {
                                  updateWeight('plus');
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                      colour: Color(0xFF1D1F33),
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'AGE',
                            style: labelStyle,
                          ),
                          Text(
                            age.toString(),
                            style: textStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              AgeIcon(
                                ageicon: FontAwesomeIcons.minus,
                                agepressed: () {
                                  setState(() {
                                    updateAge('minus');
                                  });
                                },
                              ),
                              SizedBox(
                                width: 20.0,
                              ),
                              AgeIcon(
                                ageicon: FontAwesomeIcons.plus,
                                agepressed: () {
                                  setState(() {
                                    updateAge('plus');
                                  });
                                },
                              ),
                            ],
                          ),
                        ],
                      )),
                ),
              ],
            ),
          ),
          Button_bottom(
            onTap: () {
              BMIResult _bmi = BMIResult(height: height, weight: weight);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return Result(
                      bmiresult: _bmi.getBMI(),
                      bmitext: _bmi.printBMI(),
                      bmiins: _bmi.ins(),
                    );
                  },
                ),
              );
            },
            btitle: 'CALCULATE YOUR BMI',
          ),
        ],
      ),
    );
  }
}

class Button_bottom extends StatelessWidget {
  Function onTap;
  String btitle;
  Button_bottom({@required this.onTap, this.btitle});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(
          child: Text(
            btitle,
            style: TextStyle(fontSize: 20.0, color: Colors.white),
          ),
        ),
        color: Colors.red,
        margin: EdgeInsets.only(top: 10.0),
        width: double.infinity,
        height: 60.0,
      ),
    );
  }
}

class AgeIcon extends StatelessWidget {
  IconData ageicon;
  Function agepressed;
  AgeIcon({this.ageicon, this.agepressed});
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: agepressed,
      child: Icon(ageicon),
      fillColor: Color(0xFF757881),
      shape: CircleBorder(),
      constraints: BoxConstraints.tightFor(
        width: 50.0,
        height: 50.0,
      ),
    );
  }
}

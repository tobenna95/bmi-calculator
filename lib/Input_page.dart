import 'package:bmi_calculator/Results_Page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'ReusableCard.dart';
import 'IconClass.dart';
import 'package:bmi_calculator/Constants.dart';
import 'package:bmi_calculator/BottomButton.dart';
import 'package:bmi_calculator/CalculatorBrain.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

enum Gender { male, female }

class _InputPageState extends State<InputPage> {
  Color maleCardColour = kInactiveCardColour;
  Color femaleCardColour = kInactiveCardColour;

  Gender selectedGender;
  int height = 180;
  int weight = 60;
  int age = 15;
  String sex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    gestureBuild: () {
                      setState(() {
                        selectedGender = Gender.male;
                        sex = 'Male';
                      });
                    },
                    colour: selectedGender == Gender.male
                        ? kActiveCardColour
                        : kInactiveCardColour,
                    cardChild: IconClass(
                      iconn: FontAwesomeIcons.mars,
                      texxt: 'MALE',
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    gestureBuild: () {
                      setState(() {
                        selectedGender = Gender.female;
                        sex = 'Female';
                      });
                    },
                    colour: selectedGender == Gender.female
                        ? kActiveCardColour
                        : kInactiveCardColour,
                    cardChild: IconClass(
                      iconn: FontAwesomeIcons.venus,
                      texxt: 'FEMALE',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              colour: kActiveCardColour,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'HEIGHT',
                    style: kTexxtTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        height.toString(),
                        style: kOtherTexxtTextStyle,
                      ),
                      Text(
                        'cm',
                        style: TextStyle(
                            fontSize: 20.0, fontWeight: FontWeight.w200),
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                        activeTrackColor: Colors.white,
                        overlayColor: Color(0x29EB1555),
                        thumbColor: Color(0xFFEB1555),
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 15.0),
                        overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 20.0)),
                    child: Slider(
                        value: height.toDouble(),
                        min: 120.0,
                        max: 220.0,
                        inactiveColor: Color(0xFF8D8E98),
                        onChanged: (double newValue) {
                          setState(() {
                            height = newValue.round();
                          });
                        }),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'WEIGHT',
                          style: kTexxtTextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: kOtherTexxtTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundNewButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  weight--;
                                });
                              },
                            ),
                            RoundNewButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                    colour: kActiveCardColour,
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'AGE',
                          style: kTexxtTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: kOtherTexxtTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundNewButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  age--;
                                });
                              },
                            ),
                            RoundNewButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                    colour: kActiveCardColour,
                  ),
                ),
              ],
            ),
          ),
          BottomButton(
            navi: () {
              CalculatorBrain calc = CalculatorBrain(
                height: height,
                weight: weight,
                age: age,
                sex: sex,
              );

              calc.calcBrain();

              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return ResultsPage(
                  resultText: calc.getResult(),
                  resultCalc: calc.calcBrain(),
                  interpretation: calc.getInterpretation(),
                  ageResult: calc.getAge(),
                  sexResult: calc.getSex(),
                );
              }));
            },
            actionText: 'CALCULATE',
          )
        ],
      ),
    );
  }
}

class RoundNewButton extends StatelessWidget {
  RoundNewButton({this.icon, this.onPressed});
  final IconData icon;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      constraints: BoxConstraints.tightFor(width: 36.0, height: 36.0),
      elevation: 6.0,
      shape: CircleBorder(),
      onPressed: onPressed,
    );
  }
}

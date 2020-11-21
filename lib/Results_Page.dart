import 'package:bmi_calculator/Constants.dart';
import 'package:bmi_calculator/ReusableCard.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/BottomButton.dart';

class ResultsPage extends StatelessWidget {
  ResultsPage(
      {this.resultText,
      this.resultCalc,
      this.interpretation,
      this.ageResult,
      this.sexResult});

  final String resultText;
  final String resultCalc;
  final String interpretation;
  final String ageResult;
  final String sexResult;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text(
            'Your Result - $ageResult years old $sexResult',
            style: kOtherTexxtTextStyle,
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              colour: kActiveCardColour,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    resultText,
                    style: kResultTextStyle,
                  ),
                  Text(
                    resultCalc,
                    style: kBMITextStyle,
                  ),
                  Text(
                    interpretation,
                    style: kInterpretationTextStyle,
                    textAlign: TextAlign.center,
                  ),
                  BottomButton(
                    navi: () {
                      Navigator.pop(context);
                    },
                    actionText: 'RE-CALCULATE',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:bmi_calculator/Constants.dart';

class BottomButton extends StatelessWidget {
  BottomButton({this.navi, this.actionText});

  final Function navi;
  final String actionText;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: navi,
      child: Container(
        child: Center(
          child: Text(
            actionText,
            style: kLargeButtonText,
          ),
        ),
        color: kBottomCardColour,
        width: double.infinity,
        height: kBottomContainerHeight,
      ),
    );
  }
}

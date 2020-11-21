import 'package:flutter/material.dart';
import 'package:bmi_calculator/Constants.dart';

class IconClass extends StatelessWidget {
  IconClass({this.iconn, this.texxt});
  final IconData iconn;
  final String texxt;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          iconn,
          size: 80.0,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          texxt,
          style: kTexxtTextStyle,
        ),
      ],
    );
  }
}

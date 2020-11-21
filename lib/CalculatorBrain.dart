import 'dart:math';

class CalculatorBrain {
  CalculatorBrain({this.height, this.weight, this.age, this.sex});

  final int height;
  final int weight;
  final int age;
  final String sex;

  double _bmi;

  String calcBrain() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25) {
      return 'Overweight';
    } else if (_bmi >= 18 && _bmi < 25) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  String getInterpretation() {
    if (_bmi >= 25) {
      return 'You need to drop a few. Exercise some more';
    } else if (_bmi >= 18 && _bmi < 25) {
      return 'Your weight is okay. Maintain a healthy lifestyle';
    } else {
      return 'You are underweight. Eat some more and exercise often';
    }
  }

  String getAge() {
    return age.toString();
  }

  String getSex() {
    return sex;
  }
}

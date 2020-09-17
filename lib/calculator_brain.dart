import 'dart:math';

class CalculatorBrain {
  CalculatorBrain({this.weight, this.height});
  double weight;
  double height;
  double bmiResult;

  String calculateBMI() {
    bmiResult = weight / pow(height / 100, 2);
    return bmiResult.round().toString();
  }

  String getDetailedComment() {
    if (bmiResult >= 25.0) {
      return 'You are overweight; you need to get your weight down.';
    } else if (bmiResult >= 18.5) {
      return 'Your body weight is normal. Awesome!';
    } else {
      return 'You are underweight; you need to work on getting your weight up. ';
    }
  }

  String getComment() {
    if (bmiResult >= 25.0) {
      return 'OVERWEIGHT';
    } else if (bmiResult >= 18.5) {
      return 'NORMAL';
    } else {
      return 'UNDERWEIGHT ';
    }
  }
}

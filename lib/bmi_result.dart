import 'dart:math';

class BMIResult {
  int height;
  int weight;
  double bmi;

  BMIResult({this.height, this.weight});

  String getBMI() {
    bmi = weight / pow(height / 100, 2);
    return bmi.toStringAsFixed(1);
  }

  String printBMI() {
    if (bmi < 18.5) {
      return 'Underweight';
    } else if (bmi > 18.5 && bmi < 25) {
      return 'Normal Weight';
    } else if (bmi > 25 && bmi < 30) {
      return 'Overweight';
    } else if (bmi > 30) {
      return 'obese';
    }
  }

  String ins() {
    if (bmi < 18.5) {
      return 'You have a lower than normal body weight.You can eat a bit more';
    } else if (bmi > 18.5 && bmi < 25) {
      return 'You have a normal weight.Good Job!!';
    } else if (bmi > 25 && bmi < 30) {
      return 'Try to exercise';
    } else if (bmi > 30) {
      return 'You have a heigher than normal body weight,Try to exercise more';
    }
  }
}

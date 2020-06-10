import 'package:flutter/material.dart';
import 'input_page.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xFF090C22),
        primaryColor: Color(0xFF090C22),
        accentColor: Colors.deepPurple,
        textTheme: TextTheme(
          body1: TextStyle(color: Colors.white),
        ),
      ),
      home: InputPage(),
    );
  }
}

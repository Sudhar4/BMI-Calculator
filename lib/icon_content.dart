import 'package:flutter/material.dart';

class IconContent extends StatelessWidget {
  IconContent({this.icon, this.label});
  IconData icon;
  String label;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        //SizedBox(height: 30.0),
        Icon(
          icon,
          size: 90.0,
          color: Colors.white,
        ),
        SizedBox(
          height: 20.0,
        ),
        Text(
          label,
          style:
              TextStyle(color: Color(0xFF8D909D), fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}

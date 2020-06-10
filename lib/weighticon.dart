import 'package:flutter/material.dart';

class weightIcon extends StatelessWidget {
  IconData icon;
  Function onpressed;
  weightIcon({@required this.icon, this.onpressed});
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onpressed,
      elevation: 10.0,
      child: Icon(icon),
      constraints: BoxConstraints.tightFor(
        width: 50.0,
        height: 50.0,
      ),
      fillColor: Color(0xFF757881),
      shape: CircleBorder(),
    );
  }
}

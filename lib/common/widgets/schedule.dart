import 'package:flutter/material.dart';

Widget getScheduleTile(
    double width, double fontSize, String time, String mood) {
  return Row(
    children: [
      SizedBox(
        width: width,
        child: Text(
          time,
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      Text(
        mood,
        style: TextStyle(
          fontSize: fontSize,
          fontWeight: FontWeight.bold,
        ),
      )
    ],
  );
}

import 'package:flutter/material.dart';

Widget textOverview(String data, EdgeInsets margin, Color boxColor, Color textColor) {
  return Container(
    margin: margin,
    padding: const EdgeInsets.only(left: 12,right: 12,top: 3),
    decoration: BoxDecoration(
      color: boxColor,
      borderRadius: BorderRadius.circular(8),
      border: Border.all(color: Colors.white,width: 0.8), // Border color
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.1),
          spreadRadius: 2,
          blurRadius: 5,
          offset: const Offset(0, 3),
        ),
      ],
    ),
    child: Text(
      data,
      style: TextStyle(color: textColor, fontSize: 16),
    ),
  );
}
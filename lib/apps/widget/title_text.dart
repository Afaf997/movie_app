
import 'package:flutter/material.dart';

Widget titleText(data) {
  return Padding(
    padding: const EdgeInsets.all(10),
    child: Container(
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5), 
        color:Color.fromARGB(100, 22, 44, 33), 
      ),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Text(
          data,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
      ),
    ),
  );
}
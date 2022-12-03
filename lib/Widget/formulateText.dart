import 'package:flutter/material.dart';

Widget formulateText(List <String> global) {
  String result = "";

  for(int i = 0; i <= 5; i++){
    result += global[0][i];
  }

  return Text(
    result,
    style: const TextStyle(
      color: Colors.white,
      fontSize: 30.0,
    ),
  );
}
import 'package:flutter/material.dart';

Color dragColor(int r, int g, int b) => Color.fromARGB(255, r, g, b);

Color temperatureColor(String temp_main){
  Color temperature = Colors.white;

  // ignore: curly_braces_in_flow_control_structures
  if(temp_main == "Cold") temperature = dragColor(0x25, 0x25, 0x25);
  // ignore: curly_braces_in_flow_control_structures
  else if(temp_main == "Hot") temperature = dragColor(0x4C, 0x41, 0x26);
  else {temperature = dragColor(0x21, 0x21, 0x23);}

  return temperature;
}
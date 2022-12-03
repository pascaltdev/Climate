import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

List<String> Temperature(String temp_main){
  double temp = double.parse(temp_main);
  List<String>? temperature = [];

  if(temp < 15) {temperature.add("Cold"); temperature.add("Recommend a jacket");}
  else if(temp > 20) {temperature.add("Hot"); temperature.add("Recommend a shirt");}
  else {temperature.add("Comum"); temperature.add("Recommended a shirt and pants");}

  return temperature;
}
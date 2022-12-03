import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'Widget/Home.dart';

List<String> global = [];
String iconTemp = "";

const api = "api.openweathermap.org";
const int kelvin = 273;

Future fetch() async{
  var url = Uri(
    scheme: "https",
    host: api,
    path: "data/2.5/weather/",
    queryParameters: {
      "lat": "",
      "lon": "",
      "appid": "",
      }
  );

  var response = await http.get(url);
  var responseJson = response.body;

  var convertJson = jsonDecode(responseJson);
  var jsonArray = {
    "temp_main": convertJson["main"]["temp"],
    "feels": convertJson["main"]["feels_like"],
    "temp_min": convertJson["main"]["temp_min"],
    "temp_max": convertJson["main"]["temp_max"],
    "pressure": convertJson["main"]["pressure"],
    "humidity": convertJson["main"]["humidity"],
    };

  iconTemp = convertJson["weather"][0]["icon"];

  var jsonIndex = ["temp_main", "feels", "temp_min", "temp_max", "pressure", "humidity"];
  for(int i = 0; i < jsonIndex.length; i++){
    var index = jsonIndex[i];
    global.add((jsonArray[index] - kelvin).toString());
  }
}

void main()async {
  await fetch();
  runApp(Home(global: global, iconTemp: iconTemp));
}

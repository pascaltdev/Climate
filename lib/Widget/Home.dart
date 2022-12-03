import 'package:climate/Widget/Temperature.dart';
import 'package:climate/Widget/TemperatureColor.dart';
import 'package:climate/Widget/currentTemperatureImage.dart';
import 'package:climate/Widget/refreshData.dart';
import 'package:climate/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'formulateText.dart';

/*
String iconUrl(String iconTemp) =>
    "http://openweathermap.org/img/wn/$iconTemp.png";
*/

// ignore: must_be_immutable
class Home extends StatelessWidget {
  List<String> global = [];
  String iconTemp = "";
  Home({super.key, required this.global, required this.iconTemp});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeWidget(
        global: global,
        iconTemp: iconTemp,
      ),
    );
  }
}

// ignore: must_be_immutable
class HomeWidget extends StatefulWidget {
  List<String> global = [];
  String iconTemp = "";
  HomeWidget({super.key, required this.global, required this.iconTemp});

  @override
  State<StatefulWidget> createState() => _HomeWidget();
}

class _HomeWidget extends State<HomeWidget> {
  List<String> temperatureContext = Temperature(global[0]);
  String refresh = refreshData(global);

  @override
  Widget build(BuildContext context) {
    String currentTemperature = currentTemperatureImage(temperatureContext[0]);
    Color colorTemperature = temperatureColor(temperatureContext[0]);
    return Scaffold(
      backgroundColor: colorTemperature,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              temperatureContext[0],
              style: const TextStyle(color: Colors.white, fontSize: 30.0),
            ),
            const Text(
              "alright here pascal",
              style: TextStyle(
                color: Color.fromARGB(255, 0x9A, 0x9A, 0x9A),
                fontSize: 15.0,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 60.0, bottom: 10.0),
              child: Container(
                  width: 286.0,
                  height: 300.0,
                  decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 0x1B, 0x1B, 0x1B),
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromARGB(255, 0x00, 0x00, 0x00),
                          blurRadius: 100.0,
                        )
                      ]),
                  child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(18.0),
                        child: Text(
                          "Temperature",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color.fromARGB(255, 0xC3, 0xC3, 0xC3),
                            fontSize: 15.0,
                            decoration: TextDecoration.underline,
                            decorationColor:
                                Color.fromARGB(255, 0x48, 0x48, 0x48),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 30.0, bottom: 30.0),
                        child: SizedBox(
                          width: 100.0,
                          child: Image.asset(currentTemperature),
                        ),
                      ),
                      Text(
                        temperatureContext[1],
                        style: const TextStyle(
                            color: Color.fromARGB(255, 0xC3, 0xC3, 0xC3),
                            fontSize: 15.0),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          showAlertDialog(context);
                        },
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(170, 35),
                          backgroundColor:
                              const Color.fromARGB(255, 0x1F, 0x2E, 0x4E),
                          foregroundColor: Colors.white,
                          shadowColor: Colors.black,
                          shape: const BeveledRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                          ),
                        ),
                        child: const Text(
                          "Refresh",
                          style: TextStyle(
                            fontSize: 15.0,
                          ),
                        ),
                      ),
                    ],
                  )),
            ),
            Container(
              width: 286.0,
              height: 79.0,
              decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 0x1B, 0x1B, 0x1B),
                  borderRadius: BorderRadius.all(Radius.circular(25)),
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(255, 0x00, 0x00, 0x00),
                      blurRadius: 100.0,
                    )
                  ]),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      formulateText(global),
                      const Text(
                        "°C",
                        style: TextStyle(
                          color: Color.fromARGB(255, 0x74, 0x74, 0x74),
                          fontSize: 15,
                        ),
                        ),
                    ],)
                ),
          ],
        ),
      ),
    );
  }

  showAlertDialog(BuildContext context) {  
  // Create button  
  Widget okButton = ElevatedButton(  
    child: const Text("ok"),  
    onPressed: () {  
      Navigator.of(context).pop();  
    },  
  );  
  
  // Create AlertDialog  
  AlertDialog alert = AlertDialog(  
    title: const Text("Data"),  
    content: Text(refresh),  
    actions: [  
      okButton,  
    ],  
  );  
  
  // show the dialog  
  showDialog(  
    context: context,  
    builder: (BuildContext context) {  
      return alert;  
    },  
  );  
}  
}


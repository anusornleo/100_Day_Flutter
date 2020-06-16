import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterui100day/File100Day/Day_1/Day_1.dart';
import 'package:flutterui100day/File100Day/Day_10/Day10.dart';
import 'package:flutterui100day/File100Day/Day_14/Day14.dart';
import 'package:flutterui100day/File100Day/Day_15/Day15.dart';
import 'package:flutterui100day/File100Day/Day_2/Day_2.dart';
import 'package:flutterui100day/File100Day/Day_3/StartPage.dart';
import 'package:flutterui100day/File100Day/Day_5/Day5.dart';
import 'package:flutterui100day/File100Day/Day_6/Home.dart';
import 'package:flutterui100day/File100Day/Day_7/Day7.dart';
import 'package:flutterui100day/File100Day/Day_8/Home.dart';
import 'package:flutterui100day/File100Day/Day_9/Day9.dart';
import 'package:flutterui100day/Pages/Home.dart';

import 'File100Day/Day_11/Day11.dart';
import 'File100Day/Day_12/Day12.dart';
import 'File100Day/Day_13/Day13.dart';
import 'File100Day/Day_4/Day4.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '100 Day',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "Rubik",
        primarySwatch: Colors.teal,
//        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
//      home: Home(),

      initialRoute: '/',
      routes: {
        '/': (context) => Home(),
        '/1': (context) => Day1(),
        '/2': (context) => Day2(),
        '/3': (context) => Day3(),
        '/4': (context) => Day4(),
        '/5': (context) => Day5(),
        '/6': (context) => Day6(),
        '/7': (context) => Day7(),
        '/8': (context) => Day8(),
        '/9': (context) => Day9(),
        '/10': (context) => Day10(),
        '/11': (context) => Day11(),
        '/12': (context) => Day12(),
        '/13': (context) => Day13(),
        '/14': (context) => Day14(),
        '/15': (context) => Day15(),
      },
    );
  }
}

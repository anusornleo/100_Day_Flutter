import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterui100day/File100Day/Day_1/Day_1.dart';
import 'package:flutterui100day/File100Day/Day_2/Day_2.dart';
import 'package:flutterui100day/File100Day/Day_3/StartPage.dart';
import 'package:flutterui100day/File100Day/Day_5/Day5.dart';
import 'package:flutterui100day/File100Day/Day_6/Home.dart';
import 'package:flutterui100day/File100Day/Day_7/Day7.dart';
import 'package:flutterui100day/File100Day/Day_8/Home.dart';
import 'package:flutterui100day/Pages/Home.dart';

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
      },
    );
  }
}

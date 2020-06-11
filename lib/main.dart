import 'package:flutter/material.dart';
import 'package:flutterui100day/File100Day/Day_1/Day_1.dart';
import 'package:flutterui100day/File100Day/Day_2/Day_2.dart';
import 'package:flutterui100day/File100Day/Day_3/StartPage.dart';
import 'package:flutterui100day/Pages/Home.dart';

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
      },
    );
  }
}

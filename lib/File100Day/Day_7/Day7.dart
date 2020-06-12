import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutterui100day/Pages/ButtonAnimation.dart';

class Day7 extends StatefulWidget {
  @override
  _Day7State createState() => _Day7State();
}

class _Day7State extends State<Day7> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ButtonAnimation(color: Colors.red,secondColor: Colors.redAccent,),
              SizedBox(height: 10,),
              ButtonAnimation(color: Colors.orange,secondColor: Colors.orangeAccent),
              SizedBox(height: 10,),
              ButtonAnimation(color: Colors.amber,secondColor: Colors.amberAccent),
              SizedBox(height: 10,),
              ButtonAnimation(color: Colors.green,secondColor: Colors.greenAccent),
              SizedBox(height: 10,),
              ButtonAnimation(color: Colors.blue,secondColor: Colors.lightBlueAccent),
              SizedBox(height: 10,),
              ButtonAnimation(color: Colors.purple,secondColor: Colors.purpleAccent),
            ],
          ),
        ),
      ),
    );
  }
}

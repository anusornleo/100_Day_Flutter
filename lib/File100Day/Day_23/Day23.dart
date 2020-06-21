import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterui100day/File100Day/Day_23/LoginPage.dart';
import 'package:flutterui100day/File100Day/Day_23/RegisterPage.dart';

class Day23 extends StatefulWidget {
  @override
  _Day23State createState() => _Day23State();
}

class _Day23State extends State<Day23> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20),
        width: double.infinity,
        child: SafeArea(
          child: Column(
            children: [
              Text(
                "Welcome",
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Lorem Ipsum has been the industry's standard dummy text ever since the 1500.",
                textAlign: TextAlign.center,
              ),
              Spacer(),
              Image.asset(
                "assets/PNG/rocket.png",
                width: 300,
              ),
              Spacer(),
              MaterialButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginPage()));
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                    side: BorderSide(width: 1)),
                minWidth: double.infinity,
                height: 48,
                child: Text("Login"),
              ),
              SizedBox(
                height: 22,
              ),
              MaterialButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => RegisterPage()));
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                    side: BorderSide(width: 1)),
                color: Colors.greenAccent[200],
                minWidth: double.infinity,
                height: 48,
                child: Text("Register"),
              )
            ],
          ),
        ),
      ),
    );
  }
}

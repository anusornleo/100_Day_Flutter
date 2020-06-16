import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterui100day/File100Day/Day_12/FadeAnimation.dart';

class Day12 extends StatefulWidget {
  @override
  _Day12State createState() => _Day12State();
}

class _Day12State extends State<Day12> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Stack(
              children: [
                Container(
                    height: 350,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage("assets/PNG/space.png")))),
                Positioned(
                  width: 170,
                  right: 20,
                  top: 140,
                  child: FadeAnimation(
                    isX: false,
                    delay: 100,
                    child: Image(
                      image: AssetImage("assets/PNG/rocket.png"),
                    ),
                  ),
                ),
                Positioned(
                  width: 72,
                  left: 20,
                  top: 60,
                  child: FadeAnimation(
                    isX: false,
                    delay: 150,
                    child: Image(
                      image: AssetImage("assets/PNG/meteor.png"),
                    ),
                  ),
                ),
                Positioned(
                  width: 120,
                  right: -20,
                  top: -60,
                  child: FadeAnimation(
                    isX: false,
                    delay: 200,
                    child: Image(
                      image: AssetImage("assets/PNG/planet2.png"),
                    ),
                  ),
                ),
                Positioned(
                  width: 60,
                  left: 60,
                  top: 200,
                  child: FadeAnimation(
                    isX: false,
                    delay: 200,
                    child: Image(
                      image: AssetImage("assets/PNG/moon.png"),
                    ),
                  ),
                ),
                Positioned(
                  width: MediaQuery.of(context).size.width,
                  top: 70,
                  child: FadeAnimation(
                    isX: false,
                    delay: 0,
                    child: Center(
                      child: Text(
                        "Login",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 40,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            FadeAnimation(
              isX: false,
              delay: 300,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 32),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.blueGrey.withOpacity(0.2),
                      spreadRadius: 2,
                      blurRadius: 10,
                      offset: Offset(0, 10), // changes position of shadow
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(borderSide: BorderSide.none),
                        hintText: "Username",
                      ),
                    ),
                    TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(borderSide: BorderSide.none),
                        hintText: "Password",
                      ),
                    )
                  ],
                ),
              ),
            ),
            FadeAnimation(
              isX: false,
              delay: 400,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 32, vertical: 32),
                width: MediaQuery.of(context).size.width,
                height: 47,
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                      Colors.indigo,
                      Colors.lightBlue,
                    ]),
                    borderRadius: new BorderRadius.circular(30.0)),
                child: FlatButton(
                  shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(30.0),
                  ),
                  onPressed: () {},
                  color: Colors.transparent,
                  child: Text(
                    "Login",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            FadeAnimation(
              isX: false,
              delay: 700,
              child: Center(
                child: Text(
                  "Forgot Password?",
                  style: TextStyle(color: Colors.indigo),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

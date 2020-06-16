import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterui100day/File100Day/Day_13/FadeAnimation.dart';

class Day13 extends StatefulWidget {
  @override
  _Day13State createState() => _Day13State();
}

class _Day13State extends State<Day13> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.amber[900], Colors.orange[300]],
                  begin: Alignment.topLeft)),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Stack(
                children: [
                  Positioned(
                    width: 100,
                    bottom: 65,
                    left: 93,
                    child: FadeAnimation(
                      isX: false,
                      delay: 0,
                      child: Image(
                        image: AssetImage("assets/PNG/camel.png"),
                      ),
                    ),
                  ),
                  Positioned(
                    width: 60,
                    bottom: 40,
                    right: 60,
                    child: FadeAnimation(
                      isX: false,
                      delay: 100,
                      child: Image(
                        image: AssetImage("assets/PNG/camel.png"),
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 300,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/PNG/whitewave.png"),
                            fit: BoxFit.cover)),
                  ),
                ],
              ),
              Container(
                decoration: BoxDecoration(color: Colors.white),
                padding: EdgeInsets.symmetric(horizontal: 32),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FadeAnimation(
                      isX: false,
                      delay: 400,
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 20),
                        child: Text(
                          "Login",
                          style: TextStyle(
                              fontSize: 32, fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                    FadeAnimation(
                      isX: false,
                      delay: 600,
                      child: Container(
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
                                border: OutlineInputBorder(
                                    borderSide: BorderSide.none),
                                hintText: "Username",
                              ),
                            ),
                            TextField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderSide: BorderSide.none),
                                hintText: "Password",
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    FadeAnimation(
                      isX: false,
                      delay: 1200,
                      child: Center(
                          child: Text(
                            "Forgot Password",
                            style: TextStyle(color: Colors.grey),
                          )),
                    ),
                    FadeAnimation(
                      isX: false,
                      delay: 800,
                      child: Container(
                        margin:
                        EdgeInsets.symmetric(horizontal: 64, vertical: 32),
                        width: MediaQuery
                            .of(context)
                            .size
                            .width,
                        height: 47,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(colors: [
                              Colors.amber,
                              Colors.orangeAccent,
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
                      delay: 1200,
                      child: Center(
                          child: Text(
                            "Create Account",
                            style: TextStyle(color: Colors.grey),
                          )),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

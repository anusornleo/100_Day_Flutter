import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterui100day/File100Day/Day_12/FadeAnimation.dart';

class Day14 extends StatefulWidget {
  @override
  _Day14State createState() => _Day14State();
}

class _Day14State extends State<Day14> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
              gradient:
                  LinearGradient(colors: [Colors.teal[700], Colors.teal[300]])),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(32),
                height: 200,
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FadeAnimation(
                      delay:0,
                      isX: false,
                      child: Text(
                        "Login",
                        style: TextStyle(fontSize: 48, color: Colors.white),
                      ),
                    ),
                    FadeAnimation(
                      isX: false,
                      delay: 200,
                      child: Text("Welcome Back",
                          style: TextStyle(fontSize: 22, color: Colors.white)),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 64, horizontal: 32),
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30))),
                child: Column(
                  children: [
                    FadeAnimation(
                      delay: 200,
                      isX: false,
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
                    FadeAnimation(
                      isX: false,
                      delay: 400,
                      child: Container(
                        padding: EdgeInsets.only(top: 42),
                        child: Text("Forgot Password"),
                      ),
                    ),
                    FadeAnimation(
                      isX: false,
                      delay: 600,
                      child: Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: 64, vertical: 32),
                        width: MediaQuery.of(context).size.width,
                        height: 47,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(colors: [
                              Colors.teal[600],
                              Colors.teal[400],
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
                    FadeAnimation(
                      isX: false,
                      delay: 800,
                      child: Container(
                        padding: EdgeInsets.only(top: 42),
                        child: Text("Continue with"),
                      ),
                    ),
                    FadeAnimation(
                      isX: false,
                      delay: 1000,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 32),
                            width:
                                (MediaQuery.of(context).size.width - 64) / 2 - 16,
                            height: 47,
                            decoration: BoxDecoration(
                                gradient: LinearGradient(colors: [
                                  Colors.indigoAccent,
                                  Colors.indigo,
                                ]),
                                borderRadius: new BorderRadius.circular(30.0)),
                            child: FlatButton(
                              shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(30.0),
                              ),
                              onPressed: () {},
                              color: Colors.transparent,
                              child: Text(
                                "Facebook",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18.0,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 32),
                            width:
                                (MediaQuery.of(context).size.width - 64) / 2 - 16,
                            height: 47,
                            decoration: BoxDecoration(
                                gradient: LinearGradient(colors: [
                                  Colors.black,
                                  Colors.blueGrey[800],
                                ]),
                                borderRadius: new BorderRadius.circular(30.0)),
                            child: FlatButton(
                              shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(30.0),
                              ),
                              onPressed: () {},
                              color: Colors.transparent,
                              child: Text(
                                "GitHub",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18.0,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutterui100day/File100Day/Day_8/FadeAnimation.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[800],
      body: Container(
        padding: EdgeInsets.only(left: 32,right: 32,top: 32),
        decoration: BoxDecoration(
          color: Colors.teal[800]
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              SizedBox(
                height: 200,
              ),
              FadeAnimation(
                isX: false,
                delay: 100,
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  child: Text("Login",style: TextStyle(color: Colors.white,fontSize: 32),),
                ),
              ),
              FadeAnimation(
                isX: false,
                delay: 400,
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white),
                  child: Column(
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(color: Colors.grey[300]))),
                        child: TextField(
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintStyle:
                                  TextStyle(color: Colors.grey.withOpacity(.8)),
                              hintText: "Email or Phone number"),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(),
                        child: TextField(
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintStyle:
                                  TextStyle(color: Colors.grey.withOpacity(.8)),
                              hintText: "Password"),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              FadeAnimation(
                isX: false,
                delay: 600,
                child: Center(
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 32),
                    decoration: BoxDecoration(
                        color: Colors.teal,
                        borderRadius: BorderRadius.circular(25)),
                    width: 150,
                    height: 50,
                    child: FlatButton(
                      onPressed: () {},
                      child: Text(
                        "Login",
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

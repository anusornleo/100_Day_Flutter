import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterui100day/File100Day/Day_23/RegisterPage.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(left: 32, right: 32, top: 20),
              child: Column(
                children: [
                  Text(
                    "Login",
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 32),
                  ),
                  SizedBox(height: 20),
                  Text("Please Login if you have already account"),
                  SizedBox(height: 20),
                  customTextField(title: "Username", hint: "input username"),
                  SizedBox(height: 20),
                  customTextField(
                      title: "Password", hint: "input password", secure: true),
                  SizedBox(height: 20),
                  MaterialButton(
                    onPressed: () {},
                    color: Colors.greenAccent,
                    minWidth: double.infinity,
                    height: 48,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                        side: BorderSide()),
                    child: Text("Login"),
                  ),
                  SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("don't have any account? "),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => RegisterPage()));
                        },
                        child: Text(
                          "Register",
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Spacer(),
            Image.asset("assets/PNG/moutain.png")
          ],
        ),
      ),
    );
  }

  Column customTextField({String title, String hint, bool secure = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title),
        TextField(
          obscureText: secure,
          decoration: InputDecoration(
              hintText: hint,
              contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey[300])),
              border: OutlineInputBorder(borderSide: BorderSide())),
        ),
      ],
    );
  }
}

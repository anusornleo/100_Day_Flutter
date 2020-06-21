import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterui100day/File100Day/Day_23/LoginPage.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
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
        padding: EdgeInsets.all(32),
        child: Column(
          children: [
            Text(
              "Register",
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 32),
            ),
            SizedBox(height: 20),
            Text("Please LoRegister if you don't have any account"),
            Spacer(),
            SizedBox(height: 20),
            customTextField(title: "Username", hint: "input username"),
            SizedBox(height: 20),
            customTextField(
                title: "Password", hint: "input password", secure: true),
            SizedBox(height: 20),
            customTextField(
                title: "Confirm Password",
                hint: "input password again",
                secure: true),
            SizedBox(height: 20),
            Spacer(),
            MaterialButton(
              onPressed: () {},
              color: Colors.greenAccent,
              minWidth: double.infinity,
              height: 48,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25), side: BorderSide()),
              child: Text("Register"),
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("you already have account? "),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginPage()));
                  },
                  child: Text(
                    "Login",
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                )
              ],
            ),
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

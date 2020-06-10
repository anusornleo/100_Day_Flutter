import 'package:flutter/material.dart';

class Home extends StatelessWidget {

  List<String> listDay = ["1"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("100 Day of flutter by Leo"),
        elevation: 0,
      ),
      body: ListView(
        children: <Widget>[
          Container(
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/${listDay[0]}');
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey[300],
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3),
                        )
                      ]),
                  child: Center(
                    child: Text(
                      "Day 1",
                      style: TextStyle(fontSize: 22),
                    ),
                  ),
                  height: 80,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

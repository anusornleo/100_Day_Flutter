import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutterui100day/File100Day/Day_8/FadeAnimation.dart';

class Day11 extends StatefulWidget {
  @override
  _Day11State createState() => _Day11State();
}

class _Day11State extends State<Day11> {
  List<Map> listPlace = [
    {"pic": "assets/JPEG/landscape1.jpg", "name": "Balloon"},
    {"pic": "assets/JPEG/landscape2.jpg", "name": "Ice"},
    {"pic": "assets/JPEG/landscape4.jpg", "name": "Mountain"},
    {"pic": "assets/JPEG/landscape5.jpg", "name": "Lake"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(color: Colors.white),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 24, horizontal: 44),
                height: 220,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage("assets/JPEG/landscape3.jpg"))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    FadeAnimation(
                      child: Text(
                        "What Place do you want to Go?",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 32,
                            color: Colors.white,
                            fontWeight: FontWeight.w500),
                      ),
                      isX: false,
                      delay: 0,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    FadeAnimation(
                      isX: false,
                      delay: 200,
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20)),
                        child: TextField(
                          decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.search,
                                color: Colors.grey[500],
                              ),
                              hintText: "Search Place",
                              border: InputBorder.none),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              FadeAnimation(
                isX: false,
                delay: 600,
                child: Container(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 16),
                        child: Text(
                          "Asia",
                          style: TextStyle(fontSize: 22),
                        ),
                      ),
                      Container(
                        height: 200,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemCount: listPlace.length,
                          itemBuilder: (context, i) {
                            String pic = listPlace[i]["pic"];
                            String name = listPlace[i]["name"];
                            return cardPlace(pic, name);
                          },
                          separatorBuilder: (context, i) {
                            return SizedBox(
                              width: 16,
                            );
                          },
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 16),
                        child: Text(
                          "Europe",
                          style: TextStyle(fontSize: 22),
                        ),
                      ),
                      Container(
                        height: 200,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemCount: listPlace.length,
                          itemBuilder: (context, i) {
                            String pic = listPlace[listPlace.length-1-i]["pic"];
                            String name = listPlace[listPlace.length-1-i]["name"];
                            return cardPlace(pic, name);
                          },
                          separatorBuilder: (context, i) {
                            return SizedBox(
                              width: 16,
                            );
                          },
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  AspectRatio cardPlace(String pic, String name) {
    return AspectRatio(
      aspectRatio: 2 / 2,
      child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(fit: BoxFit.cover, image: AssetImage(pic)),
            borderRadius: BorderRadius.circular(20)),
        child: Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(
              begin: Alignment.bottomRight,
              colors: [Colors.black38, Colors.transparent],
            ),
          ),
          child: Align(
            alignment: Alignment.bottomLeft,
            child: Text(
              name,
              style: TextStyle(fontSize: 22, color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}

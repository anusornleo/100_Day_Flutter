import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterui100day/File100Day/Day_12/FadeAnimation.dart';
import 'package:flutterui100day/File100Day/Day_20/Detail.dart';
import 'package:flutterui100day/File100Day/Day_20/SlideDownAnimation.dart';
import 'package:page_transition/page_transition.dart';

class Day20 extends StatefulWidget {
  @override
  _Day20State createState() => _Day20State();
}

class _Day20State extends State<Day20> {
  List<Map> items = [
    {
      "colors": [
        Colors.purpleAccent[400],
        Colors.deepPurple[400],
      ],
      "pic": "assets/PNG/adidas1.png",
      "name": "Adidas x",
      "title": "Adidas",
      "text":
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged"
    },
    {
      "colors": [Colors.grey, Colors.blueGrey],
      "pic": "assets/PNG/adidas2.png",
      "name": "Adidas x",
      "title": "Adidas",
      "text":
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged"
    },
    {
      "colors": [Colors.lightBlueAccent, Colors.blueAccent],
      "pic": "assets/PNG/adidas3.png",
      "name": "Adidas x",
      "title": "Adidas",
      "text":
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged"
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.redAccent,
        leading: IconButton(
          icon: Icon(
            Icons.menu,
            color: Colors.white,
          ),
          onPressed: () {},
        ),
      ),
      body: Column(
        children: [
          Container(
            height: 250,
            decoration: BoxDecoration(color: Colors.white),
            child: Stack(
              children: [
                SlideDownAnimation(
                  isX: false,
                  delay: 0,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    height: 200,
                    decoration: BoxDecoration(
                        color: Colors.redAccent,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(35),
                            bottomRight: Radius.circular(35))),
                    child: Stack(
                      children: [
                        Positioned(
                          left: 30,
                          top: 30,
                          width: 150,
                          child: FadeAnimation(
                            isX: false,
                            delay: 100,
                            child: Text(
                              "New Adidas",
                              style: TextStyle(
                                  fontSize: 30,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: FadeAnimation(
                            isX: false,
                            delay: 100,
                            child: Image.asset(
                              "assets/PNG/adidas4.png",
                              width: 200,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 30,
                  width: MediaQuery.of(context).size.width,
                  child: FadeAnimation(
                    isX: false,
                    delay: 200,
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black26,
                                offset: Offset(0, 10),
                                spreadRadius: -1,
                                blurRadius: 30)
                          ]),
                      margin: EdgeInsets.symmetric(horizontal: 22),
                      child: TextField(
                        style: TextStyle(fontSize: 20),
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.all(12),
                            hintText: "Search",
                            suffixIcon: IconButton(
                              icon: Icon(
                                Icons.search,
                                color: Colors.grey,
                              ),
                              onPressed: () {},
                            )),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          FadeAnimation(
            isX: false,
            delay: 400,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 32),
              child: Row(
                children: [
                  Text(
                    "Choose\na Category",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  Spacer(
                    flex: 1,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                    decoration: BoxDecoration(
                        color: Colors.red[100],
                        borderRadius: BorderRadius.circular(10)),
                    child: Text(
                      "Adult",
                      style: TextStyle(
                          color: Colors.redAccent, fontWeight: FontWeight.w500),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(10)),
                    child: Text(
                      "Children",
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                  )
                ],
              ),
            ),
          ),
          FadeAnimation(
            isX: false,
            delay: 600,
            child: Container(
              height: 300,
              padding: EdgeInsets.only(left: 20),
              width: double.infinity,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: items.length,
                itemBuilder: (context, i) {
                  String pic = items[i]["pic"];
                  String name = items[i]["name"];
                  String text = items[i]["text"];
                  String title = items[i]["title"];
                  List<Color> colors = items[i]["colors"];
                  return _cardItem(pic, title, name, text, colors);
                },
                separatorBuilder: (context, i) {
                  return SizedBox(
                    width: 10,
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }

  GestureDetector _cardItem(
    String pic,
    String title,
    String name,
    String text,
    List<Color> colors,
  ) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          PageTransition(
            type: PageTransitionType.fade,
            duration: Duration(milliseconds: 400),
            child: Detail(
              pic: pic,
              title: title,
              name: name,
              colors: colors,
              text: text,
            ),
          ),
        );
      },
      child: AspectRatio(
        aspectRatio: 2 / 3,
        child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient:
                  LinearGradient(colors: colors, begin: Alignment.bottomRight)),
          child: Center(
            child: Image.asset(pic),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterui100day/File100Day/Day_20/SlideUpAnimation.dart';

class Detail extends StatefulWidget {
  final List<Color> colors;
  final String pic;
  final String title;
  final String name;
  final String text;

  const Detail({this.pic, this.text, this.name, this.colors, this.title});

  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  List<Color> colors = [Colors.pink, Colors.amber, Colors.blue];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                height: 250,
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: widget.colors, begin: Alignment.bottomRight),
                ),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      image: DecorationImage(image: AssetImage(widget.pic))),
                ),
              ),
              Positioned(
                bottom: 0,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 32,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(32),
                          topRight: Radius.circular(32)),
                      color: Colors.white),
                ),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FadeSlideUpAnimation(
                  isX: false,
                  delay: 200,
                  child: Text(
                    widget.title,
                    style: TextStyle(color: Colors.grey[600], fontSize: 18),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                FadeSlideUpAnimation(
                    isX: false,
                    delay: 300,
                    child: Text(widget.name, style: TextStyle(fontSize: 22))),
                SizedBox(
                  height: 20,
                ),
                FadeSlideUpAnimation(
                    delay: 400,
                    isX: false,
                    child: Text(widget.text, style: TextStyle(fontSize: 16))),
                FadeSlideUpAnimation(
                  isX: false,
                  delay: 500,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 30),
                    child: Row(
                      children: [
                        Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.red, width: 5),
                              shape: BoxShape.circle,
                              color: Colors.lightBlue),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Container(
                          width: 20,
                          height: 20,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: Colors.green),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Container(
                          width: 20,
                          height: 20,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: Colors.blueGrey),
                        )
                      ],
                    ),
                  ),
                ),
                FadeSlideUpAnimation(
                  isX: false,
                  delay: 500,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Text(
                      "More Option",
                      style: TextStyle(
                          fontWeight: FontWeight.w500, color: Colors.grey),
                    ),
                  ),
                ),
                FadeSlideUpAnimation(
                  isX: false,
                  delay: 600,
                  child: Container(
                    height: 70,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: 3,
                      itemBuilder: (context, i) {
                        return Container(
                          width: 250,
                          height: 60,
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(color: Colors.grey[300])),
                          child: Row(
                            children: [
                              Container(
                                margin: EdgeInsets.only(right: 10),
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: colors[i],
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Center(
                                  child: Icon(
                                    Icons.shopping_basket,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Adidas ac",
                                  ),
                                  Text("235",
                                      style: TextStyle(color: Colors.grey))
                                ],
                              )
                            ],
                          ),
                        );
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
          )
        ],
      ),
    );
  }
}

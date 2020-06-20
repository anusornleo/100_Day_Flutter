import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterui100day/File100Day/Day_12/FadeAnimation.dart';

class HeroShoe extends StatefulWidget {
  final String name;
  final String price;
  final Color color;
  final List<String> size;
  final String pic;

  const HeroShoe(
      {Key key, this.name, this.price, this.color, this.size, this.pic})
      : super(key: key);

  @override
  _HeroShoeState createState() => _HeroShoeState();
}

class _HeroShoeState extends State<HeroShoe> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.color,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Container(
              width: 40,
              height: 30,
              decoration:
                  BoxDecoration(color: Colors.white, shape: BoxShape.circle),
              child: Icon(
                Icons.favorite_border,
                color: Colors.black,
              ),
            ),
          )
        ],
      ),
      body: Center(
        child: Hero(
          tag: widget.name,
          child: Material(
            color: Colors.transparent,
            child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(widget.pic), fit: BoxFit.cover)),
              child: Container(
                padding: EdgeInsets.all(32),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.bottomRight,
                        colors: [Colors.black54, Colors.transparent])),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    FadeAnimation(
                      isX: false,
                      delay: 0,
                      child: Text(
                        widget.name,
                        style: TextStyle(
                            fontSize: 34,
                            color: Colors.white,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    FadeAnimation(
                      isX: false,
                      delay: 0,
                      child: Container(
                        width: double.infinity,
                        height: 100,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(vertical: 10),
                              child: Text(
                                "Size",
                                style:
                                    TextStyle(fontSize: 20, color: Colors.white),
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              height: 40,
                              child: ListView.separated(
                                scrollDirection: Axis.horizontal,
                                itemCount: widget.size.length,
                                itemBuilder: (context, i) {
                                  return Container(
                                    width: 40,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: (i == 0)
                                            ? Colors.white
                                            : Colors.transparent),
                                    child: Center(
                                      child: Text(widget.size[i],
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 16,
                                              color: (i == 0)
                                                  ? Colors.black
                                                  : Colors.white)),
                                    ),
                                  );
                                },
                                separatorBuilder: (context, i) {
                                  return SizedBox(
                                    width: 10,
                                  );
                                },
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    FadeAnimation(
                      isX: false,
                      delay: 300,
                      child: Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: 0, vertical: 32),
                        width: MediaQuery.of(context).size.width,
                        height: 56,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: new BorderRadius.circular(18.0)),
                        child: FlatButton(
                          shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(18.0),
                          ),
                          onPressed: () {},
                          color: Colors.transparent,
                          child: Text(
                            "Add to Cart",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18.0,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

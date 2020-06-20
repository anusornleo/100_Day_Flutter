import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterui100day/File100Day/Day_12/FadeAnimation.dart';

class Profile extends StatefulWidget {
  const Profile(
      {this.pic,
      this.name,
      this.at,
      this.follower,
      this.following,
      this.album});

  final String pic;
  final String name;
  final String at;
  final String follower;
  final String following;
  final List<Map> album;

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
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
        actions: [
          IconButton(
            icon: Icon(
              Icons.more_horiz,
              color: Colors.black,
            ),
            onPressed: () {},
          )
        ],
      ),
      body: Column(
        children: [
          Container(
            height: 290,
            color: Colors.grey[200],
            child: Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  height: 230,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(35),
                          bottomRight: Radius.circular(35))),
                  child: Column(
                    children: [
                      Hero(
                        tag: widget.at,
                        child: Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: AssetImage(widget.pic),
                                  fit: BoxFit.cover)),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        widget.name,
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        widget.at,
                        style: TextStyle(color: Colors.grey),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            widget.follower,
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text("Follower"),
                          SizedBox(
                            width: 20,
                          ),
                          Text(widget.following,
                              style: TextStyle(fontWeight: FontWeight.w500)),
                          SizedBox(
                            width: 5,
                          ),
                          Text("Following"),
                        ],
                      )
                    ],
                  ),
                ),
                Positioned(
                  bottom: 40,
                  width: MediaQuery.of(context).size.width,
                  child: Container(
                    height: 52,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.blueGrey.withOpacity(.3),
                              offset: Offset(0, 10),
                              spreadRadius: -1,
                              blurRadius: 30)
                        ]),
                    margin: EdgeInsets.symmetric(horizontal: 50),
                    padding: EdgeInsets.all(7),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Container(
                            height: double.infinity,
                            decoration: BoxDecoration(
                                color: Colors.teal,
                                borderRadius: BorderRadius.circular(5)),
                            child: Center(
                                child: Text(
                              "Follow",
                              style: TextStyle(color: Colors.white),
                            )),
                          ),
                        ),
                        SizedBox(
                          width: 7,
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            height: double.infinity,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5)),
                            child: Center(child: Text("Message")),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
            color: Colors.grey[200],
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                      color: Colors.grey[200],
                    ))),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Collection",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16),
                            ),
                            Container(
                              width: 50,
                              padding: EdgeInsets.only(bottom: 10),
                              decoration: BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                          color: Colors.teal, width: 3))),
                            )
                          ],
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          "Likes",
                          style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.w500,
                              fontSize: 16),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 300,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: widget.album.length,
                    itemBuilder: (context, i) {
                      return Column(
                        children: [
                          Container(
                            child: Stack(
                              children: [
                                Container(
                                    width: 270,
                                    height: 200,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(
                                                widget.album[i]["cover"]),
                                            fit: BoxFit.cover),
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: Stack(
                                      alignment:
                                          AlignmentDirectional.bottomCenter,
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          child: BackdropFilter(
                                            filter: ImageFilter.blur(
                                                sigmaX: 10, sigmaY: 10),
                                            child: Container(
                                              width: double.infinity,
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 20, vertical: 20),
                                              height: 90,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(20),
//                                            color: Colors.black.withOpacity(0),
                                              ),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    widget.album[i]["name"],
                                                    style: TextStyle(
                                                        fontSize: 18,
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                  SizedBox(
                                                    height: 7,
                                                  ),
                                                  Text(
                                                    widget.album[i]["description"],
                                                    style: TextStyle(
                                                        fontSize: 17,
                                                        color: Colors.white),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    )),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            height: 27,
                            width: 270,
//                            margin: EdgeInsets.only(right: 20),
                            child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              itemCount: widget.album[i]["tag"].length,
                              itemBuilder: (context, tagIndex) => Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 25, vertical: 5),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Colors.blueGrey[100]),
                                child: Center(
                                  child: Text(
                                    widget.album[i]["tag"][tagIndex],
                                    style: TextStyle(),
                                  ),
                                ),
                              ),
                              separatorBuilder: (context, i) {
                                return SizedBox(
                                  width: 10,
                                );
                              },
                            ),
                          )
                        ],
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
          )
        ],
      ),
    );
  }
}

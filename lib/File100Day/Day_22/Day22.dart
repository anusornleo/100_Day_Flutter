import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterui100day/File100Day/Day_22/Data.dart';
import 'package:page_transition/page_transition.dart';

import 'Album.dart';
import 'Profile.dart';

class Day22 extends StatefulWidget {
  @override
  _Day22State createState() => _Day22State();
}

class _Day22State extends State<Day22> {
  List<Map> dataPost = Data().dataPost;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[200],
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.menu,
            color: Colors.black,
          ),
          onPressed: () {},
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
//        color: Colors.grey[200],
          child: Column(
            children: [
              Container(
                width: double.infinity,
                color: Colors.grey[200],
                height: 170,
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Best Place to\nfind a Perfect Photo",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            padding: EdgeInsets.all(3),
                            width: MediaQuery.of(context).size.width - 40,
                            height: 50,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5)),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width - 106,
                                  height: 60,
                                  child: TextField(
                                    style: TextStyle(fontSize: 18),
                                    decoration: InputDecoration(
                                        contentPadding: EdgeInsets.symmetric(
                                            horizontal: 16, vertical: 12),
                                        border: InputBorder.none,
                                        hintText: "Search a Photo"),
                                  ),
                                ),
                                Container(
                                  width: 60,
                                  height: 45,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: Colors.red),
                                  child: Icon(
                                    Icons.search,
                                    color: Colors.white,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
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
              ),
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 20),
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "For You",
                      style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      child: Row(
                        children: [
                          Text("Recommend",
                              style: TextStyle(fontWeight: FontWeight.w500)),
                          SizedBox(
                            width: 15,
                          ),
                          Text(
                            "Liked",
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      children: dataPost.map((e) {
                        return post(e);
                      }).toList(),
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

  Widget post(dataPost) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(bottom: 20),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Row(
              children: [
                GestureDetector(
                  child: Hero(
                    tag: dataPost["profile"]["at"],
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: AssetImage(dataPost["profile"]["pic"]),
                            fit: BoxFit.cover),
                      ),
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      PageTransition(
                        curve: Curves.easeInOut,
                        type: PageTransitionType.rightToLeft,
                        duration: Duration(milliseconds: 500),
                        child: Profile(
                          pic: dataPost["profile"]["pic"],
                          name: dataPost["profile"]["name"],
                          at: dataPost["profile"]["at"],
                          follower: dataPost["profile"]["follower"],
                          following: dataPost["profile"]["following"],
                          album: dataPost["album"],
                        ),
                      ),
                    );
                  },
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        dataPost["profile"]["name"],
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                      Text(dataPost["time"],
                          style: TextStyle(color: Colors.grey))
                    ],
                  ),
                ),
                Spacer(
                  flex: 1,
                ),
                IconButton(
                  icon: Icon(Icons.more_horiz),
                  onPressed: () {},
                )
              ],
            ),
          ),
          Container(
            height: 300,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: dataPost["album"].length,
              itemBuilder: (context, i) {
                String cover = dataPost["album"][i]["cover"];
                String address = dataPost["album"][i]["address"];
                List<String> pics = dataPost["album"][i]["pics"];
                String name = dataPost["profile"]["name"];
                String profilePic = dataPost["profile"]["pic"];

                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      PageTransition(
                        type: PageTransitionType.rightToLeft,
                        duration: Duration(milliseconds: 200),
                        child: Album(
                          cover: cover,
                          address: address,
                          pics: pics,
                          name: name,
                          profilePic: profilePic,
                        ),
                      ),
                    );
                  },
                  child: AspectRatio(
                    aspectRatio: 1 / 1,
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                              image: AssetImage(cover), fit: BoxFit.cover)),
                      child: Stack(
                        children: [
                          Positioned(
                            bottom: 30,
                            right: 30,
                            child: Icon(
                              Icons.favorite_border,
                              color: Colors.white,
                            ),
                          ),
                          Positioned(
                            bottom: 30,
                            right: 70,
                            child: Icon(
                              Icons.insert_link,
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                    ),
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
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Day19 extends StatefulWidget {
  @override
  _Day19State createState() => _Day19State();
}

class _Day19State extends State<Day19> {
  List<Map> dataStory = [
    {
      "profile": "assets/JPEG/cat1.jpg",
      "name": "Jame Guns",
      "pic": "assets/JPEG/landscape1.jpg",
    },
    {
      "profile": "assets/JPEG/cat2.jpg",
      "name": "Tomson Hubb",
      "pic": "assets/JPEG/landscape2.jpg",
    },
    {
      "profile": "assets/JPEG/cat3.jpg",
      "name": "Borivir Eric",
      "pic": "assets/JPEG/landscape3.jpg",
    },
    {
      "profile": "assets/JPEG/cat4.jpg",
      "name": "Ken Opps",
      "pic": "assets/JPEG/landscape4.jpg",
    },
    {
      "profile": "assets/JPEG/cat5.jpg",
      "name": "Astin March",
      "pic": "assets/JPEG/landscape5.jpg",
    },
    {
      "profile": "assets/JPEG/cat6.jpg",
      "name": "Pony Jen",
      "pic": "assets/JPEG/landscape6.jpg",
    }
  ];

  List<Map> dataPost = [
    {
      "profile": "assets/JPEG/cat6.jpg",
      "name": "Jim Carry",
      "time": "15:20",
      "text":
          "when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries,",
      "pic": "assets/JPEG/landscape6.jpg",
      "likeCount": "458",
      "liked": true,
      "commentCount": "112"
    },
    {
      "profile": "assets/JPEG/cat5.jpg",
      "name": "Leo Pores",
      "time": "14:40",
      "text":
          "Contrary to popular belief, Lorem Ipsum is not simply random text",
      "pic": "assets/JPEG/landscape6.jpg",
      "likeCount": "114",
      "liked": false,
      "commentCount": "3"
    },
    {
      "profile": "assets/JPEG/cat4.jpg",
      "name": "Willy McHall",
      "time": "13:26",
      "text":
          "It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old",
      "pic": "assets/JPEG/landscape4.jpg",
      "likeCount": "442",
      "liked": true,
      "commentCount": "10"
    },
    {
      "profile": "assets/JPEG/cat3.jpg",
      "name": "Mistine Ann",
      "time": "12:31",
      "text":
          "he standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested.",
      "pic": "assets/JPEG/landscape3.jpg",
      "likeCount": "752",
      "liked": false,
      "commentCount": "68"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(72.0),
        child: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          actions: [
            Container(
              width: MediaQuery.of(context).size.width - 84,
              height: 50,
              margin: EdgeInsets.only(top: 15),
              decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(20)),
              child: TextField(
                style: TextStyle(fontSize: 18),
                decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.grey[500],
                    ),
                    hintText: "Search",
                    border: InputBorder.none),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 20),
              child: Icon(
                Icons.camera_alt,
                color: Colors.black,
              ),
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              story(),
              listPost(),
            ],
          ),
        ),
      ),
    );
  }

  Widget story() {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Story",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
              ),
              Text(
                "See More",
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 180,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: dataStory.length,
              itemBuilder: (context, i) {
                String profile = dataStory[i]['profile'];
                String name = dataStory[i]['name'];
                String pic = dataStory[i]['pic'];
                return AspectRatio(
                  aspectRatio: 2 / 3,
                  child: Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(pic), fit: BoxFit.cover),
                        borderRadius: BorderRadius.circular(20)),
                    child: Container(
                      padding: EdgeInsets.all(14),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          gradient: LinearGradient(
                            begin: Alignment.bottomRight,
                            colors: [Colors.black45, Colors.transparent],
                          )),
                      child: Stack(
                        children: [
                          Positioned(
                            child: Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border:
                                      Border.all(color: Colors.white, width: 3),
                                  image: DecorationImage(
                                      image: AssetImage(profile),
                                      fit: BoxFit.cover)),
                            ),
                          ),
                          Positioned(
                            left: 0,
                            bottom: 0,
                            child: Text(
                              name,
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
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

  Widget listPost() {
    return Container(
      child: Column(
        children: dataPost
            .map((p) => post(
                  p["profile"],
                  p["name"],
                  p["time"],
                  p["text"],
                  p["pic"],
                  p["likeCount"],
                  p["liked"],
                  p["commentCount"],
                ))
            .toList(),
      ),
    );
  }

  Widget post(String profile, String name, String time, String text, String pic,
      String likeCount, bool liked, String commentCount) {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20, bottom: 20),
      width: double.infinity,
//      height: 400,
      decoration: BoxDecoration(color: Colors.white),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 10),
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(profile),
                          fit: BoxFit.cover,
                        ),
                        shape: BoxShape.circle),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        name,
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 18),
                      ),
                      Text(
                        time,
                        style: TextStyle(color: Colors.grey),
                      )
                    ],
                  ),
                ],
              ),
              IconButton(
                icon: Icon(Icons.more_horiz),
                onPressed: () {},
              )
            ],
          ),
          Padding(
              padding: EdgeInsets.symmetric(vertical: 20), child: Text(text)),
          Container(
            width: double.infinity,
            height: 200,
            decoration: BoxDecoration(
                image:
                    DecorationImage(image: AssetImage(pic), fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(12)),
          ),
          Container(
            padding: EdgeInsets.only(top: 10),
            child: Row(
              children: [
                Container(
                  width: 50,
                  child: Stack(
                    children: [
                      Positioned(
                        child: Container(
                          padding: EdgeInsets.all(2),
                          width: 25,
                          height: 25,
                          decoration: BoxDecoration(
                              color: Colors.blueAccent,
                              shape: BoxShape.circle,
                              border:
                                  Border.all(color: Colors.white, width: 2)),
                          child: Icon(
                            Icons.thumb_up,
                            size: 10,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Positioned(
                        left: 19,
                        top: 0,
                        child: Container(
                          padding: EdgeInsets.all(2),
                          width: 25,
                          height: 25,
                          decoration: BoxDecoration(
                              color: Colors.redAccent,
                              shape: BoxShape.circle,
                              border:
                                  Border.all(color: Colors.white, width: 2)),
                          child: Icon(
                            Icons.favorite,
                            size: 10,
                            color: Colors.white,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Text(likeCount),
                Spacer(
                  flex: 1,
                ),
                Text(commentCount + " comment"),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [likeButton(liked), commentButton(), shareButton()],
            ),
          )
        ],
      ),
    );
  }

  Widget likeButton(bool isLike) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 7),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[300]),
        borderRadius: BorderRadius.circular(50),
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(Icons.thumb_up,
                color: isLike ? Colors.blueAccent : Colors.grey, size: 18),
            SizedBox(
              width: 5,
            ),
            Text(
              "Like",
              style: TextStyle(color: isLike ? Colors.blueAccent : Colors.grey),
            )
          ],
        ),
      ),
    );
  }

  Widget commentButton() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 7),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[300]),
        borderRadius: BorderRadius.circular(50),
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(Icons.chat, color: Colors.grey, size: 18),
            SizedBox(
              width: 5,
            ),
            Text(
              "Comment",
              style: TextStyle(color: Colors.grey),
            )
          ],
        ),
      ),
    );
  }

  Widget shareButton() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 7),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[300]),
        borderRadius: BorderRadius.circular(50),
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(Icons.share, color: Colors.grey, size: 18),
            SizedBox(
              width: 5,
            ),
            Text(
              "Share",
              style: TextStyle(color: Colors.grey),
            )
          ],
        ),
      ),
    );
    ;
  }
}

import 'package:flutter/material.dart';
import 'package:flutterui100day/File100Day/Day_4/FadeAnimation.dart';

class Day4 extends StatefulWidget {
  @override
  _Day4State createState() => _Day4State();
}

class _Day4State extends State<Day4> {
  List<Map> listFriend = [
    {"pic": "assets/JPEG/cat1.jpg", "name": "Tommy"},
    {"pic": "assets/JPEG/cat5.jpg", "name": "Anny"},
    {"pic": "assets/JPEG/cat4.jpg", "name": "Jimmy"}
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
                leading: Icon(null),
                expandedHeight: 450,
                backgroundColor: Colors.transparent,
                flexibleSpace: FlexibleSpaceBar(
                  background: Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/JPEG/cat3.jpg"),
                            fit: BoxFit.cover)),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: [Colors.black, Colors.transparent],
                              begin: Alignment.bottomRight)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          FadeAnimation(
                            isX: true,
                            delay: 0,
                            child: Text(
                              "Black Gray Cat",
                              style: TextStyle(
                                  fontSize: 40,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          FadeAnimation(
                            isX: true,
                            delay: 100,
                            child: Row(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 16, right: 72),
                                  child: Text(
                                    "153 Likes",
                                    style: TextStyle(
                                        color: Colors.white.withOpacity(.5)),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 16, right: 16),
                                  child: Text(
                                    "104K Subscribers",
                                    style: TextStyle(
                                        color: Colors.white.withOpacity(.5)),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )),
            SliverList(
              delegate: SliverChildListDelegate([
                Container(
                  color: Colors.black,
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 16, right: 16, top: 16),
                    child: DefaultTextStyle(
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          FadeAnimation(
                            isX: true,
                            delay: 200,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 34),
                              child: Text(
                                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book",
                                style: TextStyle(
                                    color: Colors.white.withOpacity(.5),
                                    fontSize: 17),
                              ),
                            ),
                          ),
                          FadeAnimation(
                              isX: true, delay: 300, child: Text("Born")),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            child: Text("10 June 2017",
                                style: TextStyle(
                                    color: Colors.white.withOpacity(.5),
                                    fontSize: 17)),
                          ),
                          SizedBox(
                            height: 18,
                          ),
                          Text("Breeds"),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            child: Text("Persian",
                                style: TextStyle(
                                    color: Colors.white.withOpacity(.5),
                                    fontSize: 17)),
                          ),
                          SizedBox(
                            height: 18,
                          ),
                          Text("His Friends"),
                          Container(
                            margin: EdgeInsets.only(top: 16),
                            height: 200,
                            child: ListView.separated(
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return AspectRatio(
                                    aspectRatio: 2 / 3,
                                    child: Stack(
                                      children: <Widget>[
                                        Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(16),
                                              image: DecorationImage(
                                                  image: AssetImage(
                                                      listFriend[index]["pic"]),
                                                  fit: BoxFit.cover)),
                                          child: Container(
                                            decoration: BoxDecoration(
                                                gradient:
                                                    LinearGradient(colors: [
                                              Colors.black,
                                              Colors.transparent
                                            ], begin: Alignment.bottomRight)),
                                          ),
                                        ),
                                        Align(
                                          alignment: Alignment(0, 0.8),
                                          child: Text(
                                            listFriend[index]["name"],
                                            style: TextStyle(fontSize: 18),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                                separatorBuilder: (context, index) {
                                  return SizedBox(
                                    width: 16,
                                  );
                                },
                                itemCount: listFriend.length),
                          ),
                          SizedBox(
                            height: 95,
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ]),
            )
          ],
        ),
        Positioned(
            bottom: 5,
            child: Container(
              padding: EdgeInsets.all(22),
//                height: 100,
              width: MediaQuery.of(context).size.width,
              child: FadeAnimation(
                delay: 700,
                isX: false,
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.amber[500],
                      borderRadius: BorderRadius.circular(24)),
                  height: 48,
                  child: FlatButton(
                    onPressed: () {},
                    child: Text(
                      "Follow",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                ),
              ),
            ))
      ],
    );
  }
}

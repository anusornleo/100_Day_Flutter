import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutterui100day/File100Day/Day_3/FadeAnimation.dart';

class HomeDay3 extends StatefulWidget {
  @override
  _HomeDay3State createState() => _HomeDay3State();
}

class _HomeDay3State extends State<HomeDay3> with TickerProviderStateMixin {
  List<String> typeList = ["Salmon", "Dolly", "Saba", "Other"];

  List<String> listImage = [
    "assets/JPEG/salmon2.jpg",
    "assets/JPEG/salmon3.jpg"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        leading: Icon(null),
        elevation: 0,
        backgroundColor: Colors.grey[100],
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.shopping_cart,
              color: Colors.black,
            ),
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.only(left: 16, right: 16, bottom: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            FadeAnimation(
              isX: true,
              delay: 0,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 14),
                child: Text(
                  "Food Delivery",
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.w500),
                ),
              ),
            ),
            FadeAnimation(
              isX: true,
              delay: 200,
              child: Container(
                height: 50,
                width: double.infinity,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: typeList.length,
                  itemBuilder: (context, index) {
                    return AspectRatio(
                      aspectRatio: 5 / 2,
                      child: Container(
                        decoration: BoxDecoration(
                            color:
                                index == 0 ? Colors.orange[400] : Colors.white,
                            borderRadius: BorderRadius.circular(25)),
                        child: Center(
                            child: Text(
                          typeList[index],
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color:
                                  index == 0 ? Colors.white : Colors.grey[400]),
                        )),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      width: 10,
                    );
                  },
                ),
              ),
            ),
            FadeAnimation(
              delay: 300,
              isX: false,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Text(
                  "Food Delivery",
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
            FadeAnimation(
              delay: 400,
              isX: false,
              child: Container(
                height: 470,
                width: double.infinity,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: listImage.length,
                  itemBuilder: (context, index) {
                    return AspectRatio(
                      aspectRatio: 2 / 3,
                      child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                                image: AssetImage(listImage[index]),
                                fit: BoxFit.cover),
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                gradient: LinearGradient(
                                    colors: [Colors.black, Colors.transparent],
                                    begin: Alignment.bottomRight)),
                            child: Stack(
                              children: <Widget>[
                                Align(
                                  alignment: Alignment(0.9, -0.95),
                                  child: IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.favorite,
                                      size: 30,
                                    ),
                                    color: Colors.white,
                                  ),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Padding(
                                      padding: EdgeInsets.only(left: 16),
                                      child: Text(
                                        "\$ 15.00",
                                        style: TextStyle(
                                            fontSize: 36, color: Colors.white,fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(16),
                                      child: Text(
                                        "Salmon A",
                                        style: TextStyle(
                                            fontSize: 18, color: Colors.white),
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          )),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      width: 20,
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

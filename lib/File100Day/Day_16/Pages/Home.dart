import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterui100day/File100Day/Day_12/FadeAnimation.dart';
import 'package:flutterui100day/File100Day/Day_16/Pages/Category.dart';
import 'package:page_transition/page_transition.dart';

class HomeDay16 extends StatefulWidget {
  @override
  _HomeDay16State createState() => _HomeDay16State();
}

class _HomeDay16State extends State<HomeDay16> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 340,
              width: double.infinity,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/JPEG/cat3.jpg"),
                      fit: BoxFit.cover)),
              child: SafeArea(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                            icon: Icon(
                              Icons.favorite_border,
                              color: Colors.white,
                            ),
                            onPressed: () {},
                          ),
                          IconButton(
                            icon: Icon(
                              Icons.shopping_cart,
                              color: Colors.white,
                            ),
                            onPressed: () {},
                          )
                        ],
                      ),
                    ),
                    FadeAnimation(
                      isX: false,
                      delay: 0,
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Our Product",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 32,
                                ),
                              ),
                              Text(
                                "View More",
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white),
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            FadeAnimation(
              isX: false,
              delay: 200,
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Categories",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w500),
                          ),
                          Text("All")
                        ],
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: 200,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: 3,
                        itemBuilder: (context, i) {
                          return AspectRatio(
                            aspectRatio: 7 / 10,
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    PageTransition(
                                        type: PageTransitionType
                                            .fade,
                                        duration: Duration(milliseconds: 200),
                                        child: Category()));
                              },
                              child: Hero(
                                tag:"$i",
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(18),
                                      image: DecorationImage(
                                          image:
                                              AssetImage("assets/JPEG/cat1.jpg"),
                                          fit: BoxFit.cover)),
                                  child: Container(
                                    padding: EdgeInsets.all(12),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(18),
                                        gradient: LinearGradient(colors: [
                                          Colors.black87,
                                          Colors.transparent
                                        ], begin: Alignment.bottomRight)),
                                    child: Align(
                                      alignment: Alignment.bottomLeft,
                                      child: Text(
                                        "ddd",
                                        style: TextStyle(
                                            fontSize: 18, color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (context, i) {
                          return SizedBox(
                            width: 20,
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
              delay: 600,
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Best Sale",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w500),
                          ),
                          Text("All")
                        ],
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: 200,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: 3,
                        itemBuilder: (context, i) {
                          return AspectRatio(
                            aspectRatio: 10 / 10,
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(18),
                                  image: DecorationImage(
                                      image: AssetImage("assets/JPEG/cat1.jpg"),
                                      fit: BoxFit.cover)),
                              child: Container(
                                padding: EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(18),
                                    gradient: LinearGradient(colors: [
                                      Colors.black87,
                                      Colors.transparent
                                    ], begin: Alignment.bottomRight)),
                                child: Align(
                                  alignment: Alignment.bottomLeft,
                                  child: Text(
                                    "ddd",
                                    style: TextStyle(
                                        fontSize: 18, color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (context, i) {
                          return SizedBox(
                            width: 20,
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
    );
  }
}

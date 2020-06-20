import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterui100day/File100Day/Day_12/FadeAnimation.dart';

class Category extends StatefulWidget {
  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  List<Map> items = [
    {"name": "Tommy", "price": "100", "pic": "assets/JPEG/cat6.jpg"},
    {"name": "Easy", "price": "100", "pic": "assets/JPEG/cat1.jpg"},
    {"name": "Lulk", "price": "100", "pic": "assets/JPEG/cat3.jpg"},
    {"name": "Pony", "price": "100", "pic": "assets/JPEG/cat2.jpg"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Hero(
              tag: "0",
              child: Material(
                child: Container(
                  height: 200,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/JPEG/cat4.jpg"),
                          fit: BoxFit.cover)),
                  child: Container(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [Colors.black54, Colors.transparent],
                            begin: Alignment.bottomRight)),
                    child: SafeArea(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                icon: Icon(
                                  Icons.arrow_back_ios,
                                  color: Colors.white,
                                ),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              ),
                              Row(
                                children: [
                                  IconButton(
                                    icon: Icon(
                                      Icons.search,
                                      color: Colors.white,
                                    ),
                                    onPressed: () {},
                                  ),
                                  IconButton(
                                    icon: Icon(
                                      Icons.favorite,
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
                              )
                            ],
                          ),
                          FadeAnimation(
                            isX: false,
                            delay: 0,
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Align(
                                alignment: Alignment.bottomCenter,
                                child: Text(
                                  "Category",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 32,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            FadeAnimation(
              isX: false,
              delay: 200,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Category",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                    Row(
                      children: [
                        Text("View All"),
                        SizedBox(
                          width: 10,
                        ),
                        Icon(Icons.arrow_forward_ios)
                      ],
                    )
                  ],
                ),
              ),
            ),
            FadeAnimation(
              isX: false,
              delay: 400,
              child: Column(
                children: items
                    .map((e) =>
                        itemCard(e["name"], e["price"], e["pic"]))
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Padding itemCard(String name,String price,String pic) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
      child: AspectRatio(
        aspectRatio: 3 / 2,
        child: Container(
          width: 220,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(pic), fit: BoxFit.cover),
              borderRadius: BorderRadius.circular(20)),
          child: Container(
            padding: EdgeInsets.only(top: 5, left: 20, right: 20, bottom: 20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(
                    colors: [Colors.black54, Colors.transparent],
                    begin: Alignment.bottomRight)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Align(
                  alignment: Alignment(1.1, -0.9),
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.favorite_border,
                      size: 30,
                      color: Colors.white,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name,
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        Text(
                          "\$$price",
                          style: TextStyle(color: Colors.white, fontSize: 30),
                        )
                      ],
                    ),
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.white),
                      child: Icon(Icons.add_shopping_cart),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

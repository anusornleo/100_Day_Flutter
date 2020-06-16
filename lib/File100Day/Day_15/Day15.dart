import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterui100day/File100Day/Day_15/HeroShoe.dart';

class Day15 extends StatefulWidget {
  @override
  _Day15State createState() => _Day15State();
}

class _Day15State extends State<Day15> {
  List<Map> listAdidas = [
    {
      "name": "Adidas 1",
      "price": "200",
      "size": ["8", "8.5","9", "9.5","10", "10.5"],
      "pic": "assets/PNG/adidas1.png",
      "color": Colors.indigo
    },
    {
      "name": "Adidas 2",
      "price": "200",
      "size": ["9", "9.5","10"],
      "pic": "assets/PNG/adidas2.png",
      "color": Colors.grey
    },
    {
      "name": "Adidas 3",
      "price": "200",
      "size": ["9", "9.5","10", "10.5"],
      "pic": "assets/PNG/adidas3.png",
      "color": Colors.blueAccent
    },
    {
      "name": "Adidas 4",
      "price": "200",
      "size": ["8.5","9", "9.5","10", "10.5"],
      "pic": "assets/PNG/adidas4.png",
      "color": Colors.redAccent
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "Shoe Shop",
          style: TextStyle(color: Colors.black, fontSize: 24),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            icon: Icon(
              Icons.notifications_none,
              color: Colors.black,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(
              Icons.shopping_cart,
              color: Colors.black,
            ),
            onPressed: () {},
          )
        ],
      ),
      body: Container(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Container(
              margin: EdgeInsets.only(bottom: 20),
              padding: EdgeInsets.symmetric(horizontal: 16),
              width: double.infinity,
              height: 30,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (context, i) {
                  return Chip(
                    label: Text(
                      'Aaron Burr',
                      style: TextStyle(color: Colors.blueGrey),
                    ),
                    backgroundColor: (i == 0) ? Colors.grey[200] : Colors.white,
                  );
                },
                separatorBuilder: (context, i) {
                  return SizedBox(
                    width: 10,
                  );
                },
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                width: double.infinity,
                child: ListView.separated(
                  itemCount: listAdidas.length,
                  itemBuilder: (context, i) {
                    String name = listAdidas[i]["name"];
                    String price = listAdidas[i]["price"];
                    String pic = listAdidas[i]["pic"];
                    List<String> size = listAdidas[i]["size"];
                    Color color = listAdidas[i]["color"];
                    return GestureDetector(
                      child: Hero(
                        tag: name,
                        child: Material(
                          child: Stack(
                            fit: StackFit.passthrough,
                            children: [
                              Container(
                                padding: EdgeInsets.all(16),
                                height: 250,
                                decoration: BoxDecoration(
                                    color: color,
                                    borderRadius: BorderRadius.circular(20)),
                                child: Image.asset(pic),
                              ),
                              Positioned(
                                left: 20,
                                top: 20,
                                child: Text(
                                  name,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 32,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              Positioned(
                                  bottom: 20,
                                  left: 20,
                                  child: Text(
                                    price + "\$",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 28,
                                        fontWeight: FontWeight.w500),
                                  )),
                              Positioned(
                                  right: 20,
                                  top: 20,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.white),
                                    child: IconButton(
                                      onPressed: () {},
                                      icon: Icon(Icons.favorite_border),
                                    ),
                                  ))
                            ],
                          ),
                        ),
                      ),
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (_) {
                          return HeroShoe(
                            name: name,
                            price: price,
                            color: color,
                            size: size,
                            pic: pic,
                          );
                        }));
                      },
                    );
                  },
                  separatorBuilder: (context, i) {
                    return SizedBox(
                      height: 16,
                    );
                  },
                ),
              ),
            ),
            SizedBox(
              height: 16,
            )
          ],
        ),
      ),
    );
  }
}

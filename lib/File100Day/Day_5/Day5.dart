import 'package:animator/animator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Day5 extends StatefulWidget {
  @override
  _Day5State createState() => _Day5State();
}

class _Day5State extends State<Day5> {
  List<Map> listLocation = [
    {
      "pic": "assets/JPEG/cat1.jpg",
      "name": "Tommy White Cat",
      "distance": "2.4",
    },
    {
      "pic": "assets/JPEG/cat2.jpg",
      "name": "Bell Orange Cat",
      "distance": "2.4",
    },
    {
      "pic": "assets/JPEG/cat3.jpg",
      "name": "Smaug Black Cat",
      "distance": "2.4",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/JPEG/city.jpg'), fit: BoxFit.cover)),
        child: SafeArea(
          child: Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.black, Colors.transparent],
                    begin: Alignment.bottomRight)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  width: double.infinity,
                  height: 300,
                  child: Stack(
                    children: <Widget>[
                      marker(30, 230),
                      marker(140, 100),
                      marker(200, 320),
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 250,
//                color: Colors.orange,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      String pic = listLocation[index]["pic"];
                      String name = listLocation[index]["name"];
                      String distance = listLocation[index]["distance"];
                      return AspectRatio(
                        aspectRatio: 1.7 / 2,
                        child: Container(
                          padding: EdgeInsets.all(16),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20)),
                          child: Stack(
                            children: <Widget>[
                              Container(
                                width: 64,
                                height: 64,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image:
                                            AssetImage(pic),
                                        fit: BoxFit.cover),
                                    borderRadius: BorderRadius.circular(20)),
                              ),
                              Positioned(
                                top: 12,
                                right: 0,
                                child: Container(
                                  width: 80,
                                  height: 40,
                                  decoration: BoxDecoration(
                                      color: Colors.grey[300],
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Center(
                                    child: Text(distance),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment(0, 0.3),
                                child: Text(
                                  name,
                                  style: TextStyle(
                                      fontSize: 32,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomRight,
                                child: IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.star_border,
                                    color: Colors.amber,
                                    size: 30,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        width: 20,
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Positioned marker(double x, double y) {
    return Positioned(
      top: x,
      left: y,
      child: Container(
          width: 20,
          height: 20,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.greenAccent.withOpacity(0.3)),
          child: Animator<double>(
            duration: Duration(seconds: 1),
            tween: Tween<double>(begin: 1.0, end: 6.0),
            cycles: 0,
            builder: (context, anim, child) => Center(
              child: Container(
                margin: EdgeInsets.all(anim.value),
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: Colors.greenAccent),
              ),
            ),
          )),
    );
  }
}

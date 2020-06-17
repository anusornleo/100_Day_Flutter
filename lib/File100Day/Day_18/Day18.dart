import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Day18 extends StatefulWidget {
  @override
  _Day18State createState() => _Day18State();
}

class _Day18State extends State<Day18> with TickerProviderStateMixin {
  List<Map> cats = [
    {
      "name": "Sara",
      "price": "1.99",
      "star": 3,
      "pic": "assets/JPEG/cat1.jpg",
      "count": "42"
    },
    {
      "name": "James",
      "price": "1.99",
      "star": 4,
      "pic": "assets/JPEG/cat2.jpg",
      "count": "98"
    },
    {
      "name": "Kitty",
      "price": "1.99",
      "star": 5,
      "pic": "assets/JPEG/cat3.jpg",
      "count": "112"
    },
  ];

  int _nowIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              GestureDetector(
                onHorizontalDragEnd: (DragEndDetails detail) {
                  if (detail.velocity.pixelsPerSecond.dx > 0) {
                    prev();
                  } else if (detail.velocity.pixelsPerSecond.dx < 0) {
                    next();
                  }
                },
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 500),
                  transitionBuilder:
                      (Widget child, Animation<double> animation) {
                    return FadeTransition(child: child, opacity: animation);
                  },
                  child: Container(
                    key: ValueKey<int>(_nowIndex),
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height - 230,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(cats[_nowIndex]["pic"]),
                            fit: BoxFit.cover)),
                  ),
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height - 300,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: List<Widget>.generate(
                        cats.length, (index) => indicator(index)),
                  ),
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
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 32),
              width: double.infinity,
              decoration: BoxDecoration(color: Colors.white),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    cats[_nowIndex]["name"],
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.w500),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: Row(
                      children: [
                        Text(
                          cats[_nowIndex]["price"] + " \$",
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.amber,
                              fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        starGroup(cats[_nowIndex]["star"]),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                            "(${cats[_nowIndex]["star"]}/${cats[_nowIndex]["count"]} Reviewer)")
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 32),
                    width: double.infinity,
                    height: 47,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [
                          Colors.amber,
                          Colors.yellow,
                        ]),
                        borderRadius: new BorderRadius.circular(10.0)),
                    child: FlatButton(
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(10.0),
                      ),
                      onPressed: () {},
                      color: Colors.transparent,
                      child: Text(
                        "Feed Now",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18.0,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  prev() {
    if (_nowIndex > 0) {
      setState(() {
        _nowIndex--;
      });
    }
  }

  next() {
    if (_nowIndex < cats.length - 1) {
      setState(() {
        _nowIndex++;
      });
    }
  }

  Container indicator(int index) {
    return Container(
      margin: EdgeInsets.all(5),
      width: 30,
      height: 5,
      decoration: BoxDecoration(
          color: (_nowIndex == index)
              ? Colors.white
              : Colors.white.withOpacity(.5)),
    );
  }

  Container starGroup(int star) {
    List<Icon> countStar = [];

    for (int i = 0; i < 5; i++) {
      countStar.add(Icon(
        (i < star) ? Icons.star : Icons.star_border,
        color: Colors.amber,
        size: 20,
      ));
    }

    return Container(
      child: Row(
        children: countStar,
      ),
    );
  }
}

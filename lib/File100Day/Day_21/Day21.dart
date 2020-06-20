import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Day21 extends StatefulWidget {
  @override
  _Day21State createState() => _Day21State();
}

class _Day21State extends State<Day21> {
  PageController _pageController;

  int _currentPage = 0;

  List<Map> _pages = [
    {
      "pic": "assets/PNG/planet.png",
      "title": "Uranus",
      "text":
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry",
    },
    {
      "pic": "assets/PNG/planet2.png",
      "title": "Jupiter",
      "text":
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry",
    },
    {
      "pic": "assets/PNG/planet3.png",
      "title": "Venus",
      "text":
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry",
    }
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: Icon(null),
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          FlatButton(
            onPressed: () {},
            child: Text(
              "Skip",
              style: TextStyle(fontSize: 18),
            ),
          )
        ],
      ),
      body: Stack(
        children: [
          PageView(
            onPageChanged: (int page) {
              setState(() {
                _currentPage = page;
              });
            },
            controller: _pageController,
            children: _pages.map((e) {
              int index = _pages.indexOf(e);
              return page(_pages[index]["pic"], _pages[index]["title"],
                  _pages[index]["text"]);
            }).toList(),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: indicator(),
          )
        ],
      ),
    );
  }

  Widget page(String pic,String title,String text) {
    return Container(
      padding: EdgeInsets.all(70),
      decoration: BoxDecoration(color: Colors.white),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(pic),
          SizedBox(
            height: 20,
          ),
          Text(
            title,
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            text,
            style: TextStyle(fontSize: 20),
          ),
        ],
      ),
    );
  }

  Widget indicator() {
    return Container(
      height: 70,
      color: Colors.transparent,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: _pages.map((e) {
          return AnimatedContainer(
            width: (_currentPage == _pages.indexOf(e)) ? 30 : 10,
            duration: Duration(milliseconds: 200),
            margin: EdgeInsets.only(right: (_pages.length -1 == _pages.indexOf(e))?0:10),
            child: Container(
              height: 10,
              decoration: BoxDecoration(
                  color: Colors.blueGrey, borderRadius: BorderRadius.circular(5)),
            ),
          );
        }).toList(),
      ),
    );
  }
}

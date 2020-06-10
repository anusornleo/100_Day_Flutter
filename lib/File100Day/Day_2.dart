import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:simple_animations/simple_animations.dart';

class Day2 extends StatefulWidget {
  @override
  _Day2State createState() => _Day2State();
}

class _Day2State extends State<Day2> with SingleTickerProviderStateMixin {
  PageController _pageController;
  List<Map<String, dynamic>> listLocation = [
    {
      "image": "assets/JPEG/landscape2.jpg",
      "position": "1",
      "title": "The Vast Ice Fields In App",
      "star": "3",
      "count": "1203",
      "description":
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
    },
    {
      "image": "assets/JPEG/landscape3.jpg",
      "position": "1",
      "title": "Rock and Green",
      "star": "5",
      "count": "409",
      "description":
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book",
    },
    {
      "image": "assets/JPEG/landscape4.jpg",
      "position": "1",
      "title": "Huge Mountain",
      "star": "4",
      "count": "772",
      "description":
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s",
    }
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _pageController = PageController(initialPage: 0)
      ..addListener(() {
        _onScroll();
      });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onScroll() {
    print("ddd");
  }

  @override
  Widget build(BuildContext context) {
    print(listLocation[0]["image"]);
    return Scaffold(
        body: PageView.builder(
            itemCount: listLocation.length,
            itemBuilder: (context, index) {
              String image = listLocation[index]["image"];
              String title = listLocation[index]["title"];
              String star = listLocation[index]["star"];
              String count = listLocation[index]["count"];
              String description = listLocation[index]["description"];
              String length = listLocation.length.toString();
              String i = (index + 1).toString();
              return LocationPage(
                  image: image,
                  i: i,
                  length: length,
                  title: title,
                  star: star,
                  count: count,
                  description: description);
            }));
  }
}

class LocationPage extends StatelessWidget {
  const LocationPage({
    Key key,
    @required this.image,
    @required this.i,
    @required this.length,
    @required this.title,
    @required this.star,
    @required this.count,
    @required this.description,
  }) : super(key: key);

  final String image;
  final String i;
  final String length;
  final String title;
  final String star;
  final String count;
  final String description;

  @override
  Widget build(BuildContext context) {
    List<Widget> listStar = [];

    for (int i = 0; i < 5; i++) {
      Color color = Colors.white.withOpacity(.5);
      if (i < int.parse(star)) {
        color = Colors.yellow;
      }
      listStar.add(Padding(
        padding: EdgeInsets.only(right: 3, top: 20, bottom: 20),
        child: Icon(
          Icons.star,
          color: color,
          size: 16,
        ),
      ));
    }

    return Container(
      decoration: BoxDecoration(
          color: Colors.blue,
          image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover)),
      child: Container(
        padding: EdgeInsets.only(left: 16, right: 16, bottom: 24),
        decoration: BoxDecoration(
            color: Colors.blue,
            gradient: LinearGradient(
                begin: Alignment.bottomRight,
                end: Alignment.topLeft,
                colors: [Colors.black87, Colors.black54.withOpacity(0)])),
        child: Stack(
          children: <Widget>[
            Positioned(
              top: 50,
              right: 20,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: <Widget>[
                  Text(
                    i,
                    style: TextStyle(
                        fontSize: 35,
                        color: Colors.white,
                        fontWeight: FontWeight.w500),
                  ),
                  Text("/$length",
                      style: TextStyle(fontSize: 18, color: Colors.white))
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                FadeAnimation(
                  child: Text(
                    title,
                    style: TextStyle(
                        fontSize: 48,
                        color: Colors.white,
                        fontWeight: FontWeight.w500),
                  ),
                  delay: 0,
                ),
                FadeAnimation(
                  delay: 200,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Row(
                        children: listStar,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: Text(
                          star + ".0",
                          style:
                              TextStyle(color: Colors.grey[200], fontSize: 18),
                        ),
                      ),
                      Text("/($count)",
                          style: TextStyle(
                              color: Colors.white.withOpacity(.5),
                              fontWeight: FontWeight.w500,
                              fontSize: 12))
                    ],
                  ),
                ),
                FadeAnimation(
                  delay: 400,
                  child: Text(description,
                      style: TextStyle(
                          height: 2.2,
                          color: Colors.white.withOpacity(.7),
                          fontWeight: FontWeight.w500)),
                ),
                FadeAnimation(
                  delay: 600,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 18),
                    child: Text(
                      "READ MORE",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class FadeAnimation extends StatelessWidget {
  FadeAnimation({Key key, this.delay, this.child});

  final double delay;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final tween = MultiTrackTween([
      Track('opacity')
          .add(Duration(milliseconds: 300), Tween(begin: 0.0, end: 1.0)),
      Track('translateY').add(
          Duration(milliseconds: 300), Tween(begin: 100.0, end: 0.0),
          curve: Curves.easeOut)
    ]);

    return ControlledAnimation(
      delay: Duration(milliseconds: (500 + delay).round()),
      duration: tween.duration,
      tween: tween,
      child: child,
      builderWithChild: (context, child, animation) => Opacity(
        opacity: animation['opacity'],
        child: Transform.translate(
          offset: Offset(0, animation['translateY']),
          child: child,
        ),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterui100day/File100Day/Day_8/FadeAnimation.dart';
import 'package:flutterui100day/File100Day/Day_9/ListEvent.dart';
import 'package:page_transition/page_transition.dart';

class Day9 extends StatefulWidget {
  @override
  _Day9State createState() => _Day9State();
}

class _Day9State extends State<Day9> with TickerProviderStateMixin {
  AnimationController _scaleController;
  Animation _scale;
  bool isYellow = true;

  @override
  void initState() {
    super.initState();
    _scaleController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 400));

    _scale = Tween(begin: 1.0, end: 22.0).animate(_scaleController);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _scaleController.reverse();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/JPEG/landscape6.jpg"),
                fit: BoxFit.cover)),
        child: Container(
          padding: EdgeInsets.all(32),
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.black, Colors.black.withOpacity(.3)],
                  begin: Alignment.bottomRight)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FadeAnimation(
                isX: false,
                delay: 0,
                child: Text(
                  "Find the bast location near you",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.w500),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              FadeAnimation(
                isX: false,
                delay: 200,
                child: Text(
                  "Let us find an event for you",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.w100),
                ),
              ),
              SizedBox(
                height: 180,
              ),
              FadeAnimation(
                  isX: false,
                  delay: 400,
                  child: AnimatedBuilder(
                    animation: _scaleController,
                    builder: (context, child) {
                      return Transform.scale(
                        scale: _scale.value,
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.amber,
                              borderRadius: BorderRadius.circular(40)),
                          child: FlatButton(
                            padding: EdgeInsets.symmetric(
                                horizontal: 40, vertical: 20),
                            onPressed: () {
                              _scaleController.forward().then((value) =>
                                  Navigator.push(
                                      context,
                                      PageTransition(
                                          type: PageTransitionType.fade,
                                          duration:
                                              Duration(milliseconds: 400),
                                          child: ListEvent())));
                            },
                            child: Row(
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Find Event",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ),
                                Icon(
                                  Icons.arrow_forward,
                                  color: Colors.white,
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

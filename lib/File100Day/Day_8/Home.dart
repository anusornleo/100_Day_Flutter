import 'package:flutter/material.dart';
import 'package:flutterui100day/File100Day/Day_8/FadeAnimation.dart';
import 'package:flutterui100day/File100Day/Day_8/Login.dart';
import 'package:page_transition/page_transition.dart';

class Day8 extends StatefulWidget {
  @override
  _Day8State createState() => _Day8State();
}

class _Day8State extends State<Day8> with TickerProviderStateMixin {
  AnimationController _scaleAnimationController;
  AnimationController _expandAnimationController;
  AnimationController _moveCircleAnimationController;
  AnimationController _scaleFullAnimationController;

  Animation _scaleAnimation;
  Animation _expandAnimation;
  Animation _moveCircleAnimation;
  Animation _scaleFullAnimation;

  @override
  void initState() {
    super.initState();

    _scaleAnimationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 100));

    _expandAnimationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));

    _moveCircleAnimationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 700));

    _scaleFullAnimationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 700));

    _scaleAnimation =
        Tween(begin: 1.0, end: 0.9).animate(_scaleAnimationController);
    _expandAnimation =
        Tween(begin: 80.0, end: 300.0).animate(_expandAnimationController);
    _moveCircleAnimation =
        Tween(begin: 10.0, end: 225.0).animate(_moveCircleAnimationController);
    _scaleFullAnimation =
        Tween(begin: 1.0, end: 30.0).animate(_scaleFullAnimationController);
  }

  bool showArrow = true;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _scaleFullAnimationController.reverse().then(
      (value) {
        _expandAnimationController.reverse();

      },
    );
    _moveCircleAnimationController.reverse();
    setState(() {
      showArrow = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        padding: EdgeInsets.all(32),
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.teal.withOpacity(.2), Colors.black],
              begin: Alignment.topRight),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                FadeAnimation(
                  isX: false,
                  delay: 0,
                  child: Text(
                    "Welcome",
                    style: TextStyle(fontSize: 42, color: Colors.white),
                  ),
                ),
                FadeAnimation(
                  isX: false,
                  delay: 100,
                  child: Text(
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 200,
            ),
            FadeAnimation(
              isX: false,
              delay: 1000,
              child: AnimatedBuilder(
                animation: _scaleAnimationController,
                builder: (context, child) {
                  return Transform.scale(
                      scale: _scaleAnimation.value,
                      child: AnimatedBuilder(
                        animation: _expandAnimationController,
                        builder: (context, child) {
                          return AnimatedBuilder(
                            animation: _moveCircleAnimation,
                            builder: (context, child) {
                              return Stack(
                                children: <Widget>[
                                  Container(
                                    padding: EdgeInsets.all(10),
                                    width: _expandAnimation.value,
                                    height: 80,
                                    decoration: BoxDecoration(
                                        color: Colors.teal.withOpacity(.5),
                                        borderRadius: BorderRadius.circular(40)),
                                  ),
                                  Positioned(
                                    top: 10,
                                    left: _moveCircleAnimation.value,
                                    child: InkWell(
                                      onTap: () {
                                        _scaleAnimationController
                                            .forward()
                                            .then((value) {
                                          _scaleAnimationController.reverse();
                                          _expandAnimationController
                                              .forward()
                                              .then((value) =>
                                                  _moveCircleAnimationController
                                                      .forward()
                                                      .then((value) {
                                                    setState(() {
                                                      showArrow = false;
                                                    });
                                                    _scaleFullAnimationController
                                                        .forward()
                                                        .then((value) {
                                                      Navigator.push(
                                                          context,
                                                          PageTransition(
                                                              type:
                                                                  PageTransitionType
                                                                      .fade,
                                                              duration: Duration(
                                                                  milliseconds:
                                                                      500),
                                                              child: Login()));
                                                    });
                                                  }));
                                        });
                                      },
                                      child: AnimatedBuilder(
                                        animation: _scaleFullAnimationController,
                                        builder: (context, child) {
                                          return Transform.scale(
                                            scale: _scaleFullAnimation.value,
                                            child: Container(
                                              height: 60,
                                              width: 60,
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: Colors.teal),
                                              child: Center(
                                                child: AnimatedOpacity(
                                                  opacity: showArrow ? 1 : 0,
                                                  duration:
                                                      Duration(milliseconds: 400),
                                                  child: Icon(
                                                    Icons.arrow_forward_ios,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                      ));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

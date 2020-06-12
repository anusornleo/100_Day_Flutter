import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutterui100day/File100Day/Day_6/Dashboard.dart';
import 'package:page_transition/page_transition.dart';
import 'package:animator/animator.dart';

class Day6 extends StatefulWidget {
  @override
  _Day6State createState() => _Day6State();
}

class _Day6State extends State<Day6> with TickerProviderStateMixin {
  AnimationController _animationController;
  Animation<double> _animation;
  PageController _pageController;

  @override
  void initState() {
    super.initState();

    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));

    _animation =
        Tween<double>(begin: 1.0, end: 27.0).animate(_animationController);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _animationController.reverse();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/JPEG/exercise.jpg'),
                fit: BoxFit.cover)),
        child: Container(
          padding: EdgeInsets.all(32),
          decoration: BoxDecoration(
              gradient: LinearGradient(
            colors: [
              Colors.black.withOpacity(.5),
              Colors.black.withOpacity(.2)
            ],
          )),
          child: SafeArea(
            child: Container(
              height: double.infinity,
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 30),
                    child: Text(
                      "Exercise 1",
                      style: TextStyle(
                        fontSize: 48,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Text(
                    "15",
                    style: TextStyle(
                      fontSize: 40,
                      color: Colors.amber,
                    ),
                  ),
                  Text(
                    "Minutes",
                    style: TextStyle(
                      fontSize: 34,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    "3",
                    style: TextStyle(
                      fontSize: 40,
                      color: Colors.amber,
                    ),
                  ),
                  Text(
                    "Exercises",
                    style: TextStyle(
                      fontSize: 34,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 132,
                  ),
                  Center(
                    child: Container(
                      width: MediaQuery.of(context).size.width - 50,
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          "Start in Morning \n with You",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 30, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 32,
                  ),
                  Center(
                    child: ScaleTransition(
                      scale: _animation,
                      child: Animator<double>(
                        duration: Duration(seconds: 1),
                        tween: Tween<double>(begin: 6.0, end: 17.0),
                        cycles: 0,
                        builder:(context,animation,child) {
                          return Container(
                            padding: EdgeInsets.all(animation.value),
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                                color: Colors.amber.withOpacity(0.5),
                                shape: BoxShape.circle),
                            child: GestureDetector(
                              onTap: () {
                                _animationController.forward().then((value) =>
                                    Navigator.push(
                                        context,
                                        PageTransition(
                                            type: PageTransitionType.fade,
                                            duration: Duration(milliseconds: 500),
                                            child: Dashboard())));
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.amber, shape: BoxShape.circle),
                              ),
                            ),
                          );
                        }
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

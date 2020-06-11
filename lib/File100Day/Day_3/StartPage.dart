import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutterui100day/File100Day/Day_3/FadeAnimation.dart';
import 'package:flutterui100day/File100Day/Day_3/Home.dart';
import 'package:page_transition/page_transition.dart';

class Day3 extends StatefulWidget {
  @override
  _Day3State createState() => _Day3State();
}

class _Day3State extends State<Day3> with TickerProviderStateMixin {
  AnimationController _animationController;
  Animation<double> _animation;

  bool showText = true;

  @override
  void didUpdateWidget(Day3 oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
  }

  @override
  void initState() {
    super.initState();
    showText = true;
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));

    _animation =
        Tween<double>(begin: 1.0, end: 22.0).animate(_animationController);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/JPEG/salmon.jpg"),
                fit: BoxFit.cover)),
        child: Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
              color: Colors.blue,
              gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  colors: [Colors.black, Colors.black.withOpacity(0)])),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              FadeAnimation(
                  isX: true,
                  delay: 0,
                  child: Text(
                    "New Salmon from Norway",
                    style: TextStyle(
                        fontSize: 50,
                        color: Colors.white,
                        fontWeight: FontWeight.w600),
                  )),
              FadeAnimation(
                isX: true,
                delay: 100,
                child: Text(
                  "New Salmon from Norway\n in order now",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
              SizedBox(
                height: 80,
              ),
              FadeAnimation(
                isX: true,
                delay: 200,
                child: Stack(
                  children: <Widget>[
                    ScaleTransition(
                      scale: _animation,
                      child: Container(
                        height: 54,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            gradient: LinearGradient(colors: [
                              Color(0xfff46b45),
                              Color(0xffeea849)
                            ])),
                      ),
                    ),
                    AnimatedOpacity(
                      opacity: showText ? 1.0 : 0.0,
                      duration: Duration(milliseconds: 500),
                      child: FlatButton(
                        onPressed: () {
                          setState(() {
                            showText = false;
                          });
                          _animationController.forward().then((value) {
                            return Navigator.push(
                                context,
                                PageTransition(
                                    type: PageTransitionType.fade,
                                    duration: Duration(milliseconds: 500),
                                    child: HomeDay3()));
                          });
                        },
                        child: SizedBox(
                          height: 55,
                          width: double.infinity,
                          child: Center(
                            child: Text(
                              "Start",
                              style: TextStyle(color: Colors.white, fontSize: 22),
                            ),
                          ),
                        ),
                      ),
                    ),

                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(28),
                child: Center(
                  child: Text("Delivery 24/7 to your door",
                      style: TextStyle(
                          color: Colors.white.withOpacity(.5), fontSize: 14)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _animationController.reverse();
    showText = true;
  }

//  @override
//  void deactivate() {
//    super.deactivate();
//    print("ddddd2");
//  }
//
//  @override
//  void setState(VoidCallback fn) {
//    print("ddddd3");
//  }
//
//  @override
//  void reassemble() {
//    super.reassemble();
//    print("ddddd4");
//  }
}

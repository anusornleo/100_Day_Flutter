import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterui100day/File100Day/Day_12/FadeAnimation.dart';
import 'package:flutterui100day/File100Day/Day_16/Pages/Home.dart';
import 'package:page_transition/page_transition.dart';

class Day16 extends StatefulWidget {
  @override
  _Day16State createState() => _Day16State();
}

class _Day16State extends State<Day16> with TickerProviderStateMixin {
  AnimationController _scaleController;
  Animation _scale;
  bool showText = true;

  @override
  void initState() {
    super.initState();
    _scaleController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));

    _scale = Tween(begin: 1.0, end: 25.0).animate(_scaleController);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/JPEG/shopwallpaper.jpg"),
              fit: BoxFit.cover),
        ),
        child: Container(
          padding: EdgeInsets.all(32),
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.black87, Colors.black38],
                  begin: Alignment.bottomRight)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FadeAnimation(
                isX: false,
                delay: 0,
                child: Text(
                  "New Brand in Shop",
                  style: TextStyle(fontSize: 48, color: Colors.white),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              FadeAnimation(
                isX: false,
                delay: 200,
                child: Text(
                  "Let's start with winter sale.Check it now",
                  style: TextStyle(color: Colors.white, fontSize: 22),
                ),
              ),
              SizedBox(
                height: 80,
              ),
              FadeAnimation(
                isX: false,
                delay: 600,
                child: AnimatedBuilder(
                  animation: _scaleController,
                  builder: (context, child) {
                    return Transform.scale(
                      scale: _scale.value,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            showText = false;
                          });
                          _scaleController.forward().then((value) =>
                              Navigator.push(
                                  context,
                                  PageTransition(
                                      type: PageTransitionType.fade,
                                      duration: Duration(milliseconds: 400),
                                      child: HomeDay16())));
                        },
                        child: Container(
                          padding: EdgeInsets.all(16),
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30)),
                          child: Center(
                            child: AnimatedOpacity(
                              opacity: showText?1.0:0.0,
                              duration: Duration(milliseconds: 400),
                              child: Text(
                                "Next",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

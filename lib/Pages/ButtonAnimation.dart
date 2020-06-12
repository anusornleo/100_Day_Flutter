import 'package:flutter/material.dart';

class ButtonAnimation extends StatefulWidget {
  final Color color;
  final Color secondColor;

  const ButtonAnimation(
      {Key key, this.color = Colors.amber, this.secondColor = Colors.orange})
      : super(key: key);

  @override
  _ButtonAnimationState createState() => _ButtonAnimationState();
}

class _ButtonAnimationState extends State<ButtonAnimation>
    with TickerProviderStateMixin {

  // download tap reduce size to 0
  AnimationController _animationController;
  // button scale x1.1
  AnimationController _scaleAnimationController;
  // fade download slide form 0 to 200
  AnimationController _fadeAnimationController;

  Animation _animation;
  Animation _scaleAnimation;
  Animation _fadeAnimation;

  bool loadSuccess = false;

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));

    _scaleAnimationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 70));

    _fadeAnimationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 3000));
    super.initState();

    _animation = Tween(begin: 50.0, end: 0.0).animate(_animationController);

    _scaleAnimation =
        Tween(begin: 1.0, end: 1.1).animate(_scaleAnimationController);

    _fadeAnimation =
        Tween(begin: 0.0, end: 200.0).animate(_fadeAnimationController);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        AnimatedBuilder(
          animation: _scaleAnimationController,
          builder: (context, child) {
            return Transform.scale(
              scale: _scaleAnimation.value,
              child: InkWell(
                onTap: () {
                  _scaleAnimationController.forward().then((value) =>
                      _scaleAnimationController
                          .reverse()
                          .then((value) => _animationController.forward()));

                  _fadeAnimationController.forward().then((value) {
                    setState(() {
                      loadSuccess = true;
                    });
                  });
                },
                child: Container(
                  width: 200,
                  height: 50,
                  decoration: BoxDecoration(
                      color: widget.secondColor,
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Align(
                          child: loadSuccess
                              ? Icon(
                                  Icons.check,
                                  color: Colors.white,
                                )
                              : Text(
                                  "Download",
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.white),
                                ),
                        ),
                      ),
                      AnimatedBuilder(
                        animation: _animationController,
                        builder: (context, child) {
                          return Container(
                              decoration: BoxDecoration(
                                color: widget.color,
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(10),
                                    bottomRight: Radius.circular(10)),
                              ),
                              width: _animation.value,
                              height: 50,
                              child: Icon(
                                Icons.arrow_downward,
                                color: Colors.white,
                              ));
                        },
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        ),
        AnimatedBuilder(
          animation: _fadeAnimationController,
          builder: (context, child) {
            return Positioned(
              top: 0,
              left: 0,
              width: _fadeAnimation.value,
              height: 50,
              child: Container(
                color: loadSuccess
                    ? Colors.transparent
                    : Colors.white.withOpacity(.5),
              ),
            );
          },
        )
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

class FadeAnimation extends StatelessWidget {
  final double delay;
  final Widget child;
//  MultiTrackTween tween;
  bool isX;
  final double start = 120.0;
   double end = 0.0;

  FadeAnimation({@required this.delay,
    @required this.child,
//    @required this.tween,
    @required this.isX});



  final tween = MultiTrackTween([
    Track('opacity').add(Duration(milliseconds: 500),
        Tween(begin: 0.0, end: 1.0)),
    Track("translateX").add(Duration(milliseconds: 500),
        Tween(begin: -120.0, end: 0.0),
        curve: Curves.easeOut)
  ]);

  @override
  Widget build(BuildContext context) {
    return ControlledAnimation(
        delay: Duration(milliseconds: (300 + delay).round()),
        duration: tween.duration,
        tween: tween,
        child: child,
        builderWithChild: (context, child, animation) {
          return Opacity(
            opacity: animation["opacity"],
            child: Transform.translate(
              offset: isX
                  ? Offset(animation["translateX"], 0)
                  : Offset(0, animation["translateX"]),
              child: child,
            ),
          );
        });
  }
}

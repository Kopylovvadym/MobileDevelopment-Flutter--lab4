import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();

}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin{

  AnimationController controller;
  Animation curve;
  Animation curve2;
  Animation curve3;
  Animation<double> sizeAnimation;
  Animation<double> sizeAnimation2;
  Animation<double> sizeAnimation3;
  Animation<double> opacityAnimation;
  Animatable<Color> colorAnimation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(duration: Duration(seconds: 3), vsync: this);
    curve = CurvedAnimation(parent: controller, curve: Curves.easeIn);
    curve2 = CurvedAnimation(parent: controller, curve: Curves.bounceIn);
    curve3 = CurvedAnimation(parent: controller, curve: Curves.easeOut);
    sizeAnimation = Tween<double>(begin: 0, end: 255).animate(curve)
      ..addListener(() {
        setState(() {// The state that has changed here is the animation object’s value.
        });
      });
    sizeAnimation2 = Tween<double>(begin: 0, end: 280).animate(curve2)
      ..addListener(() {
        setState(() {// The state that has changed here is the animation object’s value.
        });
      });
    sizeAnimation3 = Tween<double>(begin: 0, end: 230).animate(curve3)
      ..addListener(() {
        setState(() {// The state that has changed here is the animation object’s value.
        });
      });
    opacityAnimation = Tween<double>(begin: 0.1, end: 1).animate(controller)
      ..addListener(() {
        setState(() {// The state that has changed here is the animation object’s value.
        });
      });
    colorAnimation = TweenSequence<Color>(
        [
          TweenSequenceItem(
            weight: 1.0,
            tween: ColorTween(
              begin: Colors.cyan,
              end: Colors.greenAccent,
            ),)
        ]);
    controller.forward();
    controller.repeat(reverse: true);
  }

/*  @override
  void dispose() {
       controller.dispose();
       super.dispose();
  }*/

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Flutter Demo',
      home: Container(
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                margin: EdgeInsets.only(top: 25),
                width: sizeAnimation.value,
                height: 50,
                color: Colors.red.withOpacity(opacityAnimation.value),
              ),),
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                margin: EdgeInsets.only(top: 25),
                width: sizeAnimation2.value,
                height: 50,
                color: Colors.yellow,
              )
              , ),
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                margin: EdgeInsets.only(top: 25),
                width: sizeAnimation3.value,
                height: 50,
                color: Colors.green,
              ),),
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                margin: EdgeInsets.only(top: 25),
                width: sizeAnimation.value,
                height: 50,
                color: colorAnimation.evaluate(AlwaysStoppedAnimation(controller.value)),
              ),),
          ],
        ),

      ),
    );
  }
}
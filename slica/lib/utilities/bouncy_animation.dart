import 'package:flutter/material.dart';


class BouncyAnimation extends PageRouteBuilder{
  final Widget widget;

  BouncyAnimation({this.widget}):super(
    transitionDuration: Duration(seconds: 1),
    transitionsBuilder: (BuildContext context,Animation<double> animation,Animation<double> secAnimation,Widget child ){
      animation = CurvedAnimation(parent: animation,curve: Curves.decelerate);

      return ScaleTransition(scale: animation,alignment: Alignment.center,child: child,);
    },
    pageBuilder: (BuildContext context,Animation<double> animation,Animation<double> secAnimation){
      return widget;
    }
  );

}
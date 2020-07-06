import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RouteShortcut {
  PushReplacement(BuildContext context, Object page) {
    Navigator.pushReplacement(context, CupertinoPageRoute(builder: (context) => page));
  }
  Push(BuildContext context, Object page) {
    Navigator.push(context, CupertinoPageRoute(builder: (context) => page));
  }
}
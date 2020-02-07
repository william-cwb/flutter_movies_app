import 'package:flutter/material.dart';

class Nav {
  static push(BuildContext context, Widget page, {isReplace = false}) {
    isReplace
        ? Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (c) => page))
        : Navigator.push(context, MaterialPageRoute(builder: (c) => page));
  }

  static pop(BuildContext context) {
    Navigator.of(context).pop();
  }
}

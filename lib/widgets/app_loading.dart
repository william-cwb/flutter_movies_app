import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppLoading {
  static show() {
    return Center(
      child: Platform.isIOS
          ? CupertinoActivityIndicator()
          : CircularProgressIndicator(),
    );
  }
}

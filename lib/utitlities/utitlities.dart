// ignore_for_file: prefer_const_constructors

import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:goup/views/utilities/utilities.dart';

class Utilities {
  toast(msg) {
    Fluttertoast.showToast(
      msg: msg.toString(),
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 5,
      backgroundColor: Color(0x93000000),
      textColor: Colors.white,
      // fontSize: 16.0
    );
  }
}

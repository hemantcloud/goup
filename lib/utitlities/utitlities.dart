import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:goup/views/utilities/utilities.dart';

class Utilities {
  toast(msg) {
    Fluttertoast.showToast(
      msg: msg.toString(),
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 5,
      backgroundColor: AppColors.primary,
      textColor: Colors.white,
      // fontSize: 16.0
    );
  }
}

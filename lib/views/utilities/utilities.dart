// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
class AppColors {
  static const Color primary = Color(0xFF6765C8); // AppColors.primaryColor
  static const Color secondary = Color(0xFFAEAEB2); // AppColors.secondaryColor
  static const Color secondary2 = Color(0xFF828282); // AppColors.secondaryColor2
  static const Color text = Color(0xFF838383); // AppColors.text
  static const Color text2 = Color(0xFF6B7280); // AppColors.text2
  static const Color text3 = Color(0xFFA4A4A6); // AppColors.text3
  static const Color text4 = Color(0xFF7C7C7C); // AppColors.text4
  static const Color black = Color(0xFF161C2A); // AppColors.color161C2A
  static const Color blue = Color(0xFF007FFF); // AppColors.blue
  static const Color white = Color(0xFFFFFFFF); // AppColors.white
  static const Color bg = Color(0xFFF3F3F3); // AppColors.bg
  static const Color red = Colors.red; // AppColors.red
  static const Color red2 = Color(0xFFE84F41); // AppColors.red2
  static const Color yellow = Color(0xFFFBBC04); // AppColors.yellow
}
class AppDate{
  String toDate(String bigTime) {
    DateTime tempDate = DateFormat("yyyy-MM-dd' '00:00:00.000").parse(bigTime);
    // var dateFormat = DateFormat("MM-dd-yyyy"); // you can change the format here
    var dateFormat = DateFormat.d(); // you can change the format here
    var utcDate = dateFormat.format(tempDate); // pass the UTC time here
    var localDate = dateFormat.parse(utcDate, false).toLocal().toString();
    String createdDate = dateFormat.format(DateTime.parse(localDate));
    // print("formated date is------------$createdDate");
    return createdDate;
  }
  String toMonth(String bigTime) {
    DateTime tempDate = DateFormat("yyyy-MM-dd' '00:00:00.000").parse(bigTime);
    // var dateFormat = DateFormat("MM-dd-yyyy"); // you can change the format here
    var dateFormat = DateFormat.M(); // you can change the format here
    var utcDate = dateFormat.format(tempDate); // pass the UTC time here
    var localDate = dateFormat.parse(utcDate, false).toLocal().toString();
    String createdDate = dateFormat.format(DateTime.parse(localDate));
    // print("formated date is------------$createdDate");
    return createdDate;
  }
  String toYear(String bigTime) {
    DateTime tempDate = DateFormat("yyyy-MM-dd' '00:00:00.000").parse(bigTime);
    // var dateFormat = DateFormat("MM-dd-yyyy"); // you can change the format here
    var dateFormat = DateFormat.y(); // you can change the format here
    var utcDate = dateFormat.format(tempDate); // pass the UTC time here
    var localDate = dateFormat.parse(utcDate, false).toLocal().toString();
    String createdDate = dateFormat.format(DateTime.parse(localDate));
    // print("formated date is------------$createdDate");
    return createdDate;
  }
}
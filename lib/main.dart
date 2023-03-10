// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:goup/test.dart';
import 'package:goup/views/dashboard.dart';
import 'package:goup/views/inbox/chat.dart';
import 'package:goup/views/splash2.dart';
import 'package:goup/views/utilities/utilities.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Goup',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: AppColors.primary,
          secondary: AppColors.secondary,
          background: Colors.white
        ),
        fontFamily: 'Sora',
      ),
      home: Splash2(),
      // home: Test(),
      // home: Interests(),
      // home: Test(),
      //  home: Dashboard(bottomIndex: 0),
      // home: Splash(),
    );
  }
}
// ignore_for_file: prefer_const_constructors
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:goup/views/authentication/login.dart';
import 'package:goup/views/onboarding_screens/onboarding.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark,);
    SystemChannels.textInput.invokeMethod('TextInput.hide');
    return Scaffold(
      body: InkWell(
        onTap: () async {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          Navigator.pushReplacement(
            context,
            PageTransition(
              type: PageTransitionType.rightToLeftWithFade,
              alignment: Alignment.topCenter,
              duration: Duration(milliseconds: 1000),
              isIos: true,
              child:
              prefs.getBool('initScreen') == null || prefs.getBool('initScreen') == false || prefs.getBool('initScreen') == '' ?
              Onboarding() : Login(),
            ),
          );
          prefs.setBool('initScreen', true);
          setState(() {});
        },
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                'assets/images/splash_image.png',
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: null,
        ),
      ),
    );
  }
}

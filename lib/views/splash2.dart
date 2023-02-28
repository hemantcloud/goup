// ignore_for_file: prefer_const_constructors, use_build_context_synchronously, unrelated_type_equality_checks
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:goup/views/authentication/login.dart';
import 'package:goup/views/onboarding_screens/onboarding.dart';
import 'package:goup/views/utilities/utilities.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Splash2 extends StatefulWidget {
  const Splash2({Key? key}) : super(key: key);

  @override
  State<Splash2> createState() => _Splash2State();
}

class _Splash2State extends State<Splash2> {
  bool initScreen = false;
  @override
  Widget build(BuildContext context) {
    // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark,);
    SystemChannels.textInput.invokeMethod('TextInput.hide');
    return Scaffold(
      backgroundColor: AppColors.primary,
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
        child: Stack(
          children: [
            Positioned(
              bottom: 0,
              left: 0,
              child: SvgPicture.asset('assets/icons/goup_left_design.svg',height: MediaQuery.of(context).size.height * 0.55,),
            ),
            Positioned(
              top: 0,
              right: 0,
              child: SvgPicture.asset('assets/icons/goup_right_design.svg',height: MediaQuery.of(context).size.height * 0.7,),
            ),
            Center(
              child: Padding(
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.width,
                  bottom: MediaQuery.of(context).size.width * 0.05,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SvgPicture.asset(
                      'assets/icons/goup.svg',
                      width: 150.0,
                    ),
                    Text(
                      'Tap anywhere to start',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

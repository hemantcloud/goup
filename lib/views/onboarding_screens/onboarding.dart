// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:goup/views/authentication/login.dart';
import 'package:goup/views/onboarding_screens/page_1.dart';
import 'package:goup/views/onboarding_screens/page_2.dart';
import 'package:goup/views/onboarding_screens/page_3.dart';
import 'package:goup/views/onboarding_screens/page_4.dart';
import 'package:goup/views/utilities/utilities.dart';
import 'package:page_transition/page_transition.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Onboarding extends StatefulWidget {
  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  final _controller = PageController();
  int? _currentIndex;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(bottom: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // page view
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.8,
              child: PageView(
                controller: _controller,
                onPageChanged: (index) {
                  _currentIndex = index;
                  // print('_currentIndex index is---------$_currentIndex');
                  setState(() {});
                },
                reverse: false,
                children: [
                  Page1(),
                  Page2(),
                  Page3(),
                  Page4(),
                ],
              ),
            ),

            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  PageTransition(
                    type: PageTransitionType.rightToLeftWithFade,
                    alignment: Alignment.topCenter,
                    duration: Duration(milliseconds: 1000),
                    isIos: true,
                    child: Login(),
                  ),
                );
              },
              child: Container(
                margin: EdgeInsets.only(left: 20.0,right: 20.0),
                height: 60.0,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
                child: Text(
                  'Let’s continue',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
            Stack(
              children: [
                SmoothPageIndicator(
                  onDotClicked: (index) {
                    _controller.nextPage(
                      duration: Duration(milliseconds: 500),
                      curve: Curves.easeIn,
                    );
                  },
                  controller: _controller,
                  count: 4,
                  effect: ExpandingDotsEffect(
                    radius: 8,
                    spacing: 6,
                    dotHeight: 10,
                    dotWidth: 10,
                    activeDotColor: AppColors.primary,
                    dotColor: Color.fromRGBO(103, 101, 200, 0.32),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

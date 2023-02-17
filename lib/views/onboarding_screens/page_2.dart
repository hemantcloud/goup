// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:goup/views/authentication/login.dart';
import 'package:goup/views/utilities/utilities.dart';
import 'package:page_transition/page_transition.dart';

class Page2 extends StatelessWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.06,
                  bottom: MediaQuery.of(context).size.height * 0.07
              ),
              child: InkWell(
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
                child: SvgPicture.asset(
                    'assets/icons/skip.svg'
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.05),
              child: Image.asset(
                'assets/images/store.png',
                // width: MediaQuery.of(context).size.width * 0.4,
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Create your own store & take it to the top',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Lorem ipsum dolor sit amet, consectetur adicing elit, sed do eiusmod tempor.',
                style: TextStyle(color: AppColors.secondary),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

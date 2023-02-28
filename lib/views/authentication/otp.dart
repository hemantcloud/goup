// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:async';
import 'dart:developer';

import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_countdown_timer/countdown_timer_controller.dart';
import 'package:flutter_countdown_timer/current_remaining_time.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:goup/utitlities/utitlities.dart';
import 'package:goup/views/authentication/interests.dart';
import 'package:goup/views/authentication/login.dart';
import 'package:goup/views/authentication/personal_info.dart';
import 'package:goup/views/utilities/utilities.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:page_transition/page_transition.dart';

class Otp extends StatefulWidget {
  const Otp({Key? key}) : super(key: key);

  @override
  State<Otp> createState() => _OtpState();
}

class _OtpState extends State<Otp> {
  OtpFieldController otpController = OtpFieldController();
  String countrycode = "+91";
  String? pin;
  late CountdownTimerController controller;
  int endTime = DateTime.now().millisecondsSinceEpoch + Duration(seconds: 30).inMilliseconds;

  @override
  void initState() {
    super.initState();
    controller = CountdownTimerController(endTime: endTime, onEnd: onEnd);
  }

  void onEnd() {
    print('onEnd');
  }
  Future <void> resend() async {
    int endTime = DateTime.now().millisecondsSinceEpoch + Duration(seconds: 30).inMilliseconds;
    controller = CountdownTimerController(endTime: endTime, onEnd: onEnd);
    setState(() {});
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          // statusBarColor: Colors.white,
          statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
          statusBarBrightness: Brightness.light, // For iOS (dark icons)
        ),
        toolbarHeight: 80.0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        flexibleSpace: Padding(
          padding: EdgeInsets.only(top: 40.0, bottom: 10.0),
          child: Container(
            height: 60.0,
            margin: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 0.0),
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.transparent, width: 0.0),
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () => Navigator.of(context).pop(),
                  highlightColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  child: Container(
                    width: 24.0,
                    height: 24.0,
                    child: SvgPicture.asset('assets/icons/back.svg'),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Center(
                    child: Text(
                      'Verification',
                      style: TextStyle(
                        color: AppColors.black,
                        fontSize: 20.0
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.06,),
              child: Text(
                'Enter the OTP Verification Code',
                style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w600,
                    color: AppColors.black
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Please enter the 4 digit code that given to your phone number.',
                style: TextStyle(color: AppColors.secondary),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 40.0),
              child: OTPTextField(
                controller: otpController,
                length: 4,
                width: MediaQuery.of(context).size.width,
                fieldWidth: 50,
                style: TextStyle(fontSize: 17),
                textFieldAlignment: MainAxisAlignment.spaceAround,
                fieldStyle: FieldStyle.box,
                onCompleted: (otp) {
                  print("Completed: " + otp);
                  pin = otp;
                  print(otp.runtimeType);
                },
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(top: 20.0),
              child: Row(
                children: [
                  CountdownTimer(
                    controller: controller,
                    widgetBuilder: (_, CurrentRemainingTime? time) {
                      if (time == null) {
                        return
                          InkWell(
                            onTap: () {
                              resend();
                            },
                            child: Row(
                              children: [
                                Text(
                                  'Now you can ',style: TextStyle(color: AppColors.black),
                                ),
                                Text(
                                  'Resend',style: TextStyle(color: AppColors.primary),
                                ),
                              ],
                            ),
                          );
                      }
                      return Row(
                        children: [
                          Text(
                              'Resend code in ',style: TextStyle(color: AppColors.black),
                          ),
                          Text(
                              '${time.sec} s',style: TextStyle(color: AppColors.blue),
                          ),
                        ],
                      );
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      bottomSheet: InkWell(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () {
          print('pin is ------------$pin');
          print('type is ------------${pin.runtimeType}');
          /*if (otp.isEmpty) {
            Utilities().toast("Please Enter Otp.");
          } else if (otp.length < 4 || otp.length > 4) {
            print('otp is ----------${otp.toString()}');
            Utilities().toast("Please Enter Valid Otp.");
          }else {
            Navigator.push(
              context,
              PageTransition(
                type: PageTransitionType.rightToLeftWithFade,
                alignment: Alignment.topCenter,
                duration: Duration(milliseconds: 1000),
                isIos: true,
                child: PersonalInfo(),
              ),
            );
          }*/
        },
        child: Container(
          margin: EdgeInsets.fromLTRB(20.0,0.0,20.0,20.0),
          height: 60.0,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: AppColors.primary,
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
          child: Text(
            'Confirm',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

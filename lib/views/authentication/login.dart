// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:goup/utitlities/utitlities.dart';
import 'package:goup/views/authentication/otp.dart';
import 'package:goup/views/dashboard.dart';
import 'package:goup/views/home/product_detail.dart';
import 'package:goup/views/home/profile_quick_view.dart';
import 'package:goup/views/utilities/utilities.dart';
import 'package:page_transition/page_transition.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var countrycodecontroller = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  String countrycode = "+91";
  @override
  Widget build(BuildContext context) {
    var categorList;
    var productList;
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          // statusBarColor: Colors.white,
          statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
          statusBarBrightness: Brightness.light, // For iOS (dark icons)
        ),
        // toolbarHeight: 80.0,
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
                Expanded(
                  flex: 1,
                  child: Center(
                    child: Text(
                      'Sign in',
                      style: TextStyle(
                        color: AppColors.black,
                        fontSize: 20.0
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      PageTransition(
                        type: PageTransitionType.rightToLeftWithFade,
                        alignment: Alignment.topCenter,
                        duration: Duration(milliseconds: 1000),
                        isIos: true,
                        child: Dashboard(bottomIndex: 0),
                      ),
                      (route) => false,
                    );
                  },
                  highlightColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  child: SvgPicture.asset('assets/icons/skip.svg'),
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
                'Welcome, you can choose how to log in',
                style: TextStyle(
                    fontSize: 20.0,
                    // fontWeight: FontWeight.w600,
                    color: AppColors.black
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Please put your phone number on the below field.',
                style: TextStyle(color: AppColors.secondary),
              ),
            ),
            Container(
              height: 60.0,
              margin: EdgeInsets.only(top: 40.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: Color(0xFFF1F1F3),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  InkWell(
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.3,
                      alignment: Alignment.center,
                      child: CountryCodePicker(
                        showFlag: true,
                        onChanged: (e) {
                          countrycode = e.dialCode.toString();
                          print('countrycode is ------------$countrycode');
                        },
                        initialSelection: 'IN',
                        favorite: ['+91', 'IN'],
                        showCountryOnly: false,
                        showOnlyCountryWhenClosed: false,
                        alignLeft: false,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: TextFormField(
                      controller: phoneController,
                      keyboardType: TextInputType.phone,
                      style: const TextStyle(fontSize: 14.0, color: AppColors.black),
                      buildCounter: (BuildContext context,{
                        required int currentLength,
                        int? maxLength,
                        required bool isFocused
                      }) => null,
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp("[0-9]")),
                      ],
                      cursorColor: AppColors.primary,
                      maxLength: 10,
                      decoration: InputDecoration(
                        hintText: 'Enter your mobile no.',
                        hintStyle: TextStyle(
                          color: Color(0xFFBCBCBC),
                          fontWeight: FontWeight.w500,
                        ),
                        border: InputBorder.none,
                        counterText: "",
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomSheet: InkWell(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () {
          String phone = phoneController.text;
          if (phone.isEmpty) {
            Utilities().toast("Please Enter Phone Number.");
          } else if (phone.length < 10 || phone.length > 10) {
            Utilities().toast("Please Enter Valid Phone Number.");
          }else {
            Navigator.push(
              context,
              PageTransition(
                type: PageTransitionType.rightToLeftWithFade,
                alignment: Alignment.topCenter,
                duration: Duration(milliseconds: 1000),
                isIos: true,
                child: Otp(),
              ),
            );
          }
        },
        child: Container(
          margin: EdgeInsets.fromLTRB(16.0,0.0,16.0,16.0),
          height: 50.0,
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

}

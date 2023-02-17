// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables


import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:goup/views/authentication/interests.dart';
import 'package:goup/views/authentication/otp.dart';
import 'package:goup/views/utilities/utilities.dart';
import 'package:intl/intl.dart';
import 'package:page_transition/page_transition.dart';
import 'package:flutter_multi_select_items/flutter_multi_select_items.dart';

class PersonalInfo extends StatefulWidget {
  const PersonalInfo({Key? key}) : super(key: key);

  @override
  State<PersonalInfo> createState() => _PersonalInfoState();
}

class _PersonalInfoState extends State<PersonalInfo> {
  bool isClicked = false;
  String? gender;
  DateTime selectedDate = DateTime.now();
  var dateController = TextEditingController();
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1970, 8),
      lastDate: DateTime(2101),
      keyboardType: TextInputType.datetime,
      currentDate: selectedDate,
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        // dateController.text = '${AppDate().toDate(selectedDate.toString())}/${AppDate().toMonth(selectedDate.toString())}/${AppDate().toYear(selectedDate.toString())}';
        String formattedDate = DateFormat('dd-MM-yyyy').format(selectedDate);
        dateController.text = formattedDate;
      });
    }
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
                    child: SvgPicture.asset('assets/icons/back.svg',),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Center(
                    child: Text(
                      'Personal information',
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
                'Please fill with your personal information',
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
                'Please enter your details',
                style: TextStyle(color: AppColors.secondary),
              ),
            ),
            Container(
              height: 60.0,
              margin: EdgeInsets.only(top: 40.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: Color(0xFFEAEAEB),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.11,
                    alignment: Alignment.center,
                    child: SvgPicture.asset('assets/icons/profile_unselected.svg',width: 16.0),
                  ),
                  Expanded(
                    flex: 1,
                    child: TextFormField(
                      style: const TextStyle(fontSize: 14.0, color: AppColors.black),
                      cursorColor: AppColors.primary,
                      decoration: myInputDecoration('Full name'),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20.0),
              child: Container(
                height: 50.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: Color(0xFFEAEAEB),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.11,
                      alignment: Alignment.center,
                      child: SvgPicture.asset('assets/icons/message.svg',width: 16.0),
                    ),
                    Expanded(
                      flex: 1,
                      child: TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        style: const TextStyle(fontSize: 14.0, color: AppColors.black),
                        cursorColor: AppColors.primary,
                        decoration: myInputDecoration('Email address'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20.0),
              child: Container(
                height: 50.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: Color(0xFFEAEAEB),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.11,
                      alignment: Alignment.center,
                      child: SvgPicture.asset('assets/icons/child.svg',width: 16.0),
                    ),
                    Expanded(
                      flex: 1,
                      child: TextFormField(
                        controller: dateController,
                        keyboardType: TextInputType.datetime,
                        style: const TextStyle(fontSize: 14.0, color: AppColors.black),
                        cursorColor: AppColors.primary,
                        decoration: myInputDecoration('Date of Birth'),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        _selectDate(context);
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.15,
                        alignment: Alignment.center,
                        child: SvgPicture.asset('assets/icons/date.svg',width: 18.0),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            /*Container(
              margin: EdgeInsets.only(top: 20.0),
              child: Container(
                height: 50.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: Color(0xFFEAEAEB),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.11,
                      alignment: Alignment.center,
                      child: SvgPicture.asset('assets/icons/gender.svg',width: 16.0),
                    ),
                    Expanded(
                      flex: 1,
                      child: TextFormField(
                        style: const TextStyle(fontSize: 14.0, color: AppColors.black),
                        cursorColor: AppColors.primary,
                        decoration: InputDecoration(
                          hintText: 'Sex',
                          hintStyle: TextStyle(
                            color: Color(0xFFBCBCBC),
                            fontWeight: FontWeight.w500,
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.15,
                      alignment: Alignment.center,
                      child: SvgPicture.asset('assets/icons/down.svg',width: 18.0),
                    ),
                  ],
                ),
              ),
            ),*/
            Container(
              margin: EdgeInsets.only(top: 20.0),
              child: InkWell(
                onTap: () {
                  isClicked = !isClicked;
                  setState(() {});
                },
                child: Image.asset(
                  'assets/images/gender_bar.png'
                ),
              ),
            ),
            isClicked == false ? Container() :
            Container(
              margin: EdgeInsets.only(top: 20.0),
              child: Container(
                height: 50.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: Color(0xFFEAEAEB),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 1,
                      child: InkWell(
                        onTap: () {
                          if(gender == null){
                            gender = 'Male';
                          } else if(gender == 'Female'){
                            gender = 'Male';
                          }
                          setState(() {});
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.15,
                          alignment: Alignment.center,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              gender == null ?
                              SvgPicture.asset('assets/icons/gender_unselected.svg') :
                              gender == 'Male' ?
                              Image.asset('assets/icons/gender_selected.png',width: 24.0,) :
                              SvgPicture.asset('assets/icons/gender_unselected.svg'),
                              SizedBox(width: 10.0),
                              Text('Male',style: TextStyle(color: AppColors.secondary),)
                            ],
                          ),
                        ),
                      ),
                    ),
                    SvgPicture.asset('assets/icons/separate_line.svg'),
                    Expanded(
                      flex: 1,
                      child: InkWell(
                        onTap: () {
                          if(gender == null){
                            gender = 'Female';
                          } else if(gender == 'Male'){
                            gender = 'Female';
                          }
                          setState(() {});
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.15,
                          alignment: Alignment.center,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              gender == null ?
                              SvgPicture.asset('assets/icons/gender_unselected.svg') :
                              gender == 'Female' ?
                              Image.asset('assets/icons/gender_selected.png',width: 24.0,) :
                              SvgPicture.asset('assets/icons/gender_unselected.svg'),
                              SizedBox(width: 10.0),
                              Text('Female',style: TextStyle(color: AppColors.secondary),)
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: InkWell(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () {
          Navigator.push(
            context,
            PageTransition(
              type: PageTransitionType.rightToLeftWithFade,
              alignment: Alignment.topCenter,
              duration: Duration(milliseconds: 1000),
              isIos: true,
              child: Interests(),
            ),
          );
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

  myInputDecoration(String s) {
    return InputDecoration(
      hintText: s,
      hintStyle: TextStyle(
        color: Color(0xFFBCBCBC),
        fontWeight: FontWeight.w500,
      ),
      border: InputBorder.none,
    );
  }
}

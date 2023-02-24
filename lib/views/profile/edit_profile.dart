// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables


import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:goup/views/authentication/interests.dart';
import 'package:goup/views/authentication/otp.dart';
import 'package:goup/views/utilities/utilities.dart';
import 'package:intl/intl.dart';
import 'package:page_transition/page_transition.dart';
import 'package:flutter_multi_select_items/flutter_multi_select_items.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
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
  bool fbstatus = false;
  bool twitterstatus = false;
  bool instastatus = false;
  bool linkedinstatus = false;
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
                    width: 20.0,
                    height: 20.0,
                    child: SvgPicture.asset('assets/icons/back.svg',),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Center(
                    child: Text(
                      'Edit Profile',
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
            Align(
              alignment: Alignment.center,
              child: Container(
                decoration: BoxDecoration(
                  // color: Color(0xFFE6F2EA),
                    borderRadius: BorderRadius.all(Radius.circular(60.0)),
                ),
                child: CircleAvatar(
                  // backgroundColor: Colors.transparent,
                  maxRadius: 50,
                  // radius: 60,
                  // backgroundImage: AssetImage('assets/images/profile.png'),
                  backgroundImage: AssetImage('assets/images/select_profile_image.png'),
                  // backgroundColor: Color(0xFFEAEAEB),
                  backgroundColor: Colors.transparent,
                ),
              ),
            ),
            Container(
              height: 60.0,
              margin: EdgeInsets.only(top: 20.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: Color(0xFFEAEAEB),
                // color: Colors.red,
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
              height: 100.0,
              margin: EdgeInsets.only(top: 20.0),
              alignment: Alignment.topCenter,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: Color(0xFFEAEAEB)
                // color: Colors.red
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.11,
                    alignment: Alignment.topCenter,
                    margin: EdgeInsets.only(top: 15.0),
                    child: SvgPicture.asset('assets/icons/user_icon.svg',width: 16.0),
                  ),
                  Expanded(
                    flex: 1,
                    child: TextFormField(
                      maxLines: 5,
                      style: const TextStyle(fontSize: 14.0, color: AppColors.black),
                      cursorColor: AppColors.primary,
                      decoration: myInputDecoration('Tell us about you'),
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
                        decoration: myInputDecoration('Address'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(top: 20.0),
              child: Text(
                'Connect with Social platform',
                style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w500,
                    color: AppColors.black
                ),
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(top: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Facebook',
                    style: TextStyle(
                        fontSize: 16.0,
                        color: AppColors.secondary
                    ),
                  ),
                  FlutterSwitch(
                    width: 60.0,
                    height: 37.0,
                    toggleSize: 30.0,
                    value: fbstatus,
                    activeText: '',
                    activeColor: Color(0xFF34C759),
                    inactiveColor: Color(0xFFE5E5E6),
                    inactiveText: '',
                    borderRadius: 30.0,
                    padding: 2.0,
                    duration: Duration(milliseconds: 250),
                    showOnOff: true,
                    onToggle: (val) {
                      setState(() {});
                      fbstatus = val;
                    },
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(top: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Twitter',
                    style: TextStyle(
                        fontSize: 16.0,
                        color: AppColors.secondary
                    ),
                  ),
                  FlutterSwitch(
                    width: 60.0,
                    height: 37.0,
                    toggleSize: 30.0,
                    value: twitterstatus,
                    activeText: '',
                    activeColor: Color(0xFF34C759),
                    inactiveColor: Color(0xFFE5E5E6),
                    inactiveText: '',
                    borderRadius: 30.0,
                    padding: 2.0,
                    duration: Duration(milliseconds: 250),
                    showOnOff: true,
                    onToggle: (val) {
                      setState(() {});
                      twitterstatus = val;
                    },
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(top: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Instagram',
                    style: TextStyle(
                        fontSize: 16.0,
                        color: AppColors.secondary
                    ),
                  ),
                  FlutterSwitch(
                    width: 60.0,
                    height: 37.0,
                    toggleSize: 30.0,
                    value: instastatus,
                    activeText: '',
                    activeColor: Color(0xFF34C759),
                    inactiveColor: Color(0xFFE5E5E6),
                    inactiveText: '',
                    borderRadius: 30.0,
                    padding: 2.0,
                    duration: Duration(milliseconds: 250),
                    showOnOff: true,
                    onToggle: (val) {
                      instastatus = val;
                      setState(() {});
                    },
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(top: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'LinkedIn',
                    style: TextStyle(
                        fontSize: 16.0,
                        color: AppColors.secondary
                    ),
                  ),
                  FlutterSwitch(
                    width: 60.0,
                    height: 37.0,
                    toggleSize: 30.0,
                    value: linkedinstatus,
                    activeText: '',
                    activeColor: Color(0xFF34C759),
                    inactiveColor: Color(0xFFE5E5E6),
                    inactiveText: '',
                    borderRadius: 30.0,
                    padding: 2.0,
                    duration: Duration(milliseconds: 250),
                    showOnOff: true,
                    onToggle: (val) {
                      linkedinstatus = val;
                      setState(() {});
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: InkWell(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () {
          /*Navigator.push(
            context,
            PageTransition(
              type: PageTransitionType.rightToLeftWithFade,
              alignment: Alignment.topCenter,
              duration: Duration(milliseconds: 1000),
              isIos: true,
              child: Interests(),
            ),
          );*/
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
            'Save & Continue',
            style: TextStyle(
              color: Colors.white,
              // fontWeight: FontWeight.w700,
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

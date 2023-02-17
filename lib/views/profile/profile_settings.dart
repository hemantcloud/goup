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

class ProfileSettings extends StatefulWidget {
  ProfileSettings({Key? key}) : super(key: key);

  @override
  State<ProfileSettings> createState() => _ProfileSettingsState();
}

class _ProfileSettingsState extends State<ProfileSettings> {
  bool isCalendarClicked = false;
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
            padding: EdgeInsets.symmetric(horizontal: 10.0),
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
                      'Profile Settings',
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
              padding: EdgeInsets.fromLTRB(5.0,10.0,10.0,10.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(8.0)),
                // color: Colors.red.shade100,
                color: Colors.white,
              ),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.only(right: 5.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(60.0)),
                        ),
                        child: CircleAvatar(
                          maxRadius: 25,
                          backgroundImage: AssetImage('assets/images/profile.png'),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Text(
                                    'Farhan Malik',
                                    style: TextStyle(
                                      fontSize: 15.0,
                                      color: AppColors.black,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                  ),
                                ),
                                SvgPicture.asset('assets/icons/vertical_line2.svg'),
                                SizedBox(width: 10.0),
                                Expanded(
                                  flex: 1,
                                  child: Text(
                                    '@farh_malik98',
                                    style: TextStyle(
                                      color: AppColors.primary,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  )
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Text(
                                    'Following - 28.3k',
                                    style: TextStyle(
                                      color: AppColors.secondary,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                  ),
                                ),
                                SvgPicture.asset('assets/icons/vertical_line2.svg',color: AppColors.secondary),
                                SizedBox(width: 10.0),
                                Expanded(
                                  flex: 1,
                                  child: Text(
                                    'Followers - 11.3k',
                                    style: TextStyle(
                                      color: AppColors.secondary,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 10.0),
                        child: SvgPicture.asset('assets/icons/right_arrow.svg',width: 20.0,height: 20.0),
                      )
                    ],
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: () => filterBottomSheet(context),
              child: Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.symmetric(vertical: 10.0),
                child: Text(
                  'Account settings',style: TextStyle(color: AppColors.black,fontSize: 18.0,fontWeight: FontWeight.w600),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                // color: Colors.red.shade100,
                color: Colors.white,
              ),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(10.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.only(right: 10.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(60.0)),
                          ),
                          child: SvgPicture.asset('assets/icons/account_privacy.svg'),
                        ),
                        Expanded(
                          flex: 1,
                          child: Text(
                            'Account privacy',
                            style: TextStyle(
                              fontSize: 15.0,
                              color: AppColors.black,
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 10.0),
                          child: SvgPicture.asset('assets/icons/right_arrow.svg',width: 20.0,height: 20.0),
                        )
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          color: Color(0xFFF4F5F7),
                          height: 1.0,
                          child: null,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.all(10.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.only(right: 10.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(60.0)),
                          ),
                          child: SvgPicture.asset('assets/icons/basket_privacy.svg'),
                        ),
                        Expanded(
                          flex: 1,
                          child: Text(
                            'Basket Privacy',
                            style: TextStyle(
                              fontSize: 15.0,
                              color: AppColors.black,
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 10.0),
                          child: SvgPicture.asset('assets/icons/right_arrow.svg',width: 20.0,height: 20.0),
                        )
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          color: Color(0xFFF4F5F7),
                          height: 1.0,
                          child: null,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.all(10.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.only(right: 10.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(60.0)),
                          ),
                          child: SvgPicture.asset('assets/icons/payment_settings.svg'),
                        ),
                        Expanded(
                          flex: 1,
                          child: Text(
                            'Payment settings',
                            style: TextStyle(
                              fontSize: 15.0,
                              color: AppColors.black,
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 10.0),
                          child: SvgPicture.asset('assets/icons/right_arrow.svg',width: 20.0,height: 20.0),
                        )
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          color: Color(0xFFF4F5F7),
                          height: 1.0,
                          child: null,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.all(10.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.only(right: 10.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(60.0)),
                          ),
                          child: SvgPicture.asset('assets/icons/my_bills.svg'),
                        ),
                        Expanded(
                          flex: 1,
                          child: Text(
                            'My Bills/Earnings',
                            style: TextStyle(
                              fontSize: 15.0,
                              color: AppColors.black,
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 10.0),
                          child: SvgPicture.asset('assets/icons/right_arrow.svg',width: 20.0,height: 20.0),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                // color: Colors.red.shade100,
                color: Colors.white,
              ),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(10.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.only(right: 10.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(60.0)),
                          ),
                          child: SvgPicture.asset('assets/icons/my_requests.svg'),
                        ),
                        Expanded(
                          flex: 1,
                          child: Text(
                            'My requests',
                            style: TextStyle(
                              fontSize: 15.0,
                              color: AppColors.black,
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 10.0),
                          child: SvgPicture.asset('assets/icons/right_arrow.svg',width: 20.0,height: 20.0),
                        )
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          color: Color(0xFFF4F5F7),
                          height: 1.0,
                          child: null,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.all(10.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.only(right: 10.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(60.0)),
                          ),
                          child: SvgPicture.asset('assets/icons/stock_lists.svg'),
                        ),
                        Expanded(
                          flex: 1,
                          child: Text(
                            'Stock Lists',
                            style: TextStyle(
                              fontSize: 15.0,
                              color: AppColors.black,
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 10.0),
                          child: SvgPicture.asset('assets/icons/right_arrow.svg',width: 20.0,height: 20.0),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.symmetric(vertical: 10.0),
              child: Text(
                'General settings',style: TextStyle(color: AppColors.black,fontSize: 18.0,fontWeight: FontWeight.w600),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                color: Colors.white,
              ),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(10.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.only(right: 10.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(60.0)),
                          ),
                          child: SvgPicture.asset('assets/icons/notification.svg'),
                        ),
                        Expanded(
                          flex: 1,
                          child: Text(
                            'Notification',
                            style: TextStyle(
                              fontSize: 15.0,
                              color: AppColors.black,
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 10.0),
                          child: SvgPicture.asset('assets/icons/right_arrow.svg',width: 20.0,height: 20.0),
                        )
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          color: Color(0xFFF4F5F7),
                          height: 1.0,
                          child: null,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.all(10.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.only(right: 10.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(60.0)),
                          ),
                          child: SvgPicture.asset('assets/icons/change_password.svg'),
                        ),
                        Expanded(
                          flex: 1,
                          child: Text(
                            'Change Password',
                            style: TextStyle(
                              fontSize: 15.0,
                              color: AppColors.black,
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 10.0),
                          child: SvgPicture.asset('assets/icons/right_arrow.svg',width: 20.0,height: 20.0),
                        )
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          color: Color(0xFFF4F5F7),
                          height: 1.0,
                          child: null,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.all(10.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.only(right: 10.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(60.0)),
                          ),
                          child: SvgPicture.asset('assets/icons/language.svg'),
                        ),
                        Expanded(
                          flex: 1,
                          child: Text(
                            'Language',
                            style: TextStyle(
                              fontSize: 15.0,
                              color: AppColors.black,
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 10.0),
                          child: SvgPicture.asset('assets/icons/right_arrow.svg',width: 20.0,height: 20.0),
                        )
                      ],
                    ),
                  ),
                  /*ExpansionTile(
                    title: Text(
                      "Title",
                      style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    children: <Widget>[
                      ExpansionTile(
                        title: Text(
                          'Sub title',
                        ),
                        children: <Widget>[
                          ListTile(
                            title: Text('data'),
                          )
                        ],
                      ),
                      ListTile(
                        title: Text(
                            'data'
                        ),
                      )
                    ],
                  ),*/
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          color: Color(0xFFF4F5F7),
                          height: 1.0,
                          child: null,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.all(10.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.only(right: 10.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(60.0)),
                          ),
                          child: SvgPicture.asset('assets/icons/privacy_policy.svg'),
                        ),
                        Expanded(
                          flex: 1,
                          child: Text(
                            'Privacy Policy',
                            style: TextStyle(
                              fontSize: 15.0,
                              color: AppColors.black,
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 10.0),
                          child: SvgPicture.asset('assets/icons/right_arrow.svg',width: 20.0,height: 20.0),
                        )
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          color: Color(0xFFF4F5F7),
                          height: 1.0,
                          child: null,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.all(10.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.only(right: 10.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(60.0)),
                          ),
                          child: SvgPicture.asset('assets/icons/terms.svg'),
                        ),
                        Expanded(
                          flex: 1,
                          child: Text(
                            'Terms of use',
                            style: TextStyle(
                              fontSize: 15.0,
                              color: AppColors.black,
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 10.0),
                          child: SvgPicture.asset('assets/icons/right_arrow.svg',width: 20.0,height: 20.0),
                        )
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          color: Color(0xFFF4F5F7),
                          height: 1.0,
                          child: null,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.all(10.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.only(right: 10.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(60.0)),
                          ),
                          child: SvgPicture.asset('assets/icons/about_us.svg'),
                        ),
                        Expanded(
                          flex: 1,
                          child: Text(
                            'About us',
                            style: TextStyle(
                              fontSize: 15.0,
                              color: AppColors.black,
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 10.0),
                          child: SvgPicture.asset('assets/icons/right_arrow.svg',width: 20.0,height: 20.0),
                        )
                      ],
                    ),
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
          height: 50.0,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Color(0xFFE84F41),
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset('assets/icons/logout.svg'),
              SizedBox(width: 5.0),
              Text(
                'Logout',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.0
                  // fontWeight: FontWeight.w700,
                ),
              ),
            ],
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
  filterBottomSheet(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        builder: (context) {
          return StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return SingleChildScrollView(
                child: Wrap(
                  children: [
                    Container(
                      constraints: BoxConstraints(
                        maxHeight: double.infinity,
                      ),
                      margin: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25.0),
                        color: Colors.white,
                      ),
                      child: Column(
                        children: [
                          SizedBox(height: 30.0),
                          const Divider(
                            height: 1,
                            thickness: 0.1,
                            color: Color(0xFF8D8D8D),
                            // color: Colors.black,
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 20.0,left: 20.0,right: 20.0),
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Summary of this post',
                              style: TextStyle(
                                color: AppColors.primary,
                                fontSize: 16.0,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 20.0),
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'With changes over the previous period',
                              style: TextStyle(
                                color: AppColors.secondary,
                              ),
                            ),
                          ),
                          GridView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 30 / 2,
                              childAspectRatio: 8 / 4,
                            ),
                            itemCount: 8,
                            itemBuilder: (BuildContext context, int index) {
                              return Column(
                                children: [
                                  Container(
                                    // color: Colors.transparent,
                                    padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 10.0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          padding: EdgeInsets.only(bottom: 5.0),
                                          // color: Colors.red,
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            'Products',
                                            style: TextStyle(color: AppColors.black),
                                          ),
                                        ),
                                        Row(
                                          // crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              '1.815',
                                              style: TextStyle(
                                                color: AppColors.primary,
                                              ),
                                            ),
                                            Expanded(
                                              flex: 1,
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.end,
                                                children: [
                                                  SvgPicture.asset('assets/icons/arrow_up.svg'),
                                                  Text(
                                                    '38.3%',
                                                    style: TextStyle(
                                                      color: AppColors.black,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        SvgPicture.asset('assets/icons/vertical_graph_line.svg'),
                                      ],
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        });
  }
}

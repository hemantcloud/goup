// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables


import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:goup/models/follower_model.dart';
import 'package:goup/models/following_model.dart';
import 'package:goup/views/profile/my_bills.dart';
import 'package:goup/views/profile/order_requests.dart';
import 'package:goup/views/profile/privacy_policy.dart';
import 'package:goup/views/profile/terms_and_conditions.dart';
import 'package:goup/views/utilities/utilities.dart';
import 'package:page_transition/page_transition.dart';

class ProfileSettings extends StatefulWidget {
  ProfileSettings({Key? key}) : super(key: key);

  @override
  State<ProfileSettings> createState() => _ProfileSettingsState();
}

class _ProfileSettingsState extends State<ProfileSettings> with TickerProviderStateMixin {
  bool accountprivacystatus = false;
  bool basketprivacystatus = false;
  bool appnotifistatus = false;
  bool servicenotifistatus = false;
  bool messageenotifistatus = false;
  bool transactionnotifistatus = false;
  bool managementnotifistatus = false;
  bool promotionalnotifistatus = false;
  late TabController _tabBarController;
  final List<FollowerModel> followersList = [
    FollowerModel(name: 'Samir Karim', mutual: 255, isFollowing: false),
    FollowerModel(name: 'Hafeez Janat', mutual: 543, isFollowing: true),
    FollowerModel(name: 'Samir Karim', mutual: 354, isFollowing: false),
    FollowerModel(name: 'Hafeez Janat', mutual: 686, isFollowing: false),
    FollowerModel(name: 'Samir Karim', mutual: 566, isFollowing: false),
    FollowerModel(name: 'Hafeez Janat', mutual: 664, isFollowing: true),
    FollowerModel(name: 'Samir Karim', mutual: 141, isFollowing: true),
    FollowerModel(name: 'Hafeez Janat', mutual: 543, isFollowing: true),
    FollowerModel(name: 'Samir Karim', mutual: 365, isFollowing: false),
    FollowerModel(name: 'Hafeez Janat', mutual: 7443, isFollowing: true),
    FollowerModel(name: 'Samir Karim', mutual: 124, isFollowing: false),
    FollowerModel(name: 'Hafeez Janat', mutual: 666, isFollowing: false),
    FollowerModel(name: 'Samir Karim', mutual: 6456, isFollowing: true),
    FollowerModel(name: 'Hafeez Janat', mutual: 645, isFollowing: true),
  ];
  final List<FollowingModel> followingList = [
    FollowingModel(name: 'Samir Karim', mutual: 255),
    FollowingModel(name: 'Hafeez Janat', mutual: 543),
    FollowingModel(name: 'Samir Karim', mutual: 354),
    FollowingModel(name: 'Hafeez Janat', mutual: 686),
    FollowingModel(name: 'Samir Karim', mutual: 566),
    FollowingModel(name: 'Hafeez Janat', mutual: 664),
    FollowingModel(name: 'Samir Karim', mutual: 141),
    FollowingModel(name: 'Hafeez Janat', mutual: 543),
    FollowingModel(name: 'Samir Karim', mutual: 365),
    FollowingModel(name: 'Hafeez Janat', mutual: 7443),
    FollowingModel(name: 'Samir Karim', mutual: 124),
    FollowingModel(name: 'Hafeez Janat', mutual: 666),
    FollowingModel(name: 'Samir Karim', mutual: 6456),
    FollowingModel(name: 'Hafeez Janat', mutual: 645),
  ];
  @override
  void initState() {
// TODO: implement initState
    super.initState();
    _tabBarController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabBarController.dispose();
    super.dispose();
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
                        child: Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: InkWell(
                                onTap: () => followBottomSheet(context),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Farhan Malik',
                                      style: TextStyle(
                                        color: AppColors.black,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                    ),
                                    Text(
                                      'Following - 28.3k',
                                      style: TextStyle(
                                        fontSize: 13.0,
                                        color: AppColors.secondary,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SvgPicture.asset('assets/icons/vertical_line2.svg',height: 30.0),
                            Expanded(
                              flex: 1,
                              child: InkWell(
                                onTap: () => followBottomSheet(context),
                                child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        '@farh_malik98',
                                        style: TextStyle(
                                          color: AppColors.primary,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      Text(
                                        'Followers - 11.3k',
                                        style: TextStyle(
                                          fontSize: 13.0,
                                          color: AppColors.secondary,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                      ),
                                    ],
                                  ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      /*Expanded(
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
                                      fontSize: 13.0,
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
                                      fontSize: 13.0,
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
                      ),*/
                      Container(
                        padding: EdgeInsets.only(left: 10.0),
                        child: SvgPicture.asset('assets/icons/right_arrow.svg',width: 20.0,height: 20.0),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.symmetric(vertical: 10.0),
              child: Text(
                'Account settings',style: TextStyle(color: AppColors.black,fontSize: 18.0,fontWeight: FontWeight.w600),
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
                  InkWell(
                    onTap: () => accountPrivacyBottomSheet(context),
                    child: Container(
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
                  InkWell(
                    onTap: () => basketPrivacyBottomSheet(context),
                    child: Container(
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
                  InkWell(
                    onTap: (){
                      Navigator.push(
                        context,
                        PageTransition(
                          type: PageTransitionType.rightToLeftWithFade,
                          alignment: Alignment.topCenter,
                          duration: Duration(milliseconds: 1000),
                          isIos: true,
                          child: MyBills(),
                        ),
                      );
                    },
                    child: Container(
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
                  InkWell(
                    onTap: (){
                      Navigator.push(
                        context,
                        PageTransition(
                          type: PageTransitionType.rightToLeftWithFade,
                          alignment: Alignment.topCenter,
                          duration: Duration(milliseconds: 1000),
                          isIos: true,
                          child: OrderRequests(),
                        ),
                      );
                    },
                    child: Container(
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
                  InkWell(
                    onTap: () => notificationBottomSheet(context),
                    child: Container(
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
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        PageTransition(
                          type: PageTransitionType.rightToLeftWithFade,
                          alignment: Alignment.topCenter,
                          duration: Duration(milliseconds: 1000),
                          isIos: true,
                          child: PrivacyPolicy(),
                        ),
                      );
                    },
                    child: Container(
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
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        PageTransition(
                          type: PageTransitionType.rightToLeftWithFade,
                          alignment: Alignment.topCenter,
                          duration: Duration(milliseconds: 1000),
                          isIos: true,
                          child: TermsAndCondition(),
                        ),
                      );
                    },
                    child: Container(
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
  accountPrivacyBottomSheet(BuildContext context) {
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
                      margin: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 16.0),
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
                            padding: EdgeInsets.all(20.0),
                            alignment: Alignment.center,
                            child: Text(
                              'Account Privacy',
                              style: TextStyle(
                                color: AppColors.black,
                                fontSize: 18.0,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          const Divider(
                            height: 1,
                            thickness: 0.1,
                            color: Color(0xFF8D8D8D),
                            // color: Colors.black,
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            padding: EdgeInsets.all(20.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'General',
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    color: AppColors.black
                                  ),
                                ),
                                FlutterSwitch(
                                  width: 50.0,
                                  height: 25.0,
                                  toggleSize: 25.0,
                                  value: accountprivacystatus,
                                  activeText: '',
                                  activeColor: AppColors.primary,
                                  inactiveColor: Color(0xFFE5E5E6),
                                  inactiveText: '',
                                  borderRadius: 30.0,
                                  padding: 2.0,
                                  duration: Duration(milliseconds: 250),
                                  showOnOff: true,
                                  onToggle: (val) {
                                    setState(() {});
                                    accountprivacystatus = val;
                                  },
                                ),
                              ],
                            ),
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
  basketPrivacyBottomSheet(BuildContext context) {
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
                      margin: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 16.0),
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
                            padding: EdgeInsets.all(20.0),
                            alignment: Alignment.center,
                            child: Text(
                              'Basket Privacy',
                              style: TextStyle(
                                color: AppColors.black,
                                fontSize: 18.0,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          const Divider(
                            height: 1,
                            thickness: 0.1,
                            color: Color(0xFF8D8D8D),
                            // color: Colors.black,
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            padding: EdgeInsets.all(20.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'General',
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    color: AppColors.black
                                  ),
                                ),
                                FlutterSwitch(
                                  width: 50.0,
                                  height: 25.0,
                                  toggleSize: 25.0,
                                  value: basketprivacystatus,
                                  activeText: '',
                                  activeColor: AppColors.primary,
                                  inactiveColor: Color(0xFFE5E5E6),
                                  inactiveText: '',
                                  borderRadius: 30.0,
                                  padding: 2.0,
                                  duration: Duration(milliseconds: 250),
                                  showOnOff: true,
                                  onToggle: (val) {
                                    setState(() {});
                                    basketprivacystatus = val;
                                  },
                                ),
                              ],
                            ),
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
  notificationBottomSheet(BuildContext context) {
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
                      margin: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 16.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25.0),
                        color: Colors.white,
                      ),
                      child: Column(
                        children: [
                          SizedBox(height: 30.0),
                          Divider(
                            height: 1,
                            thickness: 0.1,
                            color: Color(0xFF8D8D8D),
                            // color: Colors.black,
                          ),
                          Container(
                            padding: EdgeInsets.all(20.0),
                            alignment: Alignment.center,
                            child: Text(
                              'Notifications settings',
                              style: TextStyle(
                                color: AppColors.black,
                                fontSize: 18.0,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          Divider(
                            height: 1,
                            thickness: 0.1,
                            color: Color(0xFF8D8D8D),
                            // color: Colors.black,
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            padding: EdgeInsets.symmetric(horizontal: 20.0,vertical: 10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'App. notifications',
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    color: AppColors.black
                                  ),
                                ),
                                FlutterSwitch(
                                  width: 50.0,
                                  height: 25.0,
                                  toggleSize: 25.0,
                                  value: appnotifistatus,
                                  activeText: '',
                                  activeColor: AppColors.primary,
                                  inactiveColor: Color(0xFFE5E5E6),
                                  inactiveText: '',
                                  borderRadius: 30.0,
                                  padding: 2.0,
                                  duration: Duration(milliseconds: 250),
                                  showOnOff: true,
                                  onToggle: (val) {
                                    setState(() {});
                                    appnotifistatus = val;
                                  },
                                ),
                              ],
                            ),
                          ),
                          Divider(
                            height: 1,
                            thickness: 0.1,
                            color: Color(0xFF8D8D8D),
                            // color: Colors.black,
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            padding: EdgeInsets.symmetric(horizontal: 20.0,vertical: 10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Service notifications',
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    color: AppColors.black
                                  ),
                                ),
                                FlutterSwitch(
                                  width: 50.0,
                                  height: 25.0,
                                  toggleSize: 25.0,
                                  value: servicenotifistatus,
                                  activeText: '',
                                  activeColor: AppColors.primary,
                                  inactiveColor: Color(0xFFE5E5E6),
                                  inactiveText: '',
                                  borderRadius: 30.0,
                                  padding: 2.0,
                                  duration: Duration(milliseconds: 250),
                                  showOnOff: true,
                                  onToggle: (val) {
                                    setState(() {});
                                    servicenotifistatus = val;
                                  },
                                ),
                              ],
                            ),
                          ),
                          Divider(
                            height: 1,
                            thickness: 0.1,
                            color: Color(0xFF8D8D8D),
                            // color: Colors.black,
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            padding: EdgeInsets.symmetric(horizontal: 20.0,vertical: 10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Message notifications',
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    color: AppColors.black
                                  ),
                                ),
                                FlutterSwitch(
                                  width: 50.0,
                                  height: 25.0,
                                  toggleSize: 25.0,
                                  value: messageenotifistatus,
                                  activeText: '',
                                  activeColor: AppColors.primary,
                                  inactiveColor: Color(0xFFE5E5E6),
                                  inactiveText: '',
                                  borderRadius: 30.0,
                                  padding: 2.0,
                                  duration: Duration(milliseconds: 250),
                                  showOnOff: true,
                                  onToggle: (val) {
                                    setState(() {});
                                    messageenotifistatus = val;
                                  },
                                ),
                              ],
                            ),
                          ),
                          Divider(
                            height: 1,
                            thickness: 0.1,
                            color: Color(0xFF8D8D8D),
                            // color: Colors.black,
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            padding: EdgeInsets.symmetric(horizontal: 20.0,vertical: 10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Transaction notifications',
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    color: AppColors.black
                                  ),
                                ),
                                FlutterSwitch(
                                  width: 50.0,
                                  height: 25.0,
                                  toggleSize: 25.0,
                                  value: transactionnotifistatus,
                                  activeText: '',
                                  activeColor: AppColors.primary,
                                  inactiveColor: Color(0xFFE5E5E6),
                                  inactiveText: '',
                                  borderRadius: 30.0,
                                  padding: 2.0,
                                  duration: Duration(milliseconds: 250),
                                  showOnOff: true,
                                  onToggle: (val) {
                                    setState(() {});
                                    transactionnotifistatus = val;
                                  },
                                ),
                              ],
                            ),
                          ),
                          Divider(
                            height: 1,
                            thickness: 0.1,
                            color: Color(0xFF8D8D8D),
                            // color: Colors.black,
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            padding: EdgeInsets.symmetric(horizontal: 20.0,vertical: 10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Management notifications',
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    color: AppColors.black
                                  ),
                                ),
                                FlutterSwitch(
                                  width: 50.0,
                                  height: 25.0,
                                  toggleSize: 25.0,
                                  value: managementnotifistatus,
                                  activeText: '',
                                  activeColor: AppColors.primary,
                                  inactiveColor: Color(0xFFE5E5E6),
                                  inactiveText: '',
                                  borderRadius: 30.0,
                                  padding: 2.0,
                                  duration: Duration(milliseconds: 250),
                                  showOnOff: true,
                                  onToggle: (val) {
                                    setState(() {});
                                    managementnotifistatus = val;
                                  },
                                ),
                              ],
                            ),
                          ),
                          Divider(
                            height: 1,
                            thickness: 0.1,
                            color: Color(0xFF8D8D8D),
                            // color: Colors.black,
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            padding: EdgeInsets.symmetric(horizontal: 20.0,vertical: 10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Promotional notifications',
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    color: AppColors.black
                                  ),
                                ),
                                FlutterSwitch(
                                  width: 50.0,
                                  height: 25.0,
                                  toggleSize: 25.0,
                                  value: promotionalnotifistatus,
                                  activeText: '',
                                  activeColor: AppColors.primary,
                                  inactiveColor: Color(0xFFE5E5E6),
                                  inactiveText: '',
                                  borderRadius: 30.0,
                                  padding: 2.0,
                                  duration: Duration(milliseconds: 250),
                                  showOnOff: true,
                                  onToggle: (val) {
                                    setState(() {});
                                    promotionalnotifistatus = val;
                                  },
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 10.0),
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
  followBottomSheet(BuildContext context) {
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
                      /*constraints: BoxConstraints(
                        maxHeight: double.infinity,
                      ),*/
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.7,
                      margin: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 16.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25.0),
                        color: Colors.white,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(height: 30.0),
                          Divider(
                            height: 1,
                            thickness: 0.1,
                            color: Color(0xFF8D8D8D),
                            // color: Colors.black,
                          ),
                          Container(
                            height: 70,
                            margin: EdgeInsets.only(top: 20.0,left: 10.0,right: 10.0),
                            padding: EdgeInsets.symmetric(vertical: 5.0),
                            decoration: BoxDecoration(
                                border: Border.all(color: Color(0xFFF1F1F7)),
                                borderRadius: BorderRadius.circular(8.0),
                                color: Color(0xFFF1F1F7)
                            ),
                            // alignment: Alignment.center,
                            child: TabBar(
                              controller: _tabBarController,
                              indicator: BoxDecoration(
                                color: AppColors.primary,
                                shape: BoxShape.rectangle,
                                borderRadius: BorderRadius.all(Radius.circular(6.0)),
                              ),
                              tabs: [
                                Tab(text: '       3.8 k\nFollowers'),
                                Tab(text: '       17.1 k\nFollowing'),
                              ],
                              labelColor: Colors.white,
                              unselectedLabelColor: AppColors.text3,
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: TabBarView(
                              controller: _tabBarController,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 10.0),
                                  child: followersList.isEmpty ? Center(child: Text('No followers .'),) : ListView.builder(
                                    shrinkWrap: true,
                                    physics: const ScrollPhysics(),
                                    itemCount: followersList.length,
                                    itemBuilder: (BuildContext context, int index) {
                                      return Container(
                                        padding: const EdgeInsets.fromLTRB(20.0,20.0,20.0,0.0),
                                        // color: Colors.green,
                                        child: Column(
                                          children: [
                                            Row(
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: [
                                                Expanded(
                                                  flex: 1,
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Text(
                                                        followersList[index].name.toString(),
                                                        style: const TextStyle(
                                                          fontSize: 16.0,
                                                          fontWeight: FontWeight.w500,
                                                          color: AppColors.primary,
                                                        ),
                                                      ),
                                                      Text(
                                                        '${followersList[index].mutual.toString()} Mutual followers',
                                                        style: const TextStyle(
                                                          fontSize: 12.0,
                                                          fontWeight: FontWeight.w500,
                                                          color: AppColors.text4,
                                                        ),
                                                        overflow: TextOverflow.ellipsis,
                                                        maxLines: 1,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(width: 20.0),
                                                Column(
                                                  crossAxisAlignment: CrossAxisAlignment.end,
                                                  children: [
                                                    InkWell(
                                                      onTap: () {
                                                        if(followersList[index].isFollowing == true){
                                                          followersList[index].isFollowing = false;
                                                        } else if(followersList[index].isFollowing == false){
                                                          followersList[index].isFollowing = true;
                                                        }
                                                        setState((){});
                                                      },
                                                      child: Container(
                                                        padding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 10.0),
                                                        decoration: BoxDecoration(
                                                          borderRadius: BorderRadius.all(Radius.circular(24.5)),
                                                          color: Color(0xFFF6F6FC),
                                                        ),
                                                        child: Text(
                                                          followersList[index].isFollowing == true ? 'Following' : 'Follow back',
                                                          style: TextStyle(
                                                            color:
                                                            followersList[index].isFollowing == true ? AppColors.text3 : AppColors.primary,
                                                          )
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 10.0),
                                  child: followingList.isEmpty ? Center(child: Text('No following .'),) : ListView.builder(
                                    shrinkWrap: true,
                                    physics: const ScrollPhysics(),
                                    itemCount: followingList.length,
                                    itemBuilder: (BuildContext context, int index) {
                                      return Container(
                                        padding: const EdgeInsets.fromLTRB(20.0,20.0,20.0,0.0),
                                        // color: Colors.green,
                                        child: Column(
                                          children: [
                                            Row(
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: [
                                                Expanded(
                                                  flex: 1,
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Text(
                                                        followingList[index].name.toString(),
                                                        style: const TextStyle(
                                                          fontSize: 16.0,
                                                          fontWeight: FontWeight.w500,
                                                          color: AppColors.primary,
                                                        ),
                                                      ),
                                                      Text(
                                                        '${followingList[index].mutual.toString()} Mutual followers',
                                                        style: const TextStyle(
                                                          fontSize: 12.0,
                                                          fontWeight: FontWeight.w500,
                                                          color: AppColors.text4,
                                                        ),
                                                        overflow: TextOverflow.ellipsis,
                                                        maxLines: 1,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(width: 20.0),
                                                Column(
                                                  crossAxisAlignment: CrossAxisAlignment.end,
                                                  children: [
                                                    InkWell(
                                                      onTap: () {
                                                        followingList.remove(followingList[index]);
                                                        setState((){});
                                                      },
                                                      child: Container(
                                                        padding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 10.0),
                                                        decoration: BoxDecoration(
                                                          borderRadius: BorderRadius.all(Radius.circular(24.5)),
                                                          color: Color(0xFFFDF3F2),
                                                        ),
                                                        child: Text(
                                                            'Unfollow',
                                                            style: TextStyle(
                                                              color: AppColors.red2,
                                                            )
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 10.0),
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

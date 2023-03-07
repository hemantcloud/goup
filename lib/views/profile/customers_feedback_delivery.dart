// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables


import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:goup/views/dashboard.dart';
import 'package:goup/views/utilities/utilities.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:page_transition/page_transition.dart';

class CustomersFeedbackDelivery extends StatefulWidget {
  CustomersFeedbackDelivery({Key? key}) : super(key: key);

  @override
  State<CustomersFeedbackDelivery> createState() => _CustomersFeedbackDeliveryState();
}

class _CustomersFeedbackDeliveryState extends State<CustomersFeedbackDelivery> {
  late final _ratingController;
  late double _rating;

  double _userRating = 3.0;
  int _ratingBarMode = 2;
  double _initialRating = 5.0;
  bool _isRTLMode = false;
  bool _isVertical = false;

  IconData? _selectedIcon;
  var reviewController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _ratingController = TextEditingController(text: '3.0');
    _rating = _initialRating;
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
        // toolbarHeight: 80.0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        flexibleSpace: Padding(
          padding: EdgeInsets.only(top: 40.0, bottom: 10.0),
          child: Container(
            height: 60.0,
            margin: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 0.0),
            // padding: EdgeInsets.symmetric(horizontal: 10.0),
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
                      'Customer’s Feedback',
                      style: TextStyle(
                        color: AppColors.black,
                        fontSize: 18.0
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.center,
            child: Text(
              'How was your Delivery?',
              style: TextStyle(color: Color(0xFF071440),fontSize: 18.0),
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'At McDonaids Inc.\nRyadh, Saudi Arabia',
              style: TextStyle(color: AppColors.secondary),
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 20.0),
            child: _ratingBar(_ratingBarMode),
          ),
          Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.symmetric(horizontal: 16.0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.transparent, width: 0.0),
              borderRadius: BorderRadius.circular(5.0),
              color: Color(0xFFF6F6FC),
              // color: Colors.red,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    'Customer’s Note',
                    style: TextStyle(color: Color(0xFF071440),fontSize: 16.0,fontWeight: FontWeight.w600),
                  ),
                ),
                Divider(
                  height: 1,
                  thickness: 0.1,
                  color: Color(0xFF8D8D8D),
                  // color: Colors.black,
                ),
                Container(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    'Pickup was incredebly smooth. It’s real quick delivery service from faheem. Thank you',
                    style: TextStyle(color: AppColors.secondary),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: InkWell(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
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
        child: Container(
          margin: EdgeInsets.fromLTRB(16.0,0.0,16.0,16.0),
          height: 50.0,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: AppColors.primary,
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
          child: Text(
            'Back to home',
            style: TextStyle(
                color: Colors.white,
                fontSize: 16.0
              // fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }
  Widget _ratingBar(int mode) {
    switch (mode) {
      case 1:
        return RatingBar.builder(
          initialRating: _initialRating,
          minRating: 1,
          direction: Axis.horizontal,
          allowHalfRating: true,
          unratedColor: Colors.amber.withAlpha(50),
          itemCount: 5,
          itemSize: 50.0,
          itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
          itemBuilder: (context, _) => Icon(
            _selectedIcon ?? Icons.star,
            color: Colors.amber,
          ),
          onRatingUpdate: (rating) {
            setState(() {
              _rating = rating;
            });
          },
          updateOnDrag: true,
        );
      case 2:
        return RatingBar(
          initialRating: _initialRating,
          direction: _isVertical ? Axis.vertical : Axis.horizontal,
          allowHalfRating: true,
          itemCount: 5,
          ratingWidget: RatingWidget(
            full: _image('assets/icons/star.png'),
            half: _image('assets/icons/star.png'),
            // half: _image('assets/heart_half.png'), note-----------half image converted to full image
            empty: _image('assets/icons/star_empty.png'),
          ),
          itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
          onRatingUpdate: (rating) {
            setState(() {
              _rating = rating;
            });
          },
          updateOnDrag: true,
        );
      case 3:
        return RatingBar.builder(
          initialRating: _initialRating,
          direction: _isVertical ? Axis.vertical : Axis.horizontal,
          itemCount: 5,
          itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
          itemBuilder: (context, index) {
            switch (index) {
              case 0:
                return Icon(
                  Icons.sentiment_very_dissatisfied,
                  color: Colors.red,
                );
              case 1:
                return Icon(
                  Icons.sentiment_dissatisfied,
                  color: Colors.redAccent,
                );
              case 2:
                return Icon(
                  Icons.sentiment_neutral,
                  color: Colors.amber,
                );
              case 3:
                return Icon(
                  Icons.sentiment_satisfied,
                  color: Colors.lightGreen,
                );
              case 4:
                return Icon(
                  Icons.sentiment_very_satisfied,
                  color: Colors.green,
                );
              default:
                return Container();
            }
          },
          onRatingUpdate: (rating) {
            setState(() {
              _rating = rating;
            });
          },
          updateOnDrag: true,
        );
      default:
        return Container();
    }
  }

  Widget _image(String asset) {
    return Image.asset(
      asset,
      height: 20.0,
      width: 20.0,
      color:
      asset == 'assets/icons/star.png' ?
      Colors.amber : Colors.white,
    );
  }
}

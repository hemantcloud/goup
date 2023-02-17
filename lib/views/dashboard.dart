// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:goup/views/basket/basket.dart';
import 'package:goup/views/home/home.dart';
import 'package:goup/views/inbox/inbox.dart';
import 'package:goup/views/profile/profile.dart';
import 'package:goup/views/utilities/utilities.dart';
class Dashboard extends StatefulWidget {
  int bottomIndex;
  Dashboard({Key? key, required this.bottomIndex}) : super(key: key);
  @override
  State<Dashboard> createState() => _HomeState();
}

var widgetOptions = [
  Home(),
  Inbox(),
  Basket(),
  Profile(),
];


class _HomeState extends State<Dashboard> {

  @override
  Widget build(BuildContext context) {
    void _onItemTapped(int index) {
      setState(() {
        widget.bottomIndex = index;
        // print("index--------------------${widget.bottomIndex}");
      });
    }
    return Scaffold(
      body: widgetOptions[
        widget.bottomIndex
      ],
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: widget.bottomIndex == 0 ?
            Padding(
              padding: EdgeInsets.only(bottom: 10.0,),
              child: SvgPicture.asset('assets/icons/Group.svg',width: 80.0),
            ):
            Padding(
              padding: EdgeInsets.only(bottom: 10.0,top: 30.0),
              child: SvgPicture.asset('assets/icons/home_unselected.svg',width: 18.7),
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: widget.bottomIndex == 1 ?
            Padding(
              padding: EdgeInsets.only(),
              child: SvgPicture.asset('assets/icons/inbox_selected.svg',width: 80.0),
            ):
            Padding(
              padding: EdgeInsets.only(bottom: 10.0,top: 30.0),
              child: SvgPicture.asset('assets/icons/inbox_unselected.svg',width: 18.7),
            ),
            label: 'Inbox',
          ),
          BottomNavigationBarItem(
            icon: widget.bottomIndex == 2 ?
            SvgPicture.asset('assets/icons/basket_selected.svg',width: 80.0):
            Padding(
              padding: EdgeInsets.only(bottom: 10.0,top: 30.0),
              child: SvgPicture.asset('assets/icons/basket_unselected.svg',width: 18.7),
            ),
            label: 'Basket',
          ),
          BottomNavigationBarItem(
            icon: widget.bottomIndex == 3 ?
            SvgPicture.asset('assets/icons/profile_selected.svg',width: 80.0):
            Padding(
              padding: EdgeInsets.only(bottom: 10.0,top: 20.0),
              child: SvgPicture.asset('assets/icons/profile_unselected.svg',width: 18.7),
            ),
            label: 'Profile',
          ),
        ],
        currentIndex: widget.bottomIndex,
        elevation: 0.0,
        // backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedItemColor: AppColors.primary,
        unselectedItemColor: AppColors.secondary,
        onTap: _onItemTapped,
        selectedFontSize: 11.0,
        unselectedFontSize: 11.0,
      )
    );
  }
}

// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:goup/views/basket/basket.dart';
import 'package:goup/views/home/home.dart';
import 'package:goup/views/inbox/inbox.dart';
import 'package:goup/views/profile/profile.dart';
import 'package:goup/views/utilities/utilities.dart';
class Dashboard1 extends StatefulWidget {
  int bottomIndex;
  Dashboard1({Key? key, required this.bottomIndex}) : super(key: key);
  @override
  State<Dashboard1> createState() => _Dashboard1State();
}

var widgetOptions = [
  Home(),
  Inbox(),
  Basket(),
  Profile(),
];
List<Widget> _buildScreens() {
  return [
    Home(),
    Inbox(),
    Basket(),
    Profile(),
  ];
}


class _Dashboard1State extends State<Dashboard1> {

  @override
  Widget build(BuildContext context) {
    void _onItemTapped(int index) {
      setState(() {
        widget.bottomIndex = index;
        print("index--------------------${widget.bottomIndex}");
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
              SvgPicture.asset('assets/icons/Group.svg',width: 20.0,height: 20.0,) :
              SvgPicture.asset('assets/icons/home_unselected.svg',width: 20.0,height: 20.0,),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: widget.bottomIndex == 1 ?
            SvgPicture.asset('assets/icons/inbox_unselected.svg',width: 20.0,height: 20.0,color: AppColors.primary,) :
            SvgPicture.asset('assets/icons/inbox_unselected.svg',width: 20.0,height: 20.0,),
            label: 'Inbox',
          ),
          BottomNavigationBarItem(
            icon: widget.bottomIndex == 2 ?
            SvgPicture.asset('assets/icons/basket_unselected.svg',width: 20.0,height: 20.0,color: AppColors.primary,) :
            SvgPicture.asset('assets/icons/basket_unselected.svg',width: 20.0,height: 20.0,),
            label: 'Basket',
          ),
          BottomNavigationBarItem(
            icon: widget.bottomIndex == 3 ?
            SvgPicture.asset('assets/icons/profile_unselected.svg',width: 20.0,height: 20.0,color: AppColors.primary,) :
            SvgPicture.asset('assets/icons/profile_unselected.svg',width: 20.0,height: 20.0,),
            label: 'Profile',
          ),
        ],
        currentIndex: widget.bottomIndex,
        elevation: 0.0,
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        // showSelectedLabels: false,
        // showUnselectedLabels: false,s
        selectedItemColor: AppColors.primary,
        unselectedItemColor: AppColors.secondary,
        onTap: _onItemTapped,
        selectedFontSize: 11.0,
        unselectedFontSize: 11.0,
      )
    );
  }
}

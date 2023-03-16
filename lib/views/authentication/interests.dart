// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:goup/utitlities/utitlities.dart';
import 'package:goup/views/dashboard.dart';
import 'package:goup/views/utilities/utilities.dart';
import 'package:page_transition/page_transition.dart';
import 'package:flutter_multi_select_items/flutter_multi_select_items.dart';

class Interests extends StatefulWidget {
  const Interests({Key? key}) : super(key: key);

  @override
  State<Interests> createState() => _InterestsState();
}

class _InterestsState extends State<Interests> {
  List<String> allSelectedItems1 = [];
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
            padding: const EdgeInsets.symmetric(horizontal: 0.0),
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
                      'What’s your interests?',
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
                'You can choose your favorite products',
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
                'And start following them and seeing everything that is new',
                style: TextStyle(color: AppColors.secondary),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 40.0),
              child: MultiSelectContainer(
                  itemsDecoration: MultiSelectDecorations(
                    decoration: BoxDecoration(
                        color: Color(0xFFF1F1F3),
                        border: Border.all(color: Color(0xFFD2D2D2),width: 0.4),
                        borderRadius: BorderRadius.circular(7.0)
                    ),
                    selectedDecoration: BoxDecoration(
                        color: Color(0xFF6765C8),
                        border: Border.all(color: Color(0xFF6765C8),width: 0.4),
                        borderRadius: BorderRadius.circular(7.0)
                    ),
                  ),
                  textStyles: const MultiSelectTextStyles(
                    textStyle: TextStyle(fontSize: 16.0,color: Color(0xFF161C2A)),
                    selectedTextStyle: TextStyle(fontSize: 16.0,color: Colors.white),
                  ),
                  items: [
                    MultiSelectCard(value: 'Clothes', label: 'Clothes'),
                    MultiSelectCard(value: 'Shoes', label: 'Shoes'),
                    MultiSelectCard(value: 'Samrtphones',label: 'Samrtphones'),
                    MultiSelectCard(value: 'Laptops', label: 'Laptops'),
                    MultiSelectCard(value: 'Foods & Drinks', label: 'Foods & Drinks'),
                    MultiSelectCard(value: 'Detergents', label: 'Detergents'),
                    MultiSelectCard(value: 'Gadgets', label: 'Gadgets'),
                    MultiSelectCard(value: 'Sports', label: 'Sports'),
                    MultiSelectCard(value: 'Stationery', label: 'Stationery'),
                    MultiSelectCard(value: 'Electrical devices', label: 'Electrical devices'),
                    MultiSelectCard(value: 'Accessories', label: 'Accessories'),
                    MultiSelectCard(value: 'Beauty & Style', label: 'Beauty & Style'),
                    MultiSelectCard(value: 'Auto & Vehicles', label: 'Auto & Vehicles'),
                    MultiSelectCard(value: 'Entertainment', label: 'Entertainment'),
                  ],
                  onChange: (allSelectedItems, selectedItem) {
                    print('allSelectedItems is $allSelectedItems');
                    allSelectedItems1 = allSelectedItems;
                  }),
            ),
          ],
        ),
      ),
      bottomSheet: InkWell(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () {
          if(allSelectedItems1.isEmpty){
            Utilities().toast("Please Select atleast one interest.");
          }else {
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

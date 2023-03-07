// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:goup/views/utilities/utilities.dart';

class Categories extends StatefulWidget {
  Categories({Key? key}) : super(key: key);

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  String? phone,  electornics, vehicle, home, manFashion, womenFashion, pet;
  bool isClickedPhone = false, isClickedElectonics = false,  isClickedVehicle = false, isClickedHome = false, isClickedManFashion = false, isClickedWomanFashion = false, isClickedManPet = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.white,
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
            // padding: const EdgeInsets.symmetric(horizontal: 10.0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.transparent, width: 0.0),
              borderRadius: BorderRadius.circular(5.0),
              color: Colors.transparent,
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
                    child: SvgPicture.asset('assets/icons/back.svg'),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Center(
                    child: Text(
                      'Categories',
                      style: TextStyle(
                        // fontWeight: FontWeight.w700,
                        fontSize: 18.0,
                        color: Colors.black,
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
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(bottom: 20.0),
              child: Text(
                'Select a Category',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18.0,
                    // fontWeight: FontWeight.w600
                ),
              ),
            ),
            InkWell(
              onTap: () {
                isClickedPhone = !isClickedPhone;
                isClickedElectonics = false;
                isClickedVehicle = false;
                setState(() {});
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 10.0),
                decoration: boxDecorationTopRadius(),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset('assets/images/phone.png',width: 36.0),
                    SizedBox(width: 10.0),
                    Expanded(
                      flex: 1,
                      child: Text(
                        'Mobile Phones',
                        style: TextStyle(color: Colors.black,fontSize: 16.0),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ),
                    SizedBox(width: 10.0),
                    isClickedPhone == false ?
                    SvgPicture.asset('assets/icons/down_arrow.svg') :
                    SvgPicture.asset('assets/icons/up_arrow.svg'),
                  ],
                ),
              ),
            ),
            isClickedPhone == false ? Container() :
            Container(
              padding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 10.0),
              decoration: boxDecorationBottomRadius(),
              child: Column(
                children: [
                  InkWell(
                    onTap: () {
                      phone = 'Desktop Computer';
                      setState(() {});
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        phone == 'Desktop Computer'
                            ? Image.asset('assets/icons/gender_selected.png',width: 20.0)
                            : SvgPicture.asset('assets/icons/gender_unselected.svg',width: 20.0),
                        SizedBox(width: 10.0),
                        Expanded(
                          flex: 1,
                          child: Text(
                            'Mobile Phones',
                            style: TextStyle(color: AppColors.secondary),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.symmetric(vertical: 10.0),
                          color: Color(0xFFF4F5F7),
                          height: 1.0,
                          child: null,
                        ),
                      ),
                    ],
                  ),
                  InkWell(
                    onTap: () {
                      phone = 'Laoptops';
                      setState(() {});
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        phone == 'Laoptops'
                            ? Image.asset('assets/icons/gender_selected.png',width: 20.0)
                            : SvgPicture.asset('assets/icons/gender_unselected.svg',width: 20.0),
                        SizedBox(width: 10.0),
                        Expanded(
                          flex: 1,
                          child: Text(
                            'Laoptops',
                            style: TextStyle(color: AppColors.secondary),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.symmetric(vertical: 10.0),
                          color: Color(0xFFF4F5F7),
                          height: 1.0,
                          child: null,
                        ),
                      ),
                    ],
                  ),
                  InkWell(
                    onTap: () {
                      phone = 'Television';
                      setState(() {});
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        phone == 'Television'
                            ? Image.asset('assets/icons/gender_selected.png',width: 20.0)
                            : SvgPicture.asset('assets/icons/gender_unselected.svg',width: 20.0),
                        SizedBox(width: 10.0),
                        Expanded(
                          flex: 1,
                          child: Text(
                            'Television',
                            style: TextStyle(color: AppColors.secondary),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.symmetric(vertical: 10.0),
                          color: Color(0xFFF4F5F7),
                          height: 1.0,
                          child: null,
                        ),
                      ),
                    ],
                  ),
                  InkWell(
                    onTap: () {
                      phone = 'Camcorders & Camera';
                      setState(() {});
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        phone == 'Camcorders & Camera'
                            ? Image.asset('assets/icons/gender_selected.png',width: 20.0)
                            : SvgPicture.asset('assets/icons/gender_unselected.svg',width: 20.0),
                        SizedBox(width: 10.0),
                        Expanded(
                          flex: 1,
                          child: Text(
                            'Camcorders & Camera',
                            style: TextStyle(color: AppColors.secondary),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: () {
                isClickedElectonics = !isClickedElectonics;
                isClickedPhone = false;
                isClickedVehicle = false;
                setState(() {});
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 10.0),
                margin: EdgeInsets.only(top: 10.0),
                decoration: boxDecorationTopRadius(),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset('assets/images/laptop.png',width: 36.0),
                    SizedBox(width: 10.0),
                    Expanded(
                      flex: 1,
                      child: Text(
                        'Electronics',
                        style: TextStyle(color: Colors.black,fontSize: 16.0),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ),
                    SizedBox(width: 10.0),
                    isClickedElectonics == false ?
                    SvgPicture.asset('assets/icons/down_arrow.svg') :
                    SvgPicture.asset('assets/icons/up_arrow.svg'),
                  ],
                ),
              ),
            ),
            isClickedElectonics == false ? Container() :
            Container(
              padding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 10.0),
              decoration: boxDecorationBottomRadius(),
              child: Column(
                children: [
                  InkWell(
                    onTap: () {
                      electornics = 'Electronics 1';
                      setState(() {});
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        electornics == 'Electronics 1'
                            ? Image.asset('assets/icons/gender_selected.png',width: 20.0)
                            : SvgPicture.asset('assets/icons/gender_unselected.svg',width: 20.0),
                        SizedBox(width: 10.0),
                        Expanded(
                          flex: 1,
                          child: Text(
                            'Electronics 1',
                            style: TextStyle(color: AppColors.secondary),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.symmetric(vertical: 10.0),
                          color: Color(0xFFF4F5F7),
                          height: 1.0,
                          child: null,
                        ),
                      ),
                    ],
                  ),
                  InkWell(
                    onTap: () {
                      electornics = 'Electronics 2';
                      setState(() {});
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        electornics == 'Electronics 2'
                            ? Image.asset('assets/icons/gender_selected.png',width: 20.0)
                            : SvgPicture.asset('assets/icons/gender_unselected.svg',width: 20.0),
                        SizedBox(width: 10.0),
                        Expanded(
                          flex: 1,
                          child: Text(
                            'Electronics 2',
                            style: TextStyle(color: AppColors.secondary),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.symmetric(vertical: 10.0),
                          color: Color(0xFFF4F5F7),
                          height: 1.0,
                          child: null,
                        ),
                      ),
                    ],
                  ),
                  InkWell(
                    onTap: () {
                      electornics = 'Electronics 3';
                      setState(() {});
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        electornics == 'Electronics 3'
                            ? Image.asset('assets/icons/gender_selected.png',width: 20.0)
                            : SvgPicture.asset('assets/icons/gender_unselected.svg',width: 20.0),
                        SizedBox(width: 10.0),
                        Expanded(
                          flex: 1,
                          child: Text(
                            'Electronics 3',
                            style: TextStyle(color: AppColors.secondary),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.symmetric(vertical: 10.0),
                          color: Color(0xFFF4F5F7),
                          height: 1.0,
                          child: null,
                        ),
                      ),
                    ],
                  ),
                  InkWell(
                    onTap: () {
                      electornics = 'Electronics 4';
                      setState(() {});
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        electornics == 'Electronics 4'
                            ? Image.asset('assets/icons/gender_selected.png',width: 20.0)
                            : SvgPicture.asset('assets/icons/gender_unselected.svg',width: 20.0),
                        SizedBox(width: 10.0),
                        Expanded(
                          flex: 1,
                          child: Text(
                            'Electronics 4',
                            style: TextStyle(color: AppColors.secondary),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: () {
                isClickedVehicle = !isClickedVehicle;
                isClickedPhone = false;
                isClickedElectonics = false;
                setState(() {});
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 10.0),
                margin: EdgeInsets.only(top: 10.0),
                decoration: boxDecorationTopRadius(),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset('assets/images/vehicle.png',width: 36.0),
                    SizedBox(width: 10.0),
                    Expanded(
                      flex: 1,
                      child: Text(
                        'Vehicles & Auto mobiles',
                        style: TextStyle(color: Colors.black,fontSize: 16.0),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ),
                    SizedBox(width: 10.0),
                    isClickedVehicle == false ?
                    SvgPicture.asset('assets/icons/down_arrow.svg') :
                    SvgPicture.asset('assets/icons/up_arrow.svg'),
                  ],
                ),
              ),
            ),
            isClickedVehicle == false ? Container() :
            Container(
              padding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 10.0),
              decoration: boxDecorationBottomRadius(),
              child: Column(
                children: [
                  InkWell(
                    onTap: () {
                      vehicle = 'Vehicle1';
                      setState(() {});
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        vehicle == 'Vehicle 1'
                            ? Image.asset('assets/icons/gender_selected.png',width: 20.0)
                            : SvgPicture.asset('assets/icons/gender_unselected.svg',width: 20.0),
                        SizedBox(width: 10.0),
                        Expanded(
                          flex: 1,
                          child: Text(
                            'Vehicle 1',
                            style: TextStyle(color: AppColors.secondary),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.symmetric(vertical: 10.0),
                          color: Color(0xFFF4F5F7),
                          height: 1.0,
                          child: null,
                        ),
                      ),
                    ],
                  ),
                  InkWell(
                    onTap: () {
                      vehicle = 'Vehicle2';
                      setState(() {});
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        vehicle == 'Vehicle 2'
                            ? Image.asset('assets/icons/gender_selected.png',width: 20.0)
                            : SvgPicture.asset('assets/icons/gender_unselected.svg',width: 20.0),
                        SizedBox(width: 10.0),
                        Expanded(
                          flex: 1,
                          child: Text(
                            'Vehicle 2',
                            style: TextStyle(color: AppColors.secondary),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.symmetric(vertical: 10.0),
                          color: Color(0xFFF4F5F7),
                          height: 1.0,
                          child: null,
                        ),
                      ),
                    ],
                  ),
                  InkWell(
                    onTap: () {
                      vehicle = 'Vehicle3';
                      setState(() {});
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        vehicle == 'Vehicle 3'
                            ? Image.asset('assets/icons/gender_selected.png',width: 20.0)
                            : SvgPicture.asset('assets/icons/gender_unselected.svg',width: 20.0),
                        SizedBox(width: 10.0),
                        Expanded(
                          flex: 1,
                          child: Text(
                            'Vehicle 3',
                            style: TextStyle(color: AppColors.secondary),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.symmetric(vertical: 10.0),
                          color: Color(0xFFF4F5F7),
                          height: 1.0,
                          child: null,
                        ),
                      ),
                    ],
                  ),
                  InkWell(
                    onTap: () {
                      vehicle = 'Vehicle4';
                      setState(() {});
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        vehicle == 'Vehicle 4'
                            ? Image.asset('assets/icons/gender_selected.png',width: 20.0)
                            : SvgPicture.asset('assets/icons/gender_unselected.svg',width: 20.0),
                        SizedBox(width: 10.0),
                        Expanded(
                          flex: 1,
                          child: Text(
                            'Vehicle 4',
                            style: TextStyle(color: AppColors.secondary),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.fromLTRB(20.0,0.0,20.0,20.0),
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
              fontSize: 16.0
            // fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }

  boxDecorationTopRadius() {
    return BoxDecoration(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(8.0),
        topRight: Radius.circular(8.0),
      ),
      // color: Colors.red.shade100,
      color: Colors.white,
      boxShadow: [
        BoxShadow(
          color: Color.fromARGB(4, 10, 64, 3),
          offset: Offset(0.0, 7.0),
          blurRadius: 30.0,
        ),
      ],
    );
  }
  boxDecorationBottomRadius() {
    return BoxDecoration(
      borderRadius: const BorderRadius.only(
        bottomLeft: Radius.circular(8.0),
        bottomRight: Radius.circular(8.0),
      ),
      // color: Colors.red.shade100,
      color: Colors.white,
      boxShadow: [
        BoxShadow(
          color: Color.fromARGB(4, 10, 64, 3),
          offset: Offset(0.0, 7.0),
          blurRadius: 30.0,
        ),
      ],
    );
  }

}

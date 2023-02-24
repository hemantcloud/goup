// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:goup/views/utilities/utilities.dart';
import 'package:image_picker/image_picker.dart';

class CreatePosting extends StatefulWidget {
  CreatePosting({Key? key}) : super(key: key);

  @override
  State<CreatePosting> createState() => _CreatePostingState();
}

class _CreatePostingState extends State<CreatePosting> {
  bool isWarrentySelected = false;
  String warrentyText = 'Available';
  final ImagePicker imagePicker = ImagePicker();
  XFile? photoController;
  List<XFile>? imageFileList = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.white,
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
            margin: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
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
                      'Create Posting',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
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
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(bottom: 10.0),
              child: Text(
                'Tittle of product',
                style: TextStyle(color: Colors.black,fontSize: 16.0),
              ),
            ),
            Container(
              // height: 46.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: Color(0xFFEAEAEB),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width: 10.0),
                  Expanded(
                    flex: 1,
                    child: TextFormField(
                      style: const TextStyle(fontSize: 14.0, color: AppColors.black),
                      cursorColor: AppColors.primary,
                      decoration: myInputDecoration('Write product name here'),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(top: 15.0,bottom: 10.0),
              child: Text(
                'Asking Price',
                style: TextStyle(color: Colors.black,fontSize: 16.0),
              ),
            ),
            Container(
              // height: 46.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: Color(0xFFEAEAEB),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width: 10.0),
                  Expanded(
                    flex: 1,
                    child: TextFormField(
                      style: const TextStyle(fontSize: 14.0, color: AppColors.black),
                      cursorColor: AppColors.primary,
                      decoration: myInputDecoration('Write price here'),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(right: 15.0),
                    child: SvgPicture.asset('assets/icons/dollar.svg'),
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(top: 15.0,bottom: 10.0),
              child: Text(
                'Quantity',
                style: TextStyle(color: Colors.black,fontSize: 16.0),
              ),
            ),
            Container(
              // height: 46.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: Color(0xFFEAEAEB),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width: 10.0),
                  Expanded(
                    flex: 1,
                    child: TextFormField(
                      style: const TextStyle(fontSize: 14.0, color: AppColors.black),
                      cursorColor: AppColors.primary,
                      decoration: myInputDecoration('Write quantity here'),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(top: 15.0,bottom: 10.0),
              child: Text(
                'Description',
                style: TextStyle(color: Colors.black,fontSize: 16.0),
              ),
            ),
            Container(
              // height: 46.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: Color(0xFFEAEAEB),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width: 10.0),
                  Expanded(
                    flex: 1,
                    child: TextFormField(
                      maxLines: 5,
                      style: const TextStyle(fontSize: 14.0, color: AppColors.black),
                      cursorColor: AppColors.primary,
                      decoration: myInputDecoration('Write descrition here'),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(top: 15.0,bottom: 10.0),
              child: Row(
                children: [
                  Text(
                    'Warrenty ',
                    style: TextStyle(color: Colors.black,fontSize: 16.0),
                  ),
                  Text(
                    '(Years)',
                    style: TextStyle(color: AppColors.secondary),
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: () {
                isWarrentySelected = !isWarrentySelected;
                setState(() {});
              },
              child: Container(
                height: 46.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: Color(0xFFEAEAEB),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(width: 10.0),
                    Expanded(
                      flex: 1,
                      child: Text(
                        warrentyText,
                        style: const TextStyle(fontSize: 14.0, color: AppColors.secondary),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(right: 15.0),
                      child: SvgPicture.asset('assets/icons/down_arrow.svg'),
                    ),
                  ],
                ),
              ),
            ),
            isWarrentySelected == false ? Container() :
            Container(
              padding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 10.0),
              child: Column(
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {});
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Row(
                            children: [
                              Text(
                                '1 year ',
                                style: TextStyle(color: Colors.black,fontSize: 16.0),
                              ),
                              Text(
                                '(since activate)',
                                style: TextStyle(color: AppColors.secondary),
                              ),
                            ],
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
                      setState(() {});
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Row(
                            children: [
                              Text(
                                '2 year ',
                                style: TextStyle(color: Colors.black,fontSize: 16.0),
                              ),
                              Text(
                                '(since activate)',
                                style: TextStyle(color: AppColors.secondary),
                              ),
                            ],
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
                      setState(() {});
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Row(
                            children: [
                              Text(
                                '3 year ',
                                style: TextStyle(color: Colors.black,fontSize: 16.0),
                              ),
                              Text(
                                '(since activate)',
                                style: TextStyle(color: AppColors.secondary),
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
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(top: 15.0,bottom: 10.0),
              child: Row(
                children: [
                  Text(
                    'Number of clones ',
                    style: TextStyle(color: Colors.black,fontSize: 16.0),
                  ),
                  Text(
                    '(if available)',
                    style: TextStyle(color: AppColors.secondary),
                  ),
                ],
              ),
            ),
            Container(
              // height: 46.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: Color(0xFFEAEAEB),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width: 10.0),
                  Expanded(
                    flex: 1,
                    child: TextFormField(
                      style: const TextStyle(fontSize: 14.0, color: AppColors.black),
                      cursorColor: AppColors.primary,
                      decoration: myInputDecoration('Write number of clones'),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(top: 15.0,bottom: 10.0),
              child: Text(
                'Discount value',
                style: TextStyle(color: Colors.black,fontSize: 16.0),
              ),
            ),
            Container(
              // height: 46.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: Color(0xFFEAEAEB),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width: 10.0),
                  Expanded(
                    flex: 1,
                    child: TextFormField(
                      style: const TextStyle(fontSize: 14.0, color: AppColors.black),
                      cursorColor: AppColors.primary,
                      decoration: myInputDecoration('Write price here'),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(right: 15.0),
                    child: SvgPicture.asset('assets/icons/dollar.svg'),
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(top: 15.0,bottom: 10.0),
              child: Text(
                'Add Image',
                style: TextStyle(color: Colors.black,fontSize: 16.0),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        bottom_select_multiple(context);
                      },
                      child: Image.asset(
                          'assets/images/select_image.png',
                          height: 100.0
                      ),
                    ),
                    imageFileList!.length <= 0 ? Container() :
                    SizedBox(
                      height: 100.0,
                      child: ListView.builder(
                          itemCount: imageFileList!.length,
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                Container(
                                  child: Expanded(
                                    flex: 1,
                                    child: Stack(
                                      children: [
                                        Image.file(
                                          File(imageFileList![index].path),
                                          width: 100.0,
                                          height: 100.0,
                                          fit: BoxFit.cover,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            );
                          }
                      ),
                    ),
                  ],
                ),
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
          'Save & Continue',
          style: TextStyle(
              color: Colors.white,
              fontSize: 16.0
            // fontWeight: FontWeight.w700,
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
  // bottom bar for select image multiple
  bottom_select_multiple(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        builder: (context) {
          return Wrap(children: [
            ListTile(
              leading: Icon(Icons.camera_alt),
              title: Text('Camera'),
              onTap: () {
                //Navigator.pop(context);
                pickImageMultipleCam(context, ImageSource.camera);
              },
            ),
            ListTile(
              leading: Icon(Icons.photo_album),
              title: Text('Gallery'),
              onTap: () {
                // Navigator.pop(context);
                pickImageMultiple(context, ImageSource.gallery);
              },
            ),
          ]);
        });
  }
  // pick Image multiple camera
  Future pickImageMultipleCam(BuildContext context, imageSource) async {
    // imageFileList!.clear();
    if (!kIsWeb) {
      // may be android
      final selectedImage = await imagePicker.pickImage(source: imageSource);
      if (selectedImage == null) {
        print('+++++++++null');
        Navigator.pop(context);
      } else {
        imageFileList!.add(selectedImage);
        /* print('remove this . ------');
          if(imageFileList!.contains(selectedImages)){
            imageFileList!.remove(selectedImages);
          }*/
        print('image count ------------(android) ' +
            imageFileList!.length.toString());
        Navigator.pop(context);
      }
      setState(() {});
    } else if (kIsWeb) {
      // may be ios
      final selectedImage = await imagePicker.pickImage(source: imageSource);
      if (selectedImage == null) {
        print('+++++++++null');
        Navigator.pop(context);
      } else {
        imageFileList!.add(selectedImage);
        /* print('remove this . ------');
          if(imageFileList!.contains(selectedImages)){
            imageFileList!.remove(selectedImages);
          }*/
        print('image count ------------(ios) ' +
            imageFileList!.length.toString());
        Navigator.pop(context);
      }
      setState(() {});
    }
  }
  // pick Image multiple
  Future pickImageMultiple(BuildContext context, imageSource) async {
    // imageFileList!.clear();
    if (!kIsWeb) {
      // may be android
      final List<XFile>? selectedImages = await imagePicker.pickMultiImage();
      if (selectedImages == null) {
        print('+++++++++null');
        Navigator.pop(context);
      } else {
        if (selectedImages.isNotEmpty) {
          imageFileList!.addAll(selectedImages);
          /* print('remove this . ------');
          if(imageFileList!.contains(selectedImages)){
            imageFileList!.remove(selectedImages);
          }*/
        }
        print('image count ------------(android) ' +
            imageFileList!.length.toString());
        Navigator.pop(context);
      }
      setState(() {});
    } else if (kIsWeb) {
      // may be ios
      final List<XFile>? selectedImages = await imagePicker.pickMultiImage();
      if (selectedImages == null) {
        print('+++++++++null');
        Navigator.pop(context);
      } else {
        if (selectedImages.isNotEmpty) {
          imageFileList!.addAll(selectedImages);
        }
        print('image count ------------(ios) ' +
            imageFileList!.length.toString());
        Navigator.pop(context);
      }
      setState(() {});
    }
  }
}

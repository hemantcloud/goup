// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:goup/utitlities/utitlities.dart';
import 'package:goup/views/utilities/utilities.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class CreatePosting extends StatefulWidget {
  CreatePosting({Key? key}) : super(key: key);

  @override
  State<CreatePosting> createState() => _CreatePostingState();
}

class _CreatePostingState extends State<CreatePosting> {
  bool isWarrantySelected = false;
  int warrantyText = 0;
  final ImagePicker imagePicker = ImagePicker();
  // XFile? photoController;
  List<XFile>? imageFileList = [];
  XFile? imageFile;
  TextEditingController titleController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController quantityController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController cloneController = TextEditingController();
  TextEditingController discountController = TextEditingController();

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
                      'Create Posting',
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
              padding: EdgeInsets.only(bottom: 10.0),
              child: Text(
                'Title of product',
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
                      controller: titleController,
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
                      keyboardType: TextInputType.number,
                      controller: priceController,
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
                      controller: quantityController,
                      keyboardType: TextInputType.number,
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
                      controller: descriptionController,
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
                    'Warranty ',
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
                isWarrantySelected = !isWarrantySelected;
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
                        warrantyText == 0 ? 'Available' : '${warrantyText.toString()} year',
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
            isWarrantySelected == false ? Container() :
            Container(
              padding: EdgeInsets.symmetric(vertical: 10.0),
              child: Column(
                children: [
                  InkWell(
                    onTap: () {
                      warrantyText = 1;
                      setState(() {});
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 10.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        color: warrantyText == 1 ? Color(0xFFEAEAEB) : Colors.transparent,
                      ),
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
                      warrantyText = 2;
                      setState(() {});
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 10.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        color: warrantyText == 2 ? Color(0xFFEAEAEB) : Colors.transparent,
                      ),
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
                      warrantyText = 3;
                      setState(() {});
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 10.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        color: warrantyText == 3 ? Color(0xFFEAEAEB) : Colors.transparent,
                      ),
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
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(top: 5.0,bottom: 10.0),
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
                      controller: cloneController,
                      keyboardType: TextInputType.number,
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
                      controller: discountController,
                      keyboardType: TextInputType.number,
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
              alignment: Alignment.centerLeft,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
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
                                /*Container(
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                                  ),
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
                                ),*/
                                /*Stack(
                                  alignment: Alignment.topRight,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                      ),
                                      child: Image.file(
                                        File(imageFileList![index].path),
                                        width: 100.0,
                                        height: 100.0,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    SvgPicture.asset('assets/icons/cross2.svg'),
                                  ],
                                ),*/
                                Container(
                                  width: 100.0,
                                  height: 100.0,
                                  margin: EdgeInsets.only(left: 10.0),
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                                    image: DecorationImage(
                                      image: FileImage(File(imageFileList![index].path)),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        right: -4.0,
                                        top: -4.0,
                                        child: InkWell(
                                          onTap: (){
                                            imageFileList!.removeAt(index);
                                            setState(() {});
                                          },
                                          child: Container(
                                            padding: EdgeInsets.all(4.0),
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(Radius.circular(50.0)),
                                              color: Colors.white
                                            ),
                                            child: SvgPicture.asset('assets/icons/cross2.svg'),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                /*Container(
                                  width: 100.0,
                                  height: 100.0,
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                                    image: DecorationImage(
                                      image: FileImage(
                                        File(imageFileList![index].path),
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        right: 0,
                                        top: 0,
                                        child: Container(
                                          padding: EdgeInsets.all(20.0),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                          ),
                                          width: 12.0,
                                          height: 12.0,
                                          child: SvgPicture.asset('assets/icons/cross2.svg'),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),*/
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
      bottomNavigationBar: InkWell(
        onTap: () {
          String title = titleController.text;
          String price = priceController.text;
          String quantity = quantityController.text;
          String description = descriptionController.text;
          String clone = cloneController.text;
          String discount = discountController.text;
          if (title.isEmpty) {
            Utilities().toast("Please Enter title.");
          } else if (price.isEmpty) {
            Utilities().toast("Please Enter price.");
          } else if (quantity.isEmpty) {
            Utilities().toast("Please Enter quantity.");
          } else if (description.isEmpty) {
            Utilities().toast("Please Enter description.");
          } else if (warrantyText == 0) {
            isWarrantySelected = true;
            setState(() {});
            Utilities().toast("Please select warrenty.");
          } else if (clone.isEmpty) {
            Utilities().toast("Please Enter clone.");
          } else if (discount.isEmpty) {
            Utilities().toast("Please Enter discount.");
          } else if (imageFileList!.length < 1) {
            Utilities().toast("Please Select atleast one image.");
          }else {
            print('Done');
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
            'Save & Continue',
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
  // bottom bar for select image
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
                // pickImageCam(context, ImageSource.camera);
                _imgFromCamera();
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
  Future pickImageCam(BuildContext context, imageSource) async {
    Navigator.pop(context);
    // imageFileList!.clear();
    if (!kIsWeb) {
      // may be android
      final selectedImage = await imagePicker.pickImage(source: imageSource);
      if (selectedImage == null) {
        print('+++++++++null');
      } else {
        imageFileList!.add(selectedImage);
      }
      setState(() {});
    } else if (kIsWeb) {
      // may be ios
      final selectedImage = await imagePicker.pickImage(source: imageSource);
      if (selectedImage == null) {
        print('+++++++++null');
      } else {
        imageFileList!.add(selectedImage);
      }
      setState(() {});
    }
  }
  // pick Image multiple
  Future pickImageMultiple(BuildContext context, imageSource) async {
    Navigator.pop(context);
    // imageFileList!.clear();
    if (!kIsWeb) {
      // may be android
      final List<XFile>? selectedImages = await imagePicker.pickMultiImage();
      if (selectedImages == null) {
        print('+++++++++null');
      } else {
        if (selectedImages.isNotEmpty) {
          imageFileList!.addAll(selectedImages);
        }
      }
      setState(() {});
    } else if (kIsWeb) {
      // may be ios
      final List<XFile>? selectedImages = await imagePicker.pickMultiImage();
      if (selectedImages == null) {
        print('+++++++++null');
      } else {
        if (selectedImages.isNotEmpty) {
          imageFileList!.addAll(selectedImages);
        }
      }
      setState(() {});
    }
  }
  _imgFromCamera() async {
    Navigator.pop(context);
    await imagePicker.pickImage(
        source: ImageSource.camera, imageQuality: 50
    ).then((value){
      if(value != null){
        _cropImage(File(value.path));
      }
    });
  }
  _cropImage(File imgFile) async {
    final croppedFile = await ImageCropper().cropImage(
        sourcePath: imgFile.path,
        aspectRatioPresets: Platform.isAndroid
            ? [
          // CropAspectRatioPreset.square,
          // CropAspectRatioPreset.ratio3x2,
          CropAspectRatioPreset.original,
          // CropAspectRatioPreset.ratio4x3,
          // CropAspectRatioPreset.ratio16x9
        ] : [
          CropAspectRatioPreset.original,
          // CropAspectRatioPreset.square,
          // CropAspectRatioPreset.ratio3x2,
          // CropAspectRatioPreset.ratio4x3,
          // CropAspectRatioPreset.ratio5x3,
          // CropAspectRatioPreset.ratio5x4,
          // CropAspectRatioPreset.ratio7x5,
          // CropAspectRatioPreset.ratio16x9
        ],
        uiSettings: [AndroidUiSettings(
            toolbarTitle: "Image Cropper",
            activeControlsWidgetColor: AppColors.primary,
            toolbarColor: AppColors.primary,
            toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false),
          IOSUiSettings(
            title: "Image Cropper",
          )
        ]);
    if (croppedFile != null) {
      imageCache.clear();
      setState(() {
        imageFile = XFile(croppedFile.path);
        imageFileList!.add(imageFile!);
      });
      // reload();
    }
  }
}

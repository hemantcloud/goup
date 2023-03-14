// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:goup/models/product_size_model.dart';
import 'package:goup/models/product_detail_model.dart';
import 'package:goup/views/home/comment2.dart';
import 'package:goup/views/home/order_preview.dart';
import 'package:goup/views/home/comment.dart';
import 'package:goup/views/home/home_slider.dart';
import 'package:goup/views/home/other_users_profile.dart';
import 'package:goup/views/utilities/utilities.dart';
import 'package:page_transition/page_transition.dart';
class ProductDetail extends StatefulWidget {
  const ProductDetail({Key? key}) : super(key: key);

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  bool _isFav = false;
  final List<String> imgList = [
    'assets/images/product_image.png',
    'assets/images/product_image2.png',
    // 'assets/images/product_image3.png',
    'assets/images/product_image4.png',
  ];
  final List<ProductDetailModel> productDetailList = [
    ProductDetailModel(image: 'assets/images/product_image.png'),
    ProductDetailModel(image: 'assets/images/product_image1.png'),
    ProductDetailModel(image: 'assets/images/product_image2.png'),
    ProductDetailModel(image: 'assets/images/product_image4.png'),
  ];
  String? productDetailSelected = '';
  final List<ProductSizeModel> productSizes = [
    ProductSizeModel(size: 45),
    ProductSizeModel(size: 55),
    ProductSizeModel(size: 54),
    ProductSizeModel(size: 32),
    ProductSizeModel(size: 31),
    ProductSizeModel(size: 65),
    ProductSizeModel(size: 53),
  ];
  int productSizeSelected = 0;
  TextEditingController messageController = TextEditingController();
  bool _isLiked = false;
  String? likeCount = '30';
  int _count = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(bottom: 70.0),
        child: Column(
          children: [
            Column(
              children: [
                Stack(
                  children: [
                    Column(
                      children: [
                        HomeSlider(imgList: imgList),
                      ],
                    ),
                    Positioned(
                      top: 45,
                      left: 16,
                      child: InkWell(
                        onTap: () => Navigator.pop(context),
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        child: SvgPicture.asset('assets/icons/left.svg',width: 10.0,color: AppColors.black,),
                      )
                    ),
                    Positioned(
                      top: 35,
                      left: 40,
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            PageTransition(
                              type: PageTransitionType.rightToLeftWithFade,
                              alignment: Alignment.topCenter,
                              duration: Duration(milliseconds: 1000),
                              isIos: true,
                              child: OtherUsersProfile(),
                            ),
                          );
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(60.0),
                          child: Image.asset(
                            'assets/images/profile.png',
                            width: 40.0,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 40,
                      left: 90,
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            PageTransition(
                              type: PageTransitionType.rightToLeftWithFade,
                              alignment: Alignment.topCenter,
                              duration: Duration(milliseconds: 1000),
                              isIos: true,
                              child: OtherUsersProfile(),
                            ),
                          );
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Farhan Malik',style: TextStyle(color: AppColors.black),),
                            Text('3 hrs. Near Jeddah',style: TextStyle(color: AppColors.black),)
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                        top: 40,
                        right: 30,
                        child: InkWell(
                          // onTap: () => Navigator.pop(context),
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          child: Padding(padding: EdgeInsets.all(10.0),child: SvgPicture.asset('assets/icons/shopping_cart.svg',color: AppColors.black)),
                        )
                    ),
                    Positioned(
                        top: 40,
                        right: 10,
                        child: InkWell(
                          onTap: () => moreBottomSheet(context),
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          child: Padding(padding: EdgeInsets.all(10.0),child: SvgPicture.asset('assets/icons/menu.svg',color: AppColors.black)),
                        )
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: (){
                              int like = int.parse(likeCount.toString());
                              if(_isLiked == false){
                                _isLiked = true;
                                like++;
                                likeCount = like.toString();
                              }else{
                                _isLiked = false;
                                like--;
                                likeCount = like.toString();
                              }
                              setState(() {});
                            },
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            child: Container(
                              padding: EdgeInsets.only(left: 16.0,right: MediaQuery.of(context).size.width * 0.03),
                              child: Row(
                                children: [
                                  SvgPicture.asset(
                                    _isLiked == true
                                        ? 'assets/icons/filled_heart.svg'
                                        : 'assets/icons/empty_heart.svg',
                                    width: 16.0,
                                    height: 16.0,
                                  ),
                                  SizedBox(width: 3.0),
                                  Text(likeCount.toString(),style: TextStyle(color: AppColors.text),)
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  PageTransition(
                                    type: PageTransitionType.rightToLeftWithFade,
                                    alignment: Alignment.topCenter,
                                    duration: Duration(milliseconds: 1000),
                                    isIos: true,
                                    child: Comment2(),
                                  ),
                                );
                              },
                              splashColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              child: Container(
                                padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.01),
                                child: Row(
                                  children: [
                                    SvgPicture.asset(
                                      'assets/icons/chat.svg',
                                      width: 16.0,
                                      height: 16.0,
                                    ),
                                    SizedBox(width: 3.0),
                                    Text('09',style: TextStyle(color: AppColors.text),)
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                  'assets/icons/share.svg',
                                  width: 16.0,
                                  height: 16.0,
                                ),
                                SizedBox(width: 3.0),
                                Text('04',style: TextStyle(color: AppColors.text),)
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: InkWell(
                              onTap: () => analyticsBottomSheet(context),
                              splashColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              child: Container(
                                padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.01),
                                child: Row(
                                  children: [
                                    SvgPicture.asset(
                                      'assets/icons/stock.svg',
                                      width: 16.0,
                                      height: 16.0,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
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
                            child: Comment2(),
                          ),
                        );
                      },
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        height: 39.0,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: AppColors.primary,
                          borderRadius: BorderRadius.all(Radius.circular(6.0)),
                        ),
                        child: Text(
                          // 'Buy at \$280',
                          'Send message',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 16.0),
                  ],
                ),/*
                Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0.0),
                  child: Text(
                    'Most recent',
                    style: TextStyle(
                      color: AppColors.black,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),*/
              ],
            ),
            Expanded(
              flex: 1,
              /*child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const ScrollPhysics(),
                  itemCount: 4,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      width: MediaQuery.of(context).size.width * 1,
                      // padding: const EdgeInsets.all(10.0),
                      margin: const EdgeInsets.only(bottom: 10.0),
                      color: Colors.transparent,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                'assets/images/profile.png',
                                width: 40.0,
                              ),
                              SizedBox(width: 10.0),
                              Expanded(
                                flex: 1,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Samir Karim',
                                      style: const TextStyle(
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.black,
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          '3 hrs. ago',
                                          style: const TextStyle(
                                            fontSize: 15.0,
                                            fontWeight: FontWeight.w500,
                                            color: AppColors.black,
                                          ),
                                        ),
                                        Container(
                                          padding: EdgeInsets.symmetric(horizontal: 7.0),
                                          child: Text(
                                            '|',
                                            style: const TextStyle(
                                              fontSize: 15.0,
                                              fontWeight: FontWeight.w500,
                                              color: AppColors.black,
                                            ),
                                          ),
                                        ),
                                        SvgPicture.asset('assets/icons/location_marker.svg',width: 15.0),
                                        Padding(
                                          padding: const EdgeInsets.only(left: 5.0),
                                          child: Text(
                                            'Saudi Arabia',
                                            style: const TextStyle(
                                              fontSize: 15.0,
                                              fontWeight: FontWeight.w500,
                                              color: AppColors.black,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 10.0),
                            child: Expanded(
                              flex: 1,
                              child: Text(
                                'Lorem ipsum dolor sit consectetur adipiscing elit, sed do eiusmod tempor labore et dolore magna tempor.',
                                style: const TextStyle(
                                  color: AppColors.secondary2,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),*/
              child: Container(
                padding: const EdgeInsets.fromLTRB(16.0, 20.0, 16.0, 0.0),
                child: SingleChildScrollView(
                  physics: ScrollPhysics(),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Brand name: Nike',style: TextStyle(color: AppColors.primary)),
                                Text(
                                  'Nike military green sneaker',
                                  // 'Nike military green sneake dsf ds ds r fdsf dsf fds fdsf df dfd fdf df dfdsf dsf fds fdsf df dfd fdf df df ',
                                  style: TextStyle(
                                    color: AppColors.black,
                                    fontSize: 15.0,
                                    // fontWeight: FontWeight.w600
                                  )
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 10.0),
                          Text('\$280',style: TextStyle(color: AppColors.black,fontSize: 26.0,fontWeight: FontWeight.w700)),
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Color: ',style: TextStyle(color: AppColors.black)
                                  ),
                                  TextSpan(
                                    text: 'Military green',
                                    style: TextStyle(color: AppColors.black),
                                  ),
                                ],
                              ),
                            ),
                            Text(
                              'Only 2 Left',
                              style: TextStyle(
                                color: AppColors.text,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 80.0,
                        alignment: Alignment.centerLeft,
                        child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: productDetailList.length,
                            itemBuilder: (context, index) {
                              return
                                InkWell(
                                  onTap: () {
                                    productDetailSelected = productDetailList[index].image;
                                    setState(() {});
                                  },
                                  splashColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  child: Container(
                                    width: 77.5,
                                    // height: 100.0,
                                    alignment: Alignment.centerLeft,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                                      border: Border.all(
                                          color: productDetailSelected == productDetailList[index].image ?
                                          AppColors.primary : Colors.transparent,
                                          style: BorderStyle.solid,
                                          width: productDetailSelected == productDetailList[index].image ?
                                          2 : 0,
                                      ),
                                    ),
                                    margin: EdgeInsets.only(right: 10.0),
                                    child: Image.asset(
                                      productDetailList[index].image.toString(),
                                      width: 100.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                );
                            }),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Size',
                              style: TextStyle(fontWeight: FontWeight.bold,color: AppColors.black)
                            ),
                            Text(
                              'Size Chart',
                              style: TextStyle(
                                color: AppColors.text2,
                                decoration: TextDecoration.underline,
                                decorationColor: AppColors.text2,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 40.0,
                        // color: Colors.red,
                        alignment: Alignment.centerLeft,
                        child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: productSizes.length,
                            itemBuilder: (context, index) {
                              return
                                InkWell(
                                  onTap: () {
                                    productSizeSelected = productSizes[index].size!;
                                    setState(() {});
                                  },
                                  splashColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  child: Container(
                                    width: 40.0,
                                    // height: 100.0,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      // color: Color(0xFFDAF9EA),
                                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                                      color:
                                      productSizeSelected == productSizes[index].size!
                                        ? AppColors.primary
                                        : Colors.transparent,
                                      border: Border.all(
                                        width: 1,
                                        color:
                                        productSizeSelected == productSizes[index].size!
                                          ? AppColors.primary
                                          : Color(0xFF9CA3AF),
                                        style: BorderStyle.solid,
                                      ),
                                    ),
                                    margin: EdgeInsets.only(right: 10.0),
                                    child: Text(
                                      productSizes[index].size.toString(),
                                      style: TextStyle(
                                        color:
                                        productSizeSelected == productSizes[index].size!
                                          ? AppColors.white
                                          : AppColors.black,
                                      ),
                                    ),
                                  ),
                                );
                            }),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 20.0),
                        alignment: Alignment.centerLeft,
                        child: Text(
                            'Description',
                            style: TextStyle(
                                color: AppColors.black,
                                fontSize: 15.0,
                                // fontWeight: FontWeight.w600
                            )
                        ),
                      ),
                      Text(
                        'Lorem ipsum dolor sit consectetur adipiscing elit, sed do eiusmod tempor labore et dolore magna tempor.',
                        style: const TextStyle(
                          color: AppColors.secondary2,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Delivery option',
                              style: TextStyle(
                                color: AppColors.black,
                                fontSize: 15.0,
                                // fontWeight: FontWeight.w600
                              )
                            ),
                            Text(
                              'Size Chart',
                              style: TextStyle(
                                color: AppColors.primary,
                                decoration: TextDecoration.underline,
                                decorationColor: AppColors.primary,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        'Home delivery available. You just need to sacn the QR code.',
                        style: const TextStyle(
                          color: AppColors.secondary2,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      /*bottomSheet: Container(
        height: 78.0,
        padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 13.0),
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(60.0),
              child: Image.asset(
                'assets/images/profile.png',
                width: 40.0,
              ),
            ),
            SizedBox(width: 5.0),
            Expanded(
              flex: 1,
              child: TextFormField(
                textAlignVertical: TextAlignVertical.bottom,
                controller: messageController,
                style: const TextStyle(
                  fontSize: 14.0,
                  color: AppColors.secondary,
                ),
                cursorColor: AppColors.secondary,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(8.0),bottomLeft: Radius.circular(8.0)),
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(8.0),bottomLeft: Radius.circular(8.0)),
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(8.0),bottomLeft: Radius.circular(8.0)),
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                  fillColor: AppColors.bg,
                  filled: true,
                  hintText: 'Type Message...',
                  hintStyle: TextStyle(
                    fontSize: 14.0,
                    color: AppColors.secondary,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12.0,vertical: 16.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(topRight: Radius.circular(8.0),bottomRight: Radius.circular(8.0)),
                color: AppColors.bg,
              ),
              child: SvgPicture.asset(
                'assets/icons/send.svg',
              ),
            ),
          ],
        ),
      ),*/
      bottomSheet: Container(
        height: 70.0,
        padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 10.0),
        color: Colors.transparent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              flex: 1,
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    PageTransition(
                      type: PageTransitionType.rightToLeftWithFade,
                      alignment: Alignment.topCenter,
                      duration: Duration(milliseconds: 1000),
                      isIos: true,
                      child: OrderPreview(),
                    ),
                  );
                },
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.33,
                  height: 50.0,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                  child: Text(
                    // 'Buy at \$280',
                    'Buy now',
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () {
                      _count--;
                      setState(() {});
                    },
                    child: SvgPicture.asset('assets/icons/decrement.svg')
                  ),
                  Text(_count.toString(),style: TextStyle(color: AppColors.black,fontSize: 20.0)),
                  InkWell(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () {
                      _count++;
                      setState(() {});
                    },
                    child: SvgPicture.asset('assets/icons/increment.svg')
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  moreBottomSheet(BuildContext context) {
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
                          Row(
                            children: [
                              Expanded(
                                child: Container(
                                  color: Color(0xFFEAEAEA),
                                  height: 1.0,
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10.0,bottom: 10.0,left: 20.0),
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                    'assets/icons/unfollow.svg'
                                ),
                                SizedBox(width: 10.0),
                                Text(
                                  'Unfollow',
                                  style: TextStyle(
                                    color: AppColors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Container(
                                  color: Color(0xFFEAEAEA),
                                  height: 1.0,
                                  child: null,
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10.0,bottom: 10.0,left: 20.0),
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                  'assets/icons/link.svg'
                                ),
                                SizedBox(width: 10.0),
                                Text(
                                  'Copy link',
                                  style: TextStyle(
                                    color: AppColors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Container(
                                  color: Color(0xFFEAEAEA),
                                  height: 1.0,
                                  child: null,
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10.0,bottom: 10.0,left: 20.0),
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                  'assets/icons/offer.svg'
                                ),
                                SizedBox(width: 10.0),
                                Text(
                                  'Make an offer',
                                  style: TextStyle(
                                    color: AppColors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Container(
                                  color: Color(0xFFEAEAEA),
                                  height: 9.0,
                                  child: null,
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10.0,bottom: 10.0,left: 20.0),
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                  'assets/icons/report.svg'
                                ),
                                SizedBox(width: 10.0),
                                Text(
                                  'Report this post ',
                                  style: TextStyle(
                                    color: AppColors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Container(
                                  color: Color(0xFFEAEAEA),
                                  height: 1.0,
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10.0,bottom: 10.0,left: 20.0),
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                  'assets/icons/turn_of_notification.svg'
                                ),
                                SizedBox(width: 10.0),
                                Text(
                                  'Turn off notifications',
                                  style: TextStyle(
                                    color: AppColors.black,
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
  analyticsBottomSheet(BuildContext context) {
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

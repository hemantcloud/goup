// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:goup/models/product_size_model.dart';
import 'package:goup/models/product_detail_model.dart';
import 'package:goup/views/home/home_slider.dart';
import 'package:goup/views/utilities/utilities.dart';
class Comment extends StatefulWidget {
  const Comment({Key? key}) : super(key: key);

  @override
  State<Comment> createState() => _CommentState();
}

class _CommentState extends State<Comment> {
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
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.only(bottom: 70.0),
        child: Column(
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
                      child: SvgPicture.asset('assets/icons/left.svg',width: 10.0,color: AppColors.black,),
                    )
                ),
                Positioned(
                  top: 35,
                  left: 40,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(60.0),
                    child: Image.asset(
                      'assets/images/profile.png',
                      width: 40.0,
                    ),
                  ),
                ),
                Positioned(
                  top: 40,
                  left: 90,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Farhan Malik',style: TextStyle(color: AppColors.black),),
                      Text('3 hrs. Near Jeddah',style: TextStyle(color: AppColors.black),)
                    ],
                  ),
                ),
                Positioned(
                    top: 40,
                    right: 30,
                    child: InkWell(
                      // onTap: () => Navigator.pop(context),
                      child: Padding(padding: EdgeInsets.all(10.0),child: SvgPicture.asset('assets/icons/shopping_cart.svg',color: AppColors.black)),
                    )
                ),
                Positioned(
                    top: 40,
                    right: 10,
                    child: InkWell(
                      onTap: () => moreBottomSheet(context),
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
                        child: Container(
                          padding: EdgeInsets.only(right: MediaQuery.of(context).size.width * 0.01,left: 16.0),
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
                      Container(
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
                      Container(
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
                      Container(
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
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  height: 39.0,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.all(Radius.circular(6.0)),
                  ),
                  child: Text(
                    'Buy at \$280',
                    // 'Send message',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
            Expanded(
              flex: 1,
              child: ListView.builder(
                shrinkWrap: true,
                physics: const ScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                itemCount: 4,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    // width: MediaQuery.of(context).size.width * 1,
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
                          child: Text(
                            'Lorem ipsum dolor sit consectetur adipiscing elit, sed do eiusmod tempor labore et dolore magna tempor.',
                            style: const TextStyle(
                              color: AppColors.secondary2,
                            ),
                          ),
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
      bottomSheet: Container(
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

}

// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_const_declarations


import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:goup/models/product_model.dart';
import 'package:goup/views/home/product_detail.dart';
import 'package:goup/views/profile/categories.dart';
import 'package:goup/views/profile/create_posting.dart';
import 'package:goup/views/profile/edit_profile.dart';
import 'package:goup/views/profile/profile_settings.dart';
import 'package:goup/views/utilities/utilities.dart';
import 'package:page_transition/page_transition.dart';
import 'package:readmore/readmore.dart';
import 'package:goup/models/accrount_type_list_select_model.dart';
import 'package:goup/models/category_list_select_model.dart';
import 'package:goup/models/delivery_list_select_model.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> with TickerProviderStateMixin {
  late TabController _tabBarController;
  final List<ProductModel> productList = [
    ProductModel(name: 'iPhone 13 Pro Max', image: 'assets/images/product_image.jpg', price: '758', isFav: false),
    ProductModel(name: 'Double monk shoe', image: 'assets/images/product_image5.png', price: '758', isFav: false),
    ProductModel(name: 'Macbook Pro 13 in', image: 'assets/images/product_image6.png', price: '758', isFav: false),
    ProductModel(name: 'Apple watch 7 se', image: 'assets/images/product_image7.png', price: '758', isFav: false),
    ProductModel(name: 'iPhone 13 Pro Max', image: 'assets/images/product_image.jpg', price: '758', isFav: false),
    ProductModel(name: 'Double monk shoe', image: 'assets/images/product_image5.png', price: '758', isFav: false),
    ProductModel(name: 'Macbook Pro 13 in', image: 'assets/images/product_image6.png', price: '758', isFav: false),
    ProductModel(name: 'Apple watch 7 se', image: 'assets/images/product_image7.png', price: '758', isFav: false),
  ];
  String? categorylistselected;
  List<CategoryListSelectModel>? categoryListSelect = [
    CategoryListSelectModel(id: 1, name: 'Category 1'),
    CategoryListSelectModel(id: 2, name: 'Category 2'),
    CategoryListSelectModel(id: 3, name: 'Category 3'),
  ];
  String? accrountTypelistselected;
  List<AccrountTypeListSelectModel>? accrountTypeListSelect = [
    AccrountTypeListSelectModel(id: 1, name: 'Accournt Type 1'),
    AccrountTypeListSelectModel(id: 2, name: 'Accournt Type 2'),
    AccrountTypeListSelectModel(id: 3, name: 'Accournt Type 3'),
  ];
  String? deliverylistselected;
  List<DeliveryListSelectModel>? deliveryListSelect = [
    DeliveryListSelectModel(id: 1, name: 'Delivery 1'),
    DeliveryListSelectModel(id: 2, name: 'Delivery 2'),
    DeliveryListSelectModel(id: 3, name: 'Delivery 3'),
  ];
  RangeValues _currentRangeValues = const RangeValues(0, 100);
  @override
  void initState() {
// TODO: implement initState
    super.initState();
    _tabBarController = TabController(length: 3, vsync: this);
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
        // toolbarHeight: 50.0,
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                /*InkWell(
                  onTap: () => Navigator.of(context).pop(),
                  highlightColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  child: Container(
                    width: 24.0,
                    height: 24.0,
                    child: SvgPicture.asset('assets/icons/back.svg',color: AppColors.black,),
                  ),
                ),*/
                Expanded(
                  flex: 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            PageTransition(
                              type: PageTransitionType.rightToLeftWithFade,
                              alignment: Alignment.topCenter,
                              duration: Duration(milliseconds: 1000),
                              isIos: true,
                              child: CreatePosting(),
                            ),
                          );
                        },
                        highlightColor: Colors.transparent,
                        splashColor: Colors.transparent,
                        child: Container(
                          alignment: Alignment.center,
                          margin: EdgeInsets.only(right: 10.0),
                          child: Icon(Icons.post_add),
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
                              child: Categories(),
                            ),
                          );
                        },
                        highlightColor: Colors.transparent,
                        splashColor: Colors.transparent,
                        child: Container(
                          alignment: Alignment.center,
                          margin: EdgeInsets.only(right: 10.0),
                          child: Icon(Icons.category),
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
                              child: EditProfile(),
                            ),
                          );
                        },
                        highlightColor: Colors.transparent,
                        splashColor: Colors.transparent,
                        child: Container(
                          alignment: Alignment.center,
                          margin: EdgeInsets.only(right: 10.0),
                          child: SvgPicture.asset('assets/icons/edit.svg',color: Color(0xFF161C2A)),
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
                              child: ProfileSettings(),
                            ),
                          );
                        },
                        highlightColor: Colors.transparent,
                        splashColor: Colors.transparent,
                        child: Container(
                          alignment: Alignment.center,
                          // margin: EdgeInsets.all(10.0),
                          child: SvgPicture.asset('assets/icons/setting.svg',color: Color(0xFF161C2A)),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(16.0,16.0,16.0,0.0),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 50.0),
                    padding: EdgeInsets.fromLTRB(20.0,60.0,20.0,20.0),
                    alignment: Alignment.bottomCenter,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Color(0xFFF1F1F7),
                    ),
                    child: Column(
                      children: [
                        Text(
                          'Samir Karim',
                          style: TextStyle(
                              color: AppColors.black,
                              fontSize: 20.0,
                              fontWeight: FontWeight.w600
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset('assets/icons/location_marker.svg',width: 15.0,color: AppColors.primary,),
                            SizedBox(width: 10.0),
                            Text(
                              'Ryadh, Saudi Arabia',
                              style: TextStyle(
                                fontSize: 12.0,
                                color: AppColors.text,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Column(
                                children: [
                                  Text(
                                    '17.5k',
                                    style: TextStyle(
                                      color: AppColors.black,
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.w600
                                    ),
                                  ),
                                  Text(
                                    'Following',
                                    style: TextStyle(
                                      fontSize: 12.0,
                                      color: AppColors.text,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SvgPicture.asset('assets/icons/veritical_line.svg'),
                            Expanded(
                              child: Column(
                                children: [
                                  Text(
                                    '3.8k',
                                    style: TextStyle(
                                      color: AppColors.black,
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.w600
                                    ),
                                  ),
                                  Text(
                                    'Followers',
                                    style: TextStyle(
                                      fontSize: 12.0,
                                      color: AppColors.text,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SvgPicture.asset('assets/icons/veritical_line.svg'),
                            Expanded(
                              child: Column(
                                children: [
                                  Text(
                                    '254',
                                    style: TextStyle(
                                      color: AppColors.black,
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.w600
                                    ),
                                  ),
                                  Text(
                                    'Products',
                                    style: TextStyle(
                                      fontSize: 12.0,
                                      color: AppColors.text,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.only(top: 20.0),
                          child: Text(
                            'About me',
                            style: TextStyle(
                              color: AppColors.black,
                              fontSize: 16.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: ReadMoreText(
                            // aboutMeResult,
                            'Lorem ipsum dolor sit consectetur adipiscing elit, sed do eiusmod tempor labore et dolore joika magna yueh threas tempor.',
                            style: TextStyle(color: AppColors.text),
                            trimLines: 2,
                            trimMode: TrimMode.Line,
                            trimCollapsedText: 'Read more',
                            trimExpandedText: 'Read less',
                            moreStyle: TextStyle(fontWeight: FontWeight.w500,color: AppColors.primary),
                            lessStyle: TextStyle(fontWeight: FontWeight.w500,color: AppColors.primary),
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          height: 50.0,
                          margin: EdgeInsets.only(top: 15.0),
                          padding: EdgeInsets.symmetric(horizontal: 20.0),
                          decoration: BoxDecoration(
                            color: AppColors.primary,
                            borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          ),
                          child: Text(
                            'Upload Product',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14.0,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      decoration: BoxDecoration(
                        // color: Color(0xFFE6F2EA),
                          borderRadius: BorderRadius.all(Radius.circular(60.0)),
                          border: Border.all(color: Colors.white,width: 5)
                      ),
                      child: CircleAvatar(
                        // backgroundColor: Colors.transparent,
                        maxRadius: 50,
                        // radius: 60,
                        backgroundImage: AssetImage('assets/images/profile.png'),
                        child: Align(
                          alignment: Alignment.bottomRight,
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            child: SvgPicture.asset(
                              'assets/icons/qrcode.svg',
                              height: 25.0,
                              width: 25.0,
                              color: AppColors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                height: 48,
                margin: EdgeInsets.only(top: 20.0),
                padding: EdgeInsets.symmetric(vertical: 5.0),
                decoration: BoxDecoration(
                    border: Border.all(color: Color(0xFFF1F1F7)),
                    borderRadius: BorderRadius.circular(8.0),
                    color: Color(0xFFF1F1F7)
                ),
                child: TabBar(
                  controller: _tabBarController,
                  indicator: BoxDecoration(
                    color: AppColors.primary,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.all(Radius.circular(6.0)),
                  ),
                  tabs: [
                    Tab(text: 'Products'),
                    Tab(text: 'Purchases'),
                    Tab(text: 'Favourites'),
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
                      child: GridView.builder(
                        shrinkWrap: true,
                        physics: ScrollPhysics(),
                        gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 30 / 2,
                          childAspectRatio: 7 / 11,
                        ),
                        itemCount: productList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Column(
                            children: [
                              Container(
                                height: 165.0,
                                alignment: Alignment.bottomCenter,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  color: Colors.white,
                                  border: Border.all(
                                    width: 0.5,
                                    color: Color(0xFF9CA3AF),
                                    style: BorderStyle.solid,
                                  ),
                                ),
                                child: Stack(
                                  children: [
                                    Container(
                                      // padding: EdgeInsets.only(top: 30.0,left: 10.0,right: 10.0),
                                      child: InkWell(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            PageTransition(
                                              type: PageTransitionType.rightToLeftWithFade,
                                              alignment: Alignment.topCenter,
                                              duration: Duration(milliseconds: 1000),
                                              isIos: true,
                                              child: ProductDetail(),
                                            ),
                                          );
                                        },
                                        child: Image.asset(
                                          productList[index].image.toString(),
                                          height: 160.0,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      top: 10,
                                      left: 0,
                                      child: InkWell(
                                        onTap: () {
                                          formBottomSheet(context);
                                          // setState(() {});
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 8.0),
                                          child: SvgPicture.asset(
                                            'assets/icons/menu.svg',
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      top: 10,
                                      right: 0,
                                      child: InkWell(
                                        onTap: () {
                                          // if(productList[index].isFav == false){
                                          //   productList[index].isFav = true;
                                          // }else{
                                          //   productList[index].isFav = false;
                                          // }
                                          productList[index].isFav = !productList[index].isFav!;
                                          setState(() {});
                                        },
                                        child:
                                        productList[index].isFav == false ?
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 8.0),
                                          child: SvgPicture.asset(
                                            'assets/icons/empty_heart.svg',
                                          ),
                                        ) :
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 8.0),
                                          child: SvgPicture.asset(
                                            'assets/icons/filled_heart.svg',
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 10.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      // crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          flex: 1,
                                          child: Text(
                                            productList[index].name.toString(),
                                            style: TextStyle(
                                              color: AppColors.black,
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 2,
                                          ),
                                        ),
                                        SvgPicture.asset('assets/icons/shopping_cart.svg'),
                                      ],
                                    ),
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        '\$ ${productList[index].price.toString()}',
                                        style: TextStyle(
                                            color: AppColors.primary,
                                            fontWeight: FontWeight.w700
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: GridView.builder(
                        shrinkWrap: true,
                        physics: ScrollPhysics(),
                        gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 30 / 2,
                          childAspectRatio: 7 / 11,
                        ),
                        itemCount: productList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Column(
                            children: [
                              Container(
                                height: 165.0,
                                alignment: Alignment.bottomCenter,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  color: Colors.white,
                                  border: Border.all(
                                    width: 0.5,
                                    color: Color(0xFF9CA3AF),
                                    style: BorderStyle.solid,
                                  ),
                                ),
                                child: Stack(
                                  children: [
                                    Container(
                                      // padding: EdgeInsets.only(top: 30.0,left: 10.0,right: 10.0),
                                      child: InkWell(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            PageTransition(
                                              type: PageTransitionType.rightToLeftWithFade,
                                              alignment: Alignment.topCenter,
                                              duration: Duration(milliseconds: 1000),
                                              isIos: true,
                                              child: ProductDetail(),
                                            ),
                                          );
                                        },
                                        child: Image.asset(
                                          productList[index].image.toString(),
                                          height: 160.0,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      top: 10,
                                      left: 0,
                                      child: InkWell(
                                        onTap: () {
                                          formBottomSheet(context);
                                          // setState(() {});
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 8.0),
                                          child: SvgPicture.asset(
                                            'assets/icons/menu.svg',
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      top: 10,
                                      right: 0,
                                      child: InkWell(
                                        onTap: () {
                                          // if(productList[index].isFav == false){
                                          //   productList[index].isFav = true;
                                          // }else{
                                          //   productList[index].isFav = false;
                                          // }
                                          productList[index].isFav = !productList[index].isFav!;
                                          setState(() {});
                                        },
                                        child:
                                        productList[index].isFav == false ?
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 8.0),
                                          child: SvgPicture.asset(
                                            'assets/icons/empty_heart.svg',
                                          ),
                                        ) :
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 8.0),
                                          child: SvgPicture.asset(
                                            'assets/icons/filled_heart.svg',
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 10.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      // crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          flex: 1,
                                          child: Text(
                                            productList[index].name.toString(),
                                            style: TextStyle(
                                              color: AppColors.black,
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 2,
                                          ),
                                        ),
                                        SvgPicture.asset('assets/icons/shopping_cart.svg'),
                                      ],
                                    ),
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        '\$ ${productList[index].price.toString()}',
                                        style: TextStyle(
                                            color: AppColors.primary,
                                            fontWeight: FontWeight.w700
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: GridView.builder(
                        shrinkWrap: true,
                        physics: ScrollPhysics(),
                        gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 30 / 2,
                          childAspectRatio: 7 / 11,
                        ),
                        itemCount: productList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Column(
                            children: [
                              Container(
                                height: 165.0,
                                alignment: Alignment.bottomCenter,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  color: Colors.white,
                                  border: Border.all(
                                    width: 0.5,
                                    color: Color(0xFF9CA3AF),
                                    style: BorderStyle.solid,
                                  ),
                                ),
                                child: Stack(
                                  children: [
                                    Container(
                                      // padding: EdgeInsets.only(top: 30.0,left: 10.0,right: 10.0),
                                      child: InkWell(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            PageTransition(
                                              type: PageTransitionType.rightToLeftWithFade,
                                              alignment: Alignment.topCenter,
                                              duration: Duration(milliseconds: 1000),
                                              isIos: true,
                                              child: ProductDetail(),
                                            ),
                                          );
                                        },
                                        child: Image.asset(
                                          productList[index].image.toString(),
                                          height: 160.0,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      top: 10,
                                      left: 0,
                                      child: InkWell(
                                        onTap: () {
                                          formBottomSheet(context);
                                          // setState(() {});
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 8.0),
                                          child: SvgPicture.asset(
                                            'assets/icons/menu.svg',
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      top: 10,
                                      right: 0,
                                      child: InkWell(
                                        onTap: () {
                                          // if(productList[index].isFav == false){
                                          //   productList[index].isFav = true;
                                          // }else{
                                          //   productList[index].isFav = false;
                                          // }
                                          productList[index].isFav = !productList[index].isFav!;
                                          setState(() {});
                                        },
                                        child:
                                        productList[index].isFav == false ?
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 8.0),
                                          child: SvgPicture.asset(
                                            'assets/icons/empty_heart.svg',
                                          ),
                                        ) :
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 8.0),
                                          child: SvgPicture.asset(
                                            'assets/icons/filled_heart.svg',
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 10.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      // crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          flex: 1,
                                          child: Text(
                                            productList[index].name.toString(),
                                            style: TextStyle(
                                              color: AppColors.black,
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 2,
                                          ),
                                        ),
                                        SvgPicture.asset('assets/icons/shopping_cart.svg'),
                                      ],
                                    ),
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        '\$ ${productList[index].price.toString()}',
                                        style: TextStyle(
                                            color: AppColors.primary,
                                            fontWeight: FontWeight.w700
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
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
  formBottomSheet(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        isDismissible: false,
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
                      padding: EdgeInsets.symmetric(vertical: 30.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25.0),
                        color: Colors.white,
                      ),
                      child: Column(
                        children: [
                          const Divider(
                            height: 1,
                            thickness: 0.1,
                            color: Color(0xFF8D8D8D),
                            // color: Colors.black,
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 20.0,left: 20.0,right: 20.0,bottom: 10.0),
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Select Category',
                              style: TextStyle(
                                color: AppColors.black,
                                fontSize: 14.0,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          Container(
                            height: 44.0,
                            padding: const EdgeInsets.symmetric(horizontal: 10.0),
                            margin: const EdgeInsets.symmetric(horizontal: 10.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6.0),
                              color: Color(0xFFEAEAEB),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Expanded(
                                  flex: 1,
                                  child:
                                  DropdownButtonHideUnderline(
                                    child: DropdownButton(
                                      isExpanded: true,
                                      value: categorylistselected,
                                      style: const TextStyle(
                                          fontSize: 13.0,
                                          color: AppColors.text,
                                          fontFamily: 'Sora'
                                      ),
                                      items: categoryListSelect!.map((CategoryListSelectModel model) {
                                        return DropdownMenuItem<String>(
                                            value: model.id.toString(),
                                            child: Text(model.name.toString()));
                                      }).toList(),
                                      hint: const Text(
                                        "Select Category",
                                        style: TextStyle(
                                            fontSize: 13.0,
                                            color: AppColors.text,
                                            fontFamily: 'Sora'
                                        ),
                                      ),
                                      iconEnabledColor: AppColors.primary,
                                      iconDisabledColor: AppColors.text,
                                      onChanged: (valuee) {
                                        setState(() {
                                          categorylistselected = valuee.toString();
                                        });
                                        print('selected category is ---------------' + valuee.toString());
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 20.0,left: 20.0,right: 20.0,bottom: 10.0),
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Account type',
                              style: TextStyle(
                                color: AppColors.black,
                                fontSize: 14.0,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          Container(
                            height: 44.0,
                            padding: const EdgeInsets.symmetric(horizontal: 10.0),
                            margin: const EdgeInsets.symmetric(horizontal: 10.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6.0),
                              color: Color(0xFFEAEAEB),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Expanded(
                                  flex: 1,
                                  child:
                                  DropdownButtonHideUnderline(
                                    child: DropdownButton(
                                      isExpanded: true,
                                      value: accrountTypelistselected,
                                      style: const TextStyle(
                                          fontSize: 13.0,
                                          color: AppColors.text,
                                          fontFamily: 'Sora'
                                      ),
                                      items: accrountTypeListSelect!.map((AccrountTypeListSelectModel model) {
                                        return DropdownMenuItem<String>(
                                            value: model.id.toString(),
                                            child: Text(model.name.toString()));
                                      }).toList(),
                                      hint: const Text(
                                        "Select Account type",
                                        style: TextStyle(
                                            fontSize: 13.0,
                                            color: AppColors.text,
                                            fontFamily: 'Sora'
                                        ),
                                      ),
                                      iconEnabledColor: AppColors.primary,
                                      iconDisabledColor: AppColors.text,
                                      onChanged: (valuee) {
                                        setState(() {
                                          accrountTypelistselected = valuee.toString();
                                        });
                                        print('selected accrountTypelistselected is ---------------' + valuee.toString());
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 20.0,left: 20.0,right: 20.0,bottom: 10.0),
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Delivery',
                              style: TextStyle(
                                color: AppColors.black,
                                fontSize: 14.0,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          Container(
                            height: 44.0,
                            padding: const EdgeInsets.symmetric(horizontal: 10.0),
                            margin: const EdgeInsets.symmetric(horizontal: 10.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6.0),
                              color: Color(0xFFEAEAEB),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Expanded(
                                  flex: 1,
                                  child:
                                  DropdownButtonHideUnderline(
                                    child: DropdownButton(
                                      isExpanded: true,
                                      value: deliverylistselected,
                                      style: const TextStyle(
                                          fontSize: 13.0,
                                          color: AppColors.text,
                                          fontFamily: 'Sora'
                                      ),
                                      items: deliveryListSelect!.map((DeliveryListSelectModel model) {
                                        return DropdownMenuItem<String>(
                                            value: model.id.toString(),
                                            child: Text(model.name.toString()));
                                      }).toList(),
                                      hint: const Text(
                                        "Select Delivery",
                                        style: TextStyle(
                                            fontSize: 13.0,
                                            color: AppColors.text,
                                            fontFamily: 'Sora'
                                        ),
                                      ),
                                      iconEnabledColor: AppColors.primary,
                                      iconDisabledColor: AppColors.text,
                                      onChanged: (valuee) {
                                        setState(() {
                                          deliverylistselected = valuee.toString();
                                        });
                                        print('selected deliverylistselected is ---------------' + valuee.toString());
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 20.0,left: 20.0,right: 20.0,bottom: 10.0),
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Select price range',
                              style: TextStyle(
                                color: AppColors.black,
                                fontSize: 14.0,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          RangeSlider(
                            values: _currentRangeValues,
                            max: 350,
                            divisions: 350,
                            labels: RangeLabels(
                              _currentRangeValues.start.round().toString(),
                              _currentRangeValues.end.round().toString(),
                            ),
                            onChanged: (RangeValues values) {
                              _currentRangeValues = values;
                              print('_currentRangeValues is -----------$_currentRangeValues');
                              setState(() {});
                            },
                            activeColor: AppColors.primary,
                            inactiveColor: AppColors.secondary,
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

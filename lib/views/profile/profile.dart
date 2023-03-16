// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_const_declarations


import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:goup/models/product_model.dart';
import 'package:goup/models/users_list.dart';
import 'package:goup/views/home/comment2.dart';
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
import 'package:share_plus/share_plus.dart';

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
  bool _isLiked = false;
  String? likeCount = '20';

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
                              // fontWeight: FontWeight.w600
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
                              // fontWeight: FontWeight.w600,
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
                            height: 50.0,
                            margin: EdgeInsets.only(top: 15.0),
                            padding: EdgeInsets.symmetric(horizontal: 20.0),
                            decoration: BoxDecoration(
                              color: AppColors.primary,
                              borderRadius: BorderRadius.all(Radius.circular(10.0)),
                            ),
                            child: Text(
                              'Upload Product',
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: Colors.white,
                                // fontWeight: FontWeight.w600,
                                fontSize: 13.0,
                              ),
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
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: const ScrollPhysics(),
                        padding: const EdgeInsets.only(top: 10.0),
                        itemCount:  5,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            padding: EdgeInsets.fromLTRB(10.0,10.0,10.0,10.0),
                            margin: EdgeInsets.fromLTRB(0.0,5.0,0.0,5.0),
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                              // color: Colors.red.shade100,
                              color: Colors.white,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // Image.asset(
                                    //   'assets/images/profile.png',
                                    //   width: 40.0,
                                    // ),
                                    CircleAvatar(
                                      maxRadius: 22.0,
                                      backgroundImage: AssetImage('assets/images/profile.png'),
                                    ),
                                    SizedBox(width: 10.0),
                                    Expanded(
                                      flex: 1,
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Farhan Malik',
                                            style: const TextStyle(
                                              fontSize: 15.0,
                                              fontWeight: FontWeight.w500,
                                              color: AppColors.black,
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 1,
                                          ),
                                          Text(
                                            '1 hr. near Ryadh',
                                            style: const TextStyle(
                                              color: AppColors.text4,
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 1,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(left: 20.0),
                                      child: SvgPicture.asset(
                                          'assets/icons/shopping_cart.svg',
                                          color: AppColors.secondary
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () => productMoreBottomSheet(context),
                                      child: Row(
                                        children: [
                                          SizedBox(width: 20.0,),
                                          SvgPicture.asset(
                                              'assets/icons/menu.svg',
                                              color: AppColors.secondary
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(vertical: 10.0),
                                  child: Text(
                                    'iPhone 13 pro max, no scratch. Grab it asap!!',
                                    style: const TextStyle(
                                      color: AppColors.black,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: Stack(
                                        alignment: Alignment.bottomLeft,
                                        children: [
                                          Image.asset('assets/images/product_image10.jpg',height: 145.0,fit: BoxFit.cover),
                                          Positioned(
                                            bottom: 0,
                                            left: 0,
                                            child: Stack(
                                              alignment: Alignment.center,
                                              children: [
                                                SvgPicture.asset("assets/icons/bg.svg",width: 55.0,),
                                                Positioned(
                                                  bottom: 5,
                                                  left: 10,
                                                  child: Text("\$280",style: TextStyle(color: Colors.white,fontSize: 12.0)),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(width: 5.0),
                                    Expanded(
                                      flex: 1,
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Image.asset('assets/images/product_image11.jpg',height: 70.0,fit: BoxFit.cover),
                                          SizedBox(height: 5.0),
                                          Image.asset('assets/images/product_image12.jpg',height: 70.0,fit: BoxFit.cover),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 10.0),
                                Row(
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: Row(
                                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            flex: 1,
                                            child: InkWell(
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
                                                  Text(likeCount.toString(),style: TextStyle(color: AppColors.text),),
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
                                          Expanded(
                                            flex: 1,
                                            child: InkWell(
                                              onTap: () {
                                                print("object");
                                                _share();
                                              },
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
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: InkWell(
                                              onTap: () => analyticsBottomSheet(context),
                                              splashColor: Colors.transparent,
                                              highlightColor: Colors.transparent,
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
                                  ],
                                ),
                              ],
                            ),
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
  productMoreBottomSheet(BuildContext context) {
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
                          SizedBox(height: 20.0),
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
  void _share() {
    Share.share('check out my website https://example.com', subject: 'Look what I made!');
  }
}
class ProductsList{
  String? userProfile;
  String? userName;
  String? des;
  String? lastSeen;
  String? locaion;
}
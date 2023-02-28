// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:goup/models/accrount_type_list_select_model.dart';
import 'package:goup/models/category_list_select_model.dart';
import 'package:goup/models/category_model.dart';
import 'package:goup/models/delivery_list_select_model.dart';
import 'package:goup/models/product_model.dart';
import 'package:goup/views/authentication/login.dart';
import 'package:goup/views/dashboard.dart';
import 'package:goup/views/home/product_detail.dart';
import 'package:goup/views/home/profile_quick_view.dart';
import 'package:goup/views/utilities/utilities.dart';
import 'package:page_transition/page_transition.dart';
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool _isFav = false;
  final List<ProductModel> productList = [
    ProductModel(name: 'iPhone 13 Pro Max', image: 'assets/images/product_image.jpg', price: '758', isFav: false),
    ProductModel(name: 'Double monk shoe', image: 'assets/images/product_image5.png', price: '758', isFav: false),
    ProductModel(name: 'Macbook Pro 13 in', image: 'assets/images/product_image6.png', price: '758', isFav: false),
    ProductModel(name: 'Apple watch 7 se', image: 'assets/images/product_image7.png', price: '758', isFav: false),
  ];
  final List<CategoryModel> categorList = [
    CategoryModel(name: 'Fashion', image: 'assets/icons/fashion.svg', primarycolor: '#2DD4BF',secondarycolor: '#DAF9EA'),
    CategoryModel(name: 'Electronics', image: 'assets/icons/electonics.svg', primarycolor: '#FB923C', secondarycolor: '#FFF4E5'),
    CategoryModel(name: 'Appliances', image: 'assets/icons/appliances.svg', primarycolor: '#34D399', secondarycolor: '#E7FFF4'),
    CategoryModel(name: 'Beauty', image: 'assets/icons/beauty.svg', primarycolor: '#22D3EE', secondarycolor: '#DAFCFE'),
    CategoryModel(name: 'Furniture', image: 'assets/icons/furniture.svg', primarycolor: '#60A5FA', secondarycolor: '#E8F2FF'),
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
            // padding: const EdgeInsets.symmetric(horizontal: 10.0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.transparent, width: 0.0),
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () => formBottomSheet(context),
                  child: SvgPicture.asset(
                    'assets/icons/filter.svg',
                    width: 23.0,
                    color: AppColors.secondary,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset('assets/icons/location.svg'),
                      SizedBox(width: 10.0),
                      Text(
                        'Add location',
                        style: TextStyle(
                          fontSize: 14.0,
                          color: AppColors.secondary,
                          fontWeight: FontWeight.w500,
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
                        child: ProfileQuickView(),
                      ),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0xFFE6F2EA),
                      borderRadius: BorderRadius.all(Radius.circular(60.0)),
                      border: Border.all(color: Color(0xFF27E19E),width: 2)
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(60.0),
                      child: Image.asset(
                        'assets/images/profile.png',
                        width: 40.0,
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
      body: Padding(
        padding: EdgeInsets.fromLTRB(20.0,0.0,20.0,20.0),
        child: Column(
          children: [
            SvgPicture.asset('assets/icons/search_bar.svg'),
            Container(
              margin: EdgeInsets.only(top: 20.0),
              height: 80.0,
              child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: categorList.length,
                  itemBuilder: (context, index) {
                    final primarycolorsplitted = categorList[index].primarycolor!.split('#');
                    final secondarycolorsplitted = categorList[index].secondarycolor!.split('#');
                    String primaryC = '0xFF${primarycolorsplitted[1].toLowerCase()}';
                    String secondaryC = '0xFF${secondarycolorsplitted[1].toLowerCase()}';
                    return Row(
                      children: [
                        Column(
                          mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                          crossAxisAlignment:
                          CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: 52.0,
                              height: 52.0,
                              decoration: BoxDecoration(
                                color: Color(int.parse(secondaryC)),
                                borderRadius: BorderRadius.all(
                                    Radius.circular(100.0)),
                              ),
                              padding: EdgeInsets.all(10.0),
                              child:
                              SvgPicture.asset(categorList[index].image.toString(),width: 20.0,color: Color(int.parse(primaryC)),),
                            ),
                            Text(
                              categorList[index].name.toString(),
                              style: TextStyle(
                                fontSize: 10.0,
                                color: AppColors.secondary,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(width: 5.0),
                      ],
                    );
                  }),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Suggested for you',
                    style: TextStyle(
                      color: AppColors.black,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    'See all',
                    style: TextStyle(
                      color: AppColors.primary,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: GridView.builder(
                shrinkWrap: true,
                physics: ScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 30 / 2,
                  childAspectRatio: 8 / 13,
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
                            Positioned(
                              top: 10,
                              right: 10,
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
                            Container(
                              padding: EdgeInsets.only(top: 30.0,left: 10.0,right: 10.0),
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
    );
  }
  filterBottomSheet(BuildContext context) {
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
  Future filterAlert(context) {
    return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) => AlertDialog(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12.0)),
        ),
        insetPadding: EdgeInsets.symmetric(horizontal: 20.0,vertical: MediaQuery.of(context).size.height * 0.2),
        content: Container(
          // padding: EdgeInsets.symmetric(vertical: 10.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(12)),
            border: Border.all(color: Colors.white),
            color: Colors.white,
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SvgPicture.asset('assets/icons/report2.svg'),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: SvgPicture.asset('assets/icons/cross.svg'),
                  ),
                ],
              ),
              Image.asset('assets/images/boy_operating_computer.png',height: 150.0),
              Container(
                padding: EdgeInsets.symmetric(vertical: 10.0),
                child: Text(
                  'Hello, Farhan',
                  style: TextStyle(
                    fontSize: 16.0,
                    color: AppColors.primary,
                  ),
                ),
              ),
              Text(
                'If you re-share, your account will be converted to a marketer. You can now create your personal profile as a marketer and benefit from your percentage and profit',
                style: TextStyle(
                  color: AppColors.text,
                ),
                textAlign: TextAlign.center,
              ),
              Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        // Navigator.pop(context);
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: 50.0,
                        margin: EdgeInsets.only(top: 30.0),
                        padding: EdgeInsets.symmetric(horizontal: 20.0),
                        decoration: BoxDecoration(
                          color: AppColors.primary,
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),
                        child: Text(
                          'Let’s Continue',
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 13.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
  formBottomSheet(BuildContext context) {
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

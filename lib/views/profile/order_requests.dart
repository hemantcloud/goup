// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables


import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:goup/models/cart_model.dart';
import 'package:goup/views/utilities/utilities.dart';

class OrderRequests extends StatefulWidget {
  const OrderRequests({Key? key}) : super(key: key);

  @override
  State<OrderRequests> createState() => _OrderRequestsState();
}

class _OrderRequestsState extends State<OrderRequests> with TickerProviderStateMixin {
  late TabController _tabBarController;
  final List<CartModel> productList = [
    CartModel(name: 'Nike green sneaker', image: 'assets/images/product_image.png', price: '280', brand: 'Nike',size: '38'),
    CartModel(name: 'iphone 13 pro max', image: 'assets/images/product_image8.png', price: '455', size: '38',colorFamily: 'Military Green', selected: false),
    CartModel(name: 'Nike military green sneaker', image: 'assets/images/product_image.png', price: '280', size: '38',colorFamily: 'Military Green', selected: false),
    CartModel(name: 'iphone 13 pro max', image: 'assets/images/product_image8.png', price: '866', colorFamily: 'Military Green', selected: false),
    CartModel(name: 'Nike green sneaker', image: 'assets/images/product_image.png', price: '789', brand: 'Nike', selected: false),
    CartModel(name: 'iphone 13 pro max', image: 'assets/images/product_image8.png', price: '455', size: '38',colorFamily: 'Military Green', selected: false),
    CartModel(name: 'Nike green sneaker', image: 'assets/images/product_image.png', price: '280', brand: 'Nike',size: '38', selected: false),
  ];
  @override
  void initState() {
// TODO: implement initState
    super.initState();
    _tabBarController = TabController(length: 2, vsync: this);
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
        toolbarHeight: 80.0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        flexibleSpace: Padding(
          padding: EdgeInsets.only(top: 40.0, bottom: 10.0),
          child: Container(
            height: 60.0,
            margin: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 0.0),
            padding: EdgeInsets.symmetric(horizontal: 10.0),
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
                    child: SvgPicture.asset('assets/icons/back.svg',),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Center(
                    child: Text(
                      'Order Requests',
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
      body: Column(
        children: [
          Container(
            height: 58.0,
            margin: EdgeInsets.only(top: 10.0,left: 20.0,right: 20.0),
            padding: EdgeInsets.symmetric(vertical: 5.0,),
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
                Tab(text: '               35\nProducts Sales'),
                Tab(text: '                 12\nPurchase Products'),
              ],
              labelColor: Colors.white,
              unselectedLabelColor: AppColors.text3,
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 30.0,left: 16.0,right: 16.0,bottom: 10.0),
            alignment: Alignment.centerLeft,
            child: Text.rich(
              TextSpan(
                children: [
                  TextSpan(text: 'Sales History ',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18.0),),
                  TextSpan(text: '(This month)',style: TextStyle(color: AppColors.secondary)),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: TabBarView(
              controller: _tabBarController,
              children: [
                ListView.builder(
                  shrinkWrap: true,
                  physics: const ScrollPhysics(),
                  itemCount:  productList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      padding: EdgeInsets.fromLTRB(0.0,10.0,10.0,10.0),
                      margin: EdgeInsets.fromLTRB(20.0,5.0,20.0,5.0),
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                        // color: Colors.red.shade100,
                        color: Colors.white,
                      ),
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: 60.0,
                                height: 60.0,
                                margin: EdgeInsets.only(right: 10.0),
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                                  image: DecorationImage(
                                    image: AssetImage(productList[index].image.toString()),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      productList[index].name.toString(),
                                      style: const TextStyle(
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.w600,
                                        color: AppColors.black,
                                      ),
                                      overflow: TextOverflow.ellipsis,

                                    ),
                                    Text(
                                      'f dsf dsf',
                                      style: const TextStyle(
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.text4,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(5.0),
                                child: Image.asset(
                                  'assets/images/qrcode.png'
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const ScrollPhysics(),
                  itemCount:  productList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      padding: EdgeInsets.fromLTRB(0.0,10.0,10.0,10.0),
                      margin: EdgeInsets.fromLTRB(20.0,5.0,20.0,5.0),
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                        // color: Colors.red.shade100,
                        color: Colors.white,
                      ),
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: 60.0,
                                height: 60.0,
                                margin: EdgeInsets.only(right: 10.0),
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                                  image: DecorationImage(
                                    image: AssetImage(productList[index].image.toString()),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      productList[index].name.toString(),
                                      style: const TextStyle(
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.w600,
                                        color: AppColors.black,
                                      ),
                                      overflow: TextOverflow.ellipsis,

                                    ),
                                    Text(
                                      'f dsf dsf',
                                      style: const TextStyle(
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.text4,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(5.0),
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(Radius.circular(4.0)),
                                  color: Color(0xFFF0F0F9),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        int count = productList[index].qty!;
                                        count++;
                                        productList[index].qty = count;
                                        setState(() {});
                                      },
                                      child: SvgPicture.asset(
                                          'assets/icons/cart_increment.svg',width: 20.0,height: 20.0
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.symmetric(vertical: 5.0),
                                      child: Text(
                                          productList[index].qty.toString(),
                                          style: TextStyle(color: AppColors.black)
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        int count = productList[index].qty!;
                                        if(count > 0){
                                          count--;
                                        }
                                        productList[index].qty = count;
                                        setState(() {});
                                      },
                                      child: SvgPicture.asset(
                                          'assets/icons/cart_decrement.svg',width: 20.0,height: 20.0
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

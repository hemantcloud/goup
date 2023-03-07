// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print


import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:goup/models/cart_model.dart';
import 'package:goup/views/home/confirm_order.dart';
import 'package:goup/views/utilities/utilities.dart';
import 'package:intl/intl.dart';
import 'package:page_transition/page_transition.dart';

class SelectProduct extends StatefulWidget {
  const SelectProduct({Key? key}) : super(key: key);

  @override
  State<SelectProduct> createState() => _SelectProductState();
}

class _SelectProductState extends State<SelectProduct> with TickerProviderStateMixin {
  TextEditingController nameController = TextEditingController();
  final List<CartModel> cartList = [
    CartModel(id: 1, name: 'Nike green sneaker', image: 'assets/images/product_image.png', price: '280', qty: 20,brand: 'Nike',size: '38', selected: false),
    CartModel(id: 2, name: 'iphone 13 pro max', image: 'assets/images/product_image8.png', price: '455', qty: 3,size: '38',colorFamily: 'Military Green', selected: false),
    CartModel(id: 3, name: 'Nike military green sneaker', image: 'assets/images/product_image.png', price: '280', qty: 3,size: '38',colorFamily: 'Military Green', selected: false),
    CartModel(id: 4, name: 'iphone 13 pro max', image: 'assets/images/product_image8.png', price: '866', qty: 4,colorFamily: 'Military Green', selected: false),
    CartModel(id: 5, name: 'Nike green sneaker', image: 'assets/images/product_image.png', price: '789', qty: 8,brand: 'Nike', selected: false),
    CartModel(id: 6, name: 'iphone 13 pro max', image: 'assets/images/product_image8.png', price: '455', qty: 3,size: '38',colorFamily: 'Military Green', selected: false),
    CartModel(id: 7, name: 'Nike green sneaker', image: 'assets/images/product_image.png', price: '280', qty: 20,brand: 'Nike',size: '38', selected: false),
  ];
  List<int> selectedInterest =[];
  int total = 0;
  @override
  Widget build(BuildContext context) {
    var formatter = NumberFormat('#,##,000');
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          // Status bar color
          statusBarColor: Colors.white,
          // Status bar brightness (optional)
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
            // color: Colors.black,
            margin: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 0.0),
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.transparent, width: 0.0),
              borderRadius: BorderRadius.circular(5.0),
              color: Colors.transparent,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  flex: 1,
                  child: Text(
                    'My Basket (150)',
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.black,
                    ),
                  ),
                ),
                InkWell(
                  // onTap: () => moreBottomSheet(context),
                  child: Container(
                    alignment: Alignment.center,
                    child: SvgPicture.asset('assets/icons/delete.svg',color: AppColors.black),
                  ),
                ),
              ],
            ),
          ),
        ),
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.only(
            bottom: selectedInterest.length == 0 ? 0.0 : 90.0
        ),
        child: Column(
          children: [
            Container(
              height: 50.0,
              margin: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 10.0),
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.transparent,width: 0.0),
                borderRadius: BorderRadius.circular(8.0),
                color: Color(0xFFF1F1F3),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.only(right: 10.0),
                    child: SvgPicture.asset(
                      'assets/icons/search.svg',
                      width: 20.0,
                      color: AppColors.secondary,
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: TextFormField(
                      // textAlignVertical: TextAlignVertical.bottom,
                      controller: nameController,
                      keyboardType: TextInputType.emailAddress,
                      style: const TextStyle(
                        fontSize: 14.0,
                        color: AppColors.secondary,
                      ),
                      cursorColor: AppColors.secondary,
                      decoration: const InputDecoration(
                        hintText: 'Search Anything...',
                        hintStyle: TextStyle(
                          fontSize: 14.0,
                          color: AppColors.secondary,
                          fontWeight: FontWeight.w500,
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: ListView.builder(
                shrinkWrap: true,
                physics: const ScrollPhysics(),
                itemCount: cartList.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    padding: EdgeInsets.fromLTRB(0.0,10.0,10.0,10.0),
                    margin: EdgeInsets.fromLTRB(16.0,5.0,16.0,5.0),
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
                            InkWell(
                              onTap: () {
                                if(cartList[index].selected==true){
                                  selectedInterest.remove(cartList[index].id);
                                  cartList[index].selected= false;
                                  total -= int.parse(cartList[index].price.toString());
                                  print('price is ------$total');
                                  print('total.runtimeType is ------${total.runtimeType}');
                                }else {
                                  selectedInterest.add(cartList[index].id!);
                                  cartList[index].selected= true;
                                  total += int.parse(cartList[index].price.toString());
                                  print('price is ------$total');
                                  print('total.runtimeType is ------${total.runtimeType}');
                                }
                                setState(() {});
                              },
                              child: Container(
                                width: 40.0,
                                height: 40.0,
                                padding: EdgeInsets.all(10.0),
                                child: cartList[index].selected == true
                                ? Image.asset('assets/icons/gender_selected.png')
                                : SvgPicture.asset('assets/icons/gender_unselected.svg'),
                              ),
                            ),
                            Container(
                              width: 60.0,
                              height: 60.0,
                              margin: EdgeInsets.only(right: 10.0),
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                                image: DecorationImage(
                                  image: AssetImage(cartList[index].image.toString()),
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
                                    cartList[index].name.toString(),
                                    style: const TextStyle(
                                      fontSize: 15.0,
                                      // fontWeight: FontWeight.w600,
                                      color: AppColors.black,
                                    ),
                                    overflow: TextOverflow.ellipsis,

                                  ),
                                  Text(
                                    'f dsf dsf',
                                    style: const TextStyle(
                                      // fontSize: 15.0,
                                      // fontWeight: FontWeight.w500,
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
                                      int count = cartList[index].qty!;
                                      count++;
                                      cartList[index].qty = count;
                                      setState(() {});
                                    },
                                    child: SvgPicture.asset(
                                        'assets/icons/cart_increment.svg',width: 20.0,height: 20.0
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.symmetric(vertical: 5.0),
                                    child: Text(
                                        cartList[index].qty.toString(),
                                        style: TextStyle(color: AppColors.black)
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      int count = cartList[index].qty!;
                                      if(count > 0){
                                        count--;
                                      }
                                      cartList[index].qty = count;
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
            ),
          ],
        ),
      ),
      bottomSheet: selectedInterest.length == 0 ? null :
      InkWell(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () {
        },
        child: Container(
          padding: EdgeInsets.fromLTRB(10.0,20.0,10.0,0.0),
          height: 90.0,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10.0),
                topRight: Radius.circular(10.0)
            ),
            boxShadow: [
              BoxShadow(
                color: AppColors.secondary,
                offset: Offset(0.0, 3.0),
                blurRadius: 40.0,
                spreadRadius: 0.0,
              ),
            ],
          ),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 50.0,
                    height: 50.0,
                    padding: EdgeInsets.all(10.0),
                    child: Image.asset('assets/icons/gender_selected.png'),
                  ),
                  Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Total amount',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w500,
                            color: AppColors.text4,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                        Text(
                          // '\$${formatter.format(total.toString())}',
                          '\$ ${total.toString()}',
                          style: const TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.w600,
                            color: AppColors.black,
                          ),
                          overflow: TextOverflow.ellipsis,

                        ),
                      ],
                    ),
                  ),
                  InkWell(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () {
                      Navigator.push(
                        context,
                        PageTransition(
                          type: PageTransitionType.rightToLeftWithFade,
                          alignment: Alignment.topCenter,
                          duration: Duration(milliseconds: 1000),
                          isIos: true,
                          child: Confirmorder(productList: selectedInterest),
                        ),
                      );
                    },
                    child: Container(
                      height: 50.0,
                      padding: EdgeInsets.symmetric(horizontal: 40.0),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: AppColors.primary,
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                      child: Text(
                        'Purchase',
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
        ),
      ),
    );
  }
}

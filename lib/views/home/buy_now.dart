// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:goup/views/home/confirm_order.dart';
import 'package:goup/views/profile/basket_selected.dart';
import 'package:goup/views/utilities/utilities.dart';
import 'package:page_transition/page_transition.dart';
class BuyNow extends StatefulWidget {
  const BuyNow({Key? key}) : super(key: key);

  @override
  State<BuyNow> createState() => _BuyNowState();
}

class _BuyNowState extends State<BuyNow> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.only(top: 20.0,bottom: 220.0),
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.3,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        'assets/images/full_product_image.png',
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  top: MediaQuery.of(context).size.width * 0.08,
                  left: MediaQuery.of(context).size.height * 0.01,
                  child: InkWell(
                    onTap: () => Navigator.of(context).pop(),
                    highlightColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    child: Container(
                      width: 20.0,
                      height: 20.0,
                      child: SvgPicture.asset('assets/icons/back.svg',color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SvgPicture.asset('assets/icons/delivery_location.svg'),
                      SizedBox(width: 10.0),
                      Expanded(
                        flex: 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Delivery location',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16.0,
                              ),
                            ),
                            Text(
                              'Home delivery',
                              style: TextStyle(color: AppColors.text4),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 10.0),
                      SvgPicture.asset('assets/icons/change.svg'),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.065),
                        width: 1.0,
                        height: 30.0,
                        color: Color(0xFF9CA3AF),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SvgPicture.asset('assets/icons/payment_options.svg'),
                      SizedBox(width: 10.0),
                      Expanded(
                        flex: 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Payment Options',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16.0,
                              ),
                            ),
                            Text(
                              'Credit Card',
                              style: TextStyle(color: AppColors.text4),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 10.0),
                      SvgPicture.asset('assets/icons/change.svg'),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.065),
                        width: 1.0,
                        height: 30.0,
                        color: Color(0xFF9CA3AF),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SvgPicture.asset('assets/icons/addtional_notes.svg'),
                      SizedBox(width: 10.0),
                      Expanded(
                        flex: 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Additonal Notes',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16.0,
                              ),
                            ),
                            Text(
                              '(Optional)',
                              style: TextStyle(color: AppColors.text4),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 10.0),
                      SvgPicture.asset('assets/icons/write.svg'),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 10.0),
                    child: Text(
                      '24 hours if the delivery is not delivered, the order will be deleted within',
                      style: TextStyle(color: AppColors.red2),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomSheet: Container(
        height: 200.0,
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Product price',
                      style: TextStyle(color: AppColors.text4)
                    ),
                    Text(
                      'Delivery charge',
                      style: TextStyle(color: AppColors.text4)
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      '\$150.00',
                      style: TextStyle(color: Colors.black,fontSize: 16.0,fontWeight: FontWeight.w600)
                    ),
                    Text(
                      '\$50.00',
                      style: TextStyle(color: Colors.black,fontSize: 16.0,fontWeight: FontWeight.w600)
                    ),
                  ],
                ),
              ],
            ),
            const Divider(
              height: 1,
              thickness: 1,
              color: Color(0xFFEBEBEB),
              // color: Colors.black,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Total price',
                      style: TextStyle(color: AppColors.text4)
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      '\$200.00',
                      style: TextStyle(color: Colors.black,fontSize: 16.0,fontWeight: FontWeight.w600)
                    ),
                  ],
                ),
              ],
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
                    child: BasketSelected(),
                  ),
                );
              },
              child: Container(
                height: 50.0,
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Confirm Order',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

}

// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:goup/views/home/payment_method.dart';
import 'package:goup/views/utilities/utilities.dart';
import 'package:page_transition/page_transition.dart';

class Confirmorder extends StatefulWidget {
  List<int> productList;
  Confirmorder({Key? key,required this.productList}) : super(key: key);

  @override
  State<Confirmorder> createState() => _ConfirmorderState();
}

class _ConfirmorderState extends State<Confirmorder> {
  bool homedeliverystatus = true;
  bool officedeliverystatus = false;
  bool companydeliverystatus = false;
  String deliverystatus = 'Home Delivery';
  String? paymentMethod = 'Credit Card';
  GetData(String status){
    deliverystatus = status;
    setState(() {});
  }
  getData2(String str){
    paymentMethod = str;
    setState(() {});
  }
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
                      'Confirm Order',
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
                        'Number of items',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16.0,
                        ),
                      ),
                      Text(
                        '${widget.productList.length} items combined',
                        style: TextStyle(color: AppColors.text4),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 10.0),
                InkWell(
                  onTap: () => Navigator.of(context).pop(),
                  child: SvgPicture.asset(
                    'assets/icons/check.svg'
                  ),
                ),
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
                        deliverystatus,
                        style: TextStyle(color: AppColors.text4),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 10.0),
                InkWell(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () => deliveryLocationBottomSheet(context,GetData),
                  child: SvgPicture.asset(
                      'assets/icons/change.svg'
                  ),
                ),
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
                        paymentMethod.toString(),
                        style: TextStyle(color: AppColors.text4),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 10.0),
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
                        child: PaymentMethod(getData: getData2,paymentMethod: paymentMethod),
                      ),
                    );
                  },
                  child: SvgPicture.asset(
                      'assets/icons/change.svg'
                  ),
                ),
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
                /*Navigator.push(
                  context,
                  PageTransition(
                    type: PageTransitionType.rightToLeftWithFade,
                    alignment: Alignment.topCenter,
                    duration: Duration(milliseconds: 1000),
                    isIos: true,
                    child: PaymentMethod(getData: getData2),
                  ),
                );*/
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
  deliveryLocationBottomSheet(BuildContext context,Function GetData) {
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
                      margin: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 16.0),
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
                            alignment: Alignment.centerLeft,
                            padding: EdgeInsets.all(20.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Home Delivery',
                                        style: TextStyle(
                                            fontSize: 16.0,
                                            color: AppColors.black
                                        ),
                                      ),
                                      Text(
                                        '#24 House, 5th street, South block Ryadh, UAE',
                                        style: TextStyle(
                                            fontSize: 12.0,
                                            color: AppColors.text4
                                        ),
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(width: 40.0),
                                FlutterSwitch(
                                  width: 50.0,
                                  height: 25.0,
                                  toggleSize: 25.0,
                                  value: homedeliverystatus,
                                  activeText: '',
                                  activeColor: AppColors.primary,
                                  inactiveColor: Color(0xFFE5E5E6),
                                  inactiveText: '',
                                  borderRadius: 30.0,
                                  padding: 2.0,
                                  duration: Duration(milliseconds: 250),
                                  showOnOff: true,
                                  onToggle: (val) {
                                    homedeliverystatus = val;
                                    officedeliverystatus = false;
                                    companydeliverystatus = false;
                                    this.GetData("Home Delivery");
                                    setState(() {});
                                  },
                                ),
                              ],
                            ),
                          ),
                          const Divider(
                            height: 1,
                            thickness: 0.1,
                            color: Color(0xFF8D8D8D),
                            // color: Colors.black,
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            padding: EdgeInsets.all(20.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Office Delivery',
                                        style: TextStyle(
                                            fontSize: 16.0,
                                            color: AppColors.black
                                        ),
                                      ),
                                      Text(
                                        '#24 House, 5th street, South block Ryadh, UAE',
                                        style: TextStyle(
                                            fontSize: 12.0,
                                            color: AppColors.text4
                                        ),
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(width: 40.0),
                                FlutterSwitch(
                                  width: 50.0,
                                  height: 25.0,
                                  toggleSize: 25.0,
                                  value: officedeliverystatus,
                                  activeText: '',
                                  activeColor: AppColors.primary,
                                  inactiveColor: Color(0xFFE5E5E6),
                                  inactiveText: '',
                                  borderRadius: 30.0,
                                  padding: 2.0,
                                  duration: Duration(milliseconds: 250),
                                  showOnOff: true,
                                  onToggle: (val) {
                                    officedeliverystatus = val;
                                    homedeliverystatus = false;
                                    companydeliverystatus = false;
                                    this.GetData("Office Delivery");
                                    setState(() {});
                                  },
                                ),
                              ],
                            ),
                          ),
                          const Divider(
                            height: 1,
                            thickness: 0.1,
                            color: Color(0xFF8D8D8D),
                            // color: Colors.black,
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            padding: EdgeInsets.all(20.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Company Delivery',
                                        style: TextStyle(
                                            fontSize: 16.0,
                                            color: AppColors.black
                                        ),
                                      ),
                                      Text(
                                        '#24 House, 5th street, South block Ryadh, UAE',
                                        style: TextStyle(
                                            fontSize: 12.0,
                                            color: AppColors.text4
                                        ),
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(width: 40.0),
                                FlutterSwitch(
                                  width: 50.0,
                                  height: 25.0,
                                  toggleSize: 25.0,
                                  value: companydeliverystatus,
                                  activeText: '',
                                  activeColor: AppColors.primary,
                                  inactiveColor: Color(0xFFE5E5E6),
                                  inactiveText: '',
                                  borderRadius: 30.0,
                                  padding: 2.0,
                                  duration: Duration(milliseconds: 250),
                                  showOnOff: true,
                                  onToggle: (val) {
                                    companydeliverystatus = val;
                                    homedeliverystatus = false;
                                    officedeliverystatus = false;
                                    this.GetData("Company Delivery");
                                    setState(() {});
                                  },
                                ),
                              ],
                            ),
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

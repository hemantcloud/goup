// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:goup/views/utilities/utilities.dart';

class PaymentMethod extends StatefulWidget {
  final Function getData;
  String? paymentMethod;
  PaymentMethod({Key? key,required this.getData,required this.paymentMethod}) : super(key: key);

  @override
  State<PaymentMethod> createState() => _PaymentMethodState();
}

class _PaymentMethodState extends State<PaymentMethod> {
  String cardNumber = '123456123456';
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
                      'Payment method',
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
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(bottom: 20.0),
              child: Text(
                'Select a Payment Method',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600
                ),
              ),
            ),
            InkWell(
              onTap: () {
                widget.getData("Credit Card");
                widget.paymentMethod = 'Credit Card';
                setState(() {});
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 20.0,horizontal: 10.0),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                  // color: Colors.red.shade100,
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(4, 10, 64, 3),
                      offset: Offset(0.0, 7.0),
                      blurRadius: 30.0,
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    widget.paymentMethod == 'Credit Card'
                    ? Image.asset('assets/icons/gender_selected.png',width: 24.0)
                    : SvgPicture.asset('assets/icons/gender_unselected.svg',width: 24.0),
                    SizedBox(width: 10.0),
                    Expanded(
                      flex: 1,
                      child: Text(
                        '**** **** ${cardNumber.substring(8,12)}',
                        style: TextStyle(color: Colors.black,fontSize: 16.0),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ),
                    SizedBox(width: 10.0),
                    SvgPicture.asset('assets/icons/visa.svg'),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                widget.getData("Master Card");
                widget.paymentMethod = 'Master Card';
                setState(() {});
              },
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              child: Container(
                margin: EdgeInsets.only(top: 10.0),
                padding: EdgeInsets.symmetric(vertical: 20.0,horizontal: 10.0),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                  // color: Colors.red.shade100,
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(4, 10, 64, 3),
                      offset: Offset(0.0, 7.0),
                      blurRadius: 30.0,
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    widget.paymentMethod == 'Master Card'
                        ? Image.asset('assets/icons/gender_selected.png',width: 24.0)
                        : SvgPicture.asset('assets/icons/gender_unselected.svg',width: 24.0),
                    SizedBox(width: 10.0),
                    Expanded(
                      flex: 1,
                      child: Text(
                        '**** **** ${cardNumber.substring(8,12)}',
                        style: TextStyle(color: Colors.black,fontSize: 16.0),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ),
                    SizedBox(width: 10.0),
                    SvgPicture.asset(
                        'assets/icons/master_card.svg'
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                widget.getData("Google Pay");
                widget.paymentMethod = 'Google Pay';
                setState(() {});
              },
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              child: Container(
                margin: EdgeInsets.only(top: 10.0),
                padding: EdgeInsets.symmetric(vertical: 20.0,horizontal: 10.0),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                  // color: Colors.red.shade100,
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(4, 10, 64, 3),
                      offset: Offset(0.0, 7.0),
                      blurRadius: 30.0,
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    widget.paymentMethod == 'Google Pay'
                        ? Image.asset('assets/icons/gender_selected.png',width: 24.0)
                        : SvgPicture.asset('assets/icons/gender_unselected.svg',width: 24.0),
                    SizedBox(width: 10.0),
                    Expanded(
                      flex: 1,
                      child: Text(
                        'Google Pay',
                        style: TextStyle(color: Colors.black,fontSize: 16.0),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ),
                    SizedBox(width: 10.0),
                    SvgPicture.asset(
                        'assets/icons/gpay.svg'
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                widget.getData("Apple Pay");
                widget.paymentMethod = 'Apple Pay';
                setState(() {});
              },
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              child: Container(
                margin: EdgeInsets.only(top: 10.0),
                padding: EdgeInsets.symmetric(vertical: 20.0,horizontal: 10.0),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                  // color: Colors.red.shade100,
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(4, 10, 64, 3),
                      offset: Offset(0.0, 7.0),
                      blurRadius: 30.0,
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    widget.paymentMethod == 'Apple Pay'
                        ? Image.asset('assets/icons/gender_selected.png',width: 24.0)
                        : SvgPicture.asset('assets/icons/gender_unselected.svg',width: 24.0),
                    SizedBox(width: 10.0),
                    Expanded(
                      flex: 1,
                      child: Text(
                        'Apple Pay',
                        style: TextStyle(color: Colors.black,fontSize: 16.0),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ),
                    SizedBox(width: 10.0),
                    SvgPicture.asset(
                        'assets/icons/applepay.svg'
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                widget.getData("Cash on Delivery");
                widget.paymentMethod = 'Cash on Delivery';
                setState(() {});
              },
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              child: Container(
                margin: EdgeInsets.only(top: 10.0),
                padding: EdgeInsets.symmetric(vertical: 20.0,horizontal: 10.0),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                  // color: Colors.red.shade100,
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(4, 10, 64, 3),
                      offset: Offset(0.0, 7.0),
                      blurRadius: 30.0,
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    widget.paymentMethod == 'Cash on Delivery'
                        ? Image.asset('assets/icons/gender_selected.png',width: 24.0)
                        : SvgPicture.asset('assets/icons/gender_unselected.svg',width: 24.0),
                    SizedBox(width: 10.0),
                    Expanded(
                      flex: 1,
                      child: Text(
                        'Cash on Delivery',
                        style: TextStyle(color: Colors.black,fontSize: 16.0),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ),
                    SizedBox(width: 10.0),
                    SvgPicture.asset(
                        'assets/icons/cod.svg'
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: InkWell(
        onTap: () => Navigator.of(context).pop(),
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        child: Container(
          margin: EdgeInsets.fromLTRB(20.0,0.0,20.0,20.0),
          height: 50.0,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: AppColors.primary,
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
          child: Text(
            'Confirm Payment',
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

}

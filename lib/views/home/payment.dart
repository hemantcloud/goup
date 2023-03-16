// ignore_for_file: sort_child_properties_last, prefer_const_constructors

import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_brand.dart';
import 'package:flutter_credit_card/credit_card_form.dart';
import 'package:flutter_credit_card/credit_card_model.dart';
import 'package:flutter_credit_card/credit_card_widget.dart';
import 'package:flutter_credit_card/custom_card_type_icon.dart';
import 'package:flutter_credit_card/glassmorphism_config.dart';
import 'package:flutter_svg/svg.dart';
import 'package:goup/views/dashboard.dart';
import 'package:goup/views/utilities/utilities.dart';
import 'package:page_transition/page_transition.dart';

class Payment extends StatefulWidget {
  Payment({Key? key,}): super(key: key);

  @override
  _PaymentState createState() =>
      _PaymentState();
}

class _PaymentState extends State<Payment> {
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;
  bool useGlassMorphism = false;
  bool useBackgroundImage = true;
  String ipaddress = "";
  OutlineInputBorder? border;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    border = OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.grey.withOpacity(0.7),
        width: 2.0,
      ),
    );
    Future.delayed(Duration.zero, () {
      this.printIps();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);
    return MediaQuery(
      data: mediaQueryData.copyWith(textScaleFactor: 1.0),
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: AppColors.white,
          body: SafeArea(
            child: SingleChildScrollView(
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Column(
                  children: [
                    Container(
                      color: Colors.transparent,
                      child: Row(
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: Container(
                              padding: EdgeInsets.fromLTRB(23, 16, 23, 16),
                              child: SvgPicture.asset(
                                "assets/icons/back.svg",
                                width: 11,
                                height: 20,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              alignment: Alignment.center,
                              child: Text(
                                "Payment",
                                style: TextStyle(
                                  fontSize: 20,
                                  // fontWeight: FontWeight.w600,
                                  color: Colors.black
                                ),
                              ),
                            ),
                            flex: 1,
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(23, 20, 23, 20),
                            child: SvgPicture.asset(
                              "assets/images/ic_left_arrow_blue.svg",
                              width: 11,
                              height: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                    CreditCardWidget(
                      glassmorphismConfig:
                      useGlassMorphism ? Glassmorphism.defaultConfig() : null,
                      cardNumber: cardNumber,
                      expiryDate: expiryDate,
                      cardHolderName: cardHolderName,
                      cvvCode: cvvCode,
                      // bankName: 'Axis Bank',
                      // textStyle: TextStyle(fontFamily: 'OCRA',color: Colors.white),
                      chipColor: Color(0xFFF6C859),
                      cardType: CardType.mastercard,
                      showBackView: isCvvFocused,
                      obscureCardNumber: true,
                      obscureCardCvv: true,
                      isHolderNameVisible: true,
                      cardBgColor: Color(0xFF011A2E),
                      backgroundImage:
                      useBackgroundImage ? 'assets/images/card_bg.png' : null,
                      isSwipeGestureEnabled: true,
                      onCreditCardWidgetChange:
                          (CreditCardBrand creditCardBrand) {},
                      customCardTypeIcons: <CustomCardTypeIcon>[
                        CustomCardTypeIcon(
                          cardType: CardType.mastercard,
                          cardImage: Image.asset(
                            'assets/images/mastercard.png',
                            height: 48,
                            width: 48,
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: <Widget>[
                            CreditCardForm(
                              formKey: formKey,
                              obscureCvv: true,
                              obscureNumber: true,
                              cardNumber: cardNumber,
                              cvvCode: cvvCode,
                              isHolderNameVisible: true,
                              isCardNumberVisible: true,
                              isExpiryDateVisible: true,
                              cardHolderName: cardHolderName,
                              expiryDate: expiryDate,
                              themeColor: Color(0xFF011A2E),
                              textColor: Color(0xFF011A2E),
                              cardNumberDecoration: InputDecoration(
                                labelText: 'Number',
                                hintText: 'XXXX XXXX XXXX XXXX',
                                hintStyle:
                                const TextStyle(color: AppColors.black),
                                labelStyle:
                                const TextStyle(color: AppColors.black),
                                focusedBorder: myBorder(),
                                enabledBorder: myBorder(),
                              ),
                              expiryDateDecoration: InputDecoration(
                                hintStyle:
                                const TextStyle(color: AppColors.black),
                                labelStyle:
                                const TextStyle(color: AppColors.black),
                                focusedBorder: myBorder(),
                                enabledBorder: myBorder(),
                                labelText: 'Expired Date',
                                hintText: 'XX/XX',
                              ),
                              cvvCodeDecoration: InputDecoration(
                                hintStyle:
                                const TextStyle(color: AppColors.black),
                                labelStyle:
                                const TextStyle(color: AppColors.black),
                                focusedBorder: myBorder(),
                                enabledBorder: myBorder(),
                                labelText: 'CVV',
                                hintText: 'XXX',
                              ),
                              cardHolderDecoration: InputDecoration(
                                hintStyle:
                                const TextStyle(color: AppColors.black),
                                labelStyle:
                                const TextStyle(color: AppColors.black),
                                focusedBorder: myBorder(),
                                enabledBorder: myBorder(),
                                labelText: 'Card Holder',
                              ),
                              onCreditCardModelChange: onCreditCardModelChange,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          bottomSheet: InkWell(
            onTap: () {
              if (formKey.currentState!.validate()) {
                print("cardNumber >>>" + cardNumber.toString());
                print("expiryDate >>>" + expiryDate.toString());
                print("cardHolderName >>>" +
                    cardHolderName.toString());
                print("cvvCode >>>" + cvvCode.toString());
                print("isCvvFocused >>>" +
                    isCvvFocused.toString());
                // payaccount(context, cardNumber, expiryDate,
                //     cardHolderName, cvvCode);
                setState(() {});
                // payaccount(context,cardNumber,expiryDate,cardHolderName,cvvCode);
                // payByTap(context, cardNumber, expiryDate,
                //     cardHolderName, cvvCode);
                successAlert(context);
              }
            },
            child: Container(
              height: 50.0,
              margin: EdgeInsets.symmetric(horizontal: 16.0,vertical: 10.0),
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
      ),
    );
  }

  void onCreditCardModelChange(CreditCardModel? creditCardModel) {
    setState(() {
      cardNumber = creditCardModel!.cardNumber;
      expiryDate = creditCardModel.expiryDate;
      cardHolderName = creditCardModel.cardHolderName;
      cvvCode = creditCardModel.cvvCode;
      isCvvFocused = creditCardModel.isCvvFocused;
    });
  }

  Future printIps() async {
    for (var interface in await NetworkInterface.list()) {
      print('== Interface: ${interface.name} ==');
      for (var addr in interface.addresses) {
        print(
            '${addr.address} ${addr.host} ${addr.isLoopback} ${addr.rawAddress} ${addr.type.name}');
        ipaddress = addr.address.toString();
        setState(() {});
      }
    }
  }
  Future successAlert(context) {
    return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) => AlertDialog(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12.0)),
        ),
        insetPadding: const EdgeInsets.symmetric(horizontal: 20.0/*,vertical: MediaQuery.of(context).size.height * 0.18*/),
        content: Container(
          // padding: EdgeInsets.symmetric(vertical: 10.0),
          height: 300.0,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(12)),
            border: Border.all(color: Colors.white),
            color: Colors.white,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SvgPicture.asset('assets/icons/success.svg',height: 120.0,color: AppColors.primary,),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: const Text(
                  'Congratulation',
                  style: TextStyle(
                      fontSize: 20.0,
                      color: AppColors.primary,
                  ),
                ),
              ),
              const Text(
                'You have successfully changed your password',
                style: TextStyle(
                  color: AppColors.secondary,
                ),
                textAlign: TextAlign.center,
                // maxLines: 3,
                // overflow: TextOverflow.ellipsis,
              ),
              Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        Navigator.pushAndRemoveUntil(
                          context,
                          PageTransition(
                            type: PageTransitionType.rightToLeftWithFade,
                            alignment: Alignment.topCenter,
                            duration: const Duration(milliseconds: 1000),
                            isIos: true,
                            child: Dashboard(bottomIndex: 0),
                          ),
                          (route) => false,
                        );
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: 50.0,
                        margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.0),
                        // padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        decoration: const BoxDecoration(
                          color: AppColors.primary,
                          borderRadius: BorderRadius.all(Radius.circular(19.0)),
                        ),
                        child: const Text(
                          'OK',
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                          textAlign: TextAlign.center,
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

myBorder() {
  return UnderlineInputBorder(
    borderSide: BorderSide(color: Color(0xFFE4E4E4),width: 2),
  );
}
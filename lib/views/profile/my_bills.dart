// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables


import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:goup/models/notification_users_list.dart';
import 'package:goup/models/transaction_history.dart';
import 'package:goup/models/users_list.dart';
import 'package:goup/views/inbox/chat.dart';
import 'package:goup/views/utilities/utilities.dart';
import 'package:page_transition/page_transition.dart';

class MyBills extends StatefulWidget {
  const MyBills({Key? key}) : super(key: key);

  @override
  State<MyBills> createState() => _MyBillsState();
}

class _MyBillsState extends State<MyBills>{
  TextEditingController nameController = TextEditingController();
  final List<TransactionHistory> transactionList = [
    TransactionHistory(account: 'Acc. #89087678 ', type: 'Credit card', time: '27 nov. 2022 (03:31 PM)', money: '-\$ 42.00'),
    TransactionHistory(account: 'Acc. #565466546 ', type: 'Debit card', time: '23 nov. 2022 (03:31 PM)', money: '-\$ 25.00'),
    TransactionHistory(account: 'Acc. #654654654 ', type: 'Credit card', time: '25 nov. 2022 (03:31 PM)', money: '-\$ 54.00'),
    TransactionHistory(account: 'Acc. #645654654 ', type: 'Credit card', time: '5 nov. 2022 (03:31 PM)', money: '-\$ 53.00'),
    TransactionHistory(account: 'Acc. #65465466 ', type: 'Debit card', time: '16 nov. 2022 (03:31 PM)', money: '-\$ 8.00'),
    TransactionHistory(account: 'Acc. #89087678 ', type: 'Credit card', time: '27 nov. 2022 (03:31 PM)', money: '-\$ 42.00'),
    TransactionHistory(account: 'Acc. #565466546 ', type: 'Debit card', time: '23 nov. 2022 (03:31 PM)', money: '-\$ 25.00'),
    TransactionHistory(account: 'Acc. #654654654 ', type: 'Credit card', time: '25 nov. 2022 (03:31 PM)', money: '-\$ 54.00'),
    TransactionHistory(account: 'Acc. #645654654 ', type: 'Credit card', time: '5 nov. 2022 (03:31 PM)', money: '-\$ 53.00'),
    TransactionHistory(account: 'Acc. #65465466 ', type: 'Debit card', time: '16 nov. 2022 (03:31 PM)', money: '-\$ 8.00'),
  ];
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
                    width: 20.0,
                    height: 20.0,
                    child: SvgPicture.asset('assets/icons/back.svg',),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Center(
                    child: Text(
                      'My Bills',
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
            padding: EdgeInsets.fromLTRB(5.0,10.0,10.0,20.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20.0),
                bottomRight: Radius.circular(20.0)
              ),
              // color: Colors.red.shade100,
              color: Colors.white,
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
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Text(
                            'My Earnings\n',
                            style: TextStyle(
                              fontSize: 12.0,
                              color: AppColors.text,
                            ),
                          ),
                          Text(
                            '\$7489',
                            style: TextStyle(
                                color: AppColors.black,
                                fontSize: 20.0,
                                fontWeight: FontWeight.w600
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
                            'Number of\norders',
                            style: TextStyle(
                              fontSize: 12.0,
                              color: AppColors.text,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            '42',
                            style: TextStyle(
                                color: AppColors.black,
                                fontSize: 20.0,
                                fontWeight: FontWeight.w600
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
                            'Number of\nitems',
                            style: TextStyle(
                              fontSize: 12.0,
                              color: AppColors.text,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            '4568',
                            style: TextStyle(
                                color: AppColors.black,
                                fontSize: 20.0,
                                fontWeight: FontWeight.w600
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 30.0,left: 16.0,right: 16.0,bottom: 10.0),
            alignment: Alignment.centerLeft,
            child: Text.rich(
              TextSpan(
                children: [
                  TextSpan(text: 'Transaction History ',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18.0),),
                  TextSpan(text: '(This month)'),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: ListView.builder(
              shrinkWrap: true,
              physics: const ScrollPhysics(),
              itemCount: transactionList.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  padding: const EdgeInsets.fromLTRB(20.0,20.0,20.0,0.0),
                  // color: Colors.green,
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SvgPicture.asset(
                            'assets/icons/transaction_history.svg',
                            width: 40.0,
                          ),
                          SizedBox(width: 10.0),
                          Expanded(
                            flex: 1,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  transactionList[index].account.toString(),
                                  style: const TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.primary,
                                  ),
                                ),
                                Text(
                                  transactionList[index].time.toString(),
                                  style: const TextStyle(
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.text4,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 20.0),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                transactionList[index].money.toString(),
                                style: const TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFFE84F41),
                                ),
                              ),
                              Text(
                                transactionList[index].type.toString(),
                                style: const TextStyle(
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.text4,
                                ),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                            ],
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
      bottomSheet: InkWell(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () {
          /*Navigator.push(
            context,
            PageTransition(
              type: PageTransitionType.rightToLeftWithFade,
              alignment: Alignment.topCenter,
              duration: Duration(milliseconds: 1000),
              isIos: true,
              child: Otp(),
            ),
          );*/
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
                          '\$12489',
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
                      /*Navigator.push(
                        context,
                        PageTransition(
                          type: PageTransitionType.rightToLeftWithFade,
                          alignment: Alignment.topCenter,
                          duration: Duration(milliseconds: 1000),
                          isIos: true,
                          child: Otp(),
                        ),
                      );*/
                    },
                    child: Container(
                      height: 50.0,
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: AppColors.primary,
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                      child: Text(
                        'Withdrawal',
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

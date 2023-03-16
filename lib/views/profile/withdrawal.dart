import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:goup/utitlities/utitlities.dart';
import 'package:goup/views/dashboard.dart';
import 'package:goup/views/utilities/utilities.dart';
import 'package:page_transition/page_transition.dart';
class Withdrawal extends StatefulWidget {
  const Withdrawal({Key? key}) : super(key: key);

  @override
  State<Withdrawal> createState() => _WithdrawalState();
}

class _WithdrawalState extends State<Withdrawal> {
  TextEditingController amountController = TextEditingController();
  List<Transactions> transactionlist = [
    Transactions(date: '15 oct 2023',transactionID: '546546546546',money: '576.00'),
    Transactions(date: '01 apr 2023',transactionID: '5464565645',money: '56546.00'),
    Transactions(date: '25 jun 2023',transactionID: '6456456546',money: '891.00'),
    Transactions(date: '29 jan 2023',transactionID: '245345635',money: '50870.00'),
    Transactions(date: '15 may 2023',transactionID: '17832001',money: '31463.00'),
    Transactions(date: '20 nov 2023',transactionID: '7879897',money: '186376.00'),
    Transactions(date: '25 jul 2023',transactionID: '98897789',money: '36711.00'),
    Transactions(date: '30 mar 2023',transactionID: '2136871',money: '1313.00'),
    Transactions(date: '09 aug 2023',transactionID: '7878789',money: '564516.00'),
    Transactions(date: '11 feb 2023',transactionID: '1837878',money: '1546.00'),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          // automaticallyImplyLeading: false,
          backgroundColor: AppColors.primary,
          title: const Text('My Wallet',style: TextStyle(fontSize: 18.0,)),
          elevation: 0.0,
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(vertical: 16.0,),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                  border: Border.all(color: const Color(0XFFE1E1E1),style: BorderStyle.solid,width: 1.0),
                  color: Colors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: const Text(
                        'Wallet Balance',
                        style: TextStyle(color: AppColors.black,fontSize: 16.0),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: const Text(
                        '\$2000',
                        style: TextStyle(color: AppColors.primary,fontSize: 20.0,fontWeight: FontWeight.bold),
                      ),
                    ),
                    const Divider(
                      color: AppColors.secondary,
                      thickness: 0.3,
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10.0),
                      padding: const EdgeInsets.only(top: 10.0),
                      child: const Text(
                        'Amount',
                        style: TextStyle(color: AppColors.black,fontSize: 16.0),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      margin: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.primary, width: 1.0),
                        borderRadius: BorderRadius.circular(5.0),
                        // color: const Color(0xFFEAEAEA),
                        // color: Colors.red,
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: TextFormField(
                              controller: amountController,
                              style: const TextStyle(fontSize: 14.0, color: AppColors.black),
                              cursorColor: AppColors.primary,
                              decoration: myInputDecoration('Enter Amount'),
                              keyboardType: TextInputType.number,
                            ),
                          ),
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        String? amt = amountController.text;
                        if(amt.isEmpty){
                          Utilities().toast("Payment must be at least ₹1.");
                        }else {
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
                        }
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: 50.0,
                        margin: const EdgeInsets.fromLTRB(10.0, 40.0, 10.0, 0.0),
                        decoration: const BoxDecoration(
                          color: AppColors.primary,
                          borderRadius: BorderRadius.all(Radius.circular(19.0)),
                        ),
                        child: const Text(
                          'Withdrawal',
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: Colors.white,
                            // fontWeight: FontWeight.w600,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20.0),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Recent Transactions',
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      color: Color(0xFF41405D),
                      fontSize: 18.0,
                      // fontWeight: FontWeight.w700
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              const SizedBox(height: 20.0),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: transactionlist.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    padding: const EdgeInsets.all(10.0),
                    margin: const EdgeInsets.only(bottom: 10.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14.0),
                      color: AppColors.white,
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0xFFe6e6e6),
                          offset: Offset(
                            0.0,
                            0.0,
                          ),
                          blurRadius: 4.0,
                          spreadRadius: 0,
                        ),
                      ],
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset("assets/icons/debit.svg",width: 50.0,),
                        const SizedBox(width: 10.0),
                        Expanded(
                          flex: 1,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Withdrawal",
                                style: TextStyle(
                                    fontSize: 16.0,
                                    color: AppColors.black,
                                    // fontWeight: FontWeight.w600
                                ),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                              Text(
                                transactionlist[index].date.toString(),
                                style: const TextStyle(color: AppColors.secondary,fontSize: 12.0),
                              ),
                              Text(
                                "ID : ${transactionlist[index].transactionID.toString()}",
                                style: const TextStyle(color: AppColors.secondary,fontSize: 12.0),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 10.0),
                        Text(
                          '- \$${transactionlist[index].money.toString()}',
                          style: const TextStyle(
                            color: AppColors.red,
                            fontSize: 14.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
  myInputDecoration(String s) {
    return InputDecoration(
      hintText: s,
      hintStyle: const TextStyle(
        color: Color(0xFFAFAFAF),
        fontWeight: FontWeight.w500,
      ),
      border: InputBorder.none,
    );
  }
}

class Transactions{
  String? date;
  String? transactionID;
  String? money;
  Transactions({required this.date,required this.transactionID,required this.money});
}

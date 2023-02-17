// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables


import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:goup/views/utilities/utilities.dart';

class Chat extends StatefulWidget {
  const Chat({Key? key}) : super(key: key);

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  TextEditingController messageController = TextEditingController();
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
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
        ),
        flexibleSpace: Padding(
          padding: EdgeInsets.only(top: 40.0, bottom: 10.0),
          child: Container(
            height: 60.0,
            margin: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.transparent, width: 0.0),
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(60.0)),
                    border: Border.all(color: Colors.white,width: 5)
                  ),
                  margin: EdgeInsets.only(right: 5.0),
                  child: CircleAvatar(
                    backgroundImage: AssetImage('assets/images/user1.png'),
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          border: Border.all(color: Colors.white,width: 1),
                          color: Color(0xFF53F550),
                        ),
                        width: 10.0,
                        height: 10.0,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Sara Passaq',
                        style: TextStyle(
                          fontSize: 16.0,
                          color: AppColors.black,
                        ),
                      ),
                      Text(
                        'Online',
                        style: TextStyle(
                          fontSize: 12.0,
                          color: AppColors.text4,
                        ),
                      ),
                    ],
                  ),
                ),
                SvgPicture.asset(
                  'assets/icons/menu.svg',
                  height: 20.0,
                  // color: AppColors.secondary,
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset('assets/images/user1.png',width: 40.0,height: 40.0,),
                const SizedBox(width: 10.0,),
                Expanded(
                  flex: 1,
                  child: Container(
                    padding: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Color(0xFFF0F0F0),
                      // border: Border.all(
                      //   width: 1.0,
                      //   color: AppColors.inputBorderColor,
                      //   style: BorderStyle.solid,
                      // ),
                    ),
                    child: const Text(
                      'Hey i am Steve you have register on the app you have been assigned for the task',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        color: AppColors.primary,
                        fontSize: 13.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset('assets/images/user1.png',width: 40.0,height: 40.0,),
                const SizedBox(width: 10.0,),
                Expanded(
                  flex: 1,
                  child: Container(
                    padding: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Color(0xFFF0F0F0),
                      // border: Border.all(
                      //   width: 1.0,
                      //   color: AppColors.inputBorderColor,
                      //   style: BorderStyle.solid,
                      // ),
                    ),
                    child: const Text(
                      'I will pay \$25 for this task and you have to complete the task within 8 hrs',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        color: AppColors.primary,
                        fontSize: 13.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    padding: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: AppColors.primary,
                      // border: Border.all(
                      //   width: 1.0,
                      //   color: AppColors.inputBorderColor,
                      //   style: BorderStyle.solid,
                      // ),
                    ),
                    child: const Text(
                      'Ok i am ready for the task Ok i am ready for the task Ok i am ready for the task',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        color: Colors.white,
                        fontSize: 13.0,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.right,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset('assets/images/user1.png',width: 40.0,height: 40.0,),
                const SizedBox(width: 10.0,),
                Expanded(
                  flex: 1,
                  child: Container(
                    padding: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Color(0xFFF0F0F0),
                      // border: Border.all(
                      //   width: 1.0,
                      //   color: AppColors.inputBorderColor,
                      //   style: BorderStyle.solid,
                      // ),
                    ),
                    child: const Text(
                      'Okay, then complete the task and let me know.',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        color: AppColors.primary,
                        fontSize: 13.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset('assets/images/user1.png',width: 40.0,height: 40.0,),
                const SizedBox(width: 10.0,),
                Expanded(
                  flex: 1,
                  child: Container(
                    padding: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Color(0xFFF0F0F0),
                      // border: Border.all(
                      //   width: 1.0,
                      //   color: AppColors.inputBorderColor,
                      //   style: BorderStyle.solid,
                      // ),
                    ),
                    child: const Text(
                      'Hey i am Steve you have register on the app you have been assigned for the task',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        color: AppColors.primary,
                        fontSize: 13.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset('assets/images/user1.png',width: 40.0,height: 40.0,),
                const SizedBox(width: 10.0,),
                Expanded(
                  flex: 1,
                  child: Container(
                    padding: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Color(0xFFF0F0F0),
                      // border: Border.all(
                      //   width: 1.0,
                      //   color: AppColors.inputBorderColor,
                      //   style: BorderStyle.solid,
                      // ),
                    ),
                    child: const Text(
                      'I will pay \$25 for this task and you have to complete the task within 8 hrs',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        color: AppColors.primary,
                        fontSize: 13.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20.0),
            InkWell(
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              onLongPress: () => moreBottomSheet(context),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      padding: EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: AppColors.primary,
                        // border: Border.all(
                        //   width: 1.0,
                        //   color: AppColors.inputBorderColor,
                        //   style: BorderStyle.solid,
                        // ),
                      ),
                      child: const Text(
                        'Ok i am ready for the task Ok i am ready for the task Ok i am ready for the task',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          color: Colors.white,
                          fontSize: 13.0,
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.right,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset('assets/images/user1.png',width: 40.0,height: 40.0,),
                const SizedBox(width: 10.0,),
                Expanded(
                  flex: 1,
                  child: Container(
                    padding: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Color(0xFFF0F0F0),
                      // border: Border.all(
                      //   width: 1.0,
                      //   color: AppColors.inputBorderColor,
                      //   style: BorderStyle.solid,
                      // ),
                    ),
                    child: const Text(
                      'Okay, then complete the task and let me know.',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        color: AppColors.primary,
                        fontSize: 13.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset('assets/images/user1.png',width: 40.0,height: 40.0,),
                const SizedBox(width: 10.0,),
                Expanded(
                  flex: 1,
                  child: Container(
                    padding: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Color(0xFFF0F0F0),
                      // border: Border.all(
                      //   width: 1.0,
                      //   color: AppColors.inputBorderColor,
                      //   style: BorderStyle.solid,
                      // ),
                    ),
                    child: const Text(
                      'Hey i am Steve you have register on the app you have been assigned for the task',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        color: AppColors.primary,
                        fontSize: 13.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset('assets/images/user1.png',width: 40.0,height: 40.0,),
                const SizedBox(width: 10.0,),
                Expanded(
                  flex: 1,
                  child: Container(
                    padding: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Color(0xFFF0F0F0),
                      // border: Border.all(
                      //   width: 1.0,
                      //   color: AppColors.inputBorderColor,
                      //   style: BorderStyle.solid,
                      // ),
                    ),
                    child: const Text(
                      'I will pay \$25 for this task and you have to complete the task within 8 hrs',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        color: AppColors.primary,
                        fontSize: 13.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    padding: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: AppColors.primary,
                      // border: Border.all(
                      //   width: 1.0,
                      //   color: AppColors.inputBorderColor,
                      //   style: BorderStyle.solid,
                      // ),
                    ),
                    child: const Text(
                      'Ok i am ready for the task Ok i am ready for the task Ok i am ready for the task',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        color: Colors.white,
                        fontSize: 13.0,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.right,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset('assets/images/user1.png',width: 40.0,height: 40.0,),
                const SizedBox(width: 10.0,),
                Expanded(
                  flex: 1,
                  child: Container(
                    padding: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Color(0xFFF0F0F0),
                      // border: Border.all(
                      //   width: 1.0,
                      //   color: AppColors.inputBorderColor,
                      //   style: BorderStyle.solid,
                      // ),
                    ),
                    child: const Text(
                      'Okay, then complete the task and let me know.',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        color: AppColors.primary,
                        fontSize: 13.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10.0),
          ],
        ),
      ),
      bottomSheet: Container(
        height: 78.0,
        padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 13.0),
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SvgPicture.asset('assets/icons/smile.svg'),
            SizedBox(width: 5.0),
            Expanded(
              flex: 1,
              child: TextFormField(
                textAlignVertical: TextAlignVertical.bottom,
                controller: messageController,
                style: const TextStyle(
                  fontSize: 14.0,
                  color: AppColors.secondary,
                ),
                cursorColor: AppColors.secondary,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(20.0),bottomLeft: Radius.circular(20.0)),
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(20.0),bottomLeft: Radius.circular(20.0)),
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(20.0),bottomLeft: Radius.circular(20.0)),
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                  fillColor: AppColors.bg,
                  filled: true,
                  hintText: 'Type Message...',
                  hintStyle: TextStyle(
                    fontSize: 14.0,
                    color: AppColors.secondary,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12.0,vertical: 16.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(topRight: Radius.circular(20.0),bottomRight: Radius.circular(20.0)),
                color: AppColors.bg,
              ),
              child: SvgPicture.asset(
                'assets/icons/send.svg',
              ),
            ),
          ],
        ),
      ),
    );
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
                                SvgPicture.asset('assets/icons/delete.svg'),
                                SizedBox(width: 10.0),
                                Text(
                                  'Delete message',
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
}

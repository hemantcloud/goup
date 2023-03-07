// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables


import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:goup/views/utilities/utilities.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/foundation.dart' as foundation;
import 'package:goup/models/msg_model.dart';

class Chat extends StatefulWidget {
  const Chat({Key? key}) : super(key: key);

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  TextEditingController messageController = TextEditingController();
  bool emojiShowing = false;
  final List<MsgModel> msglist = [
    MsgModel(id: 1,msg: 'Hey i am Steve you have register on the app you have been assigned for the task', type: 'receiver'),
    MsgModel(id: 1,msg: 'he app you have been assigned for the task', type: 'receiver'),
    MsgModel(id: 1,msg: 'Hey i r the task', type: 'receiver'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
          statusBarBrightness: Brightness.light, // For iOS (dark icons)
        ),
        // toolbarHeight: 60.0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
        ),
        flexibleSpace: Padding(
          padding: EdgeInsets.only(top: 25.0, bottom: 0.0),
          child: Container(
            height: 60.0,
            margin: EdgeInsets.fromLTRB(20.0, 0.0, 0.0, 0.0),
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
                InkWell(
                  highlightColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  onTap: () => moreBottomSheet(context),
                  child: Container(
                    // color: AppColors.red,
                    alignment: Alignment.centerRight,
                    width: 50.0,
                    height: 50.0,
                    padding: EdgeInsets.only(right: 20.0),
                    child: SvgPicture.asset(
                      'assets/icons/menu.svg',
                      height: 20.0,
                      // color: AppColors.secondary,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        elevation: 0.0,
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.fromLTRB(16.0, 10.0, 16.0, 0.0),
          child: Column(
            children: [
              Expanded(
                child: /*ListView.builder(
                  itemCount: msglist.length,
                  shrinkWrap: true,
                  padding: EdgeInsets.only(top: 10, bottom: 10),
                  physics: ScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                        image: msglist[index].type == "receiver"
                            ? DecorationImage(image: AssetImage('assets/images/user1.png'),alignment: Alignment.centerLeft)
                            : null,
                      ),
                      child: Align(
                        alignment: (msglist[index].type == "receiver"
                            ? Alignment.topLeft
                            : Alignment.topRight),
                        child: Container(
                          margin: EdgeInsets.only(
                            left: msglist[index].type == "receiver"
                                ? 70.0
                                : 0.0,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: msglist[index].type == "receiver"
                                ? BorderRadius.only(
                              topLeft: Radius.circular(20.0),
                                topRight: Radius.circular(20.0),
                                bottomLeft: Radius.circular(20.0),
                                bottomRight: Radius.circular(20.0))
                                : BorderRadius.only(
                              bottomRight: Radius.circular(20.0),
                              topRight: Radius.circular(20.0),
                              topLeft: Radius.circular(20.0),
                              bottomLeft: Radius.circular(20.0),
                            ),
                            color: (msglist[index].type == "receiver"
                                ? Color(0xFFE5E5E5)
                                : AppColors.primary),
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 16,vertical: 5),
                          child: Text(
                            msglist[index].msg.toString(),
                            style: TextStyle(
                                color: msglist[index].type == "receiver"
                                    ? AppColors.black
                                    : Colors.white),
                          ),
                        ),
                      ),
                    );
                  },
                ),*/
                ListView.builder(
                    shrinkWrap: true,
                    physics: ScrollPhysics(),
                    // itemCount: msgList.length,
                    itemCount: msglist.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 10.0),
                        child: msglist[index].type == 'receiver' ?
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
                                  color: Color(0xFFE5E5E5),
                                  // border: Border.all(
                                  //   width: 1.0,
                                  //   color: AppColors.inputBorderColor,
                                  //   style: BorderStyle.solid,
                                  // ),
                                ),
                                child: Text(
                                  msglist[index].msg.toString(),
                                  style: TextStyle(
                                    color: AppColors.black,
                                    fontSize: 13.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ) :
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 1,
                              child: Container(
                                padding: EdgeInsets.all(10.0),
                                margin: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.1),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.0),
                                  color: AppColors.primary,
                                  // border: Border.all(
                                  //   width: 1.0,
                                  //   color: AppColors.inputBorderColor,
                                  //   style: BorderStyle.solid,
                                  // ),
                                ),
                                alignment: Alignment.centerRight,
                                child: Text(
                                  msglist[index].msg.toString(),
                                  style: TextStyle(
                                    color: AppColors.white,
                                    fontSize: 13.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    }
                ),
                /*Row(
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
                    const SizedBox(height: 10.0),
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
                    const SizedBox(height: 10.0),*/
              ),
              Container(
                height: 78.0,
                padding: const EdgeInsets.symmetric(horizontal: 0.0,vertical: 13.0),
                color: Colors.transparent,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {
                        emojiShowing = !emojiShowing;
                        if(emojiShowing == true){
                          FocusManager.instance.primaryFocus?.unfocus();
                        }
                        setState(() {});
                        print('emojiShowing is -----------$emojiShowing');
                      },
                      child: SvgPicture.asset(
                          'assets/icons/smile.svg'
                      ),
                    ),
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
                        onTap: (){
                          emojiShowing = false;
                          setState(() {});
                        },
                        cursorColor: AppColors.secondary,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(8.0),bottomLeft: Radius.circular(8.0)),
                            borderSide: BorderSide(color: Colors.transparent),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(8.0),bottomLeft: Radius.circular(8.0)),
                            borderSide: BorderSide(color: Colors.transparent),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(8.0),bottomLeft: Radius.circular(8.0)),
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
                    InkWell(
                      onTap: () {
                        msglist.add(
                            MsgModel(msg: messageController.text, type: 'sender')
                        );
                        messageController.clear();
                        setState(() {});
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 12.0,vertical: 16.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(topRight: Radius.circular(8.0),bottomRight: Radius.circular(8.0)),
                          color: AppColors.bg,
                        ),
                        child: SvgPicture.asset(
                          'assets/icons/send.svg',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Offstage(
                offstage: !emojiShowing,
                child: SizedBox(
                    height: 250,
                    child: EmojiPicker(
                      textEditingController: messageController,
                      config: Config(
                        columns: 7,
                        // Issue: https://github.com/flutter/flutter/issues/28894
                        emojiSizeMax: 32 *
                            (foundation.defaultTargetPlatform ==
                                TargetPlatform.iOS
                                ? 1.30
                                : 1.0),
                        verticalSpacing: 0,
                        horizontalSpacing: 0,
                        gridPadding: EdgeInsets.zero,
                        // initCategory: Category.RECENT,
                        bgColor: Colors.transparent,
                        indicatorColor: Colors.blue,
                        iconColor: Colors.grey,
                        iconColorSelected: Colors.blue,
                        backspaceColor: Colors.blue,
                        skinToneDialogBgColor: Colors.white,
                        skinToneIndicatorColor: Colors.grey,
                        enableSkinTones: true,
                        showRecentsTab: true,
                        recentsLimit: 28,
                        replaceEmojiOnLimitExceed: false,
                        noRecents: const Text(
                          'No Recents',
                          style: TextStyle(fontSize: 18,color: AppColors.text4),
                          textAlign: TextAlign.center,
                        ),
                        loadingIndicator: const SizedBox.shrink(),
                        tabIndicatorAnimDuration: kTabScrollDuration,
                        categoryIcons: const CategoryIcons(),
                        buttonMode: ButtonMode.MATERIAL,
                        checkPlatformCompatibility: true,
                      ),
                    )),
              ),
            ],
          ),
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

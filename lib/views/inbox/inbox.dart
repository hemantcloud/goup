// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables


import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:goup/models/notification_users_list.dart';
import 'package:goup/models/users_list.dart';
import 'package:goup/views/inbox/chat.dart';
import 'package:goup/views/utilities/utilities.dart';
import 'package:page_transition/page_transition.dart';

class Inbox extends StatefulWidget {
  const Inbox({Key? key}) : super(key: key);

  @override
  State<Inbox> createState() => _InboxState();
}

class _InboxState extends State<Inbox> with TickerProviderStateMixin {
  late TabController _tabBarController;
  TextEditingController nameController = TextEditingController();
  final List<UserList> userList = [
    UserList(name: 'Sara Passaq', image: 'assets/images/user1.png', lastSeen: '1 hr', isActive: false, lastMessage: 'okf dsfjkd sjf dsjfdjs fjdsf dshfjhdsjhf '),
    UserList(name: 'Qasim Muhammed ', image: 'assets/images/user2.png', lastSeen: '6 hr', isActive: true, lastMessage: 'ok can you tell me the name of the product '),
    UserList(name: 'Bushra', image: 'assets/images/user3.png', lastSeen: '8 hr', isActive: false, lastMessage: 'I booked your appointment for '),
    UserList(name: 'Waleed Abdullah ', image: 'assets/images/user4.png', lastSeen: '1 hr', isActive: true, lastMessage: 'great'),
    UserList(name: 'Mohammed', image: 'assets/images/user5.png', lastSeen: '7 hr', isActive: true, lastMessage: 'hahahahah'),
    UserList(name: 'Khalid ', image: 'assets/images/user6.png', lastSeen: '3 hr', isActive: false, lastMessage: 'I will meet you tomorrow'),
    UserList(name: 'Waleed Abdullah ', image: 'assets/images/user4.png', lastSeen: '1 hr', isActive: true, lastMessage: 'great'),
    UserList(name: 'Mohammed', image: 'assets/images/user5.png', lastSeen: '7 hr', isActive: true, lastMessage: 'hahahahah'),
    UserList(name: 'Khalid ', image: 'assets/images/user6.png', lastSeen: '3 hr', isActive: false, lastMessage: 'I will meet you tomorrow'),
    UserList(name: 'Waleed Abdullah ', image: 'assets/images/user4.png', lastSeen: '1 hr', isActive: true, lastMessage: 'great'),
    UserList(name: 'Mohammed', image: 'assets/images/user5.png', lastSeen: '7 hr', isActive: true, lastMessage: 'hahahahah'),
    UserList(name: 'Khalid ', image: 'assets/images/user6.png', lastSeen: '3 hr', isActive: false, lastMessage: 'I will meet you tomorrow'),
  ];
  final List<NotificationUserList> notificationUserList = [
    NotificationUserList(name: 'Lorem ipsum', image: 'assets/images/user7.png', isActive: false, lastMessage: 'Lorem ipsum dolor sit amet, conse f dfsdf dsf'),
    NotificationUserList(name: 'Lorem ipsum ', image: 'assets/images/user8.png', isActive: true, lastMessage: 'Lorem ipsum dolor sit amet, conse f dfsdf dsf'),
    NotificationUserList(name: 'Lorem ipsum', image: 'assets/images/user9.png', isActive: false, lastMessage: 'Lorem ipsum dolor sit amet, conse f dfsdf dsf'),
    NotificationUserList(name: 'Lorem ipsum', image: 'assets/images/user9.png', isActive: false, lastMessage: 'Lorem ipsum dolor sit amet, conse f dfsdf dsf'),
    NotificationUserList(name: 'Lorem ipsum ', image: 'assets/images/user10.png', isActive: true, lastMessage: 'Lorem ipsum dolor sit amet, conse f dfsdf dsf'),
    NotificationUserList(name: 'Lorem ipsum', image: 'assets/images/user11.png', isActive: true, lastMessage: 'Lorem ipsum dolor sit amet, conse f dfsdf dsf'),
    NotificationUserList(name: 'Lorem ipsum ', image: 'assets/images/user12.png', isActive: false, lastMessage: 'Lorem ipsum dolor sit amet, conse f dfsdf dsf'),
    NotificationUserList(name: 'Lorem ipsum ', image: 'assets/images/user13.png', isActive: false, lastMessage: 'Lorem ipsum dolor sit amet, conse f dfsdf dsf'),
    NotificationUserList(name: 'Lorem ipsum', image: 'assets/images/user9.png', isActive: false, lastMessage: 'Lorem ipsum dolor sit amet, conse f dfsdf dsf'),
    NotificationUserList(name: 'Lorem ipsum ', image: 'assets/images/user10.png', isActive: true, lastMessage: 'Lorem ipsum dolor sit amet, conse f dfsdf dsf'),
    NotificationUserList(name: 'Lorem ipsum', image: 'assets/images/user11.png', isActive: true, lastMessage: 'Lorem ipsum dolor sit amet, conse f dfsdf dsf'),
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
        title: Text('Messages',style: TextStyle(color: AppColors.black)),
        backgroundColor: Color(0xFFFAFAFA),
        elevation: 0.0,
      ),
      body: Column(
        children: [
          Container(
            height: 58.0,
            margin: EdgeInsets.only(top: 10.0,left: 16.0,right: 16.0),
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
                Tab(text: 'Messages'),
                Tab(text: 'Notifications'),
              ],
              labelColor: Colors.white,
              unselectedLabelColor: AppColors.text3,
            ),
          ),
          Container(
            height: 50.0,
            margin: EdgeInsets.fromLTRB(16.0, 10.0, 16.0, 0.0),
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
            child: TabBarView(
              controller: _tabBarController,
              children: [
                ListView.builder(
                  shrinkWrap: true,
                  physics: ClampingScrollPhysics(),
                  itemCount: userList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
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
                            child: Chat(),
                          ),
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.fromLTRB(20.0,20.0,20.0,0.0),
                        // color: Colors.green,
                        child: Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Image.asset(
                                //   'assets/images/profile.png',
                                //   width: 40.0,
                                // ),
                                CircleAvatar(
                                  backgroundImage: AssetImage(userList[index].image.toString()),
                                  child: Align(
                                    alignment: Alignment.bottomRight,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                        border: Border.all(
                                          color: userList[index].isActive == true ? Colors.white : Colors.transparent,
                                          width: userList[index].isActive == true ? 1 : 0
                                        ),
                                        color: userList[index].isActive == true ? Color(0xFF53F550) : Colors.transparent,
                                      ),
                                      width: 10.0,
                                      height: 10.0,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 10.0),
                                Expanded(
                                  flex: 1,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        userList[index].name.toString(),
                                        style: const TextStyle(
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.w500,
                                          color: AppColors.black,
                                        ),
                                      ),
                                      Text(
                                        userList[index].lastMessage.toString(),
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
                                SizedBox(width: 20.0),
                                Text(
                                  userList[index].lastSeen.toString(),
                                  style: const TextStyle(
                                    color: AppColors.text4,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const ScrollPhysics(),
                  itemCount: notificationUserList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      padding: const EdgeInsets.fromLTRB(20.0,20.0,20.0,0.0),
                      // color: Colors.green,
                      child: Column(
                        children: [
                          index == 0 ?
                          Container(
                            padding: EdgeInsets.only(bottom: 10.0),
                            alignment: Alignment.centerLeft,
                            child: Text(
                            'Today',style: TextStyle(color: AppColors.black,fontSize: 16.0,fontWeight: FontWeight.w600)
                            ),
                          ) : Container(),
                          index == 1 ?
                          Container(
                            padding: EdgeInsets.only(bottom: 10.0),
                            alignment: Alignment.centerLeft,
                            child: Text(
                            'This week',style: TextStyle(color: AppColors.black,fontSize: 16.0,fontWeight: FontWeight.w600)
                            ),
                          ) : Container(),
                          index == 3 ?
                          Container(
                            padding: EdgeInsets.only(bottom: 10.0),
                            alignment: Alignment.centerLeft,
                            child: Text(
                            'This Month',style: TextStyle(color: AppColors.black,fontSize: 16.0,fontWeight: FontWeight.w600)
                            ),
                          ) : Container(),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 40.0,
                                height: 40.0,
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                                  image: DecorationImage(
                                    image: AssetImage(notificationUserList[index].image.toString()),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                child: Stack(
                                  children: [
                                    Positioned(
                                      right: 0,
                                      child: Container(
                                        padding: EdgeInsets.all(20.0),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                          border: Border.all(
                                            color: notificationUserList[index].isActive == true ? Colors.white : Colors.transparent,
                                            width: notificationUserList[index].isActive == true ? 1 : 0
                                          ),
                                          color: notificationUserList[index].isActive == true ? AppColors.yellow : Colors.transparent,
                                        ),
                                        width: 12.0,
                                        height: 12.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(width: 10.0),
                              Expanded(
                                flex: 1,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      notificationUserList[index].name.toString(),
                                      style: const TextStyle(
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.black,
                                      ),
                                    ),
                                    Text(
                                      notificationUserList[index].lastMessage.toString(),
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
                              SizedBox(width: 20.0),
                              SvgPicture.asset('assets/icons/menu.svg',color: AppColors.black),
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
                                SvgPicture.asset(
                                    'assets/icons/link.svg'
                                ),
                                SizedBox(width: 10.0),
                                Text(
                                  'Copy link',
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

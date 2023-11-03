import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:unjuk_keterampilan_fg/models/user_model.dart';
import 'package:unjuk_keterampilan_fg/pages/call_page.dart';
import 'package:unjuk_keterampilan_fg/pages/chat_page.dart';
import 'package:unjuk_keterampilan_fg/pages/chat_room_page.dart';
import 'package:unjuk_keterampilan_fg/pages/bottom_nav_page.dart';
import 'package:unjuk_keterampilan_fg/pages/people_page.dart';
import 'package:unjuk_keterampilan_fg/resources/colors.dart';
import 'package:unjuk_keterampilan_fg/resources/constants.dart';
import 'package:unjuk_keterampilan_fg/widgets/custom_text_field.dart';
import 'package:unjuk_keterampilan_fg/widgets/icon_background_widget.dart';
import 'package:unjuk_keterampilan_fg/widgets/tab_choices_widget.dart';
import 'package:badges/badges.dart' as badges;

class ChannelPage extends StatefulWidget {
  const ChannelPage({super.key});

  @override
  State<ChannelPage> createState() => _ChannelPageState();
}

class _ChannelPageState extends State<ChannelPage> {
  int _selectedIndex = 0;

  void _onTabTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  List<Widget> pages = [
    const ChatMainPage(),
    const CallPage(),
    const PeoplePage(),
  ];

  @override
  Widget build(BuildContext context) {
    List<UserModel> onlineUsers =
        userData.where((user) => user.isOnline).toList();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: Padding(
          padding: const EdgeInsets.only(top: 4.0),
          child: badges.Badge(
            badgeStyle: badges.BadgeStyle(
              borderSide:
                  BorderSide(color: ColorPalette().mainWhiteColor, width: 3),
            ),
            badgeContent: Padding(
              padding: const EdgeInsets.all(3.0),
              child: Text(
                "7",
                style: TextStyle(color: ColorPalette().mainWhiteColor),
              ),
            ),
            position: badges.BadgePosition.topEnd(top: -6, end: -4),
            child: Padding(
              padding: const EdgeInsets.only(left: 4),
              child: IconBackgroundWidget(
                child: Builder(
                  builder: (BuildContext context) {
                    return IconButton(
                      splashRadius: 16,
                      onPressed: () {
                        Scaffold.of(context).openDrawer();
                      },
                      icon: const Icon(Icons.menu_rounded),
                      tooltip: MaterialLocalizations.of(context)
                          .openAppDrawerTooltip,
                    );
                  },
                ),
              ),
            ),
          ),
        ),
        title: const Text(
          "Chats",
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: IconBackgroundWidget(
              width: 42,
              height: 42,
              child: IconButton(
                splashRadius: 16,
                onPressed: () {},
                icon: const Icon(Icons.edit_rounded),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: <Widget>[
              //Search TextField
              const CustomTextField(
                hintText: "Search",
                prefixIcon: Icon(Icons.search),
                padding: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0),
              ),
              const Gap(8),
              //Online User ListView
              SizedBox(
                height: 104,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: onlineUsers.length,
                  itemBuilder: (context, index) {
                    var data = onlineUsers[index];
                    final isLastItem = index == onlineUsers.length - 1;
                    final isFirstItem = index == 0;
                    return Padding(
                      padding: EdgeInsets.only(
                        left: isFirstItem ? 16.0 : 8.0,
                        right: isLastItem ? 16.0 : 8.0,
                      ),
                      child: Column(
                        children: [
                          badges.Badge(
                            badgeContent: const SizedBox(
                              height: 10.0,
                              width: 10.0,
                            ),
                            position: badges.BadgePosition.bottomEnd(
                              end: -2,
                              bottom: -4,
                            ),
                            badgeStyle: badges.BadgeStyle(
                              badgeColor: ColorPalette().onlineColor,
                              borderSide: BorderSide(
                                color: ColorPalette().mainWhiteColor,
                                width: 3,
                              ),
                            ),
                            child: CircleAvatar(
                              radius: 30,
                              backgroundImage: NetworkImage(data.picUrl),
                            ),
                          ),
                          const Gap(4),
                          SizedBox(
                            width: 60,
                            child: Text(
                              data.name,
                              textAlign: TextAlign.center,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
              //Tab
              Padding(
                padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                child: Row(
                  children: [
                    //Selected Tab
                    TabChoicesWidget(
                      onTap: () {
                        Navigator.pushAndRemoveUntil(
                          context,
                          PageRouteBuilder(
                            pageBuilder: (context, animation1, animation2) =>
                                const MainApp(),
                            transitionDuration: Duration.zero,
                            reverseTransitionDuration: Duration.zero,
                          ),
                          (route) => false,
                        );
                      },
                      isSelected: false,
                      label: 'HOME',
                    ),
                    const Gap(16),
                    //Unselected Tab
                    TabChoicesWidget(
                      onTap: () {
                        Navigator.pushAndRemoveUntil(
                          context,
                          PageRouteBuilder(
                            pageBuilder: (context, animation1, animation2) =>
                                const ChannelPage(),
                            transitionDuration: Duration.zero,
                            reverseTransitionDuration: Duration.zero,
                          ),
                          (route) => false,
                        );
                      },
                      isSelected: true,
                      label: 'CHANNELS',
                    ),
                  ],
                ),
              ),
              //Chat Content
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0),
                  child: ListView.builder(
                    itemCount: userData.length,
                    itemBuilder: ((context, index) {
                      var data = userData[index];
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ChatPage(
                                lastSent: data.lastSent,
                                name: data.name,
                                lastOnline: data.lastOnline,
                                isOnline: data.isOnline,
                                userChat: data.userChat,
                                myChat: data.myChat,
                                picUrl: data.picUrl,
                              ),
                            ),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 16),
                          child: Row(
                            children: [
                              badges.Badge(
                                badgeContent: !data.isOnline
                                    ? Text(
                                        data.lastOnline,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w800,
                                            fontSize: 9),
                                      )
                                    : const SizedBox(
                                        height: 10.0,
                                        width: 10.0,
                                      ),
                                position: badges.BadgePosition.bottomEnd(
                                  end: -4,
                                  bottom: -4,
                                ),
                                badgeStyle: badges.BadgeStyle(
                                  borderRadius: BorderRadius.circular(12),
                                  shape: data.isOnline
                                      ? badges.BadgeShape.circle
                                      : badges.BadgeShape.square,
                                  badgeColor: data.isOnline
                                      ? ColorPalette().onlineColor
                                      : const Color(0xFFD3FFC8),
                                  borderSide: BorderSide(
                                    color: ColorPalette().mainWhiteColor,
                                    width: 3,
                                  ),
                                ),
                                child: CircleAvatar(
                                  radius: 28,
                                  backgroundImage: NetworkImage(data.picUrl),
                                ),
                              ),
                              const Gap(16),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    data.name,
                                    style: TextStyle(
                                      fontSize: 17,
                                      fontWeight:
                                          data.isRead ? null : FontWeight.bold,
                                    ),
                                  ),
                                  const Gap(6),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width - 110,
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Flexible(
                                          fit: FlexFit.loose,
                                          child: Text(
                                            data.userChat.last,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                              fontWeight: data.isRead
                                                  ? null
                                                  : FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                        const Text(
                                          " · ",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          data.lastSent,
                                          style: TextStyle(
                                            fontWeight: data.isRead
                                                ? null
                                                : FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    }),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: ColorPalette().iconChatColor,
        unselectedItemColor: ColorPalette().unselectedColor,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble),
            label: "Chats",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.videocam),
            label: "Calls",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: "People",
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onTabTapped,
      ),
      drawer: const NavigationDrawer(
        children: [
          Text('Drawer'),
        ],
      ),
    );
  }
}

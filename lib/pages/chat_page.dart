import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:unjuk_keterampilan_fg/models/user_model.dart';
import 'package:unjuk_keterampilan_fg/pages/channel_page.dart';
import 'package:unjuk_keterampilan_fg/pages/chat_room_page.dart';
import 'package:unjuk_keterampilan_fg/pages/bottom_nav_page.dart';
import 'package:unjuk_keterampilan_fg/resources/colors.dart';
import 'package:badges/badges.dart' as badges;
import 'package:unjuk_keterampilan_fg/resources/constants.dart';
import 'package:unjuk_keterampilan_fg/widgets/custom_text_field.dart';
import 'package:unjuk_keterampilan_fg/widgets/icon_background_widget.dart';
import 'package:unjuk_keterampilan_fg/widgets/tab_choices_widget.dart';

class ChatMainPage extends StatefulWidget {
  const ChatMainPage({super.key});

  @override
  State<ChatMainPage> createState() => _ChatMainPageState();
}

class _ChatMainPageState extends State<ChatMainPage> {
  @override
  Widget build(BuildContext context) {
    List<UserModel> onlineUsers =
        userData.where((user) => user.isOnline).toList();

    return Scaffold(
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
                      isSelected: true,
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
                      isSelected: false,
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
    );
  }
}

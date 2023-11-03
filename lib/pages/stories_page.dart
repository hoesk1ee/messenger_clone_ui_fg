import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:unjuk_keterampilan_fg/pages/bottom_nav_page.dart';
import 'package:unjuk_keterampilan_fg/pages/call_page.dart';
import 'package:unjuk_keterampilan_fg/pages/chat_page.dart';
import 'package:unjuk_keterampilan_fg/pages/people_page.dart';
import 'package:unjuk_keterampilan_fg/resources/colors.dart';
import 'package:unjuk_keterampilan_fg/resources/constants.dart';
import 'package:unjuk_keterampilan_fg/widgets/icon_background_widget.dart';
import 'package:badges/badges.dart' as badges;
import 'package:unjuk_keterampilan_fg/widgets/tab_choices_widget.dart';

class StoriesPage extends StatefulWidget {
  const StoriesPage({super.key});

  @override
  State<StoriesPage> createState() => _StoriesPageState();
}

class _StoriesPageState extends State<StoriesPage> {
  int _selectedIndex = 0;

  List<List<Widget>> actionButtons = [
    [
      const Icon(Icons.edit_rounded),
    ],
    [
      const Icon(Icons.call),
      const Icon(Icons.videocam),
    ],
    [
      const Icon(Icons.book),
    ],
  ];

  List<String> appBarTitle = [
    'Chats',
    'Calls',
    'People',
  ];

  List<Widget> _buildAppBarActions(BuildContext context) {
    return actionButtons[_selectedIndex].map((action) {
      return Builder(
        builder: (context) {
          return Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: IconBackgroundWidget(
              width: 42,
              height: 42,
              child: IconButton(
                splashRadius: 16,
                onPressed: () {},
                icon: action,
              ),
            ),
          );
        },
      );
    }).toList();
  }

  void _onTabTapped(int index) {
    setState(() {
      _selectedIndex = index;
      appBarTitle[index];
      actionButtons[index];
    });
  }

  List<Widget> pages = [
    const ChatMainPage(),
    const CallPage(),
    const PeoplePage(),
  ];

  @override
  Widget build(BuildContext context) {
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
        title: Text(
          appBarTitle[_selectedIndex],
          style: const TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: _buildAppBarActions(context),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //Tab
                Row(
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
                      label: 'ACTIVITY',
                    ),
                    const Gap(16),
                    //Unselected Tab
                    TabChoicesWidget(
                      onTap: () {
                        Navigator.pushAndRemoveUntil(
                          context,
                          PageRouteBuilder(
                            pageBuilder: (context, animation1, animation2) =>
                                const StoriesPage(),
                            transitionDuration: Duration.zero,
                            reverseTransitionDuration: Duration.zero,
                          ),
                          (route) => false,
                        );
                      },
                      isSelected: true,
                      label: 'STORIES (10)',
                    ),
                  ],
                ),
                const Gap(16),
                //Content
                Expanded(
                  child: GridView.builder(
                      itemCount: userData.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: 0.8,
                        crossAxisCount: 2,
                        crossAxisSpacing: 8.0,
                        mainAxisSpacing: 8.0,
                      ),
                      itemBuilder: (context, index) {
                        var data = userData[index];
                        return Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(data.picUrl),
                                fit: BoxFit.cover),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        color: ColorPalette().iconChatColor,
                                        width: 2),
                                  ),
                                  child: CircleAvatar(
                                    backgroundImage: NetworkImage(data.picUrl),
                                  ),
                                ),
                                const Spacer(),
                                Text(
                                  data.name,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: ColorPalette().mainWhiteColor),
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                ),
              ],
            ),
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

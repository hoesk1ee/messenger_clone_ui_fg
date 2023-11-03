import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:gap/gap.dart';
import 'package:unjuk_keterampilan_fg/pages/call_page.dart';
import 'package:unjuk_keterampilan_fg/pages/chat_page.dart';
import 'package:unjuk_keterampilan_fg/pages/people_page.dart';
import 'package:unjuk_keterampilan_fg/resources/colors.dart';
import 'package:unjuk_keterampilan_fg/widgets/icon_background_widget.dart';

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
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
      body: IndexedStack(
        index: _selectedIndex,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: ColorPalette().iconChatColor,
        unselectedItemColor: ColorPalette().unselectedColor,
        items: [
          BottomNavigationBarItem(
            icon: badges.Badge(
              badgeStyle: badges.BadgeStyle(
                borderSide:
                    BorderSide(color: ColorPalette().mainWhiteColor, width: 3),
              ),
              badgeContent: Padding(
                padding: const EdgeInsets.all(1.0),
                child: Text(
                  "3",
                  style: TextStyle(
                      color: ColorPalette().mainWhiteColor, fontSize: 11),
                ),
              ),
              position: badges.BadgePosition.topEnd(top: -10, end: -8),
              child: const Icon(Icons.chat_bubble),
            ),
            label: "Chats",
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.videocam),
            label: "Calls",
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: "People",
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onTabTapped,
      ),
      drawer: const NavigationDrawer(
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: NetworkImage(
                        'https://lh3.googleusercontent.com/4RtSy8rScY9INrYqtibqVeA_GvzE-n-oufMTGASBM0xnCzRGC2O9KFgYPUv9vaoJrWvIq-m9Db4k4CYj9fExJVzuAayfQOsftnH5rBI1tqRA3_do=w960-rj-nu-e365',
                      ),
                    ),
                    Gap(16),
                    Text("Ferry Gunawan"),
                    Icon(Icons.expand_more),
                    Spacer(),
                    Icon(Icons.settings),
                  ],
                ),
                Gap(32),
                DrawerListItem(
                  isSelected: true,
                  label: 'Chats',
                  icons: Icons.chat_bubble,
                ),
                Gap(8),
                DrawerListItem(
                  isSelected: false,
                  label: 'Marketplace',
                  icons: Icons.store,
                ),
                Gap(8),
                DrawerListItem(
                  isSelected: false,
                  label: 'Message requests',
                  icons: Icons.sms,
                ),
                Gap(8),
                DrawerListItem(
                  isSelected: false,
                  label: 'Archive',
                  icons: Icons.inventory,
                ),
                Gap(8),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class DrawerListItem extends StatelessWidget {
  const DrawerListItem({
    super.key,
    required this.label,
    required this.icons,
    required this.isSelected,
  });

  final String label;
  final IconData icons;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: isSelected
            ? ColorPalette().iconBackgroundColor
            : Colors.transparent,
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.all(8),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: ColorPalette().unselectedColor.withOpacity(0.2),
            ),
            child: Icon(
              icons,
              size: 20,
            ),
          ),
          const Gap(16),
          Text(
            label,
            style: const TextStyle(fontSize: 18),
          ),
          const Spacer(),
          isSelected
              ? badges.Badge(
                  badgeStyle: badges.BadgeStyle(
                    borderRadius: BorderRadius.circular(12),
                    shape: badges.BadgeShape.square,
                    badgeColor: ColorPalette().iconChatColor,
                  ),
                  badgeContent: Padding(
                    padding: const EdgeInsets.only(left: 4.0, right: 4.0),
                    child: Text(
                      "3",
                      style: TextStyle(
                        color: ColorPalette().mainWhiteColor,
                        fontSize: 11,
                      ),
                    ),
                  ),
                )
              : const Text("")
        ],
      ),
    );
  }
}

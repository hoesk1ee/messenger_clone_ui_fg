import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
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

  List<String> appBarTitle = [
    'Chats',
    'Calls',
    'People',
  ];

  void _onTabTapped(int index) {
    setState(() {
      _selectedIndex = index;
      appBarTitle[index];
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
      body: IndexedStack(
        index: _selectedIndex,
        children: pages,
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

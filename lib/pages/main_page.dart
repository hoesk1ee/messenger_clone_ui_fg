import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:gap/gap.dart';
import 'package:unjuk_keterampilan_fg/resources/colors.dart';
import 'package:unjuk_keterampilan_fg/widgets/icon_background_widget.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    int itemLength = 10;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: badges.Badge(
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
                    tooltip:
                        MaterialLocalizations.of(context).openAppDrawerTooltip,
                  );
                },
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
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  color: ColorPalette().iconBackgroundColor,
                ),
                child: const TextField(
                  textAlignVertical: TextAlignVertical.center,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    border: InputBorder.none,
                    hintText: "Search",
                  ),
                ),
              ),
            ),
            const Gap(8),
            //Online User ListView
            SizedBox(
              height: 104,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: itemLength,
                itemBuilder: (context, index) {
                  final isLastItem = index == 9;
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
                              end: -2, bottom: -4),
                          badgeStyle: badges.BadgeStyle(
                            badgeColor: ColorPalette().onlineColor,
                            borderSide: BorderSide(
                                color: ColorPalette().mainWhiteColor, width: 3),
                          ),
                          child: const CircleAvatar(
                            radius: 30,
                          ),
                        ),
                        const Gap(4),
                        const SizedBox(
                          width: 60,
                          child: Text(
                            "Ferry\nGunawan",
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
            DefaultTabController(
              length: 2, // Number of tabs (choices)
              child: Column(
                children: [
                  // Tab Bar
                  TabBar(
                    labelColor: Colors.black,
                    indicatorColor: Colors.transparent,
                    tabs: [
                      Tab(
                        child: Container(
                          decoration: BoxDecoration(
                            color: ColorPalette().iconBackgroundColor,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Center(
                            child: Text("HOME"),
                          ),
                        ),
                      ),
                      Tab(
                        child: Container(
                          decoration: BoxDecoration(
                            color: ColorPalette().iconBackgroundColor,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Center(
                            child: Text("CHANNELS"),
                          ),
                        ),
                      ),
                    ],
                  ),
                  // Tab Content
                  SizedBox(
                    height: 200,
                    child: TabBarView(
                      children: [
                        // Content for "HOME" tab
                        Center(
                          child: Text("HOME Content"),
                        ),
                        // Content for "CHANNELS" tab
                        Center(
                          child: Text("CHANNELS Content"),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
            //Tab Content
          ],
        ),
      ),
      drawer: const NavigationDrawer(
        children: [
          Text('Drawer'),
        ],
      ),
    );
  }
}

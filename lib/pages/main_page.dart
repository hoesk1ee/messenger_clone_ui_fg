import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:unjuk_keterampilan_fg/resources/colors.dart';
import 'package:unjuk_keterampilan_fg/widgets/icon_background_widget.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
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
        title: Row(
          children: [
            const Text(
              "Chats",
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Spacer(),
            IconBackgroundWidget(
              width: 42,
              height: 42,
              child: IconButton(
                splashRadius: 16,
                onPressed: () {},
                icon: const Icon(Icons.edit_rounded),
              ),
            )
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 8.0),
        child: Column(
          children: <Widget>[
            Container(
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
            )
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

import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
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
          badgeStyle: const badges.BadgeStyle(
            borderSide: BorderSide(color: Colors.white, width: 3),
          ),
          badgeContent: const Padding(
            padding: EdgeInsets.all(3.0),
            child: Text(
              "7",
              style: TextStyle(color: Colors.white),
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
      body: Container(),
      drawer: const NavigationDrawer(
        children: [
          Text('Drawer'),
        ],
      ),
    );
  }
}

// Stack(
//           children: [
//             Container(
//               decoration: const BoxDecoration(
//                 shape: BoxShape.circle,
//                 color: Color(0xFFF1F1F1),
//               ),
//               child: Builder(builder: (BuildContext context) {
//                 return IconButton(
//                   splashRadius: 16,
//                   onPressed: () {
//                     Scaffold.of(context).openDrawer();
//                   },
//                   icon: const Icon(Icons.menu_rounded),
//                   iconSize: 28,
//                   tooltip:
//                       MaterialLocalizations.of(context).openAppDrawerTooltip,
//                 );
//               }),
//             ),
//             //Notification Badge
//             Positioned(
//               right: -2,
//               top: -8,
//               child: Container(
//                 constraints: BoxConstraints(
//                   minWidth: 24,
//                   minHeight: 24,
//                 ),
//                 decoration: BoxDecoration(
//                   border: Border.all(color: Colors.white, width: 3),
//                   shape: BoxShape.circle,
//                   color: Colors.red,
//                 ),
//                 child: Padding(
//                   padding: const EdgeInsets.all(4.0),
//                   child: Text(
//                     "7",
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 16,
//                     ),
//                     textAlign: TextAlign.center,
//                   ),
//                 ),
//               ),
//             )
//           ],
//         ),

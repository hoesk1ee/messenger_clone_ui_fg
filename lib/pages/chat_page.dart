import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:unjuk_keterampilan_fg/resources/colors.dart';
import 'package:unjuk_keterampilan_fg/widgets/chat_actions_widget.dart';
import 'package:unjuk_keterampilan_fg/widgets/icon_background_widget.dart';
import 'package:badges/badges.dart' as badges;

class ChatPage extends StatefulWidget {
  const ChatPage(
      {super.key,
      required this.name,
      required this.lastOnline,
      required this.isOnline,
      required this.chat,
      required this.picUrl});

  final String name;
  final String lastOnline;
  final bool isOnline;
  final List<String> chat;
  final String picUrl;

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    List<String> nameParts = widget.name.split(" ");

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: ColorPalette().chatActionColor),
        leadingWidth: 32,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(4.0),
          child: Container(
            color: ColorPalette().iconBackgroundColor,
            height: 2.0,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Row(
          children: [
            widget.isOnline
                ? badges.Badge(
                    badgeContent: const SizedBox(
                      height: 6.0,
                      width: 6.0,
                    ),
                    position: badges.BadgePosition.bottomEnd(
                      end: -4,
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
                      backgroundImage: NetworkImage(widget.picUrl),
                    ),
                  )
                : CircleAvatar(
                    backgroundImage: NetworkImage(widget.picUrl),
                  ),
            const Gap(16),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  fit: FlexFit.loose,
                  child: Text(
                    nameParts[0],
                    overflow: TextOverflow.fade,
                    style: const TextStyle(fontSize: 18),
                  ),
                ),
                Text(
                  widget.isOnline
                      ? "Active Now"
                      : "Active ${widget.lastOnline} Ago",
                  style: TextStyle(
                      color: ColorPalette().unselectedColor, fontSize: 12),
                )
              ],
            ),
          ],
        ),
        actions: [
          ChatActionButton(
            onPressed: () {},
            icon: const Icon(
              Icons.call_rounded,
            ),
          ),
          ChatActionButton(
            onPressed: () {},
            icon: const Icon(
              Icons.videocam_rounded,
            ),
          ),
          ChatActionButton(
            onPressed: () {},
            icon: const Icon(
              Icons.info_rounded,
            ),
          ),
        ],
      ),
      body: Center(
        child: Column(
          children: [
            const Gap(24),
            widget.isOnline
                ? badges.Badge(
                    badgeContent: const SizedBox(
                      height: 16.0,
                      width: 16.0,
                    ),
                    position: badges.BadgePosition.bottomEnd(
                      end: -2,
                      bottom: 0,
                    ),
                    badgeStyle: badges.BadgeStyle(
                      badgeColor: ColorPalette().onlineColor,
                      borderSide: BorderSide(
                        color: ColorPalette().mainWhiteColor,
                        width: 3,
                      ),
                    ),
                    child: CircleAvatar(
                      radius: 48,
                      backgroundImage: NetworkImage(widget.picUrl),
                    ),
                  )
                : CircleAvatar(
                    radius: 48,
                    backgroundImage: NetworkImage(widget.picUrl),
                  ),
            const Gap(16),
            Text(
              widget.name,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Gap(4),
            const Text("Facebook"),
            Text(
              "You're friends on Facebook",
              style: TextStyle(
                color: ColorPalette().unselectedColor,
                fontWeight: FontWeight.w500,
              ),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:unjuk_keterampilan_fg/pages/bottom_nav_page.dart';
import 'package:unjuk_keterampilan_fg/pages/channel_page.dart';
import 'package:unjuk_keterampilan_fg/pages/stories_page.dart';
import 'package:unjuk_keterampilan_fg/resources/colors.dart';
import 'package:unjuk_keterampilan_fg/resources/constants.dart';
import 'package:unjuk_keterampilan_fg/widgets/tab_choices_widget.dart';

class PeoplePage extends StatelessWidget {
  const PeoplePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      isSelected: true,
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
                      isSelected: false,
                      label: 'STORIES (10)',
                    ),
                  ],
                ),
                //Content
                const Gap(32),
                Row(
                  children: [
                    Text(
                      "Facebook updates (8)",
                      style: TextStyle(color: ColorPalette().unselectedColor),
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {},
                      child: Text(
                        "SEE ALL",
                        style: TextStyle(color: ColorPalette().iconChatColor),
                      ),
                    ),
                  ],
                ),
                //List Update
                const Gap(16),
                Expanded(
                  child: ListView.builder(
                    itemCount: userData.length,
                    itemBuilder: (context, index) {
                      var data = userData[index];
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 16.0),
                        child: Row(
                          children: [
                            CircleAvatar(
                              backgroundImage: NetworkImage(
                                data.picUrl,
                              ),
                            ),
                            const Gap(16),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(data.name),
                                const Gap(4),
                                Text(
                                  "Added a new photo/video - Today",
                                  style: TextStyle(
                                    color: ColorPalette().unselectedColor,
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

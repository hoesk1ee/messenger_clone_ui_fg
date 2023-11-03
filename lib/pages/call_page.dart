import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:unjuk_keterampilan_fg/resources/colors.dart';
import 'package:unjuk_keterampilan_fg/resources/constants.dart';
import 'package:unjuk_keterampilan_fg/widgets/icon_background_widget.dart';

class CallPage extends StatelessWidget {
  const CallPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "No Calls",
                        style: TextStyle(
                          fontSize: 21,
                          color: ColorPalette().unselectedColor,
                        ),
                      ),
                      Text(
                        "Recent calls will appear here.",
                        style: TextStyle(
                          color: ColorPalette().unselectedColor,
                        ),
                      ),
                      const Gap(8),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: ColorPalette().iconChatColor,
                        ),
                        onPressed: () {},
                        child: Text('START A CALL'),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Suggestions"),
                      const Gap(24),
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
                                    radius: 24,
                                    backgroundImage: NetworkImage(data.picUrl),
                                  ),
                                  const Gap(16),
                                  Text(data.name),
                                  const Spacer(),
                                  IconBackgroundWidget(
                                    width: 32,
                                    height: 32,
                                    child: IconButton(
                                      splashRadius: 16,
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.call,
                                        size: 16,
                                      ),
                                    ),
                                  ),
                                  IconBackgroundWidget(
                                    width: 32,
                                    height: 32,
                                    child: IconButton(
                                      splashRadius: 16,
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.videocam,
                                        size: 16,
                                      ),
                                    ),
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
            ],
          ),
        ),
      ),
    );
  }
}

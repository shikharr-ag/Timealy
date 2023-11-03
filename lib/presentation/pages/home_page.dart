import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

import '../../utils/constants.dart';
import '../core/control_buttons.dart';
import '../core/header_message.dart';
import '../core/indicator.dart';
import '../core/meal_stopwatch.dart';
import '../core/sound_button.dart';

class MyHomePage extends StatefulWidget {
  static const routeName = '/home';
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late AudioPlayer player;
  @override
  void initState() {
    player = AudioPlayer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData obj = MediaQuery.of(context);
    AppBar ab = AppBar(
      backgroundColor: bgColor,
      title: Text(
        widget.title,
        style: titleStyle,
      ),
      centerTitle: true,
      leading: BackButton(
        color: Colors.white,
      ),
    );
    double height = obj.size.height;

    double width = obj.size.width;

    return Scaffold(
      backgroundColor: bgColor,
      appBar: ab,
      body: SizedBox(
        height: height - ab.preferredSize.height,
        width: width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: height * 0.05,
              child: const Row(
                children: [
                  Spacer(),
                  Indicator(),
                  Spacer(),
                ],
              ),
            ),
            const HeaderMessage(),
            const MealStopwatch(),
            Spacer(),
            SoundButton(),
            ControlButtons(player: player, height: height, width: width),
            Spacer(),
          ],
        ),
      ),
    );
  }
}

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../application/providers/home_page_provider.dart';
import '../../application/providers/tick_state_provider.dart';
import '../../utils/constants.dart';

class ControlButtons extends StatelessWidget {
  final AudioPlayer player;
  final double height;
  final double width;
  const ControlButtons(
      {super.key,
      required this.player,
      required this.height,
      required this.width});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomePageProvider>(builder: (context, prov, _) {
      return Consumer<TickStateProvider>(builder: (context, tickProv, _) {
        return Column(
          children: [
            SizedBox(
              width: width * 0.6,
              child: ElevatedButton(
                child: Text(
                  tickProv.tickCount > 0 ? 'Pause' : 'Start',
                  style: buttonTextStyle,
                ),
                onPressed: () {
                  if (prov.isStarted && tickProv.tickCount > 0) {
                    prov.pause();
                    tickProv?.stopCount();
                  } else {
                    prov.start();
                    tickProv.startCount(player);
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: startButtonColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
              ),
            ),
            if (prov.isStarted)
              SizedBox(
                width: width * 0.6,
                child: Consumer<HomePageProvider>(builder: (context, prov, _) {
                  return Consumer<TickStateProvider>(
                      builder: (context, tickProv, _) {
                    return ElevatedButton(
                      child: Text(
                        "LET'S STOP I'M FULL NOW",
                        style: buttonTextStyle.copyWith(
                            color: Colors.white, fontWeight: FontWeight.w300),
                      ),
                      onPressed: () {
                        if (prov.isStarted) {
                          prov.pause();
                          tickProv.stopCount();
                        } else {
                          prov.start();
                          tickProv.startCount(player);
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: bgColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                            side: BorderSide(color: Colors.white)),
                      ),
                    );
                  });
                }),
              ),
          ],
        );
      });
    });
  }
}

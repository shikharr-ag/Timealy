import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../application/providers/tick_state_provider.dart';
import '../../utils/constants.dart';

class SoundButton extends StatelessWidget {
  const SoundButton({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Consumer<TickStateProvider>(builder: (context, tickProv, _) {
        bool s = tickProv.muteState;
        return InkWell(
          splashColor: bgColor,
          onTap: () {
            print('tap');
            tickProv.muteAndUnmute(!s);
          },
          child: SizedBox(
            height: height * 0.08,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Expanded(
                  child: Switch(
                    value: !s,
                    onChanged: (x) {},
                    inactiveTrackColor: Colors.grey,
                    activeTrackColor: Colors.green,
                    thumbColor: MaterialStateProperty.resolveWith<Color>(
                        (Set<MaterialState> states) {
                      if (states.contains(MaterialState.disabled)) {
                        return Colors.white.withOpacity(.48);
                      }
                      return Colors.white;
                    }),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  'Sound ${tickProv.muteState ? "Off" : "On"}',
                  style: captionStyle,
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}

import 'dart:developer';

import 'package:audioplayers/audioplayers.dart';

class AudioHelper {
  void playSound({required AudioPlayer player}) async {
    log('Playing');
    player.stop().then((value) {
      player
          .setSourceAsset('countdown_tick.mp3')
          .then((value) => player.resume());
    });
  }
}

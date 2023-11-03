import 'dart:async';
import 'dart:developer';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:timealy/presentation/utils/audio_helper.dart';

class TickStateProvider extends ChangeNotifier {
  double _count = 0;
  double get tickCount => _count;
  int _factorCount = 0;
  int _factor = 2;
  int _cpyVar = 0;
  bool _isMuted = false;

  Timer? _secondsTimer;
  int get factorCount => _factorCount;
  bool get muteState => _isMuted;

  void setCount(double count, AudioPlayer p) {
    _count = count;
    _factorCount = count ~/ _factor;
    if (_factorCount > 25) {
      if (!_isMuted) _playSound(p);
    }
    print('Factor Count : $_factorCount');
    notifyListeners();
  }

  void muteAndUnmute(bool s) {
    _isMuted = s;
    log('State: $_isMuted');
    notifyListeners();
  }

  void _playSound(AudioPlayer p) {
    if (_factorCount > _cpyVar) {
      _cpyVar = _factorCount;
      AudioHelper().playSound(player: p);
    }
  }

  void resetCount() {
    _count = 0;
    _factorCount = 0;
    _cpyVar = 0;
    notifyListeners();
  }

  void startCount(AudioPlayer p) {
    double _elapsed = 0;

    setCount(0, p);
    _secondsTimer ??= Timer.periodic(Duration(milliseconds: 50), (timer) {
      _elapsed = _elapsed + 0.2;
      print('Counting $_elapsed');
      setCount(_elapsed, p);
      if (_elapsed > 60) {
        stopCount();
      }
    });
  }

  void stopCount() {
    print('Cancelled');
    _secondsTimer?.cancel();
    _secondsTimer = null;
    resetCount();
  }
}

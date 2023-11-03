import 'package:flutter/material.dart';

class HomePageProvider extends ChangeNotifier {
  bool _isStarted = false;

  int _state = 0;

  bool get isStarted => _isStarted;
  int get state => _state;
  void start() {
    _isStarted = true;
    _state += 1;
    if (_state > 3) {
      _state = 0;
    }
    notifyListeners();
  }

  void pause() {
    _isStarted = false;
    notifyListeners();
  }
}

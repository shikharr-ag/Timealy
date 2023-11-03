import 'package:flutter/material.dart';

const String messageFirst =
    'Its simple: eat slowly for ten minutes, rest for five, then finish your meal';

Map<String, String> msgCaption = {
  'Time to eat mindfully':
      'Its simple: eat slowly for ten minutes,\n rest for five, then finish your meal',
  'Nom Nom :)':
      'You have 10 minutes to eat before the pause.\nFocus on eating slowly',
  'Break Time':
      'Take a five-minute break to check in on your level of fullness',
  'Finish your meal': 'You can eat until you feel full',
};

const String appbarTitle = 'Mindful Meal Timer';

const Color bgColor = Color.fromRGBO(22, 20, 33, 1);

const Color indicatorInactiveColor = Color.fromRGBO(90, 91, 98, 1);
const Color startButtonColor = Color.fromRGBO(177, 232, 193, 1);

const Color textColor = Color.fromRGBO(100, 97, 115, 1);

const TextStyle titleStyle = TextStyle(color: textColor);
const TextStyle title2Style = TextStyle(color: Colors.white, fontSize: 24);
const TextStyle captionStyle = TextStyle(color: Colors.white, fontSize: 12);
const TextStyle buttonTextStyle = TextStyle(color: Colors.black, fontSize: 16);

OutlinedBorder defaultElevatedButtonShape =
    RoundedRectangleBorder(borderRadius: BorderRadius.circular(6.0));

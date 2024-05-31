import 'package:app_lampara/src/screens/smart_light/smart_light.dart';
import 'package:flutter/cupertino.dart';
import 'package:app_lampara/src/screens/home_screen/home_screen.dart';
import 'package:app_lampara/color_picker_screen.dart';
import 'package:flutter/material.dart';

// Routes arranged in ascending order

final Map<String, WidgetBuilder> routes = {
  HomeScreen.routeName: (context) => const HomeScreen(),
  SmartLight.routeName: (context) => const SmartLight(),
  ColorPickerScreen.routeName: (context) => const ColorPickerScreen(),
};

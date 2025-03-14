import 'package:flutter/material.dart';

MaterialColor createMaterialColor(Color color) {
  List strengths = <double>[.05, .1, .2, .3, .4, .5, .6, .7, .8, .9];
  Map<int, Color> swatch = {};
  for (var strength in strengths) {
    swatch[(strength * 1000).round()] = Color.fromRGBO(
      color.red,
      color.green,
      color.blue,
      strength,
    );
  }
  return MaterialColor(color.value, swatch);
}

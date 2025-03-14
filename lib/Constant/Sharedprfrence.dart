import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  static String sharedlang = "ISLANGUAGE";
  static Future<bool> saveLanguage(Locale spHost1) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    // preferences.reload();

    return await preferences.setString(sharedlang, spHost1.languageCode);
  }

  static Future<String?> getlanguage() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    // preferences.reload();

    return preferences.getString(sharedlang);
  }
}

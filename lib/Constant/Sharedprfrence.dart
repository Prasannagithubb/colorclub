import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  static String sharedlang = "ISLANGUAGE";
  static String memberID = "MemberID";
  static String tokenID = "TokenID";

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

  static Future<bool> saveMemberId(String spHost1) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    // preferences.reload();

    return await preferences.setString(memberID, spHost1);
  }

  static Future<String?> getMemberId() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    // preferences.reload();

    return preferences.getString(memberID);
  }

  static clearMemberId() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.remove(memberID);
  }

  static Future<bool> saveTokenId(String spHost1) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    // preferences.reload();

    return await preferences.setString(tokenID, spHost1);
  }

  static Future<String?> geTokenId() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    // preferences.reload();

    return preferences.getString(tokenID);
  }

  static clearTokenId() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.remove(tokenID);
  }
}

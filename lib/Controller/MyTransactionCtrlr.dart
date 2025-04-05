import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:new_one/Constant/Configuration.dart';
import 'package:new_one/Models/MyTransactionModel/AllTransMdl.dart';
import 'package:new_one/Service/GetMyTransaction/AllTransApi.dart';
import 'package:new_one/Service/GetMyTransaction/AmountWiseTransApi.dart';
import 'package:new_one/Service/GetMyTransaction/DateWiseTransApi.dart';
import 'package:new_one/Service/GetMyTransaction/PointWiseTransApi.dart';

class MyTransactionCtrl extends ChangeNotifier {
  init() {
    clearAllData();
    callAllapi();
  }

  clearAllData() {
    transdata = [];
    selectedname = null;
    datecontroller.text = '';
    todatecontroller.text = '';
    notifyListeners();
  }

  final List<String> selectednameList = [
    'All',
    'Date',
    'Points',
    'Amount'
  ]; // Option 2
  String? selectedname;

  // Option 2
  TextEditingController datecontroller = TextEditingController();
  TextEditingController todatecontroller = TextEditingController();
  Configure config = Configure();
  // List<MyTransPointsDataModel> transactions = [];

  List<MyTransAmtDataModel> transdata = [];
  callAllapi() async {
    transdata = [];
    await MyTransAllApi.sendTransactionapi().then((value) {
      if (value.statusCode! >= 200 && value.statusCode! <= 210) {
        transdata = value.data;

        log('All::${transdata.length}');
        notifyListeners();
      } else if (value.statusCode! >= 400 && value.statusCode! <= 410) {
        notifyListeners();
      } else {}
    });
    notifyListeners();
  }

  callAmtapi() async {
    transdata = [];
    await MyTransAmtApi.sendTransactionapi(
            int.parse(datecontroller.text), int.parse(todatecontroller.text))
        .then((value) {
      if (value.statusCode! >= 200 && value.statusCode! <= 210) {
        transdata = value.data;

        log(transdata.length.toString());
        notifyListeners();
      } else if (value.statusCode! >= 400 && value.statusCode! <= 410) {
        notifyListeners();
      } else {}
    });
    notifyListeners();
  }

  callPointapi() async {
    transdata = [];
    await MyTransPointsApi.sendTransactionapi(
            int.parse(datecontroller.text), int.parse(todatecontroller.text))
        .then((value) {
      if (value.statusCode! >= 200 && value.statusCode! <= 210) {
        transdata = value.data;

        log(transdata.length.toString());
        notifyListeners();
      } else if (value.statusCode! >= 400 && value.statusCode! <= 410) {
        notifyListeners();
      } else {}
    });
    notifyListeners();
  }

  callDateapi() async {
    transdata = [];
    await MyTransDateApi.sendTransactionapi(
            config.alignDate1(datecontroller.text),
            config.alignDate1(todatecontroller.text))
        .then((value) {
      if (value.statusCode! >= 200 && value.statusCode! <= 210) {
        transdata = value.data;

        log(transdata.length.toString());
        notifyListeners();
      } else if (value.statusCode! >= 400 && value.statusCode! <= 410) {
        notifyListeners();
      } else {}
    });
    notifyListeners();
  }
}

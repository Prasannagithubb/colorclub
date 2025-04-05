import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:new_one/Models/scanmodel/getcouponmodel.dart';
import 'package:new_one/Models/scanmodel/gettransmodel.dart';
import 'package:new_one/Service/AddPointsTrans.dart';
import 'package:new_one/Service/GetCouponDetils.dart';

import '../../Constant/Sharedprfrence.dart';

class Scancontroller extends ChangeNotifier {
  List<Newscancoupon> dataslist = [];
  List<TransactionData> transdatalist = [];
  bool? isloading = false;
  String? exception = '';
  String? transexception = '';
  String? apiresponsemessage;
  bool? transisloading = false;
  init(String couponCode) {
    // scanapicall(couponCode);
    notifyListeners();
  }

  List<TransactionModel> translist = [];
  List<QrModel> couponList = [];
  Future<void> scanapicall(String couponCode) async {
    isloading = true;
    exception = null;
    dataslist.clear();
    couponList.clear();
    notifyListeners();
    log("gggggg::$couponCode");
    couponList.add(QrModel(qrcode: couponCode));
    log("couponList::${couponList.length}");
    // try {
    final value = await GetScanCouponApi.getdata(
        couponList, couponCode); // Pass couponCode

    if (value.stcode != null && value.stcode! >= 200 && value.stcode! <= 210) {
      if (value.datalist != null && value.datalist!.isNotEmpty) {
        dataslist = value.datalist!;
        isloading = false;
      } else {
        exception = 'No data found';
        isloading = false;
      }
    } else if (value.stcode == 500) {
      exception = value.respDesc ?? 'Server error';
      isloading = false;
    } else {
      exception = value.respDesc ?? 'Unknown error';
      isloading = false;
    }
    notifyListeners();
  }

  Future<void> transpointapicall(
      int couponId, int points, double amount) async {
    log('datsaaaaa:::::$couponId + $points + $amount');
    transisloading = true;
    transexception = null;
    transdatalist.clear();
    translist.clear();
    notifyListeners();
    log("zzzzz::$translist");
    translist.add(
        TransactionModel(amount: amount, couponId: couponId, points: points));

    log("couponList::${translist.length}");

    final tvalue = await AddPointTransApi.sendTransactionapi(translist);

    if (tvalue.stcode != null &&
        tvalue.stcode! >= 200 &&
        tvalue.stcode! <= 210) {
      if (tvalue.datasource.isNotEmpty) {
        transdatalist = tvalue.datasource;

        await SharedPref.saveMemberId(transdatalist[0].memberId.toString());

        isloading = false;
      } else {
        transexception = 'No data found';
        isloading = false;
      }
    } else if (tvalue.stcode == 500) {
      transexception = tvalue.respDesc;
      isloading = false;
    } else {
      transexception = tvalue.respDesc;
      isloading = false;
    }
    notifyListeners();
  }
}

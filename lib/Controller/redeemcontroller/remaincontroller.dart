import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:new_one/Models/redeemmodel/redeemamtm.dart';
import 'package:new_one/Models/redeemmodel/redeemcate.dart';
import 'package:new_one/Models/redeemmodel/redeemdelm.dart';
import 'package:new_one/Models/redeemmodel/redeempointsapi.dart';
import 'package:new_one/Service/redeemamt.dart';
import 'package:new_one/Service/redeemcate.dart';
import 'package:new_one/Service/redeemdelser.dart';
import 'package:new_one/Service/redeemservices.dart';

class Redeemcontroller extends ChangeNotifier {
  init() {
    clearalldata();
    callpointsapi();
    callamtsapi();
    callReedemapi();
    callcategoryapi();
    notifyListeners();
  }

  clearalldata() {
    memberid = "";
    pointsdata = [];
    amtmemberid = '';
    reamtdata = [];
    reddelid = '';
    deldata = [];
    membercatid = '';
    catedata = [];
    notifyListeners();
  }

  String? memberid;
  String? amtmemberid;
  String? reddelid;
  String? membercatid;
  List<PointsDataModel>? pointsdata;
  callpointsapi() async {
    pointsdata = [];

    memberid = "15";
    await PointsApi.getData(memberid.toString()).then((value) {
      if (value.statusCode! >= 200 && value.statusCode! <= 210) {
        pointsdata = value.data;
        log(pointsdata!.length.toString());
        notifyListeners();
      } else if (value.statusCode! >= 400 && value.statusCode! <= 410) {
        notifyListeners();
      } else {}
    });
    notifyListeners();
  }

  List<RedeemamtDataModel>? reamtdata;
  callamtsapi() async {
    reamtdata = [];

    amtmemberid = "12";
    await RedeemamtApi.getData(amtmemberid.toString()).then((value) {
      if (value.statusCode! >= 200 && value.statusCode! <= 210) {
        reamtdata = value.data;
        log(reamtdata!.length.toString());
        notifyListeners();
      } else if (value.statusCode! >= 400 && value.statusCode! <= 410) {
        notifyListeners();
      } else {}
    });
    notifyListeners();
  }

  List<Redeemdelmdatamodel>? deldata;
  callReedemapi() async {
    deldata = [];

    reddelid = "10";
    await RedeemdelApi.getData(reddelid.toString()).then((value) {
      if (value.statusCode! >= 200 && value.statusCode! <= 210) {
        deldata = value.data;
        log(deldata!.length.toString());
        notifyListeners();
      } else if (value.statusCode! >= 400 && value.statusCode! <= 410) {
        notifyListeners();
      } else {}
    });
    notifyListeners();
  }

  List<CategoryDataModel>? catedata;
  callcategoryapi() async {
    catedata = [];

    membercatid = "18";
    await CateApi.getData(membercatid.toString()).then((value) {
      if (value.statusCode! >= 200 && value.statusCode! <= 210) {
        catedata = value.data;
        log(catedata!.length.toString());
        notifyListeners();
      } else if (value.statusCode! >= 400 && value.statusCode! <= 410) {
        notifyListeners();
      } else {}
    });
    notifyListeners();
  }
}

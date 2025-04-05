import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:new_one/Constant/AppConstant.dart';
import 'package:new_one/Constant/Configuration.dart';
import 'package:new_one/Models/redeemmodel/AddRedeemPointPostModel.dart';
import 'package:new_one/Models/redeemmodel/AddRedeemPoints.dart';
import 'package:new_one/Models/redeemmodel/redeemamtm.dart';
import 'package:new_one/Models/redeemmodel/redeemcate.dart';
import 'package:new_one/Models/redeemmodel/redeemdelm.dart';
import 'package:new_one/Models/redeemmodel/redeempointsapi.dart';
import 'package:new_one/Service/AddRedeemApi.dart';
// import 'package:new_one/Service/GetMyDealer.dart';
// import 'package:new_one/Service/getpointsapi.dart';
import 'package:new_one/Service/GetAmtToRedeem.dart';
import 'package:new_one/Service/GetMyDealer.dart';
import 'package:new_one/Service/GetPoints.dart';
import 'package:new_one/Service/redeemcate.dart';

class Redeemcontroller extends ChangeNotifier {
  init() {
    clearalldata();
    callApiList();
    notifyListeners();
  }

  callApiList() async {
    callGetMyDealerApi();
    spDeviceID = await config.getdeviceId();
    callpointsapi();
    callamtsapi();
    callcategoryapi();
    notifyListeners();
  }

  clearalldata() {
    memberid = "";
    pointsdata = [];
    amtmemberid = '';
    reamtdata = [];
    selectedCode = null;
    reddelid = '';
    membercatid = '';
    catedata = [];
    transDealerData = [];
    redeemPoints = [];
    isNotSelect = false;
    pointsController.text = '';
    addRedeemteddata = [];
    notifyListeners();
  }

  TextEditingController pointsController = TextEditingController();
  String? selectedCode;
  bool isNotSelect = false;
  String? memberid;
  String? amtmemberid;
  String? reddelid;
  String? membercatid;
  List<PointsDataModel> pointsdata = [];

  Configure config = Configure();
  String? spDeviceID = '';

  selectedDealer(String val) {
    for (var i = 0; i < transDealerData.length; i++) {
      if (transDealerData[i].dealername == val) {
        selectedCode = transDealerData[i].dealercode;
        notifyListeners();
      }
    }
    notifyListeners();
  }

  callpointsapi() async {
    pointsdata = [];
    memberid = '';
    memberid = AppConstant.memberId;
    await PointsApi.getData(memberid.toString()).then((value) {
      if (value.statusCode! >= 200 && value.statusCode! <= 210) {
        pointsdata = value.data;
        if (pointsdata.isNotEmpty) {
          pointsController.text =
              pointsdata.isNotEmpty ? pointsdata[0].points.toString() : '0';
          notifyListeners();
        }

        log(pointsdata.length.toString());
        notifyListeners();
      } else if (value.statusCode! >= 400 && value.statusCode! <= 410) {
        notifyListeners();
      } else {}
    });
    notifyListeners();
  }

  List<GetMyDealerMdlData> transDealerData = [];
  callGetMyDealerApi() async {
    transDealerData = [];
    await GetMyDealerApi.getData().then((value) {
      if (value.statusCode! >= 200 && value.statusCode! <= 210) {
        transDealerData = value.data;

        log(transDealerData.length.toString());
        notifyListeners();
      } else if (value.statusCode! >= 400 && value.statusCode! <= 410) {
        notifyListeners();
      } else {}
    });
    notifyListeners();
  }

  List<RedeemamtDataModel> reamtdata = [];
  callamtsapi() async {
    reamtdata = [];
    amtmemberid = "";

    amtmemberid = AppConstant.memberId;
    await GetAmttoRedeem.getData(amtmemberid.toString()).then((value) {
      if (value.statusCode! >= 200 && value.statusCode! <= 210) {
        reamtdata = value.data;
        log(reamtdata.length.toString());
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

    await CateApi.getData().then((value) {
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

  List<AddRedeemPointsPostMdl> redeemPoints = [];
  // List<RedeemamtDataModel> redeemAmtdata = [];

  addDocValue() {
// alignDate1

    String crnt1 = config.aligntimeDate2(
      config.currentDate(),
    );

    redeemPoints.add(AddRedeemPointsPostMdl(
      dealerCode: selectedCode,
      docDate: config.aligndateforsiteout(crnt1),
      memberId: int.parse(AppConstant.memberId),
      transIP: spDeviceID,
      debitAmount: reamtdata[0].redeemamt,
    ));
    notifyListeners();
  }

  List<AddRedeemPointsDataModel> addRedeemteddata = [];
  callRedeemAmountApi() async {
    addRedeemteddata = [];
    await addDocValue();
    AddRedeemAmtApi.dealerCode = selectedCode;
    AddRedeemAmtApi.points = int.parse(pointsdata[0].points.toString());
    AddRedeemAmtApi.transIp = spDeviceID;
    AddRedeemAmtApi.redeemPoints = redeemPoints;
    await AddRedeemAmtApi.getData().then((value) {
      if (value.statusCode! >= 200 && value.statusCode! <= 210) {
        addRedeemteddata = value.data;
        log(addRedeemteddata.length.toString());
        pointsController.text = '0';
        pointsdata[0].points = 0;
        notifyListeners();
      } else if (value.statusCode! >= 400 && value.statusCode! <= 410) {
        notifyListeners();
      } else {}
    });
    notifyListeners();
  }
}

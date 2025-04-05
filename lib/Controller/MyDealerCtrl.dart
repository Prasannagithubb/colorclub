import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:new_one/Models/redeemmodel/redeemdelm.dart';
import 'package:new_one/Service/GetMyDealer.dart';

class GetMyDealerCtrlr extends ChangeNotifier {
  init() {
    clearAllData();
    callGetMyDealerApi();
    notifyListeners();
  }

  clearAllData() {
    transDealerData = [];
    notifyListeners();
  }

  List<GetMyDealerMdlData> transDealerData = [];
  callGetMyDealerApi() async {
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
}

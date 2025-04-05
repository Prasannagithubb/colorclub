import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:new_one/Constant/AppConstant.dart';
import 'package:new_one/Models/redeemmodel/redeemamtm.dart';

class GetAmttoRedeem {
  static Future<RedeemamtModel> getData(String memberid) async {
    int ressCode = 500;

    try {
      log('GetAmttoRedeem URL::::http://dev.sellerkit.in:5468/api/Coupon/v1/GetAmountToRedeem?memberid=$memberid');
      final response = await http.get(
        Uri.parse(
            'http://dev.sellerkit.in:5468/api/Coupon/v1/GetAmountToRedeem?memberid=$memberid'),
        headers: {
          "content-type": "application/json",
          'Authorization': 'bearer ${AppConstant.token}'
        },
      );
      ressCode = response.statusCode;
      // log('AccBal sts::::${response.statusCode}');
      log("GetAmttoRedeem Res::${json.decode(response.body)}");
      if (response.statusCode == 200) {
        return RedeemamtModel.fromJson(json.decode(response.body), ressCode);
      } else {
        log("Error GetAmttoRedeem: ${json.decode(response.body)}");
        throw Exception("Error");
        // return AccountBalanceModel.exception('Error', ressCode);
      }
    } catch (e) {
      log("Exception GetAmttoRedeem: $e");
      //  throw Exception(e.toString());
      return RedeemamtModel.exception(e.toString(), ressCode);
    }
  }
}

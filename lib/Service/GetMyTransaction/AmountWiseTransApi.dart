import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:new_one/Constant/AppConstant.dart';
import 'package:new_one/Models/MyTransactionModel/AllTransMdl.dart';

class MyTransAmtApi {
  static Future<MyTransAmtResponse> sendTransactionapi(int min, int max) async {
    int rescode = 500;
    try {
      log("http://dev.sellerkit.in:5468/api/Coupon/v1/GetMyTransactionRedeemAmount?memberid=${AppConstant.memberId}&minamount=$min&maxamount=$max");
      final response = await http.get(
        Uri.parse(
            "http://dev.sellerkit.in:5468/api/Coupon/v1/GetMyTransactionRedeemAmount?memberid=${AppConstant.memberId}&minamount=$min&maxamount=$max"),
        headers: {
          "Content-Type": "application/json",
          'Authorization': 'bearer ${AppConstant.token}'
        },
      );

      log("Response Body: ${response.body}");
      log("Response Code: ${response.statusCode}");

      final responseData = json.decode(response.body);
      if (response.statusCode == 200) {
        return MyTransAmtResponse.fromJson(responseData, response.statusCode);
      } else {
        return MyTransAmtResponse.exception(responseData, response.statusCode);
      }
    } catch (e) {
      log("Exception: ${e.toString()}");
      return MyTransAmtResponse.exception(e.toString(), 500);
    }
  }
}

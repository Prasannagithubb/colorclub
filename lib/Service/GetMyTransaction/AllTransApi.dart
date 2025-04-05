import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:new_one/Constant/AppConstant.dart';
import 'package:new_one/Models/MyTransactionModel/AllTransMdl.dart';

class MyTransAllApi {
  static Future<MyTransAmtResponse> sendTransactionapi() async {
    int rescode = 500;
    try {
      log("http://dev.sellerkit.in:5468/api/Coupon/v1/GeTMyTransactionByAll?memberid=${AppConstant.memberId}::::${AppConstant.token}");
      final response = await http.get(
        Uri.parse(
            "http://dev.sellerkit.in:5468/api/Coupon/v1/GeTMyTransactionByAll?memberid=${AppConstant.memberId}"),
        headers: {
          "Content-Type": "application/json",
          'accept': '*/*',
          'Authorization': 'bearer ${AppConstant.token}'
        },
      );

      log("Response GeTMyTransactionByAll: ${response.body}");
      log("GeTMyTransactionByAll Code: ${response.statusCode}");

      final responseData = json.decode(response.body);
      if (response.statusCode == 200) {
        return MyTransAmtResponse.fromJson(responseData, response.statusCode);
      } else {
        return MyTransAmtResponse.exception(responseData, response.statusCode);
      }
    } catch (e) {
      log("GeTMyTransactionByAll Exception: ${e.toString()}");
      return MyTransAmtResponse.exception(e.toString(), 500);
    }
  }
}

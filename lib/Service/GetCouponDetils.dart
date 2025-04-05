import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:new_one/Constant/AppConstant.dart';
import 'package:new_one/Models/scanmodel/getcouponmodel.dart';

class GetScanCouponApi {
  static Future<GetCouponModel> getdata(
      List<QrModel> qrmodel, String couponCode) async {
    int rescode = 500;
    try {
      log("qrmodel::http://dev.sellerkit.in:5468/api/Coupon/v1/GetCouponDetails");
      log('AppConstant.token::${AppConstant.token}');

      final response = await http.post(
          Uri.parse(
              "http://dev.sellerkit.in:5468/api/Coupon/v1/GetCouponDetails"),
          headers: {
            "Content-Type": "application/json",
            'Authorization': 'bearer ${AppConstant.token}'
          },
          body: json.encode({'couponCode': couponCode})
          // body: jsonEncode(qrmodel.map((e) => e.tojson()).toList()),
          );
      log(
        "Response: ${jsonEncode(qrmodel.map((e) => e.tojson()).toList())}",
      );
      // Log the response
      log("Response GetCoupon: ${response.body}");
      log("Response sts: ${response.statusCode}");

      // Decode response JSON
      final responseData = json.decode(response.body);

      if (response.statusCode == 200 && responseData["respType"] == "Success") {
        return GetCouponModel.fromJson(responseData, response.statusCode);
      } else {
        return GetCouponModel.errors(responseData, response.statusCode);
      }
    } catch (e) {
      log("Exception GetCoupon: ${e.toString()}");
      return GetCouponModel.issues(
          "Something went wrong: ${e.toString()}", rescode);
    }
  }
}

class QrModel {
  String? qrcode;
  QrModel({required this.qrcode});
  Map<String, dynamic> tojson() {
    Map<String, dynamic> coupondata = {"couponCode": "$qrcode"};
    return coupondata;
  }
}

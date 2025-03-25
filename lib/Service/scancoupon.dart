import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:new_one/Models/scanmodel/getcouponmodel.dart';

class GetScanCouponApi {
  static Future<GetCouponModel> getdata(List<QrModel> qrmodel) async {
    log("qrmodel::${qrmodel.length}");
    int rescode = 500;
    try {
      final response = await http.post(
        Uri.parse(
            "http://dev.sellerkit.in:5468/api/Coupon/v1/AddCouponDetails"),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(qrmodel.map((e) => e.tojson()).toList()),
      );
      log(
        "Response: ${jsonEncode(qrmodel.map((e) => e.tojson()).toList())}",
      );
      // Log the response
      log("Response: ${response.body}");
      log("Response: ${response.statusCode}");

      // Decode response JSON
      final responseData = json.decode(response.body);

      if (response.statusCode == 200 && responseData["respType"] == "Success") {
        return GetCouponModel.fromJson(responseData, response.statusCode);
      } else {
        return GetCouponModel.errors(responseData, response.statusCode);
      }
    } catch (e) {
      log("Exception: ${e.toString()}");
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

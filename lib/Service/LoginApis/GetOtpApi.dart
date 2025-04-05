import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

import '../../Models/LoginModels/GetOtpModel.dart';

class GetOTPApi {
  static Future<GetLoginOtpMooel> getData(String mobileNum) async {
    int ressCode = 500;

    try {
      log('http://dev.sellerkit.in:5468/api/Coupon/v1/SendOtp?mobilenumber=$mobileNum');
      final response = await http.post(
        Uri.parse(
            'http://dev.sellerkit.in:5468/api/Coupon/v1/SendOtp?mobilenumber=$mobileNum'),
        headers: {
          "content-type": "application/json",
        },
      );
      ressCode = response.statusCode;
      // log('AccBal sts::::${response.statusCode}');
      log("SendOtp Res::${response.body}");
      if (response.statusCode == 200) {
        return GetLoginOtpMooel.fromJson(json.decode(response.body), ressCode);
      } else {
        log("Error AccBal: ${json.decode(response.body)}");
        throw Exception("Error");
        // return AccountBalanceModel.exception('Error', ressCode);
      }
    } catch (e) {
      log("Exception AB: $e");
      //  throw Exception(e.toString());
      return GetLoginOtpMooel.exception(e.toString(), ressCode);
    }
  }
}

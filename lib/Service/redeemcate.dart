import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:new_one/Models/redeemmodel/redeemcate.dart';

class CateApi {
  static Future<Category> getData(String cardcode) async {
    int ressCode = 500;

    try {
      final response = await http.get(
        Uri.parse(
            'http://dev.sellerkit.in:5468/api/Coupon/v1/GetCategory?memberid=18'),
        headers: {
          "content-type": "application/json",
        },
      );
      ressCode = response.statusCode;
      // log('AccBal sts::::${response.statusCode}');
      log("AccBal Res::${json.decode(response.body)}");
      if (response.statusCode == 200) {
        return Category.fromJson(json.decode(response.body), ressCode);
      } else {
        log("Error AccBal: ${json.decode(response.body)}");
        throw Exception("Error");
        // return AccountBalanceModel.exception('Error', ressCode);
      }
    } catch (e) {
      log("Exception AB: $e");
      //  throw Exception(e.toString());
      return Category.exception(e.toString(), ressCode);
    }
  }
}

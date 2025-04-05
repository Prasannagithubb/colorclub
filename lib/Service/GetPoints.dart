import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:new_one/Constant/AppConstant.dart';
import 'package:new_one/Models/redeemmodel/redeempointsapi.dart';

class PointsApi {
  static Future<PointsModel> getData(String cardcode) async {
    int ressCode = 500;

    try {
      log("kkk::" + "${AppConstant.token}");
      final response = await http.get(
        Uri.parse(
            'http://dev.sellerkit.in:5468/api/Coupon/v1/GetPoints?memberid=$cardcode'),
        headers: {
          // "content-type": "application/json",
          "accept": "*/*",
          'Authorization': 'bearer ${AppConstant.token}'
        },
      );
      ressCode = response.statusCode;

      log("GetPoints Res::${json.decode(response.body)}");
      if (response.statusCode == 200) {
        return PointsModel.fromJson(json.decode(response.body), ressCode);
      } else {
        log("Error GetPoints: ${json.decode(response.body)}");
        throw Exception("Error");
        // return AccountBalanceModel.exception('Error', ressCode);
      }
    } catch (e) {
      log("Exception AB: $e");
      //  throw Exception(e.toString());
      return PointsModel.exception(e.toString(), ressCode);
    }
  }
}

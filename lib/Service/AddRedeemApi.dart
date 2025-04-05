import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:new_one/Constant/AppConstant.dart';
import 'package:new_one/Models/redeemmodel/AddRedeemPointPostModel.dart';
import 'package:new_one/Models/redeemmodel/AddRedeemPoints.dart';

class AddRedeemAmtApi {
  static List<AddRedeemPointsPostMdl>? redeemPoints;
  static String? dealerCode;
  static String? transIp;
  static int? points;
  static int? debitAmt;

  static Future<AddRedeemPointsModel> getData() async {
    int ressCode = 500;

    try {
      log('AddRedeempoints::${AppConstant.token}');

      log(
        json.encode({
          "points": redeemPoints!.map((e) => e.tojson()).toList(),
          "redeemPoints": {
            "dealerCode": "$dealerCode",
            "transType": "Points_Redeem",
            "points": points,
            "currencytype": "TZS",
            "transip": "$transIp"
          }
        }),
      );
      final response = await http.post(
        Uri.parse('http://dev.sellerkit.in:5468/api/Coupon/v1/AddRedeempoints'),
        headers: {
          "content-type": "application/json",
          'Authorization': 'bearer ${AppConstant.token}'
        },
        body: json.encode({
          "points": redeemPoints!.map((e) => e.tojson()).toList(),
          "redeemPoints": {
            "dealerCode": "$dealerCode",
            "transType": "Points_Redeem",
            "points": points,
            "currencytype": "TZS",
            "transip": "$transIp"
          }

          // "points": [
          //   {
          //     "docDate": "2025-03-24T04:40:11.660Z",
          //     "memberId": 878978,
          //     "transType": "Points_Redeem",
          //     "dealerCode": "D001",
          //     "currency": "USD",
          //     "transRef": "TXN123456789",
          //     "transIP": "192.168.1.1"
          //   }
          // ],
          // "redeemPoints": {
          //   "dealerCode": "D001",
          //   "transType": "Redemption",
          //   "points": 40,
          //   "currencytype": "TZS",
          //   "transip": "192.168.1.1"
          // }
        }),
      );
      ressCode = response.statusCode;
      // log('AccBal sts::::${response.statusCode}');
      log("AddRedeempoints Res::${json.decode(response.body)}");
      if (response.statusCode == 200) {
        return AddRedeemPointsModel.fromJson(
            json.decode(response.body), ressCode);
      } else {
        log("Error AddRedeempoints: ${json.decode(response.body)}");
        throw Exception("Error");
        // return AccountBalanceModel.exception('Error', ressCode);
      }
    } catch (e) {
      log("Exception AddRedeempoints: $e");
      //  throw Exception(e.toString());
      return AddRedeemPointsModel.exception(e.toString(), ressCode);
    }
  }
}

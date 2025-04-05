import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:new_one/Models/mytransmodel/getmytransamt.dart';

class GetTransredamtApi {
  static Future<MyTransAmt> getData(String cardcode) async {
    int ressCode = 500;

    try {
      final response = await http.get(
        Uri.parse(
            'http://dev.sellerkit.in:5468/api/Coupon/v1/GetMyTransactionRedeemAmount?memberid=$cardcode'),
        headers: {
          "content-type": "application/json",
        },
      );
      ressCode = response.statusCode;
      // log('AccBal sts::::${response.statusCode}');
      log("GetMyTransactionRedeemAmount Res::${json.decode(response.body)}");
      if (response.statusCode == 200) {
        return MyTransAmt.fromJson(json.decode(response.body), ressCode);
      } else {
        log("Error GetMyTransactionRedeemAmount: ${json.decode(response.body)}");
        throw Exception("Error");
        // return AccountBalanceModel.exception('Error', ressCode);
      }
    } catch (e) {
      log("Exception in GetMyTransactionRedeemAmount: $e");
      //  throw Exception(e.toString());
      return MyTransAmt.exception(e.toString(), ressCode);
    }
  }
}

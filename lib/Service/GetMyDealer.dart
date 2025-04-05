import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:new_one/Constant/AppConstant.dart';
import 'package:new_one/Models/redeemmodel/redeemdelm.dart';

class GetMyDealerApi {
  static Future<GetMyDealerMdl> getData() async {
    int ressCode = 500;

    try {
      final response = await http.get(
        Uri.parse(
            'http://dev.sellerkit.in:5468/api/Coupon/v1/GetMyDealer?memberid=${AppConstant.memberId}'),
        headers: {
          "content-type": "application/json",
          'Authorization': 'bearer ${AppConstant.token}'
        },
      );
      ressCode = response.statusCode;
      // log('AccBal sts::::${response.statusCode}');
      log("GetMyDealer Res::${json.decode(response.body)}");
      if (response.statusCode == 200) {
        return GetMyDealerMdl.fromJson(json.decode(response.body), ressCode);
      } else {
        log("Error GetMyDealer: ${json.decode(response.body)}");
        throw Exception("Error");
        // return AccountBalanceModel.exception('Error', ressCode);
      }
    } catch (e) {
      log("Exception GetMyDealer: $e");
      //  throw Exception(e.toString());
      return GetMyDealerMdl.exception(e.toString(), ressCode);
    }
  }
}

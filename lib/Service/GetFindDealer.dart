import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:new_one/Constant/AppConstant.dart';
import 'package:new_one/Models/FindDealerModel.dart';

class GetFindDealerApi {
  static Future<GetFindDealerModel> getData(
      String lat, String long, String dist) async {
    int ressCode = 500;

    try {
      log('AppConstant.token::${AppConstant.token}');
      log('GetFindDealer::http://dev.sellerkit.in:5468/api/Coupon/v1/GetFindDealer?lat=$lat&longitude=$long&distance=$dist');
      final response = await http.get(
        Uri.parse(
            'http://dev.sellerkit.in:5468/api/Coupon/v1/GetFindDealer?lat= 23.54&longitude=-20.34&distance=2000'),
        headers: {
          "content-type": "application/json",
          'Authorization': 'bearer ${AppConstant.token}'
        },
      );
      ressCode = response.statusCode;
      // log('AccBal sts::::${response.statusCode}');
      log("GetFindDealer Res::${json.decode(response.body)}");
      if (response.statusCode == 200) {
        return GetFindDealerModel.fromJson(
            json.decode(response.body), ressCode);
      } else {
        log("Error GetFindDealer: ${json.decode(response.body)}");
        throw Exception("Error");
        // return AccountBalanceModel.exception('Error', ressCode);
      }
    } catch (e) {
      log("Exception GetFindDealer: $e");
      //  throw Exception(e.toString());
      return GetFindDealerModel.exception(e.toString(), ressCode);
    }
  }
}

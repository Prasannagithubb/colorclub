import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:new_one/Constant/AppConstant.dart';
import 'package:new_one/Constant/Configuration.dart';
import 'package:new_one/Constant/Encryption.dart';
import 'package:new_one/Constant/Sharedprfrence.dart';
import 'package:new_one/Models/LoginModels/ValidationModel.dart';

class ValidateOTPApi {
  static Future<GetValidateModel> getData(String mobileNum, String otp) async {
    int ressCode = 500;

    try {
      log('http://dev.sellerkit.in:5468/api/Coupon/v1/ValidateOtp');
      final response = await http.post(
          Uri.parse('http://dev.sellerkit.in:5468/api/Coupon/v1/ValidateOtp'),
          headers: {
            "content-type": "application/json",
          },
          body: json.encode({"mobileNumber": mobileNum, "otp": otp}));
      ressCode = response.statusCode;
      // log('AccBal sts::::${response.statusCode}');
      log("SendOtp Res::${response.body}");
      if (response.statusCode == 200) {
        Configure config = new Configure();
        Map<String, dynamic> tokenNew3 = json.decode(response.body);
        Map<String, dynamic> jres =
            config.parseJwt(tokenNew3['data'].toString());
        SharedPref.saveTokenId(tokenNew3['data'].toString());
        String? gettokenid = await SharedPref.geTokenId();
        AppConstant.token = gettokenid!;
        log("ABCD7333:::$gettokenid");
        EncryptData Encrupt = new EncryptData();
        String? testData2 = Encrupt.decrypt(jres['encryptedClaims'].toString());

        Map<String, dynamic> jres2 = jsonDecode(testData2);
        log("jres2:::$jres2");
        Map<String, dynamic> tokenNew = json.decode(response.body);
        log("token::::$jres2");
        // ConstantValues.token = tokenNew['token'];
        return GetValidateModel.fromJson(
            jres2, json.decode(response.body), response.statusCode);
        // return GetValidateModel.fromJson(json.decode(response.body), ressCode);
      } else {
        log("Error AccBal: ${json.decode(response.body)}");
        throw Exception("Error");
        // return AccountBalanceModel.exception('Error', ressCode);
      }
    } catch (e) {
      log("Exception AB: $e");
      //  throw Exception(e.toString());
      return GetValidateModel.exception(e.toString(), ressCode);
    }
  }
}

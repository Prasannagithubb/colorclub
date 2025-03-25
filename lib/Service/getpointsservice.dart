import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:new_one/Models/scanmodel/gettransmodel.dart';

class AddPointTransApi {
  static Future<AddPointTransModel> sendTransactionapi(
      List<TransactionModel> transactions) async {
    log("Sending transactions: \${transactions.length}");
    int rescode = 500;
    try {
      final response = await http.post(
        Uri.parse(
            "http://dev.sellerkit.in:5468/api/Coupon/v1/AddPointTrans?transtype=test&transip=test"),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(transactions.map((e) => e.toJson()).toList()),
      );

      log("Request Body: ${jsonEncode(transactions.map((e) => e.toJson()).toList())}");
      log("Response Body: ${response.body}");
      log("Response Code: ${response.statusCode}");

      final responseData = json.decode(response.body);
      if (response.statusCode == 200 && responseData["respType"] == "success") {
        return AddPointTransModel.fromJson(responseData, response.statusCode);
      } else {
        return AddPointTransModel.errors(responseData, response.statusCode);
      }
    } catch (e) {
      log("Exception: ${e.toString()}");
      return AddPointTransModel.errors(
          {"respDesc": "Something went wrong: ${e.toString()}"}, rescode);
    }
  }
}

class TransactionModel {
  int couponId;
  int points;
  double amount;

  TransactionModel(
      {required this.amount, required this.couponId, required this.points});

  Map<String, dynamic> toJson() {
    return {
      "couponId": couponId,
      "points": points,
      "amount": amount,
    };
  }
}

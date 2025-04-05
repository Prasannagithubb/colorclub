import 'dart:convert';
import 'dart:developer';

class GetCouponModel {
  String? respType;
  String? respCode;
  String? respDesc;
  List<Newscancoupon>? datalist;
  int? stcode;
  String? exception;
  GetCouponModel(
      {required this.datalist,
      required this.respCode,
      required this.respDesc,
      required this.respType,
      required this.stcode,
      this.exception});

  factory GetCouponModel.fromJson(Map<String, dynamic> jsons, int stcode) {
    log("json::$jsons");
    var list = json.decode(jsons['data']) as List;
    List<Newscancoupon> datalist =
        list.map((e) => Newscancoupon.fromJson(e)).toList();
    return GetCouponModel(
        datalist: datalist,
        respCode: jsons["respCode"],
        respDesc: jsons["respDesc"],
        respType: jsons["respType"],
        stcode: stcode);
  }

  factory GetCouponModel.errors(Map<String, dynamic> json, int stocde) {
    return GetCouponModel(
        datalist: null,
        respCode: json["respCode"],
        respDesc: json["respDesc"],
        respType: json["respType"],
        stcode: stocde,
        exception: "error");
  }

  factory GetCouponModel.issues(String erro, int stcode) {
    return GetCouponModel(
        datalist: null,
        respCode: null,
        respDesc: null,
        respType: null,
        stcode: stcode,
        exception: "Coupon is already used");
  }
}

class Newscancoupon {
  final int docEntry;
  final String couponCode;
  final int points;
  final double equivalentAmount;
  final String amountCurr;
  final String itemCode;
  final String itemName;
  final String packSize;
  final String batchNumber;
  final String dateOfMFG;
  final String dateOfExpiry;
  final int couponStatus;
  final String dateOfClaim;

  Newscancoupon({
    required this.docEntry,
    required this.couponCode,
    required this.points,
    required this.equivalentAmount,
    required this.amountCurr,
    required this.itemCode,
    required this.itemName,
    required this.packSize,
    required this.batchNumber,
    required this.dateOfMFG,
    required this.dateOfExpiry,
    required this.couponStatus,
    required this.dateOfClaim,
  });
  factory Newscancoupon.fromJson(Map<String, dynamic> jsons) {
    return Newscancoupon(
      docEntry: jsons['DocEntry'],
      couponCode: jsons['CouponCode'] ?? '',
      points: jsons['Points'],
      equivalentAmount: jsons['EquvalentAmount'] ?? 0,
      amountCurr: jsons['AmountCurr'] ?? '',
      itemCode: jsons['ItemCode'] ?? '',
      itemName: jsons['ItemName'] ?? '',
      packSize: jsons['PackSize'] ?? '',
      batchNumber: jsons['BatchNumber'] ?? '',
      dateOfMFG: jsons['DateofMFG'] ?? '',
      dateOfExpiry: jsons['DateofExpiry'] ?? '',
      couponStatus: jsons['CouponStatus'] ?? '',
      dateOfClaim: jsons['DateofClaim'] ?? '',
    );
  }
}

import 'dart:convert';

class CouponResponse {
  List<CouponData>? coupons;
  String message;
  bool status;
  String? exception;
  int? statusCode;

  CouponResponse({
    required this.coupons,
    required this.message,
    required this.status,
    this.exception,
    required this.statusCode,
  });

  factory CouponResponse.fromJson(Map<String, dynamic> json, int statusCode) {
    try {
      List<dynamic> dataList = jsonDecode(json["data"]);
      List<CouponData> coupons =
          dataList.map((data) => CouponData.fromJson(data)).toList();

      return CouponResponse(
        coupons: coupons,
        message: json["respDesc"] ?? "Success",
        status: json["respType"] == "success",
        statusCode: statusCode,
        exception: null,
      );
    } catch (e) {
      return CouponResponse(
        coupons: null,
        message: "Parsing Error",
        status: false,
        statusCode: statusCode,
        exception: e.toString(),
      );
    }
  }

  factory CouponResponse.error(String errorMsg, int statusCode) {
    return CouponResponse(
      coupons: null,
      message: "Exception",
      status: false,
      statusCode: statusCode,
      exception: errorMsg,
    );
  }
}

class CouponData {
  int docEntry;
  String couponCode;
  int points;
  double equivalentAmount;
  String amountCurr;
  String itemCode;
  String itemName;
  String packSize;
  String batchNumber;
  String dateOfMFG;
  String dateOfExpiry;
  int couponStatus;
  int memberId;
  String dateOfClaim;
  String secKey;
  String createdLastIP;
  String claimIP;
  int createdBy;
  String createdOn;
  String? updatedBy;
  String? updatedOn;
  String traceId;

  CouponData({
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
    required this.memberId,
    required this.dateOfClaim,
    required this.secKey,
    required this.createdLastIP,
    required this.claimIP,
    required this.createdBy,
    required this.createdOn,
    this.updatedBy,
    this.updatedOn,
    required this.traceId,
  });

  factory CouponData.fromJson(Map<String, dynamic> json) {
    return CouponData(
      docEntry: json["DocEntry"] ?? 0,
      couponCode: json["CouponCode"] ?? "",
      points: json["Points"] ?? 0,
      equivalentAmount: (json["EquvalentAmount"] ?? 0).toDouble(),
      amountCurr: json["AmountCurr"] ?? "",
      itemCode: json["ItemCode"] ?? "",
      itemName: json["ItemName"] ?? "",
      packSize: json["PackSize"] ?? "",
      batchNumber: json["BatchNumber"] ?? "",
      dateOfMFG: json["DateofMFG"] ?? "",
      dateOfExpiry: json["DateofExpiry"] ?? "",
      couponStatus: json["CouponStatus"] ?? 0,
      memberId: json["MemberId"] ?? 0,
      dateOfClaim: json["DateofClaim"] ?? "",
      secKey: json["SecKey"] ?? "",
      createdLastIP: json["CreatedLastIP"] ?? "",
      claimIP: json["ClaimIP"] ?? "",
      createdBy: json["CreatedBy"] ?? 0,
      createdOn: json["CreatedOn"] ?? "",
      updatedBy: json["UpdatedBy"],
      updatedOn: json["UpdatedOn"],
      traceId: json["TraceId"] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "DocEntry": docEntry,
      "CouponCode": couponCode,
      "Points": points,
      "EquvalentAmount": equivalentAmount,
      "AmountCurr": amountCurr,
      "ItemCode": itemCode,
      "ItemName": itemName,
      "PackSize": packSize,
      "BatchNumber": batchNumber,
      "DateofMFG": dateOfMFG,
      "DateofExpiry": dateOfExpiry,
      "CouponStatus": couponStatus,
      "MemberId": memberId,
      "DateofClaim": dateOfClaim,
      "SecKey": secKey,
      "CreatedLastIP": createdLastIP,
      "ClaimIP": claimIP,
      "CreatedBy": createdBy,
      "CreatedOn": createdOn,
      "UpdatedBy": updatedBy,
      "UpdatedOn": updatedOn,
      "TraceId": traceId,
    };
  }
}

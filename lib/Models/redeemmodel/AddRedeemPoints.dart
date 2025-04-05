import 'dart:convert';

class AddRedeemPointsModel {
  String respType;
  String respCode;
  String respDesc;
  List<AddRedeemPointsDataModel> data;
  String? error;
  int? statusCode;

  AddRedeemPointsModel({
    required this.respType,
    required this.respCode,
    required this.respDesc,
    required this.data,
    required this.error,
    required this.statusCode,
  });

  factory AddRedeemPointsModel.fromJson(
      Map<String, dynamic> json, int stscode) {
    if (stscode >= 200 && stscode <= 210) {
      if (json['data'] != null && json['data'].toString() != 'No data found') {
        var list = jsonDecode(json['data']) as List;
        List<AddRedeemPointsDataModel> dataList = list
            .map((dynamic entry) => AddRedeemPointsDataModel.fromJson(entry))
            .toList();

        return AddRedeemPointsModel(
            respType: json["respType"],
            respCode: json["respCode"],
            respDesc: json["respDesc"],
            data: dataList,
            statusCode: stscode,
            error: '');
      } else {
        return AddRedeemPointsModel(
            respType: "",
            respCode: "",
            respDesc: "",
            data: [],
            statusCode: stscode,
            error: '');
      }
    } else {
      return AddRedeemPointsModel(
          respType: "",
          respCode: "",
          respDesc: "",
          data: [],
          statusCode: stscode,
          error: '');
    }
  }

  factory AddRedeemPointsModel.exception(String e, int statuscode) {
    return AddRedeemPointsModel(
        respType: "",
        respCode: "",
        respDesc: "",
        data: [],
        statusCode: statuscode,
        error: e);
  }

  Map<String, dynamic> toJson() => {
        "respType": respType,
        "respCode": respCode,
        "respDesc": respDesc,
        "data": data,
      };
}

class AddRedeemPointsDataModel {
  int? docEntry;
  String? docDate;
  int? memberId;
  String? transType;
  String? couponId;
  String? claimDealerCode;
  String? dealerName;
  int? pointDebit;
  int? pointCredit;
  double? amount;
  String? transRef;
  String? transIp;
  int? createdBy;
  String? createdOn;
  int? updatedBy;
  String? updatedOn;
  String? traceId;

  AddRedeemPointsDataModel({
    required this.docEntry,
    required this.docDate,
    required this.memberId,
    required this.transType,
    required this.dealerName,
    required this.couponId,
    required this.claimDealerCode,
    required this.pointDebit,
    required this.pointCredit,
    required this.amount,
    required this.transRef,
    required this.transIp,
    required this.createdBy,
    required this.createdOn,
    required this.updatedBy,
    required this.updatedOn,
    required this.traceId,
  });

  factory AddRedeemPointsDataModel.fromJson(Map<String, dynamic> json) {
    return AddRedeemPointsDataModel(
      docEntry: json["DocEntry"] ?? 0,
      docDate: json["DocDate"] ?? "",
      memberId: json["MemberId"] ?? 0,
      transType: json["TransType"] ?? "",
      couponId: json["CouponId"] ?? "",
      claimDealerCode: json["ClaimDealerCode"] ?? "",
      dealerName: json["DealerName"] ?? "",
      pointDebit: json["PointDebit"] ?? 0,
      pointCredit: json["PointCredit"] ?? 0,
      amount: json["Amount"] ?? 0.0,
      transRef: json["TransRef"] ?? "",
      transIp: json["TransIP"] ?? "",
      createdBy: json["CreatedBy"] ?? 0,
      createdOn: json["CreatedOn"] ?? "",
      updatedBy: json["UpdatedBy"] ?? 0,
      updatedOn: json["UpdatedOn"] ?? "",
      traceId: json["TraceId"] ?? "",
    );
  }
}

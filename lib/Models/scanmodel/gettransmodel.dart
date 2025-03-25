import 'dart:convert';
import 'dart:developer';

class AddPointTransModel {
  final String respType;
  final String respCode;
  final String respDesc;
  int? stcode;
  String? exception;
  final List<TransactionData> datasource;

  AddPointTransModel({
    required this.respType,
    required this.respCode,
    required this.respDesc,
    required this.datasource,
    required this.stcode,
    this.exception,
  });

  factory AddPointTransModel.fromJson(Map<String, dynamic> json, int stcode) {
    log('json:::$json');
    var list = (jsonDecode(json['data']) as List)
        .map((e) => TransactionData.fromJson(e))
        .toList();
    return AddPointTransModel(
      respType: json['respType'],
      respCode: json['respCode'],
      respDesc: json['respDesc'],
      datasource: list,
      stcode: stcode,
    );
  }

  factory AddPointTransModel.errors(Map<String, dynamic> json, int statusCode) {
    return AddPointTransModel(
      respType: json["respType"] ?? "error",
      respCode: json["respCode"] ?? "Unknown Error",
      respDesc: json["respDesc"] ?? "An error occurred",
      datasource: [],
      stcode: statusCode,
    );
  }

  factory AddPointTransModel.issues(Map<String, dynamic> json, int statusCode) {
    return AddPointTransModel(
        respType: '',
        respCode: '',
        respDesc: '',
        stcode: statusCode,
        exception: 'points data not found',
        datasource: []);
  }
}

class TransactionData {
  final int docEntry;
  final DateTime docDate;
  final int memberId;
  final String transType;
  final int couponId;
  final String? claimDealerCode;
  final int pointDebit;
  final int pointCredit;
  final double amount;
  final String transRef;
  final String transIP;
  final int createdBy;
  final DateTime createdOn;
  final int? updatedBy;
  final DateTime? updatedOn;
  final String traceId;

  TransactionData({
    required this.docEntry,
    required this.docDate,
    required this.memberId,
    required this.transType,
    required this.couponId,
    this.claimDealerCode,
    required this.pointDebit,
    required this.pointCredit,
    required this.amount,
    required this.transRef,
    required this.transIP,
    required this.createdBy,
    required this.createdOn,
    this.updatedBy,
    this.updatedOn,
    required this.traceId,
  });

  factory TransactionData.fromJson(Map<String, dynamic> json) {
    return TransactionData(
      docEntry: json['DocEntry'],
      docDate: DateTime.parse(json['DocDate']),
      memberId: json['MemberId'],
      transType: json['TransType'],
      couponId: json['CouponId'],
      claimDealerCode: json['ClaimDealerCode'],
      pointDebit: json['PointDebit'],
      pointCredit: json['PointCredit'],
      amount: json['Amount'].toDouble(),
      transRef: json['TransRef'],
      transIP: json['TransIP'],
      createdBy: json['CreatedBy'],
      createdOn: DateTime.parse(json['CreatedOn']),
      updatedBy: json['UpdatedBy'],
      updatedOn:
          json['UpdatedOn'] != null ? DateTime.parse(json['UpdatedOn']) : null,
      traceId: json['TraceId'],
    );
  }
}

import 'dart:convert';

class MyTransAmt {
  String respType;
  String respCode;
  String respDesc;
  List<MyTransAmtDataModel> data;
  String? error;
  int? statusCode;

  MyTransAmt({
    required this.respType,
    required this.respCode,
    required this.respDesc,
    required this.data,
    this.error,
    this.statusCode,
  });

  factory MyTransAmt.fromJson(Map<String, dynamic> json, int stscode) {
    if (stscode >= 200 && stscode <= 210) {
      if (json['data'].toString() != 'No data found') {
        var list = jsonDecode(json['data']) as List;
        List<MyTransAmtDataModel> dataList = list
            .map((dynamic item) => MyTransAmtDataModel.fromJson(item))
            .toList();
        return MyTransAmt(
          respType: json["respType"],
          respCode: json["respCode"],
          respDesc: json["respDesc"],
          data: dataList,
          statusCode: stscode,
          error: '',
        );
      } else {
        return MyTransAmt(
          respType: "",
          respCode: "",
          respDesc: "",
          data: [],
          statusCode: stscode,
          error: '',
        );
      }
    } else {
      return MyTransAmt(
        respType: "",
        respCode: "",
        respDesc: "",
        data: [],
        statusCode: stscode,
        error: '',
      );
    }
  }

  factory MyTransAmt.exception(String e, int statuscode) {
    return MyTransAmt(
      respType: "",
      respCode: "",
      respDesc: "",
      data: [],
      statusCode: statuscode,
      error: e,
    );
  }

  Map<String, dynamic> toJson() => {
        "respType": respType,
        "respCode": respCode,
        "respDesc": respDesc,
        "data": jsonEncode(data.map((e) => e.toJson()).toList()),
      };
}

class MyTransAmtDataModel {
  String docDate;
  double redeemAmount;
  String dealerName;

  MyTransAmtDataModel({
    required this.docDate,
    required this.redeemAmount,
    required this.dealerName,
  });

  factory MyTransAmtDataModel.fromJson(Map<String, dynamic> json) {
    return MyTransAmtDataModel(
      docDate: json["DocDate"],
      redeemAmount: json["RedeemAmount"].toDouble(),
      dealerName: json["DealerName"],
    );
  }

  Map<String, dynamic> toJson() => {
        "DocDate": docDate,
        "RedeemAmount": redeemAmount,
        "DealerName": dealerName,
      };
}

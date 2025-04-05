import 'dart:convert';

class MyTransPoints {
  String respType;
  String respCode;
  String respDesc;
  List<MyTransPointsDataModel> data;
  String? error;
  int? statusCode;

  MyTransPoints({
    required this.respType,
    required this.respCode,
    required this.respDesc,
    required this.data,
    this.error,
    this.statusCode,
  });

  factory MyTransPoints.fromJson(Map<String, dynamic> json, int stscode) {
    if (stscode >= 200 && stscode <= 210) {
      if (json['data'].toString() != 'No data found') {
        var list = jsonDecode(json['data']) as List;
        List<MyTransPointsDataModel> dataList = list
            .map((dynamic item) => MyTransPointsDataModel.fromJson(item))
            .toList();
        return MyTransPoints(
          respType: json["respType"],
          respCode: json["respCode"],
          respDesc: json["respDesc"],
          data: dataList,
          statusCode: stscode,
          error: '',
        );
      } else {
        return MyTransPoints(
          respType: "",
          respCode: "",
          respDesc: "",
          data: [],
          statusCode: stscode,
          error: '',
        );
      }
    } else {
      return MyTransPoints(
        respType: "",
        respCode: "",
        respDesc: "",
        data: [],
        statusCode: stscode,
        error: '',
      );
    }
  }

  factory MyTransPoints.exception(String e, int statuscode) {
    return MyTransPoints(
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

class MyTransPointsDataModel {
  String docDate;
  int receivedPoints;
  String? details;

  double amount;

  MyTransPointsDataModel({
    required this.docDate,
    required this.receivedPoints,
    required this.amount,
    this.details,
  });

  factory MyTransPointsDataModel.fromJson(Map<String, dynamic> json) {
    return MyTransPointsDataModel(
      docDate: json["DocDate"] ?? '',
      receivedPoints: json["RecievedPoints"] ?? 0,
      amount: json["Amount"] ?? 0,
    );
  }

  Map<String, dynamic> toJson() => {
        "DocDate": docDate,
        "RecievedPoints": receivedPoints,
        "Amount": amount,
      };
}

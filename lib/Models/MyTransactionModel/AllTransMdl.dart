// {"respType":"Success","respCode":"CC100","respDesc":"Data Retrived Succesfully","data":"[{\"DocDate\":\"2025-04-03T00:00:00\",\"RecievedPoints\":150,\"Amount\":125.00,\"RedeemedAmount\":-125.00,\"DealerName\":null},{\"DocDate\":\"2025-04-01T00:00:00\",\"RecievedPoints\":12,\"Amount\":900.00,\"RedeemedAmount\":-900.00,\"DealerName\":null},{\"DocDate\":\"2025-04-01T00:00:00\",\"RecievedPoints\":14,\"Amount\":908.00,\"RedeemedAmount\":-908.00,\"DealerName\":null},{\"DocDate\":\"2025-04-01T00:00:00\",\"RecievedPoints\":550,\"Amount\":500.00,\"RedeemedAmount\":-500.00,\"DealerName\":null},{\"DocDate\":\"2025-04-01T00:00:00\",\"RecievedPoints\":400,\"Amount\":350.00,\"RedeemedAmount\":-350.00,\"DealerName\":null},{\"DocDate\":\"2025-03-27T00:00:00\",\"RecievedPoints\":45,\"Amount\":55.00,\"RedeemedAmount\":-55.00,\"DealerName\":null},{\"DocDate\":\"2025-03-25T00:00:00\",\"RecievedPoints\":0,\"Amount\":-220.00,\"RedeemedAmount\":220.00,\"DealerName\":\"PELE Paints\"},{\"DocDate\":\"2025-03-24T00:00:00\",\"RecievedPoints\":0,\"Amount\":-100.00,\"RedeemedAmount\":100.00,\"DealerName\":\"MARADONA Paints\"},{\"DocDate\":\"2025-03-24T00:00:00\",\"RecievedPoints\":500,\"Amount\":550.00,\"RedeemedAmount\":-550.00,\"DealerName\":null}]"}

import 'dart:convert';

class MyTransAmtResponse {
  String respType;
  String respCode;
  String respDesc;
  List<MyTransAmtDataModel> data;
  String? error;
  int? statusCode;

  MyTransAmtResponse({
    required this.respType,
    required this.respCode,
    required this.respDesc,
    required this.data,
    this.error,
    this.statusCode,
  });

  factory MyTransAmtResponse.fromJson(Map<String, dynamic> json, int stscode) {
    if (stscode >= 200 && stscode <= 210) {
      if (json['data'].toString() != 'No data found') {
        var list = jsonDecode(json['data']) as List;
        List<MyTransAmtDataModel> dataList = list
            .map((dynamic item) => MyTransAmtDataModel.fromJson(item))
            .toList();
        return MyTransAmtResponse(
          respType: json["respType"],
          respCode: json["respCode"],
          respDesc: json["respDesc"],
          data: dataList,
          statusCode: stscode,
          error: '',
        );
      } else {
        return MyTransAmtResponse(
          respType: "",
          respCode: "",
          respDesc: "",
          data: [],
          statusCode: stscode,
          error: '',
        );
      }
    } else {
      return MyTransAmtResponse(
        respType: "",
        respCode: "",
        respDesc: "",
        data: [],
        statusCode: stscode,
        error: '',
      );
    }
  }

  factory MyTransAmtResponse.exception(String e, int statuscode) {
    return MyTransAmtResponse(
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
  int recievedPoints;
  double amount;
  double redeemedAmount;
  String? dealerName;

  MyTransAmtDataModel({
    required this.docDate,
    required this.recievedPoints,
    required this.amount,
    required this.redeemedAmount,
    this.dealerName,
  });

  factory MyTransAmtDataModel.fromJson(Map<String, dynamic> json) {
    return MyTransAmtDataModel(
      docDate: json["DocDate"] ?? '',
      recievedPoints: json["RecievedPoints"] ?? 0,
      amount: json["Amount"] ?? 0,
      redeemedAmount: json["RedeemedAmount"] ?? 0,
      dealerName: json["DealerName"] ?? '', // Can be null
    );
  }

  Map<String, dynamic> toJson() => {
        "DocDate": docDate,
        "RecievedPoints": recievedPoints,
        "Amount": amount,
        "RedeemedAmount": redeemedAmount,
        "DealerName": dealerName,
      };
}

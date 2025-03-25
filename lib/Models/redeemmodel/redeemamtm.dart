import 'dart:convert';
import 'dart:developer';

// Category categoryFromJson(String str) => Category.fromJson(json.decode(str));

// String categoryToJson(Category data) => json.encode(data.toJson());

class RedeemamtModel {
  String respType;
  String respCode;
  String respDesc;

  List<RedeemamtDataModel> data;
  String? error;
  int? statusCode;

  RedeemamtModel({
    required this.respType,
    required this.respCode,
    required this.respDesc,
    required this.data,
    required this.error,
    required this.statusCode,
  });

  factory RedeemamtModel.fromJson(Map<String, dynamic> json, int stscode) {
    if (stscode >= 200 && stscode <= 210) {
      if (json['data'].toString() != 'No data found') {
        log('dddddddd');
        var list = jsonDecode(json['data']) as List; //jsonDecode
        List<RedeemamtDataModel> dataList = list
            .map((dynamic enquiries) => RedeemamtDataModel.fromJson(enquiries))
            .toList();
        return RedeemamtModel(
            respType: json["respType"],
            respCode: json["respCode"],
            respDesc: json["respDesc"],
            data: dataList,
            statusCode: stscode,
            error: '');
      } else {
        return RedeemamtModel(
            respType: "",
            respCode: "",
            respDesc: "",
            data: [],
            statusCode: stscode,
            error: '');
      }
    } else {
      return RedeemamtModel(
          respType: "",
          respCode: "",
          respDesc: "",
          data: [],
          statusCode: stscode,
          error: '');
    }
  }
  factory RedeemamtModel.exception(String e, int statuscode) {
    return RedeemamtModel(
        respType: "",
        respCode: "",
        respDesc: "",
        data: [],
        statusCode: statuscode,
        error: '');
  }
  Map<String, dynamic> toJson() => {
        "respType": respType,
        "respCode": respCode,
        "respDesc": respDesc,
        "data": data,
      };
}

class RedeemamtDataModel {
  double? redeemamt;
  RedeemamtDataModel({required this.redeemamt});
  factory RedeemamtDataModel.fromJson(Map<String, dynamic> json) =>
      RedeemamtDataModel(
        redeemamt: json["AmountForRedeem"],
      );
}

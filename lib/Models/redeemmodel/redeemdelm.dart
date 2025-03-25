import 'dart:convert';
import 'dart:developer';

// Category categoryFromJson(String str) => Category.fromJson(json.decode(str));

// String categoryToJson(Category data) => json.encode(data.toJson());

class Redeemdelm {
  String respType;
  String respCode;
  String respDesc;

  List<Redeemdelmdatamodel> data;
  String? error;
  int? statusCode;

  Redeemdelm({
    required this.respType,
    required this.respCode,
    required this.respDesc,
    required this.data,
    required this.error,
    required this.statusCode,
  });

  factory Redeemdelm.fromJson(Map<String, dynamic> json, int stscode) {
    if (stscode >= 200 && stscode <= 210) {
      if (json['data'].toString() != 'No data found') {
        log('dddddddd');
        var list = jsonDecode(json['data']) as List; //jsonDecode
        List<Redeemdelmdatamodel> dataList = list
            .map((dynamic enquiries) => Redeemdelmdatamodel.fromJson(enquiries))
            .toList();
        return Redeemdelm(
            respType: json["respType"],
            respCode: json["respCode"],
            respDesc: json["respDesc"],
            data: dataList,
            statusCode: stscode,
            error: '');
      } else {
        return Redeemdelm(
            respType: "",
            respCode: "",
            respDesc: "",
            data: [],
            statusCode: stscode,
            error: '');
      }
    } else {
      return Redeemdelm(
          respType: "",
          respCode: "",
          respDesc: "",
          data: [],
          statusCode: stscode,
          error: '');
    }
  }
  factory Redeemdelm.exception(String e, int statuscode) {
    return Redeemdelm(
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

class Redeemdelmdatamodel {
  String? dealername;
  Redeemdelmdatamodel({required this.dealername});
  factory Redeemdelmdatamodel.fromJson(Map<String, dynamic> json) =>
      Redeemdelmdatamodel(
        dealername: json["DealerName"],
      );
}

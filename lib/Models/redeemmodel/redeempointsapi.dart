import 'dart:convert';
import 'dart:developer';

// PointsModel pointsModelFromJson(String str) => PointsModel.fromJson(json.decode(str));

// String pointsModelToJson(PointsModel data) => json.encode(data.toJson());

class PointsModel {
  String respType;
  String respCode;
  String respDesc;
  List<PointsDataModel> data;
  String? error;
  int? statusCode;

  PointsModel({
    required this.respType,
    required this.respCode,
    required this.respDesc,
    required this.data,
    required this.error,
    required this.statusCode,
  });

  factory PointsModel.fromJson(Map<String, dynamic> json, int stscode) {
    if (stscode >= 200 && stscode <= 210) {
      if (json['data'].toString() != 'No data found') {
        log('dddddddd');
        var list = jsonDecode(json['data']) as List; //jsonDecode
        List<PointsDataModel> dataList = list
            .map((dynamic enquiries) => PointsDataModel.fromJson(enquiries))
            .toList();
        return PointsModel(
            respType: json["respType"],
            respCode: json["respCode"],
            respDesc: json["respDesc"],
            data: dataList,
            statusCode: stscode,
            error: '');
      } else {
        return PointsModel(
            respType: "",
            respCode: "",
            respDesc: "",
            data: [],
            statusCode: stscode,
            error: '');
      }
    } else {
      return PointsModel(
          respType: "",
          respCode: "",
          respDesc: "",
          data: [],
          statusCode: stscode,
          error: '');
    }
  }
  factory PointsModel.exception(String e, int statuscode) {
    return PointsModel(
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

class PointsDataModel {
  int? points;
  PointsDataModel({required this.points});
  factory PointsDataModel.fromJson(Map<String, dynamic> json) =>
      PointsDataModel(
        points: json["Points"],
      );
}

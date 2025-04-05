import 'dart:convert';
import 'dart:developer';

// GetFindDealerModel GetFindDealerModelFromJson(String str) => GetFindDealerModel.fromJson(json.decode(str));

// String GetFindDealerModelToJson(GetFindDealerModel data) => json.encode(data.toJson());

class GetFindDealerModel {
  String respType;
  String respCode;
  String respDesc;
  List<FindDealerDataModel> data;
  String? error;
  int? statusCode;

  GetFindDealerModel({
    required this.respType,
    required this.respCode,
    required this.respDesc,
    required this.data,
    required this.error,
    required this.statusCode,
  });

  factory GetFindDealerModel.fromJson(Map<String, dynamic> json, int stscode) {
    if (stscode >= 200 && stscode <= 210) {
      if (json['data'].toString() != 'No data found') {
        log('dddddddd');
        var list = jsonDecode(json['data']) as List; //jsonDecode
        List<FindDealerDataModel> dataList = list
            .map((dynamic enquiries) => FindDealerDataModel.fromJson(enquiries))
            .toList();
        return GetFindDealerModel(
            respType: json["respType"],
            respCode: json["respCode"],
            respDesc: json["respDesc"],
            data: dataList,
            statusCode: stscode,
            error: '');
      } else {
        return GetFindDealerModel(
            respType: "",
            respCode: "",
            respDesc: "",
            data: [],
            statusCode: stscode,
            error: '');
      }
    } else {
      return GetFindDealerModel(
          respType: "",
          respCode: "",
          respDesc: "",
          data: [],
          statusCode: stscode,
          error: '');
    }
  }
  factory GetFindDealerModel.exception(String e, int statuscode) {
    return GetFindDealerModel(
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

// "data": "[{\"DealerName\":\"admin\",\"DealerContact\":\"+1 234-567-8901\",\"Latitude\":\"10.7128\",\"Langitude\":\"10.7128\",\"Distance\":176.14694}]"
class FindDealerDataModel {
  String? dealerContact;
  String dealerName;
  String? latitude;
  String? langitude;
  double? distance;
  FindDealerDataModel(
      {required this.dealerName,
      required this.dealerContact,
      required this.distance,
      required this.langitude,
      required this.latitude});
  factory FindDealerDataModel.fromJson(Map<String, dynamic> json) =>
      FindDealerDataModel(
        dealerContact: json["DealerContact"] ?? '',
        distance: json["Distance"] ?? '',
        langitude: json["Langitude"] ?? '',
        latitude: json["Latitude"] ?? '',
        dealerName: json["DealerName"] ?? '',
      );
}

// Category categoryFromJson(String str) => Category.fromJson(json.decode(str));

// String categoryToJson(Category data) => json.encode(data.toJson());
import 'dart:developer';

class GetValidateModel {
  String? respType;
  String? respCode;
  String? respDesc;
  GetValidateData? data;
  // List<GetValidateData> data;
  String? error;
  int? statusCode;

  GetValidateModel({
    this.respType,
    this.respCode,
    this.respDesc,
    this.data,
    this.error,
    this.statusCode,
  });

  factory GetValidateModel.fromJson(Map<String, dynamic> jsons,
      Map<String, dynamic> verifijsons, int stscode) {
    if (jsons != null) {
      log("AANBHHH+$jsons");
      // var list = verifijsons['data'] as List;
      //  List<GetValidateData> dataList =
      //     list.map((data) => GetValidateData.fromJson(data)).toList();
      //  if(list.isEmpty){
      return GetValidateModel(
          // respType: verifijsons["respType"],
          // respCode: verifijsons["respCode"],
          // respDesc: verifijsons["respDesc"],
          data: GetValidateData.fromJson(jsons),
          statusCode: stscode,
          error: '');
      // } else {
      //   return GetValidateModel(
      //       respType: "",
      //       respCode: "",
      //       respDesc: "",
      //       data: [],
      //       statusCode: stscode,
      //       error: '');
      // }
    } else {
      return GetValidateModel(
          respType: "",
          respCode: "",
          respDesc: "",
          data: null,
          statusCode: stscode,
          error: '');
    }
  }
  factory GetValidateModel.exception(String e, int statuscode) {
    return GetValidateModel(
        respType: "",
        respCode: "",
        respDesc: "",
        data: null,
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

class GetValidateData {
  String memberId;
  String memberCode;
  String deviceCode;
  String memberName;

  String memberType;
  String? memberContact;

  GetValidateData({
    required this.memberId,
    required this.memberCode,
    required this.memberName,
    required this.deviceCode,
    required this.memberType,
    this.memberContact,
  });

  // Factory constructor to create model from JSON response
  factory GetValidateData.fromJson(Map<String, dynamic> json) {
    log('jsonjson::$json');
    return GetValidateData(
      memberId: json['MemberId'] ?? '',
      memberName: json[
              'http://schemas.xmlsoap.org/ws/2005/05/identity/claims/nameidentifier'] ??
          '',
      memberCode: json['MemberCode'] ?? "",
      deviceCode: json['DeviceCode'] ?? "",
      memberType: json['MemberType'] ?? "",
      memberContact: json['MemberContact'] ?? "",
    );
  }

  // Exception factory constructor
}

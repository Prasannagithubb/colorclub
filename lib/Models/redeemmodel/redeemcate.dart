import 'dart:convert';
import 'dart:developer';

// Category categoryFromJson(String str) => Category.fromJson(json.decode(str));

// String categoryToJson(Category data) => json.encode(data.toJson());

class Category {
  String respType;
  String respCode;
  String respDesc;

  List<CategoryDataModel> data;
  String? error;
  int? statusCode;

  Category({
    required this.respType,
    required this.respCode,
    required this.respDesc,
    required this.data,
    required this.error,
    required this.statusCode,
  });

  factory Category.fromJson(Map<String, dynamic> json, int stscode) {
    if (stscode >= 200 && stscode <= 210) {
      if (json['data'].toString() != 'No data found') {
        log('dddddddd');
        var list = jsonDecode(json['data']) as List; //jsonDecode
        List<CategoryDataModel> dataList = list
            .map((dynamic enquiries) => CategoryDataModel.fromJson(enquiries))
            .toList();
        return Category(
            respType: json["respType"],
            respCode: json["respCode"],
            respDesc: json["respDesc"],
            data: dataList,
            statusCode: stscode,
            error: '');
      } else {
        return Category(
            respType: "",
            respCode: "",
            respDesc: "",
            data: [],
            statusCode: stscode,
            error: '');
      }
    } else {
      return Category(
          respType: "",
          respCode: "",
          respDesc: "",
          data: [],
          statusCode: stscode,
          error: '');
    }
  }
  factory Category.exception(String e, int statuscode) {
    return Category(
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

class CategoryDataModel {
  String? categorybadge;
  CategoryDataModel({required this.categorybadge});
  factory CategoryDataModel.fromJson(Map<String, dynamic> json) =>
      CategoryDataModel(
        categorybadge: json["Category"],
      );
}

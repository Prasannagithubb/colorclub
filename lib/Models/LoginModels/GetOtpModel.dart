// Category categoryFromJson(String str) => Category.fromJson(json.decode(str));

// String categoryToJson(Category data) => json.encode(data.toJson());

class GetLoginOtpMooel {
  String respType;
  String respCode;
  String respDesc;

  String data;
  String? error;
  int? statusCode;

  GetLoginOtpMooel({
    required this.respType,
    required this.respCode,
    required this.respDesc,
    required this.data,
    required this.error,
    required this.statusCode,
  });

  factory GetLoginOtpMooel.fromJson(Map<String, dynamic> json, int stscode) {
    if (stscode >= 200 && stscode <= 210) {
      if (json['data'].toString() != 'No data found') {
        return GetLoginOtpMooel(
            respType: json["respType"],
            respCode: json["respCode"],
            respDesc: json["respDesc"],
            data: json["data"],
            statusCode: stscode,
            error: '');
      } else {
        return GetLoginOtpMooel(
            respType: "",
            respCode: "",
            respDesc: "",
            data: "",
            statusCode: stscode,
            error: '');
      }
    } else {
      return GetLoginOtpMooel(
          respType: "",
          respCode: "",
          respDesc: "",
          data: "",
          statusCode: stscode,
          error: '');
    }
  }
  factory GetLoginOtpMooel.exception(String e, int statuscode) {
    return GetLoginOtpMooel(
        respType: "",
        respCode: "",
        respDesc: "",
        data: "",
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

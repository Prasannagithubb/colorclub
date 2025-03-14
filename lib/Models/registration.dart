import 'dart:convert';

class MemberResponse {
  List<MemberData>? members;
  String message;
  bool status;
  String? exception;
  int? statusCode;

  MemberResponse({
    required this.members,
    required this.message,
    required this.status,
    this.exception,
    required this.statusCode,
  });

  factory MemberResponse.fromJson(Map<String, dynamic> json, int statusCode) {
    try {
      List<dynamic> dataList =
          jsonDecode(json["data"]); // Decode the "data" field

      List<MemberData> members =
          dataList.map((data) => MemberData.fromJson(data)).toList();

      return MemberResponse(
        members: members,
        message: json["respDesc"] ?? "Success",
        status: json["respType"] == "success",
        statusCode: statusCode,
        exception: null,
      );
    } catch (e) {
      return MemberResponse(
        members: null,
        message: "Parsing Error",
        status: false,
        statusCode: statusCode,
        exception: e.toString(),
      );
    }
  }

  factory MemberResponse.error(String errorMsg, int statusCode) {
    return MemberResponse(
      members: null,
      message: "Exception",
      status: false,
      statusCode: statusCode,
      exception: errorMsg,
    );
  }
}

class MemberData {
  int docEntry;
  String memberCode;
  String memberFirstName;
  String memberLastName;
  String memberNicName;
  String memberLanguage;
  String memberContact;
  String emailId;
  String whatsAppNo;
  String address1;
  String address2;
  String address3;
  String city;
  String state;
  String country;
  String zipcode;
  String memberType;
  String memberStatus;
  String activeSince;
  double rating;
  String badgeLevel;
  String referredBy;
  String? dob;
  String? pwdKey;
  String? lastLogin;
  int? lastOTP;
  String? validTill;
  int pinNumber;
  String deviceName;
  String deviceCode;
  String fcmToken;
  String profilePicURL;
  String updateBy;
  String updatedOn;
  String traceId;

  MemberData({
    required this.docEntry,
    required this.memberCode,
    required this.memberFirstName,
    required this.memberLastName,
    required this.memberNicName,
    required this.memberLanguage,
    required this.memberContact,
    required this.emailId,
    required this.whatsAppNo,
    required this.address1,
    required this.address2,
    required this.address3,
    required this.city,
    required this.state,
    required this.country,
    required this.zipcode,
    required this.memberType,
    required this.memberStatus,
    required this.activeSince,
    required this.rating,
    required this.badgeLevel,
    required this.referredBy,
    required this.dob,
    this.pwdKey,
    this.lastLogin,
    this.lastOTP,
    required this.validTill,
    required this.pinNumber,
    required this.deviceName,
    required this.deviceCode,
    required this.fcmToken,
    required this.profilePicURL,
    required this.updateBy,
    required this.updatedOn,
    required this.traceId,
  });

  factory MemberData.fromJson(Map<String, dynamic> json) {
    return MemberData(
      docEntry: json["docEntry"] ?? 0,
      memberCode: json["memberCode"] ?? "",
      memberFirstName: json["memberFirstName"] ?? "",
      memberLastName: json["memberLastName"] ?? "",
      memberNicName: json["memberNicName"] ?? "",
      memberLanguage: json["memberLanguage"] ?? "",
      memberContact: json["memberContact"] ?? "",
      emailId: json["emailId"] ?? "",
      whatsAppNo: json["whatsAppNo"] ?? "",
      address1: json["address1"] ?? "",
      address2: json["address2"] ?? "",
      address3: json["address3"] ?? "",
      city: json["city"] ?? "",
      state: json["state"] ?? "",
      country: json["country"] ?? "",
      zipcode: json["zipcode"] ?? "",
      memberType: json["memberType"] ?? "",
      memberStatus: json["memberStatus"] ?? "",
      activeSince: json["activeSince"] ?? "",
      rating: (json["rating"] ?? 0).toDouble(),
      badgeLevel: json["badgeLevel"] ?? "",
      referredBy: json["referredBy"] ?? "",
      dob: json["dob"] ?? "",
      pwdKey: json["pwdKey"],
      lastLogin: json["lastLogin"] ?? "",
      lastOTP: json["lastOTP"],
      validTill: json["validTill"] ?? "",
      pinNumber: json["pinNumber"] ?? 0,
      deviceName: json["deviceName"] ?? "",
      deviceCode: json["deviceCode"] ?? "",
      fcmToken: json["fcmToken"] ?? "",
      profilePicURL: json["profilePicURL"] ?? "",
      updateBy: json["updateBy"] ?? "",
      updatedOn: json['updatedOn'] ?? "",
      traceId: json["traceId"] ?? "",
    );
  }

  Map<String, dynamic> tojson() {
    Map<String, dynamic> map = {
      "docEntry": docEntry,
      "memberCode": memberCode,
      "memberFirstName": memberFirstName,
      "memberLastName": memberLastName,
      "memberNicName": memberNicName,
      "memberLanguage": memberLanguage,
      "memberContact": memberContact,
      "emailId": emailId,
      "whatsAppNo": whatsAppNo,
      "address1": address1,
      "address2": address2,
      "address3": address3,
      "city": city,
      "state": "TN",
      "country": "IN",
      "zipcode": zipcode,
      "memberType": "1",
      "memberStatus": memberStatus,
      "activeSince": activeSince,
      "rating": rating,
      "badgeLevel": badgeLevel,
      "referredBy": referredBy,
      "dob": dob,
      "pwdKey": "securepwd123",
      "lastLogin": lastLogin,
      "lastOTP": lastOTP,
      "validTill": validTill,
      "pinNumber": pinNumber,
      "deviceName": deviceName,
      "deviceCode": deviceCode,
      "fcmToken": fcmToken,
      "profilePicURL": profilePicURL,
      "updateBy": updateBy,
      "updatedOn": updatedOn,
      "traceId": "3fa85f64-5717-4562-b3fc-2c963f66afa6"
    };
    return map;
  }
}

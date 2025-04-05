import 'dart:convert';
import 'dart:developer';

// Category categoryFromJson(String str) => Category.fromJson(json.decode(str));

// String categoryToJson(Category data) => json.encode(data.toJson());

class GetMyDealerMdl {
  String respType;
  String respCode;
  String respDesc;

  List<GetMyDealerMdlData> data;
  String? error;
  int? statusCode;

  GetMyDealerMdl({
    required this.respType,
    required this.respCode,
    required this.respDesc,
    required this.data,
    required this.error,
    required this.statusCode,
  });

  factory GetMyDealerMdl.fromJson(Map<String, dynamic> json, int stscode) {
    if (stscode >= 200 && stscode <= 210) {
      if (json['data'].toString() != 'No data found') {
        log('dddddddd');
        var list = jsonDecode(json['data']) as List; //jsonDecode
        List<GetMyDealerMdlData> dataList = list
            .map((dynamic enquiries) => GetMyDealerMdlData.fromJson(enquiries))
            .toList();
        return GetMyDealerMdl(
            respType: json["respType"],
            respCode: json["respCode"],
            respDesc: json["respDesc"],
            data: dataList,
            statusCode: stscode,
            error: '');
      } else {
        return GetMyDealerMdl(
            respType: "",
            respCode: "",
            respDesc: "",
            data: [],
            statusCode: stscode,
            error: '');
      }
    } else {
      return GetMyDealerMdl(
          respType: "",
          respCode: "",
          respDesc: "",
          data: [],
          statusCode: stscode,
          error: '');
    }
  }
  factory GetMyDealerMdl.exception(String e, int statuscode) {
    return GetMyDealerMdl(
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

class GetMyDealerMdlData {
  String distance;

  String dealername;
  String dealercode;
  String dealercontactpersonname;
  String dealercontact;
  String dealeremail;
  String dealercurrency;
  String dealerwhatsappno;
  String address1;
  String address2;
  String address3;
  String city;
  String state;
  String country;
  int zipcode;
  String geolatlang;

// {\"DealerName\":\"PELE Paints\",\"DealerCode\":\"2EB9BA2\",\"DealerContactPersonName\":\"PELE\",\"DealerContact\":\"+1 234-567-8901\",\"DealerEmail\":\"pele@pelepaints.com\",\"DealerCurrency\":\"USD\",\"DealerWhatsAppNo\":\"+1 234-567-8901\",
//\"Address1\":\"123 Main Street\",\"Address2\":\"Suite 456\",\"Address3\":\"Near City Mall\",\"City\":\"New York\",\"State\":\"TN\",\"Country\":\"IN\",\"ZipCode\":10001,\"GeoLatLang\":\"20.7128,-4.0060\"}

  GetMyDealerMdlData({
    required this.distance,
    required this.dealername,
    required this.dealercode,
    required this.dealercontactpersonname,
    required this.dealercontact,
    required this.dealeremail,
    required this.dealercurrency,
    required this.dealerwhatsappno,
    required this.address1,
    required this.address2,
    required this.address3,
    required this.city,
    required this.state,
    required this.country,
    required this.zipcode,
    required this.geolatlang,
  });
  factory GetMyDealerMdlData.fromJson(Map<String, dynamic> json) =>
      GetMyDealerMdlData(
        distance: json["Distance"] ?? '0',
        dealername: json["DealerName"] ?? '',
        dealercode: json["DealerCode"] ?? '',
        dealercontactpersonname: json["DealerContactPersonName"] ?? '',
        dealercontact: json["DealerContact"] ?? '',
        dealeremail: json["DealerEmail"] ?? '',
        dealercurrency: json["DealerCurrency"] ?? '',
        dealerwhatsappno: json["DealerWhatsAppNo"] ?? '',
        address1: json["Address1"] ?? '',
        address2: json["Address2"] ?? '',
        address3: json["Address3"] ?? '',
        city: json["City"] ?? '',
        state: json["State"] ?? '',
        country: json["Country"] ?? '',
        zipcode: json["ZipCode"] ?? 0,
        geolatlang: json["GeoLatLang"] ?? '',
      );
}

import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'Screen.dart';

class Configure {
  void showDialogBox(String title, String msg, BuildContext context) {
    showDialog<dynamic>(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            final theme = Theme.of(context);
            return AlertDialog(
              insetPadding: EdgeInsets.all(0),
              title: Container(
                height: Screens.padingHeight(context) * 0.05,
                alignment: Alignment.center,
                color: theme.primaryColor,
                child: Center(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        width: Screens.width(context) * 0.45,
                        child: Text(
                          title,
                          style: theme.textTheme.titleMedium
                              ?.copyWith(color: Colors.white),
                        ),
                      ),
                      IconButton(
                          onPressed: () {
                            Get.back();
                          },
                          icon: Icon(Icons.close_outlined, color: Colors.white))
                    ],
                  ),
                ),
              ),
              content: Container(
                width: Screens.width(context) * 0.45,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      msg,
                      style: theme.textTheme.bodyLarge?.copyWith(),
                    ),
                    SizedBox(
                      height: Screens.bodyheight(context) * 0.02,
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  Map<String, dynamic> parseJwt(String token) {
    log("String token::$token");

    final parts = token.split('.');
    log('partsparts:$parts');
    if (parts.length != 3) {
      throw Exception('invalid token');
    }

    final payload = decodeBase64(parts[1]);
    // log("payload"+payload.toString());
    final payloadMap = json.decode(payload);
    log("payloadMap$payloadMap");
    if (payloadMap is! Map<String, dynamic>) {
      throw Exception('invalid payload');
    }

    return payloadMap;
  }

  String decodeBase64(String str) {
    //'-', '+' 62nd char of encoding,  '_', '/' 63rd char of encoding
    String output = str.replaceAll('-', '+').replaceAll('_', '/');
    switch (output.length % 4) {
      // Pad with trailing '='
      case 0: // No pad chars in this case
        break;
      case 2: // Two pad chars
        output += '==';
        break;
      case 3: // One pad char
        output += '=';
        break;
      default:
        throw Exception('Illegal base64url string!"');
    }

    return utf8.decode(base64Url.decode(output));
  }

  Future<bool> haveInterNet() async {
    final result = await Connectivity().checkConnectivity();
    final hasInternet = result != ConnectivityResult.none;
    return hasInternet;
  }

  String alignDate(String date) {
    // log("message" + date);
    if (date == 'null' || date.isEmpty) {
      return '';
    }
    var dates = DateTime.parse(date);
    // print(
    //     "${dates.day.toString().padLeft(2, '0')}-${dates.month.toString().padLeft(2, '0')}-${dates.year}");
    return "${dates.day.toString().padLeft(2, '0')}-${dates.month.toString().padLeft(2, '0')}-${dates.year}";
  }

  String aligntimeDate(String date) {
    var dates = DateTime.parse(date);

    String currentDateTime =
        "${dates.day.toString()}-${dates.month.toString().padLeft(2, '0')}-${dates.year.toString().padLeft(2, '0')} ${dates.hour.toString().padLeft(2, '0')}:${dates.minute.toString().padLeft(2, '0')}:${dates.second.toString().padLeft(2, '0')}";
    return currentDateTime;
  }

  String aligntimeDate2(String date) {
    var dates = DateTime.parse(date);

    String currentDateTime =
        "${dates.day.toString()}-${dates.month.toString().padLeft(2, '0')}-${dates.year.toString().padLeft(2, '0')} ${dates.hour.toString().padLeft(2, '0')}:${dates.minute.toString().padLeft(2, '0')}:${dates.second.toString().padLeft(2, '0')}";
    return currentDateTime;
  }

  String aligndateforsiteout(String date) {
    String inputDateString = date;
    DateTime inputDate = DateFormat("dd-MM-yyyy").parse(inputDateString);

    String formattedDate =
        DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'").format(inputDate);
    log("formattedDate:::$formattedDate");
    return formattedDate;
  }

  String alignDate1(String date) {
    var inputFormat = DateFormat('dd-MM-yyyy');
    var date1 = inputFormat.parse(date);
    // log("------------------------------------------------------------------------------------------------");
    var dates = DateTime.parse(date1.toString());
    return "${dates.year}-${dates.month.toString().padLeft(2, '0')}-${dates.day.toString().padLeft(2, '0')}";
    // return date1.toString();
  }

  String alignDateT(String date) {
    var dates = DateTime.parse(date);
    return "${dates.day.toString().padLeft(2, '0')}-${dates.month.toString().padLeft(2, '0')}-${dates.year}";
    // } else {
    //   return '';
    // }
  }

  Future<String?> getdeviceId() async {
    var deviceInfo = DeviceInfoPlugin();
    if (Platform.isIOS) {
      // import 'dart:io'

      var iosDeviceInfo = await deviceInfo.iosInfo;
      return iosDeviceInfo.identifierForVendor; // unique ID on iOS
    } else if (Platform.isAndroid) {
      var androidDeviceInfo = await deviceInfo.androidInfo;
      return androidDeviceInfo.id; // unique ID on Android
    }
    return null;
  }

  String alignDate2(String date) {
    var inputFormat = DateFormat('dd-MM-yyyy');
    var date1 = inputFormat.parse(date);
    var dates = DateTime.parse(date1.toString());
    return "${dates.year}-${dates.month.toString().padLeft(2, '0')}-${dates.day.toString().padLeft(2, '0')}";

    // return date1.toString();
  }

  String currentDate() {
    DateTime now = DateTime.now();
    String currentDateTime =
        "${now.year.toString()}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')} ${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}:${now.second.toString().padLeft(2, '0')}";
    return currentDateTime;
  }

  String currentDate2() {
    DateTime now = DateTime.now();
    String currentDateTime =
        "${now.year.toString()}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')}";
    return currentDateTime;
  }

  String slpitCurrency2(String value) {
    double values = double.parse(value);
    var format = NumberFormat.currency(
      name: "INR", locale: 'en_IN',
      decimalDigits: 2, // change it to get decimal places
      symbol: '',
    );
    String formattedCurrency = format.format(values);
    //  double formattedvalue =  double.parse(formattedCurrency);
    return formattedCurrency;
  }

  String splitValues(String val) {
    // print("vvvvv: "+val);
    var formatter = NumberFormat('###,000.00');
    double formatNO = double.parse(val);
    // print("formatedd: "+formatter.format(formatNO));
    String retunVal = formatter.format(formatNO).toString();
    return retunVal;
  }

  void showDialogSucessB(String msg, String title) {
    Get.defaultDialog<void>(
        title: title,
        content: Column(
          children: [
            Text(msg),
          ],
        )).then((value) {
      Get.back<void>();
    });
  }

  Future<void> showDialogg(String msg, String title) async {
    Get.defaultDialog<void>(
        title: title,
        content: Column(
          children: [
            Text(msg),
          ],
        ));
  }
}

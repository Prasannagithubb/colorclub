import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:new_one/Constant/AppConstant.dart';
import 'package:new_one/Constant/Screen.dart';
import 'package:new_one/Models/FindDealerModel.dart';
import 'package:new_one/Service/GetFindDealer.dart';
import 'package:permission_handler/permission_handler.dart';

class FindDealerController extends ChangeNotifier {
  init(BuildContext context) {
    clearAllData();
    requestLocationPermission(context);

    notifyListeners();
  }

  clearAllData() {
    findDealerData = [];
    closeonclick = false;
    distanceController.text = '';
    notifyListeners();
  }

  String latitude = '';
  String longitude = '';
  static const MethodChannel _channel =
      MethodChannel('com.buson.posinsignia/location');

  getLocation(BuildContext context) async {
    latitude = '';
    longitude = '';
    Position? position = await checkAndEnableLocation(context);
    if (position != null) {
      latitude = '${position.latitude}';
      longitude = '${position.longitude}';
      await callFindDealerApi();

      log("Sales order Latitude: $latitude, Longitude: $longitude");
      notifyListeners();
    } else {
      print("Location services are disabled or not available.");
    }
    notifyListeners();
  }

  Future<Position?> checkAndEnableLocation(BuildContext context) async {
    try {
      final bool isEnabled = await _channel.invokeMethod('isLocationEnabled');
      if (!isEnabled) {
        checkAndPromptLocationService(context);
        notifyListeners();

        return null;
      }
      notifyListeners();

      return await getCurrentLatPosition();
    } on PlatformException catch (e) {
      log("Failed to check or enable location: '${e.message}'.");
      return null;
    }
  }

  static Future<Position> getCurrentLatPosition() async {
    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }

  requestLocationPermission(BuildContext context) async {
    var status = await Permission.location.request();
    if (status.isDenied) {
      checkAndPromptLocationService(context);
    } else if (status.isPermanentlyDenied) {
      checkAndPromptLocationService(context);
    } else {
      getLocation(context);
    }
  }

  void checkAndPromptLocationService(BuildContext context) async {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text('Enable location on your device '),
                SizedBox(
                  height: Screens.padingHeight(context) * 0.02,
                ),
                Container(
                  alignment: Alignment.center,
                  child: ElevatedButton(
                      onPressed: () async {
                        Navigator.pop(context);
                        await promptEnableLocation();
                        requestLocationPermission(context);
                      },
                      child: const Text('  OK  ')),
                )
              ],
            ),
          );
        });
    notifyListeners();
  }

  Future<void> promptEnableLocation() async {
    try {
      await _channel.invokeMethod('openLocationSettings');
    } on PlatformException catch (e) {
      log("Failed to open location settings: '${e.message}'.");
    }
  }

  List<FindDealerDataModel> findDealerData = [];
  List<FindDealerDataModel> searhfindDeaelerData = [];

  callFindDealerApi() async {
    findDealerData = [];
    searhfindDeaelerData = [];
    await GetFindDealerApi.getData(latitude, " $longitude", '2000')
        .then((value) {
      if (value.statusCode! >= 200 && value.statusCode! <= 210) {
        findDealerData = value.data;

        findDealerData.add(FindDealerDataModel(
            dealerName: AppConstant.userName,
            dealerContact: AppConstant.userContact,
            distance: 0.0,
            langitude: longitude,
            latitude: latitude));
        log("findDealerData::${findDealerData.length}:::${AppConstant.userName}");

        for (var i = 0; i < findDealerData.length; i++) {
          if (findDealerData[i].dealerName != AppConstant.userName) {
            searhfindDeaelerData.add(FindDealerDataModel(
                dealerName: findDealerData[i].dealerName,
                dealerContact: findDealerData[i].dealerContact,
                distance: findDealerData[i].distance,
                langitude: findDealerData[i].langitude,
                latitude: findDealerData[i].latitude));
          }
        }
        log("find dealer length${findDealerData.length}");

        notifyListeners();
      } else if (value.statusCode! >= 400 && value.statusCode! <= 410) {
        notifyListeners();
      } else {}
    });
    notifyListeners();
  }

  setstate1() {
    notifyListeners();
  }

  List<Map<String, dynamic>> dealers = [
    {
      "name": "userlocation",
      "location": "Dar es Salaam",
      "phone": "+255 654 123 456",
      "rating": 4.7,
      "latitude": -3.3635,
      "longitude": 36.6336
    },
    //   {
    //     "name": "Tanzania Paints Ltd",
    //     "location": "Dar es Salaam",
    //     "phone": "+255 654 123 456",
    //     "rating": 4.7,
    //     "latitude": -3.3635,
    //     "longitude": 36.6338
    //   },
    //   {
    //     "name": "Arusha Color House",
    //     "location": "Arusha",
    //     "phone": "+255 767 234 567",
    //     "rating": 4.5,
    //     "latitude": -3.3629,
    //     "longitude": 36.6352
    //   },
    //   {
    //     "name": "Mwanza Paint Mart",
    //     "location": "Mwanza",
    //     "phone": "+255 768 345 678",
    //     "rating": 4.6,
    //     "latitude": -3.3642,
    //     "longitude": 36.6325
    //   },
    //   {
    //     "name": "Dodoma Paint Supplies",
    //     "location": "Dodoma",
    //     "phone": "+255 765 456 789",
    //     "rating": 4.4,
    //     "latitude": -3.3651,
    //     "longitude": 36.6341
    //   },
    //   {
    //     "name": "Shinyanga Paint Depot",
    //     "location": "Shinyanga",
    //     "phone": "+255 754 567 890",
    //     "rating": 4.3,
    //     "latitude": -3.3618,
    //     "longitude": 36.6319
    //   },
    //   {
    //     "name": "Mbeya Coatings",
    //     "location": "Mbeya",
    //     "phone": "+255 759 678 901",
    //     "rating": 4.5,
    //     "latitude": -3.3609,
    //     "longitude": 36.6358
    //   },
    //   {
    //     "name": "Morogoro Paint Center",
    //     "location": "Morogoro",
    //     "phone": "+255 765 789 012",
    //     "rating": 4.6,
    //     "latitude": -3.3645,
    //     "longitude": 36.6360
    //   },
    //   {
    //     "name": "Tanga Paint Suppliers",
    //     "location": "Tanga",
    //     "phone": "+255 768 890 123",
    //     "rating": 4.2,
    //     "latitude": -3.3623,
    //     "longitude": 36.6307
    //   },
    //   {
    //     "name": "Kigoma Color World",
    //     "location": "Kigoma",
    //     "phone": "+255 762 901 234",
    //     "rating": 4.3,
    //     "latitude": -3.3662,
    //     "longitude": 36.6332
    //   },
    //   {
    //     "name": "Tabora Paint Solutions",
    //     "location": "Tabora",
    //     "phone": "+255 765 012 345",
    //     "rating": 4.4,
    //     "latitude": -3.3612,
    //     "longitude": 36.6328
    //   },
    //   {
    //     "name": "Songea Paint Masters",
    //     "location": "Songea",
    //     "phone": "+255 754 123 678",
    //     "rating": 4.5,
    //     "latitude": -3.3635,
    //     "longitude": 36.6338
    //   },
    //   {
    //     "name": "Mtwara Paints & Colors",
    //     "location": "Mtwara",
    //     "phone": "+255 765 234 789",
    //     "rating": 4.2,
    //     "latitude": -3.3629,
    //     "longitude": 36.6352
    //   },
    //   {
    //     "name": "Iringa Paint Experts",
    //     "location": "Iringa",
    //     "phone": "+255 768 345 890",
    //     "rating": 4.6,
    //     "latitude": -7.770070,
    //     "longitude": 35.692747
    //   },
    //   {
    //     "name": "Lindi Paint Shop",
    //     "location": "Lindi",
    //     "phone": "+255 762 456 901",
    //     "rating": 4.3,
    //     "latitude": -3.3642,
    //     "longitude": 36.6325
    //   },
    //   {
    //     "name": "Zanzibar Paints & Supplies",
    //     "location": "Zanzibar",
    //     "phone": "+255 759 567 012",
    //     "rating": 4.7,
    //     "latitude": -3.3651,
    //     "longitude": 36.6341
    //   },
    //   {
    //     "name": "Bukoba Color Hub",
    //     "location": "Bukoba",
    //     "phone": "+255 765 678 123",
    //     "rating": 4.4,
    //     "latitude": -3.3618,
    //     "longitude": 31.812880
    //   },
    //   {
    //     "name": "Musoma Paint Experts",
    //     "location": "Musoma",
    //     "phone": "+255 768 789 234",
    //     "rating": 4.5,
    //     "latitude": -1.500591,
    //     "longitude": 33.797297
    //   },
    //   {
    //     "name": "Moshi Paint Masters",
    //     "location": "Moshi",
    //     "phone": "+255 762 890 345",
    //     "rating": 4.3,
    //     "latitude": -3.333333,
    //     "longitude": 37.333333
    //   },
    //   {
    //     "name": "Singida Paint Depot",
    //     "location": "Singida",
    //     "phone": "+255 759 901 456",
    //     "rating": 4.2,
    //     "latitude": -4.816284,
    //     "longitude": 34.743593
    //   },
    //   {
    //     "name": "Njombe Paint House",
    //     "location": "Njombe",
    //     "phone": "+255 765 012 567",
    //     "rating": 4.6,
    //     "latitude": -9.331792,
    //     "longitude": 34.774379
    //   }
  ];

  String searchQuery = "";
  final ScrollController scrollController = ScrollController();
  final TextEditingController distanceController = TextEditingController();
  // Map<String, dynamic>? dealerx;
  // int? index;
  bool closeonclick = false;
}

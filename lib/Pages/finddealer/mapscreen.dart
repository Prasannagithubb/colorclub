import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:new_one/Constant/AppConstant.dart';
import 'package:new_one/Models/FindDealerModel.dart';

class MapScreen extends StatefulWidget {
  // final Map<String, dynamic> dealer;
  // final List<Map<String, dynamic>> allDealers;
  FindDealerDataModel dealer;
  List<FindDealerDataModel> allDealers;

  final bool onclicklist;

  MapScreen({
    required this.dealer,
    required this.allDealers,
    required this.onclicklist,
  });

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  FindDealerDataModel? selectedDealer;

  @override
  void initState() {
    super.initState();
    selectedDealer = widget.dealer; // Start with selected dealer
  }

  @override
  Widget build(BuildContext context) {
    List<FindDealerDataModel> selectedMarkers = widget.onclicklist
        ? widget.allDealers.toList()
        : widget.allDealers.toList();

    if (!selectedMarkers.contains(selectedDealer)) {
      selectedMarkers.add(selectedDealer!);
    }

    Set<Marker> markers = selectedMarkers.map((d) {
      log("userlocation:::${d.dealerName}");
      log('step2');
      bool isUserLocation = d.dealerName.toString().toLowerCase() ==
          AppConstant.userName.toString().toLowerCase();

      bool isSelectedDealer = d.dealerName.toString().toLowerCase() ==
          selectedDealer!.dealerName.toString().toLowerCase();

      return Marker(
        markerId: MarkerId(d.dealerName),
        position: LatLng(double.parse(d.latitude!), double.parse(d.langitude!)),
        infoWindow: InfoWindow(title: d.dealerName, snippet: d.dealerContact),
        icon: isUserLocation
            ? BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue) //
            : isSelectedDealer
                ? BitmapDescriptor.defaultMarkerWithHue(
                    BitmapDescriptor.hueOrange)
                : BitmapDescriptor.defaultMarkerWithHue(
                    BitmapDescriptor.hueRed),
        onTap: () {
          log("Marker Clicked: ${d.dealerName}");
          AppConstant.userName;
          setState(() {
            selectedDealer = d;
          });
        },
      );
    }).toSet();

    return Scaffold(
      appBar: AppBar(title: Text(selectedDealer!.dealerName)),
      body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: CameraPosition(
              target: LatLng(double.parse(selectedDealer!.latitude!),
                  double.parse(selectedDealer!.langitude!)),
              zoom: 16.0,
            ),
            markers: markers,
            mapType: MapType.normal,
          ),
          DraggableScrollableSheet(
            initialChildSize: 0.2,
            minChildSize: 0.1,
            maxChildSize: 0.4,
            builder: (context, scrollController) {
              return Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                padding: const EdgeInsets.all(16),
                child: ListView(
                  controller: scrollController,
                  children: [
                    Center(
                      child: Container(
                        width: 50,
                        height: 5,
                        decoration: BoxDecoration(
                          color: Colors.grey[400],
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          selectedDealer!.dealerName,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          '${selectedDealer!.distance.toString()} km',
                          style: const TextStyle(
                              fontSize: 18,
                              color: Color.fromARGB(255, 226, 0, 0)),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Icon(Icons.location_on, color: Colors.red),
                        const SizedBox(width: 5),
                        Text(
                          selectedDealer!.dealerName,
                          style: const TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Icon(Icons.phone, color: Colors.green),
                        const SizedBox(width: 5),
                        Text(
                          selectedDealer!.dealerContact!,
                          style: const TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Icon(Icons.star, color: Colors.orange),
                        const SizedBox(width: 5),
                        Text(
                          "${selectedDealer!.distance} ★",
                          style: const TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

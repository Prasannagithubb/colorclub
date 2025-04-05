import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:new_one/Models/FindDealerModel.dart';

class DealerMapScreen extends StatefulWidget {
  List<FindDealerDataModel> allDealers;
  final Map<String, dynamic> userLocation;

  DealerMapScreen({
    required this.allDealers,
    required this.userLocation,
  });

  @override
  State<DealerMapScreen> createState() => _DealerMapScreenState();
}

class _DealerMapScreenState extends State<DealerMapScreen> {
  FindDealerDataModel? selectedDealer; // Default Green Marker

  @override
  void initState() {
    super.initState();

    if (widget.allDealers.isNotEmpty) {
      selectedDealer =
          widget.allDealers.first; // Default: First dealer is Green
    }
  }

  @override
  Widget build(BuildContext context) {
    Set<Marker> markers = widget.allDealers.map((d) {
      bool isUserLocation =
          d.dealerName.toString().toLowerCase() == "userlocation";
      bool isSelectedDealer = d.dealerName == selectedDealer!.dealerName;

      return Marker(
        markerId: MarkerId(d.dealerName),
        position: LatLng(double.parse(d.latitude!), double.parse(d.langitude!)),
        infoWindow: InfoWindow(title: d.dealerName, snippet: d.dealerContact),
        icon: isUserLocation
            ? BitmapDescriptor.defaultMarkerWithHue(
                BitmapDescriptor.hueBlue) // User 🔵
            : isSelectedDealer
                ? BitmapDescriptor.defaultMarkerWithHue(
                    BitmapDescriptor.hueGreen) // Default Dealer 🟢
                : BitmapDescriptor.defaultMarkerWithHue(
                    BitmapDescriptor.hueRed), // Others 🔴
        onTap: () {
          log("Marker Clicked: ${d.dealerName}");
          setState(() {
            selectedDealer = d; // Change Green Marker on Tap
          });
        },
      );
    }).toSet();

    return Scaffold(
      appBar: AppBar(title: Text("Dealers Map")),
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
                        color: Colors.black26, blurRadius: 10, spreadRadius: 2),
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
                              fontSize: 20, fontWeight: FontWeight.bold),
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
                        Text(selectedDealer!.dealerContact!,
                            style: const TextStyle(fontSize: 18)),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Icon(Icons.phone, color: Colors.green),
                        const SizedBox(width: 5),
                        Text(selectedDealer!.dealerContact!,
                            style: const TextStyle(fontSize: 18)),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Icon(Icons.star, color: Colors.orange),
                        const SizedBox(width: 5),
                        Text("${selectedDealer!.distance} ★",
                            style: const TextStyle(fontSize: 16)),
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

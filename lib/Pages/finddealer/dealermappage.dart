import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:google_maps_flutter/google_maps_flutter.dart';

class DealersMapScreen extends StatefulWidget {
  final List<Map<String, dynamic>> dealers;
  final Map<String, dynamic> selectedDealer; // Ensure this is defined
  final LatLng initialPosition; // Ensure this is defined

  const DealersMapScreen({
    required this.dealers,
    required this.selectedDealer, // Fix: Ensure this is included
    required this.initialPosition, // Fix: Ensure this is included
  });

  @override
  _DealersMapScreenState createState() => _DealersMapScreenState();
}

class _DealersMapScreenState extends State<DealersMapScreen> {
  late GoogleMapController mapController;
  Set<Marker> _markers = {};
  late String _mapStyle;
  LatLng? _selectedMarker;

  @override
  void initState() {
    super.initState();
    _loadMapStyle();
    _loadMarkers();
  }

  /// Load custom Google Maps style from assets
  Future<void> _loadMapStyle() async {
    _mapStyle = await rootBundle.loadString("assets/map_style.json");
  }

  /// Load multiple markers and handle selection
  void _loadMarkers() {
    setState(() {
      _markers = widget.dealers.map((dealer) {
        final LatLng position = LatLng(dealer["latitude"], dealer["longitude"]);
        bool isSelected = _selectedMarker == position;

        return Marker(
          markerId: MarkerId(dealer["name"]),
          position: position,
          icon: BitmapDescriptor.defaultMarkerWithHue(
            isSelected ? BitmapDescriptor.hueAzure : BitmapDescriptor.hueRed,
          ),
          infoWindow:
              InfoWindow(title: dealer["name"], snippet: dealer["location"]),
          onTap: () {
            setState(() {
              _selectedMarker = position;
              _loadMarkers(); // Refresh markers to update size
            });
          },
        );
      }).toSet();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Dealer Locations")),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: widget.initialPosition,
          zoom: 12.0,
        ),
        onMapCreated: (GoogleMapController controller) {
          setState(() {
            mapController = controller;
            mapController.setMapStyle(_mapStyle);
          });
        },
        markers: _markers,
      ),
    );
  }
}

import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:new_one/Pages/homescreen/scanpoints.dart';

class QRpage extends StatefulWidget {
  const QRpage({super.key});

  @override
  State<QRpage> createState() => _QRpageState();
}

class _QRpageState extends State<QRpage> {
  String _qrCode = "Scan a QR code"; // Default message before scanning
  bool _hasScanned = false; // Prevent multiple detections
  final MobileScannerController _scannerController =
      MobileScannerController(); // QR scanner controller

  // API call to fetch scan points
  Future<int> _fetchScanPoints(String scannedCode) async {
    const String apiUrl =
        "http://dev.sellerkit.in:5468/api/Coupon/v1/GetCoupon?couponcode=";

    try {
      final response = await http.get(
        Uri.parse("$apiUrl$scannedCode"),
        headers: {"Accept": "application/json"},
      );

      log("Fetching scan points for QR: $scannedCode");

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonResponse = jsonDecode(response.body);
        int points =
            jsonResponse['points'] ?? 0; // Assuming API returns 'points' key
        log("Received scan points: $points");
        return points;
      } else {
        log("Failed to fetch points, status: ${response.statusCode}");
        return 0;
      }
    } catch (e) {
      log("Error fetching scan points: $e");
      return 0;
    }
  }

  // When QR code is scanned
  void _onScan(BarcodeCapture barcode) async {
    if (_hasScanned) return; // Stop multiple detections

    final String? scannedValue =
        barcode.barcodes.first.rawValue; // Get QR code value

    if (scannedValue != null) {
      setState(() {
        _qrCode = scannedValue;
        _hasScanned = true;
      });

      _scannerController.stop(); // Stop scanning

      log('Scanned QR Code: $_qrCode');

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Scanned QR Code: $_qrCode')),
      );

      // Fetch scan points from API
      int points = await _fetchScanPoints(_qrCode);

      // Navigate to Scanpoints page with the retrieved points
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => Scanpoints(points: points),
        ),
      );
    } else {
      log("No QR Code detected");
    }
  }

  @override
  void dispose() {
    _scannerController.dispose(); // Dispose the scanner properly
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('QR Code Scanner')),
      body: Center(
        child: MobileScanner(
          controller: _scannerController,
          onDetect: _onScan,
        ),
      ),
    );
  }
}

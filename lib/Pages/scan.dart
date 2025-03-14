// import 'dart:developer';

// import 'package:flutter/material.dart';
// import 'package:mobile_scanner/mobile_scanner.dart';
// import 'package:new_one/Pages/homescreen/scanpoints.dart';

// class QRpage extends StatefulWidget {
//   @override
//   State<QRpage> createState() => _QRpageState();
// }

// class _QRpageState extends State<QRpage> {
//   String _qrCode = "Scan a QR code"; // Default message before scanning
//   bool _hasScanned = false; // Prevent multiple detections
//   final MobileScannerController _scannerController =
//       MobileScannerController(); // Default message before scanning

//   // This function is called when a QR code is scanned
//   void _onScan(BarcodeCapture barcode) {
//     if (_hasScanned) return; // Stop multiple detections

//     final String? scannedValue =
//         barcode.barcodes.first.rawValue; // Get QR code value

//     if (scannedValue != null) {
//       setState(() {
//         _qrCode = scannedValue;
//         _hasScanned = true;
//       });

//       _scannerController.stop(); // Stop scanning

//       log('Scanned QR Code: $_qrCode');

//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Scanned QR Code: $_qrCode')),
//       );

//       // Delay and navigate
//       Future.delayed(const Duration(seconds: 1), () {
//         if (mounted) {
//           Navigator.pushReplacement(
//             context,
//             MaterialPageRoute(builder: (context) => const  Scanpoints(points: points),),
//           );
//         }
//       });
//     } else {
//       log("No QR Code detected");
//     }
//   }

//   @override
//   void dispose() {
//     _scannerController.dispose(); // Dispose the scanner properly
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('QR Code Scanner'),
//       ),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(20.0),
//             child: Container(
//               height: 400, // Adjust height as needed
//               width: 400, // Adjust width as needed
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(
//                     70), // Rounded corners for the scanner
//                 border: Border.all(
//                   color:
//                       const Color.fromARGB(255, 209, 208, 208), // Border color
//                   width: 3, // Border width
//                 ),
//               ),
//               child: ClipRRect(
//                 borderRadius: BorderRadius.circular(70),
//                 child: MobileScanner(
//                   onDetect: (barcode) {
//                     if (barcode.raw != null) {
//                       // Update the state with the scanned QR code value
//                       _onScan(barcode);

//                       // Show a snackbar with the scanned QR code
//                       // ScaffoldMessenger.of(context).showSnackBar(
//                       //   SnackBar(
//                       //       content: Text('Scanned QR Code: ${barcode.raw}')),
//                       // );

//                       // Log the scanned QR code value
//                       log('Scanned QR Code: ${barcode.raw}');
//                     }
//                   },
//                 ),
//               ),
//             ),
//           ),

//           // Display the scanned QR code below the scanner view
//           const Text(
//             "Scan QR Code", // Show the scanned QR code value
//             style: TextStyle(fontSize: 20),
//           ),
//           const SizedBox(height: 20), // Add some spacing
//           // Optionally, show a message or another UI component
//           // Text("Congratulation! 500 points have been added to your wallet"),
//         ],
//       ),
//     );
//   }
// }

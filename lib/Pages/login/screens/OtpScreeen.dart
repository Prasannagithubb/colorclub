// import 'package:flutter/material.dart';
// import 'package:new_one/Controller/logincontrollerss/logincontroller.dart';
// import 'package:pin_code_fields/pin_code_fields.dart';
// import 'package:provider/provider.dart';

// class OtpBottomSheet extends StatefulWidget {
//   const OtpBottomSheet({super.key});

//   @override
//   _OtpBottomSheetState createState() => _OtpBottomSheetState();
// }

// class _OtpBottomSheetState extends State<OtpBottomSheet> {
//   @override
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.only(
//         bottom: MediaQuery.of(context).viewInsets.bottom, // Adjust for keyboard
//       ),
//       child: Container(
//         padding: const EdgeInsets.all(20),
//         decoration: BoxDecoration(
//           color: Colors.white,
//           border: Border.all(
//               color: const Color.fromARGB(255, 16, 57, 122), width: 2.0),
//           borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
//         ),
//         child: Column(
//           mainAxisSize: MainAxisSize.min, // Adaptive modal size
//           children: [
//             Container(
//               width: 50,
//               height: 5,
//               decoration: BoxDecoration(
//                 color: Colors.grey[400],
//                 borderRadius: BorderRadius.circular(10),
//               ),
//             ),
//             const SizedBox(height: 10),

//             // OTP Title
//             const SizedBox(height: 10),
//             const Text(
//               'OTP Verification', // Replace with your localization key S.current.otpverify
//               style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(height: 20),
// // getOtp
//             Text(
//               'Your Otp is : ${context.read<LoginControllerrs>().getOtp}', // Replace with your localization key S.current.otpverify
//               style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//             ),
//             // OTP Fields
//             PinCodeTextField(
//               controller: context.watch<LoginControllerrs>().otpController,
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               keyboardType: TextInputType.number,
//               length: 4,
//               obscureText: false,
//               animationType: AnimationType.fade,
//               pinTheme: PinTheme(
//                 shape: PinCodeFieldShape.box,
//                 borderRadius: BorderRadius.circular(8),
//                 fieldHeight: 50,
//                 fieldWidth: 50,
//                 activeFillColor: Colors.white,
//                 inactiveColor: Colors.grey,
//                 selectedColor: Colors.blue,
//               ),
//               animationDuration: const Duration(milliseconds: 300),
//               onChanged: (value) {
//                 context
//                     .read<LoginControllerrs>()
//                     .OtpPlayAudio('Sounds/beep-313342.mp3');
//               },
//               appContext: context,
//             ),

//             // Instruction Text
//             const Text(
//               'Enter OTP ', // Replace with your localization key S.current.otpenter
//               textAlign: TextAlign.center,
//               style: TextStyle(
//                 fontSize: 18,
//                 color: Colors.black54,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             const SizedBox(height: 15),

//             // Buttons Row (Verify & Back)
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 ElevatedButton(
//                   onPressed: () {
//                     context
//                         .read<LoginControllerrs>()
//                         .callValidateOtpApi(context);
//                   },
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: const Color.fromARGB(255, 6, 18, 83),
//                     padding: const EdgeInsets.symmetric(
//                         horizontal: 30, vertical: 12),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                   ),
//                   child: const Text(
//                     'Verify', // Replace with your localization key S.current.verify
//                     style: TextStyle(
//                         fontSize: 16,
//                         color: Colors.white,
//                         fontWeight: FontWeight.bold),
//                   ),
//                 ),
//               ],
//             ),

//             const SizedBox(height: 20),

//             // Resend Code
//             GestureDetector(
//               onTap: () {},
//               child: const Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text(
//                     'Didn\'t receive the code?', // Replace with your localization key S.current.didntrecivecode
//                     style: TextStyle(
//                         fontSize: 14,
//                         color: Color.fromARGB(255, 6, 18, 83),
//                         fontWeight: FontWeight.bold),
//                   ),
//                   SizedBox(width: 20),
//                   Text(
//                     'Resend', // Replace with your localization key S.current.resend
//                     style: TextStyle(
//                         fontSize: 14,
//                         color: Colors.red,
//                         fontWeight: FontWeight.bold),
//                   ),
//                 ],
//               ),
//             ),

//             const SizedBox(height: 40),
//           ],
//         ),
//       ),
//     );
//   }

//   // void _showFinalSuccessPopup(BuildContext context) {
//   //   // Show a success popup or dialog
//   //   showDialog(
//   //     context: context,
//   //     builder: (context) => AlertDialog(
//   //       title: const Text('Success'),
//   //       content: const Text('OTP Verified Successfully!'),
//   //       actions: <Widget>[
//   //         TextButton(
//   //           onPressed: () => Navigator.of(context).pop(),
//   //           child: const Text('OK'),
//   //         ),
//   //       ],
//   //     ),
//   //   );
//   // }
// }

// // class OtpBottomShee2 extends StatefulWidget {
// //   const OtpBottomShee2({
// //     super.key,
// //   });

// //   @override
// //   _OtpBottomShee2State createState() => _OtpBottomShee2State();
// // }

// // class _OtpBottomShee2State extends State<OtpBottomShee2> {
// //   TextEditingController otpController = TextEditingController();

// //   @override
// //   Widget build(BuildContext context) {
// //     return Padding(
// //       padding: EdgeInsets.only(
// //         bottom: MediaQuery.of(context).viewInsets.bottom, // Adjust for keyboard
// //       ),
// //       child: Container(
// //         padding: const EdgeInsets.all(20),
// //         decoration: const BoxDecoration(
// //           color: Colors.white,
// //           borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
// //         ),
// //         child: Column(
// //           mainAxisSize: MainAxisSize.min, // Adaptive modal size
// //           children: [
// //             // Drag handle
// //             Container(
// //               width: 50,
// //               height: 5,
// //               decoration: BoxDecoration(
// //                 color: Colors.grey[400],
// //                 borderRadius: BorderRadius.circular(10),
// //               ),
// //             ),
// //             const SizedBox(height: 10),

// //             const SizedBox(height: 10),
// //             const Text("OTP Verification",
// //                 style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
// //             const SizedBox(height: 20),
// //             // OTP Fields
// //             PinCodeTextField(
// //               keyboardType: TextInputType.number,
// //               length: 4,
// //               obscureText: false,
// //               animationType: AnimationType.fade,
// //               pinTheme: PinTheme(
// //                 shape: PinCodeFieldShape.box,
// //                 borderRadius: BorderRadius.circular(8),
// //                 fieldHeight: 50,
// //                 fieldWidth: 50,
// //                 activeFillColor: Colors.white,
// //                 inactiveColor: Colors.grey,
// //                 selectedColor: Colors.blue,
// //               ),
// //               animationDuration: const Duration(milliseconds: 300),
// //               controller: otpController,
// //               onChanged: (value) {},
// //               appContext: context,
// //             ),

// //             // Instruction Text
// //             const Text("Enter the OTP sent to your phonee",
// //                 textAlign: TextAlign.center,
// //                 style: TextStyle(
// //                     fontSize: 14, color: Color.fromARGB(137, 0, 0, 0))),

// //             const SizedBox(height: 15),

// //             // Buttons Row (Verify & Back)
// //             Row(
// //               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// //               children: [
// //                 ElevatedButton(
// //                   onPressed: () {
// //                     if (otpController.text == "1234") {
// //                       Navigator.pop(context); // Close Bottom Sheet
// //                       _showFinalSuccessPopup(context);
// //                     } else {
// //                       ScaffoldMessenger.of(context).showSnackBar(
// //                         const SnackBar(
// //                           content: Text("Invalid OTP. Please try again."),
// //                           backgroundColor: Colors.red,
// //                         ),
// //                       );
// //                     }
// //                   },
// //                   style: ElevatedButton.styleFrom(
// //                     backgroundColor: const Color.fromARGB(255, 6, 18, 83),
// //                     padding: const EdgeInsets.symmetric(
// //                         horizontal: 30, vertical: 12),
// //                     shape: RoundedRectangleBorder(
// //                       borderRadius: BorderRadius.circular(10),
// //                     ),
// //                   ),
// //                   child: const Text("Verify",
// //                       style: TextStyle(fontSize: 16, color: Colors.white)),
// //                 ),
// //                 ElevatedButton(
// //                   onPressed: () {
// //                     Navigator.pop(context);
// //                     showResetPasswordDialog(context);
// //                   },
// //                   style: ElevatedButton.styleFrom(
// //                     backgroundColor: Colors.grey,
// //                     padding: const EdgeInsets.symmetric(
// //                         horizontal: 30, vertical: 12),
// //                     shape: RoundedRectangleBorder(
// //                       borderRadius: BorderRadius.circular(10),
// //                     ),
// //                   ),
// //                   child: const Text("Back",
// //                       style: TextStyle(fontSize: 16, color: Colors.white)),
// //                 ),
// //               ],
// //             ),

// //             const SizedBox(height: 20),

// //             // Resend Code
// //             GestureDetector(
// //               onTap: () {},
// //               child: const Row(
// //                 mainAxisAlignment: MainAxisAlignment.center,
// //                 children: [
// //                   Text("Didn't receive code?",
// //                       style: TextStyle(
// //                           fontSize: 14,
// //                           color: Colors.blue,
// //                           fontWeight: FontWeight.bold)),
// //                   Text(" Resend",
// //                       style: TextStyle(
// //                           fontSize: 14,
// //                           color: Colors.red,
// //                           fontWeight: FontWeight.bold)),
// //                 ],
// //               ),
// //             ),

// //             const SizedBox(height: 40),
// //           ],
// //         ),
// //       ),
// //     );
// //   }

// //   void _showFinalSuccessPopup(BuildContext context) {
// //     showDialog(
// //       context: context,
// //       barrierDismissible: false, // Prevent closing without pressing the button
// //       builder: (BuildContext context) {
// //         return Dialog(
// //           shape: RoundedRectangleBorder(
// //             borderRadius: BorderRadius.circular(20),
// //           ),
// //           child: Padding(
// //             padding: const EdgeInsets.all(20.0),
// //             child: Column(
// //               mainAxisSize: MainAxisSize.min,
// //               children: [
// //                 // SUCCESS ANIMATION
// //                 Lottie.asset(
// //                   'assets/sucess.json', // Green checkmark animation
// //                   width: 250,
// //                   repeat: false,
// //                 ),
// //                 const SizedBox(height: 20),
// //                 const Text(
// //                   "Verification Successful!",
// //                   style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
// //                 ),
// //                 const SizedBox(height: 10),
// //                 const Text(
// //                   "Your OTP has been verified successfully.",
// //                   style: TextStyle(fontSize: 16, color: Colors.black54),
// //                   textAlign: TextAlign.center,
// //                 ),
// //                 const SizedBox(height: 20),
// //                 ElevatedButton(
// //                   onPressed: () {
// //                     Navigator.pop(context);
// //                     showResetPasswordDialog(context);
// //                   },
// //                   style: ElevatedButton.styleFrom(
// //                     backgroundColor: const Color.fromARGB(255, 6, 18, 83),
// //                     padding: const EdgeInsets.symmetric(
// //                         horizontal: 30, vertical: 12),
// //                     shape: RoundedRectangleBorder(
// //                       borderRadius: BorderRadius.circular(10),
// //                     ),
// //                   ),
// //                   child: const Text(
// //                     "Continue",
// //                     style: TextStyle(fontSize: 16, color: Colors.white),
// //                   ),
// //                 ),
// //               ],
// //             ),
// //           ),
// //         );
// //       },
// //     );
// //   }
// // }

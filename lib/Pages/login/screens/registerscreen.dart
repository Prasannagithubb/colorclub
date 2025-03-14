// import 'dart:developer';
// import 'dart:io';
// import 'dart:ui';

// import 'package:file_picker/file_picker.dart';
// import 'package:flutter/material.dart';
// import 'package:geocoding/geocoding.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:new_one/Constant/Screen.dart';
// import 'package:new_one/Controller/logincontroller/languagecontroller.dart';
// import 'package:new_one/DB%20Helper/DBhelper.dart';
// import 'package:new_one/Models/language_model.dart';
// import 'package:new_one/Pages/login/screens/loginscreen.dart';
// import 'package:new_one/Pages/login/widgets/custom_shake_transtition.dart';
// import 'package:new_one/Service/regisservices.dart';
// import 'package:new_one/generated/l10n.dart';
// import 'package:provider/provider.dart';
// import 'package:sqflite/sqflite.dart';

// class registerscreen extends StatefulWidget {
//   const registerscreen({super.key});

//   @override
//   State<registerscreen> createState() => _registerscreenState();
// }

// class _registerscreenState extends State<registerscreen> {
//   TextEditingController _address1Controller = TextEditingController();

//   TextEditingController countrycontroller = TextEditingController();
//   TextEditingController messagecontroller = TextEditingController();
//   TextEditingController usernamecontroller = TextEditingController();
//   TextEditingController mobilenumber1controller = TextEditingController();
//   TextEditingController whatsappnocontroller = TextEditingController();
//   TextEditingController notificationviacontroller = TextEditingController();
//   TextEditingController address2controller = TextEditingController();

//   TextEditingController citycontroller = TextEditingController();

//   final TextEditingController countryController = TextEditingController();
//   final TextEditingController _messagecontroller = TextEditingController();
//   final List<String> countries = ["USA", "Canada", "India", "Australia", "UK"];
//   final List<String> Message = ["SMS", "Whats App"];
//   final _formKey1 = GlobalKey<FormState>();

//   String? selectedNotification;
//   String selectedLanguage = "Language";

//   File? _selectedFile;
//   File? _selectedImage;

//   // Function to pick a file
//   Future<void> pickFile() async {
//     FilePickerResult? result = await FilePicker.platform.pickFiles();
//     if (result != null) {
//       setState(() {
//         _selectedFile = File(result.files.single.path!);
//       });
//     }
//   }

//   Future<void> _getCurrentLocation() async {
//     try {
//       // Request location permission
//       LocationPermission permission = await Geolocator.requestPermission();
//       if (permission == LocationPermission.denied ||
//           permission == LocationPermission.deniedForever) {
//         log("Location permission denied");
//         return;
//       }

//       // Get current position
//       Position position = await Geolocator.getCurrentPosition(
//           desiredAccuracy: LocationAccuracy.high);

//       log("Location: ${position.latitude}, ${position.longitude}");

//       // Get address from coordinates
//       List<Placemark> placemarks =
//           await placemarkFromCoordinates(position.latitude, position.longitude);

//       if (placemarks.isNotEmpty) {
//         Placemark place = placemarks[0];
//         String address =
//             "${place.street}, ${place.locality}, ${place.administrativeArea}, ${place.country}";

//         setState(() {
//           _address1Controller.text = address;
//         });
//       }
//     } catch (e) {
//       log("Error getting location: $e");
//     }
//   }

//   // Function to take a selfie (capture image from camera)
//   Future<void> pickImage() async {
//     try {
//       log('Opening camera for selfie...');
//       final ImagePicker _picker = ImagePicker();
//       XFile? image = await _picker.pickImage(source: ImageSource.camera);

//       if (image != null) {
//         log('Image selected: ${image.path}');
//         setState(() {
//           _selectedImage = File(image.path);
//         });
//       } else {
//         log('User canceled image selection');
//       }
//     } catch (e) {
//       log('Error picking image: $e');
//     }
//   }

//   List<Map<String, dynamic>> _users = [];
//   @override
//   void initState() {
//     super.initState();
//     fetchAndStoreUsers();
//   }

//   // Fetch data from API & store it in SQLite
//   Future<void> fetchAndStoreUsers() async {
//     try {
//       List<Map<String, dynamic>> apiUsers =
//           await ApiService.fetchRegistrationData();
//       final db = await DBHelper.getInstance(); // Get the database instance

//       for (var user in apiUsers) {
//         await db.insert(
//           'users',
//           {'name': user['name'], 'email': user['email']},
//           conflictAlgorithm: ConflictAlgorithm.replace,
//         );
//       }

//       loadUsersFromDatabase();
//     } catch (e) {
//       print("Error fetching users: $e");
//     }
//   }

//   // Load users from SQLite database
//   Future<void> loadUsersFromDatabase() async {
//     final db = await DBHelper.getInstance();
//     List<Map<String, dynamic>> localUsers = await db.query('users');

//     setState(() {
//       _users = localUsers;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);
//     var groupvalue = context.read<Languagecontroller>().locale.languageCode;

//     return Scaffold(
//       body: SingleChildScrollView(
//         scrollDirection: Axis.vertical,
//         child: Container(
//           height: Screens.bodyheight(context) * 1.2,
//           width: double.infinity,
//           decoration: const BoxDecoration(color: Colors.white),
//           child: Column(
//             children: [
//               Positioned.fill(
//                 child: BackdropFilter(
//                   filter: ImageFilter.blur(
//                       sigmaX: 4, sigmaY: 4), // Adjust blur intensity
//                   child: Container(
//                     color: const Color.fromARGB(255, 0, 0, 0).withOpacity(
//                         0.5), // Adjust transparency for the glass effect
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: EdgeInsets.symmetric(
//                     horizontal: Screens.width(context) * 0.01,
//                     vertical: Screens.fullHeight(context) * 0.05),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.end,
//                   children: [
//                     InkWell(
//                       onTap: () {
//                         showDialog(
//                             context: context,
//                             builder: (context) {
//                               return AlertDialog(
//                                 insetPadding: const EdgeInsets.all(10),
//                                 contentPadding: const EdgeInsets.all(0),
//                                 shape: RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.circular(8)),
//                                 alignment: Alignment.center,
//                                 content: Container(
//                                   // height: 300,
//                                   // color: Colors.amber,
//                                   width: Screens.width(context) * 0.1,
//                                   constraints: BoxConstraints(
//                                       maxHeight:
//                                           Screens.padingHeight(context) * 0.3),
//                                   child: Column(
//                                     mainAxisSize: MainAxisSize.min,
//                                     children: [
//                                       Expanded(
//                                         child: ListView.builder(
//                                             shrinkWrap: true,
//                                             // ise:true,
//                                             itemCount: LanguageModel.length,
//                                             itemBuilder: (context, i) {
//                                               var item = LanguageModel[i];
//                                               return RadioListTile(
//                                                   value: item.languagecode,
//                                                   activeColor:
//                                                       theme.primaryColor,
//                                                   groupValue: groupvalue,
//                                                   title: Text(item.language!),
//                                                   subtitle:
//                                                       Text(item.sublanguage!),
//                                                   onChanged: (val) {
//                                                     groupvalue = val.toString();
//                                                     context
//                                                         .read<
//                                                             Languagecontroller>()
//                                                         .setlocate(Locale(item
//                                                             .languagecode!));
//                                                     Navigator.pop(context);
//                                                   });
//                                             }),
//                                       )
//                                     ],
//                                   ),
//                                 ),
//                               );
//                             });
//                       },
//                       child: Container(
//                         alignment: Alignment.topRight,
//                         width: Screens.width(context) * 0.3,
//                         height: Screens.fullHeight(context) * 0.05,
//                         // child: const Icon(
//                         //   Icons.language,
//                         //   color: Colors.black,
//                         //   size: 30,
//                         // )
//                         decoration: BoxDecoration(
//                             color: const Color.fromARGB(255, 16, 69, 85),
//                             borderRadius: BorderRadius.circular(10),
//                             border: Border.all(color: Colors.white, width: 1)),

//                         child: Padding(
//                           padding: EdgeInsets.symmetric(
//                               vertical: Screens.padingHeight(context) * 0.01),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Text(
//                                 S.current.language,
//                                 style: const TextStyle(
//                                     fontSize: 15, color: Colors.white),
//                               ),
//                               const Icon(
//                                 Icons.arrow_drop_down,
//                                 color: Colors.white,
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               Padding(
//                 padding: EdgeInsets.symmetric(
//                     // vertical: Screens.padingHeight(context) * 0.0,
//                     horizontal: Screens.width(context) * 0.1
//                     //
//                     ),
//                 child: Form(
//                   key: _formKey1,
//                   child: Column(
//                     children: [
//                       const SizedBox(
//                         height: 5,
//                       ),
//                       CustomShakeTransition(
//                         duration: const Duration(milliseconds: 900),
//                         child: SizedBox(
//                           child: TextFormField(
//                             controller: usernamecontroller,
//                             keyboardType: TextInputType.number,
//                             style: theme.textTheme.bodyMedium,
//                             validator: (data) {
//                               if (data!.isEmpty) {
//                                 return "Required*";
//                               }
//                               // else if (!data.contains("@")) {
//                               //   return "Enter Valid Email*";
//                               // }
//                               return null;
//                             },
//                             decoration: InputDecoration(
//                               contentPadding: const EdgeInsets.symmetric(
//                                   vertical: 10.0, horizontal: 10.0),
//                               fillColor:
//                                   const Color.fromARGB(255, 255, 255, 255)
//                                       .withOpacity(0.8),
//                               filled: true,
//                               labelText: S.current.username,
//                               border: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(10.0),
//                                 borderSide: const BorderSide(
//                                   color: Colors.lightBlueAccent,
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                       const SizedBox(
//                         height: 5,
//                       ),
//                       CustomShakeTransition(
//                         duration: const Duration(milliseconds: 900),
//                         child: SizedBox(
//                           child: TextFormField(
//                             controller: mobilenumber1controller,
//                             keyboardType: TextInputType.number,
//                             maxLength: 10,
//                             style: theme.textTheme.bodyMedium,
//                             validator: (value) {
//                               if (value == null || value.isEmpty) {
//                                 return 'Required*';
//                               }
//                               if (value.length != 10) {
//                                 return 'Mobile number must be 10 digits long';
//                               }

//                               return null;
//                             },
//                             decoration: InputDecoration(
//                               contentPadding: const EdgeInsets.symmetric(
//                                   vertical: 10.0, horizontal: 10.0),
//                               fillColor:
//                                   const Color.fromARGB(255, 255, 255, 255)
//                                       .withOpacity(0.8),
//                               filled: true,
//                               labelText: S.current.Mobilenumber,
//                               border: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(10.0),
//                                 borderSide: const BorderSide(
//                                   color: Colors.lightBlueAccent,
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                       const SizedBox(
//                         height: 5,
//                       ),
//                       CustomShakeTransition(
//                         duration: const Duration(milliseconds: 900),
//                         child: SizedBox(
//                           child: TextFormField(
//                             controller: whatsappnocontroller,
//                             keyboardType: TextInputType.text,
//                             style: theme.textTheme.bodyMedium,
//                             validator: (data) {
//                               if (data!.isEmpty) {
//                                 return "Required*";
//                               }
//                               // else if (!data.contains("@")) {
//                               //   return "Enter Valid Email*";
//                               // }
//                               return null;
//                             },
//                             decoration: InputDecoration(
//                               contentPadding: const EdgeInsets.symmetric(
//                                   vertical: 10.0, horizontal: 10.0),
//                               fillColor:
//                                   const Color.fromARGB(255, 255, 255, 255)
//                                       .withOpacity(0.8),
//                               filled: true,
//                               labelText: S.current.whatsappno,
//                               border: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(10.0),
//                                 borderSide: const BorderSide(
//                                   color: Colors.lightBlueAccent,
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                       const SizedBox(
//                         height: 5,
//                       ),
//                       CustomShakeTransition(
//                         duration: const Duration(milliseconds: 900),
//                         child: SizedBox(
//                           child: TextFormField(
//                             controller: _messagecontroller,
//                             keyboardType: TextInputType.text,
//                             style: theme.textTheme.bodyMedium,
//                             validator: (data) {
//                               if (data!.isEmpty) {
//                                 return "Required*";
//                               }
//                               // else if (!data.contains("@")) {
//                               //   return "Enter Valid Email*";
//                               // }
//                               return null;
//                             },
//                             decoration: InputDecoration(
//                               suffixIcon: PopupMenuButton<String>(
//                                 icon: const Icon(Icons.arrow_drop_down),
//                                 onSelected: (String value) {
//                                   setState(() {
//                                     _messagecontroller.text = value;
//                                   });
//                                 },
//                                 itemBuilder: (BuildContext context) {
//                                   return Message.map((String messages) {
//                                     return PopupMenuItem<String>(
//                                       value: messages,
//                                       child: Text(
//                                         messages,
//                                         style: const TextStyle(),
//                                       ),
//                                     );
//                                   }).toList();
//                                 },
//                               ),
//                               contentPadding: const EdgeInsets.symmetric(
//                                   vertical: 10.0, horizontal: 10.0),
//                               fillColor:
//                                   const Color.fromARGB(255, 255, 255, 255)
//                                       .withOpacity(0.8),
//                               filled: true,
//                               labelText: S.current.notificationvia,
//                               border: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(10.0),
//                                 borderSide: const BorderSide(
//                                   color: Colors.lightBlueAccent,
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                       const SizedBox(
//                         height: 5,
//                       ),
//                       CustomShakeTransition(
//                         duration: const Duration(milliseconds: 900),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment
//                               .spaceBetween, // Adjust spacing between items
//                           children: [
//                             // Address 1 TextFormField inside CustomShakeTransition
//                             Expanded(
//                               child: TextFormField(
//                                 controller: _address1Controller,
//                                 keyboardType: TextInputType.text,
//                                 style: theme.textTheme.bodyMedium,
//                                 validator: (data) {
//                                   if (data!.isEmpty) {
//                                     return "Required*";
//                                   }
//                                   return null;
//                                 },
//                                 decoration: InputDecoration(
//                                   contentPadding: const EdgeInsets.symmetric(
//                                       vertical: 10.0, horizontal: 10.0),
//                                   fillColor:
//                                       const Color.fromARGB(255, 255, 255, 255)
//                                           .withOpacity(0.8),
//                                   filled: true,
//                                   labelText: S.current.address1,
//                                   border: OutlineInputBorder(
//                                     borderRadius: BorderRadius.circular(10.0),
//                                     borderSide: const BorderSide(
//                                       color: Colors.lightBlueAccent,
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ),

//                             const SizedBox(
//                                 width:
//                                     5), // Add some space between the TextFormField and Button

//                             // ElevatedButton for "Via Google"
//                             ElevatedButton(
//                               style: ElevatedButton.styleFrom(
//                                 backgroundColor:
//                                     const Color.fromARGB(255, 16, 69, 85),
//                                 shape: const RoundedRectangleBorder(
//                                   side: BorderSide(
//                                     color: Colors
//                                         .white, // Set the border color to white
//                                     width: 1, // Adjust the width of the border
//                                   ),
//                                   borderRadius: BorderRadius.all(
//                                     Radius.circular(5),
//                                   ),
//                                 ),
//                               ),
//                               onPressed: _getCurrentLocation,
//                               child: Text(
//                                 S.current.viagoogle,
//                                 style: const TextStyle(
//                                   color: Color.fromARGB(255, 255, 255, 255),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       const SizedBox(
//                         height: 5,
//                       ),
//                       CustomShakeTransition(
//                         duration: const Duration(milliseconds: 900),
//                         child: SizedBox(
//                           child: TextFormField(
//                             controller: address2controller,
//                             keyboardType: TextInputType.text,
//                             style: theme.textTheme.bodyMedium,
//                             validator: (data) {
//                               if (data!.isEmpty) {
//                                 return "Required*";
//                               }
//                               // else if (!data.contains("@")) {
//                               //   return "Enter Valid Email*";
//                               // }
//                               return null;
//                             },
//                             decoration: InputDecoration(
//                               contentPadding: const EdgeInsets.symmetric(
//                                   vertical: 10.0, horizontal: 10.0),
//                               fillColor:
//                                   const Color.fromARGB(255, 255, 255, 255)
//                                       .withOpacity(0.8),
//                               filled: true,
//                               labelText: S.current.address2,
//                               border: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(10.0),
//                                 borderSide: const BorderSide(
//                                   color: Colors.lightBlueAccent,
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                       const SizedBox(
//                         height: 5,
//                       ),
//                       CustomShakeTransition(
//                         duration: const Duration(milliseconds: 900),
//                         child: SizedBox(
//                           child: TextFormField(
//                             controller: citycontroller,
//                             keyboardType: TextInputType.text,
//                             style: theme.textTheme.bodyMedium,
//                             validator: (data) {
//                               if (data!.isEmpty) {
//                                 return "Required*";
//                               }
//                               // else if (!data.contains("@")) {
//                               //   return "Enter Valid Email*";
//                               // }
//                               return null;
//                             },
//                             decoration: InputDecoration(
//                               contentPadding: const EdgeInsets.symmetric(
//                                   vertical: 10.0, horizontal: 10.0),
//                               fillColor:
//                                   const Color.fromARGB(255, 255, 255, 255)
//                                       .withOpacity(0.8),
//                               filled: true,
//                               labelText: S.current.city,
//                               border: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(10.0),
//                                 borderSide: const BorderSide(
//                                   color: Colors.lightBlueAccent,
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                       const SizedBox(
//                         height: 5,
//                       ),
//                       CustomShakeTransition(
//                         duration: const Duration(milliseconds: 900),
//                         child: SizedBox(
//                           child: TextFormField(
//                             controller: countryController,
//                             keyboardType: TextInputType.text,
//                             style: theme.textTheme.bodyMedium,
//                             validator: (data) {
//                               if (data!.isEmpty) {
//                                 return "Required*";
//                               }
//                               // else if (!data.contains("@")) {
//                               //   return "Enter Valid Email*";
//                               // }
//                               return null;
//                             },
//                             decoration: InputDecoration(
//                               suffixIcon: PopupMenuButton<String>(
//                                 icon: const Icon(Icons.arrow_drop_down),
//                                 onSelected: (String value) {
//                                   setState(() {
//                                     countryController.text = value;
//                                   });
//                                 },
//                                 itemBuilder: (BuildContext context) {
//                                   return countries.map((String country) {
//                                     return PopupMenuItem<String>(
//                                       value: country,
//                                       child: Text(country),
//                                     );
//                                   }).toList();
//                                 },
//                               ),
//                               contentPadding: const EdgeInsets.symmetric(
//                                   vertical: 10.0, horizontal: 10.0),
//                               fillColor:
//                                   const Color.fromARGB(255, 255, 255, 255)
//                                       .withOpacity(0.8),
//                               filled: true,
//                               labelText: S.current.country,
//                               border: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(10.0),
//                                 borderSide: const BorderSide(
//                                   color: Colors.lightBlueAccent,
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                       const SizedBox(
//                         height: 5,
//                       ),
//                       CustomShakeTransition(
//                         duration: const Duration(milliseconds: 900),
//                         child: SizedBox(
//                           child: TextFormField(
//                             // controller: prdlog.mycontroller[0],
//                             keyboardType: TextInputType.number,
//                             maxLength: 6,
//                             style: theme.textTheme.bodyMedium,
//                             validator: (data) {
//                               if (data == null || data.isEmpty) {
//                                 return 'Required*';
//                               }
//                               if (data.length != 6) {
//                                 return 'Zip Code must be 6 digits long';
//                               }

//                               return null;
//                             },
//                             decoration: InputDecoration(
//                               contentPadding: const EdgeInsets.symmetric(
//                                   vertical: 10.0, horizontal: 10.0),
//                               fillColor:
//                                   const Color.fromARGB(255, 255, 255, 255)
//                                       .withOpacity(0.8),
//                               filled: true,
//                               labelText: S.current.zipcode,
//                               border: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(10.0),
//                                 borderSide: const BorderSide(
//                                   color: Colors.lightBlueAccent,
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                       Padding(
//                         padding: EdgeInsets.symmetric(
//                             vertical: Screens.bodyheight(context) * 0.03),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                           children: [
//                             GestureDetector(
//                               onTap: pickFile,
//                               child: Container(
//                                 height: Screens.bodyheight(context) * 0.1,
//                                 width: Screens.width(context) * 0.2,
//                                 decoration: BoxDecoration(
//                                   image: _selectedFile != null
//                                       ? DecorationImage(
//                                           image: FileImage(
//                                               _selectedFile!), // Display selected file
//                                           fit: BoxFit.cover,
//                                         )
//                                       // : const DecorationImage(
//                                       //     image: AssetImage(
//                                       //         "assets/uplode1.png"), // Default image
//                                       //     fit: BoxFit.fill,
//                                       //   ),
//                                       : null,
//                                   border: Border.all(
//                                     color:
//                                         const Color.fromARGB(255, 82, 82, 82),
//                                   ),
//                                   borderRadius: const BorderRadius.all(
//                                       Radius.circular(10)),
//                                   color:
//                                       const Color.fromARGB(255, 255, 255, 255)
//                                           .withOpacity(0.8),
//                                 ),
//                                 child: _selectedImage == null
//                                     ? const Column(
//                                         children: [
//                                           Text(
//                                             "Upload",
//                                             style: TextStyle(
//                                               color: Colors.black,
//                                               fontSize: 15,
//                                             ),
//                                           ),
//                                           Icon(Icons.upload_file,
//                                               size: 40,
//                                               color: Color.fromARGB(
//                                                   255, 29, 12, 128)),
//                                         ],
//                                       )
//                                     : null, // When an ima
//                               ),
//                             ),
//                             GestureDetector(
//                               onTap: pickImage,
//                               child: Container(
//                                 height: Screens.bodyheight(context) * 0.1,
//                                 width: Screens.width(context) * 0.2,
//                                 decoration: BoxDecoration(
//                                   color:
//                                       const Color.fromARGB(255, 255, 255, 255)
//                                           .withOpacity(0.8),
//                                   image: _selectedImage != null
//                                       ? DecorationImage(
//                                           image: FileImage(_selectedImage!),
//                                           fit: BoxFit.fill,
//                                         )
//                                       : null,
//                                   borderRadius: const BorderRadius.all(
//                                       Radius.circular(10)),
//                                   border: Border.all(
//                                     color:
//                                         const Color.fromARGB(255, 82, 82, 82),
//                                   ),
//                                 ),

//                                 child: _selectedImage == null
//                                     ? const Column(
//                                         children: [
//                                           Text(
//                                             "Selfie",
//                                             style: TextStyle(
//                                               color: Colors.black,
//                                               fontSize: 15,
//                                             ),
//                                           ),
//                                           Icon(Icons.camera_alt,
//                                               size: 40,
//                                               color: Color.fromARGB(
//                                                   255, 29, 12, 128)),
//                                         ],
//                                       )
//                                     : null, // When an image is selected, child is null
//                               ),
//                             )
//                           ],
//                         ),
//                       ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                         children: [
//                           ElevatedButton(
//                               style: ElevatedButton.styleFrom(
//                                   backgroundColor:
//                                       const Color.fromARGB(255, 16, 69, 85),
//                                   side: const BorderSide(
//                                     color: Colors
//                                         .white, // Set the border color to white
//                                     width: 1, // Adjust the width of the border
//                                   ),
//                                   shape: RoundedRectangleBorder(
//                                       borderRadius: BorderRadius.circular(10))),
//                               onPressed: () async {
//                                 if (_formKey1.currentState!.validate()) {
//                                   log("Form validation passed. Preparing user data...");

//                                   // Create user data map
//                                   Map<String, dynamic> userData = {
//                                     "name": usernamecontroller.text,
//                                     "email": notificationviacontroller
//                                         .text, // Assuming email is stored here
//                                     "mobile": mobilenumber1controller.text,
//                                     "whatsapp_no": whatsappnocontroller.text,
//                                     "address": _address1Controller.text,
//                                     "city": citycontroller.text,
//                                     "country": countrycontroller.text,
//                                   };

//                                   log("User data: $userData");

//                                   try {
//                                     // Call API to register user
//                                     log("Calling API to register user...");
//                                     bool isRegistered =
//                                         await ApiService.registerUser(userData);

//                                     if (isRegistered) {
//                                       log("User successfully registered. Saving to SQLite...");

//                                       // Store user in SQLite
//                                       final db = await DBHelper.getInstance();
//                                       await db.insert(
//                                         'users',
//                                         userData,
//                                         conflictAlgorithm:
//                                             ConflictAlgorithm.replace,
//                                       );

//                                       log("User saved to SQLite. Navigating to Login Screen...");

//                                       // Navigate to login screen
//                                       Navigator.push(
//                                         context,
//                                         MaterialPageRoute(
//                                             builder: (context) =>
//                                                 const Loginscreen()),
//                                       );
//                                     } else {
//                                       log("Registration failed. Showing Snackbar...");
//                                       ScaffoldMessenger.of(context)
//                                           .showSnackBar(
//                                         const SnackBar(
//                                             content: Text(
//                                                 "Registration failed! Please try again.")),
//                                       );
//                                     }
//                                   } catch (e) {
//                                     log("Error during registration process: $e");
//                                     ScaffoldMessenger.of(context).showSnackBar(
//                                       const SnackBar(
//                                           content: Text(
//                                               "Something went wrong. Try again later!")),
//                                     );
//                                   }
//                                 } else {
//                                   log("Form validation failed!");
//                                 }
//                               },
//                               child: Text("hi",
//                                   style: const TextStyle(color: Colors.amber))),
//                         ],
//                       )
//                     ],
//                   ),
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

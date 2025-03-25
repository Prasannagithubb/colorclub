import 'dart:developer';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:new_one/Constant/Screen.dart';
import 'package:new_one/Controller/logincontroller/languagecontroller.dart';
import 'package:new_one/Models/language_model.dart';
import 'package:new_one/Models/registration.dart';
import 'package:new_one/Pages/login/screens/loginscreen.dart';
import 'package:new_one/Service/regisservices.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

class Productcomplaintnew extends StatefulWidget {
  const Productcomplaintnew({super.key});

  @override
  State<Productcomplaintnew> createState() => _ProductcomplaintnewState();
}

class _ProductcomplaintnewState extends State<Productcomplaintnew> {
  final TextEditingController complaintController = TextEditingController();
  String? selectedProduct;
  File? _image;
  String? complaintTicket;
  void _showComplaintDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Complaint Submitted"),
          content: const Text(
              "Your complaint has been taken. Our team will review it soon."),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text("OK", style: TextStyle(color: primaryColor)),
            ),
          ],
        );
      },
    );
  }

  final List<String> products = [
    "Paint - Red",
    "Paint - Blue",
    "Paint - White",
    "Paint - Green",
    "Paint - Black"
  ];

  final ImagePicker _picker = ImagePicker();
  final Color primaryColor = const Color.fromARGB(255, 16, 57, 122);
  final Color greyBorder = Colors.grey.shade300;

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  void _submitComplaint() {
    if (selectedProduct != null && complaintController.text.isNotEmpty) {
      String ticketCode = const Uuid().v4().substring(0, 8).toUpperCase();
      setState(() {
        complaintTicket = "TICKET: $ticketCode";
      });
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Complaint submitted successfully! Ticket: $ticketCode"),
        backgroundColor: primaryColor,
      ));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Please fill in all details!")));
    }
  }

  final _formKey = GlobalKey<FormState>();

  String? selectedState;
  final List<String> states = [
    "California",
    "Texas",
    "New York",
    "Florida",
    "Illinois"
  ];
  bool hasError = false; // Default state

  void _validateButton() {
    setState(() {
      hasError = true; // Trigger error state
    });
  }

  String? selectedMessage;
  String? MessageError;
  final List<String> Message = ["SMS", "Whats App"];

  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController whatsappController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController notificationController = TextEditingController();

  String? stateError;
  File? _selectedFile;
  File? _selectedImage;
  String selectedLanguage = "Language";

  // Function to pick a file
  Future<void> pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      log("File selected: ${result.files.single.name}");
      setState(() {
        _selectedFile = File(result.files.single.path!);
      });
    } else {
      log("User canceled file selection.");
    }
  }

  Future<void> _getCurrentLocation() async {
    try {
      LocationPermission permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied ||
          permission == LocationPermission.deniedForever) {
        log("Location permission denied");
        return;
      }

      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      log("User location: ${position.latitude}, ${position.longitude}");

      List<Placemark> placemarks =
          await placemarkFromCoordinates(position.latitude, position.longitude);

      if (placemarks.isNotEmpty) {
        Placemark place = placemarks[0];
        String address =
            "${place.street}, ${place.locality}, ${place.administrativeArea}, ${place.country}";
        log("Fetched Address: $address");

        setState(() {
          addressController.text = address;
        });
      }
    } catch (e) {
      log("Error getting location: $e");
    }
  }

  // Function to take a selfie (capture image from camera)
  Future<void> pickImage() async {
    try {
      final ImagePicker _picker = ImagePicker();
      XFile? image = await _picker.pickImage(source: ImageSource.camera);

      if (image != null) {
        log("Image selected: ${image.path}");
        setState(() {
          _selectedImage = File(image.path);
        });
      } else {
        log("User canceled image selection");
      }
    } catch (e) {
      log("Error picking image: $e");
    }
  }

  void _showStatePicker(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(16),
          height: 300,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text("Select State",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const Divider(),
              Expanded(
                child: ListView.builder(
                  itemCount: states.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(states[index]),
                      onTap: () {
                        log("Selected State: ${states[index]}");
                        setState(() {
                          selectedState = states[index];
                          stateError = null;
                        });
                        Navigator.pop(context);
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _showNotificationPicker(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(16),
          height: 300,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text("Select Via",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const Divider(),
              Expanded(
                child: ListView.builder(
                  itemCount: Message.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(Message[index]),
                      onTap: () {
                        log("Selected Notification: ${Message[index]}");
                        setState(() {
                          selectedMessage = Message[index];
                          MessageError = null;
                        });
                        Navigator.pop(context);
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  List<MemberData> members = [];
  Future<void> _saveProfile() async {
    members.clear();
    log(DateTime.now().toString());

    setState(() {
      stateError = selectedState == null ? "Please select a state" : null;
      MessageError =
          selectedMessage == null ? "Please select Notification via" : null;
    });

    if (_formKey.currentState!.validate() &&
        selectedState != null &&
        selectedMessage != null) {
      members.add(MemberData(
        docEntry: 0,
        memberCode: "",
        memberFirstName: fullNameController.text,
        memberLastName: "",
        memberNicName: "",
        memberLanguage: selectedLanguage,
        memberContact: mobileController.text,
        emailId: emailController.text,
        whatsAppNo: whatsappController.text,
        address1: addressController.text,
        address2: "",
        address3: "",
        city: "",
        state: selectedState ?? "",
        country: "",
        zipcode: "",
        memberType: "",
        memberStatus: "",
        activeSince: "1990-05-15T00:00:00.000Z",
        rating: 0.0,
        badgeLevel: "",
        referredBy: "",
        dob: "1990-05-15T00:00:00.000Z",
        pwdKey: null,
        lastLogin: "1990-05-15T00:00:00.000Z",
        lastOTP: null,
        validTill: "1990-05-15T00:00:00.000Z",
        pinNumber: 0,
        deviceName: "",
        deviceCode: "",
        fcmToken: "",
        profilePicURL: "",
        updateBy: "",
        updatedOn: "1990-05-15T00:00:00.000Z",
        traceId: "",
      ));
      // MemberData user =

      // log("📤 Sending user data to API: ${jsonEncode(user.tojson())}");

      bool isRegistered = await ApiService.registerUser(members);

      if (isRegistered) {
        log(" Profile Saved Successfully!");
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Profile Saved Successfully!")),
        );
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const Loginscreen()));
      } else {
        log(" Profile save failed.");
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Failed to save profile.")),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: Screens.fullHeight(context),
          width: Screens.width(context),
          padding: const EdgeInsets.only(bottom: 20, top: 30),
          decoration:
              const BoxDecoration(color: Color.fromARGB(255, 16, 57, 122)),
          child: Column(
            children: [
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20),
                          topLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                          bottomLeft: Radius.circular(20))),
                  child: Column(
                    children: [
                      SizedBox(height: Screens.fullHeight(context) * 0.01),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset('assets/Img1.png', height: 120),
                          Image.asset('assets/CoralLogo_Outline.png',
                              height: 100),
                          Image.asset('assets/Img2.png', height: 130),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _buildSectionTitle("hi"),
                        ],
                      ),
                      Text(
                        '       PRODUCT COMPLAINTS',
                        style: TextStyle(
                            color: Colors.red.shade700,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                      SizedBox(height: Screens.bodyheight(context) * 0.01),
                      // Dropdown Selection
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("Select Product",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black)),
                            const SizedBox(height: 8),
                            Container(
                              decoration: BoxDecoration(
                                border:
                                    Border.all(color: greyBorder, width: 1.5),
                                borderRadius: BorderRadius.circular(8),
                                color: Colors.grey.shade100,
                              ),
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 12),
                              child: DropdownButtonFormField<String>(
                                borderRadius: BorderRadius.circular(10),
                                value: selectedProduct,
                                items: products.map((product) {
                                  return DropdownMenuItem(
                                      value: product, child: Text(product));
                                }).toList(),
                                onChanged: (value) {
                                  setState(() {
                                    selectedProduct = value;
                                  });
                                },
                                icon: const Icon(
                                  size: 25.0,
                                  Icons.arrow_drop_down,
                                  color: Colors.red,
                                ),
                                decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Choose Product",
                                    hintStyle: TextStyle(color: Colors.grey)),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      // Complaint Input Field
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("Enter Complaint Details",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black)),
                            const SizedBox(height: 8),
                            TextField(
                              cursorColor: Colors.grey,
                              controller: complaintController,
                              maxLines: 3,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide:
                                        const BorderSide(color: Colors.amber)),
                                hintText: "Describe your complaint",
                                hintStyle: const TextStyle(color: Colors.grey),
                                filled: true,
                                fillColor: Colors.grey.shade100,
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Colors.grey, width: 1.0),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      // Attach Image Button
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton.icon(
                              onPressed: _pickImage,
                              icon: const Icon(Icons.image,
                                  color: Color.fromARGB(255, 255, 17, 0)),
                              label: const Text("Attach Image",
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 255, 17, 0))),
                              style: ElevatedButton.styleFrom(
                                minimumSize: const Size(295, 50),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                backgroundColor: Colors.grey.shade200,
                              ),
                            ),
                            SizedBox(
                              width: Screens.width(context) * 0.02,
                            ),
                            if (_image != null)
                              const Icon(Icons.check_circle,
                                  color: Color.fromARGB(255, 255, 17, 0)),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      // Complaint Ticket Display
                      if (complaintTicket != null)
                        Center(
                          child: Text(
                            complaintTicket!,
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: primaryColor),
                          ),
                        ),
                      SizedBox(
                        height: Screens.bodyheight(context) * 0.12,
                      ),
                      // Submit Button
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: Center(
                          child: ElevatedButton(
                            onPressed: () {
                              _submitComplaint();
                              _showComplaintDialog();
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red.shade800,
                              minimumSize: const Size(360, 50),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8)),
                            ),
                            child: const Text("Register Complaint",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18)),
                          ),
                        ),
                      ),
                      // SizedBox(
                      //   height: Screens.bodyheight(context) * 0.12,
                      // ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),

      // backgroundColor: const Color.fromARGB(255, 16, 57, 122),
      // body: Container(
      //   height: Screens.fullHeight(context),
      //   child: Padding(
      //     padding: const EdgeInsets.only(top: 30, bottom: 20),
      //     child: SingleChildScrollView(
      //       // Prevents overflow when keyboard appears
      //       child: Column(
      //         children: [
      // Container(
      //   width: Screens.width(context),
      //   decoration: BoxDecoration(
      //     color: Colors.white,
      //     borderRadius:
      //         BorderRadius.only(bottomLeft: Radius.circular(50)),
      //   ),
      //   padding: const EdgeInsets.only(top: 30, bottom: 20),
      //   child: Column(
      //     children: [
      // SizedBox(height: Screens.bodyheight(context) * 0.01),
      // Row(
      //   mainAxisAlignment: MainAxisAlignment.center,
      //   children: [
      //     Image.asset('assets/Img1.png', height: 120),
      //     Image.asset('assets/CoralLogo_Outline.png',
      //         height: 100),
      //     Image.asset('assets/Img2.png', height: 130),
      //   ],
      // ),
      //       SizedBox(height: Screens.bodyheight(context) * 0.01),

      //                 Row(
      //                   mainAxisAlignment: MainAxisAlignment.center,
      //                   children: [
      //                     _buildSectionTitle("hi"),
      //                   ],
      //                 ),
      // Text(
      //   '       PRODUCT COMPLAINTS',
      //   style: TextStyle(
      //       color: Colors.red.shade700,
      //       fontWeight: FontWeight.bold,
      //       fontSize: 16),
      // ),
      // SizedBox(height: Screens.bodyheight(context) * 0.01),

      // // Dropdown Selection
      // Padding(
      //   padding: const EdgeInsets.all(8.0),
      //   child: Column(
      //     crossAxisAlignment: CrossAxisAlignment.start,
      //     children: [
      //       const Text("Select Product",
      //           style: TextStyle(
      //               fontSize: 14,
      //               fontWeight: FontWeight.bold,
      //               color: Colors.black)),
      //       const SizedBox(height: 8),
      //       Container(
      //         decoration: BoxDecoration(
      //           border:
      //               Border.all(color: greyBorder, width: 1.5),
      //           borderRadius: BorderRadius.circular(8),
      //           color: Colors.grey.shade100,
      //         ),
      //         padding:
      //             const EdgeInsets.symmetric(horizontal: 12),
      //         child: DropdownButtonFormField<String>(
      //           borderRadius: BorderRadius.circular(10),
      //           value: selectedProduct,
      //           items: products.map((product) {
      //             return DropdownMenuItem(
      //                 value: product, child: Text(product));
      //           }).toList(),
      //           onChanged: (value) {
      //             setState(() {
      //               selectedProduct = value;
      //             });
      //           },
      //           icon: const Icon(
      //             size: 25.0,
      //             Icons.arrow_drop_down,
      //             color: Colors.red,
      //           ),
      //           decoration: const InputDecoration(
      //               border: InputBorder.none,
      //               hintText: "Choose Product",
      //               hintStyle: TextStyle(color: Colors.grey)),
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
      // const SizedBox(height: 20),

      // // Complaint Input Field
      // Padding(
      //   padding: const EdgeInsets.all(8.0),
      //   child: Column(
      //     crossAxisAlignment: CrossAxisAlignment.start,
      //     children: [
      //       const Text("Enter Complaint Details",
      //           style: TextStyle(
      //               fontSize: 14,
      //               fontWeight: FontWeight.bold,
      //               color: Colors.black)),
      //       const SizedBox(height: 8),
      //       TextField(
      //         cursorColor: Colors.grey,
      //         controller: complaintController,
      //         maxLines: 3,
      //         decoration: InputDecoration(
      //           border: OutlineInputBorder(
      //               borderRadius: BorderRadius.circular(8),
      //               borderSide:
      //                   const BorderSide(color: Colors.amber)),
      //           hintText: "Describe your complaint",
      //           hintStyle: const TextStyle(color: Colors.grey),
      //           filled: true,
      //           fillColor: Colors.grey.shade100,
      //           focusedBorder: OutlineInputBorder(
      //             borderSide: const BorderSide(
      //                 color: Colors.grey, width: 1.0),
      //             borderRadius: BorderRadius.circular(8),
      //           ),
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
      // const SizedBox(height: 20),

      // // Attach Image Button
      // Padding(
      //   padding: const EdgeInsets.all(8.0),
      //   child: Row(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: [
      //       ElevatedButton.icon(
      //         onPressed: _pickImage,
      //         icon: const Icon(Icons.image,
      //             color: Color.fromARGB(255, 255, 17, 0)),
      //         label: const Text("Attach Image",
      //             style: TextStyle(
      //                 color: Color.fromARGB(255, 255, 17, 0))),
      //         style: ElevatedButton.styleFrom(
      //           minimumSize: const Size(295, 50),
      //           shape: RoundedRectangleBorder(
      //             borderRadius: BorderRadius.circular(6),
      //           ),
      //           backgroundColor: Colors.grey.shade200,
      //         ),
      //       ),
      //       if (_image != null)
      //         Icon(Icons.check_circle,
      //             color: const Color.fromARGB(255, 255, 17, 0)),
      //     ],
      //   ),
      // ),
      // const SizedBox(height: 20),

      //                 // Complaint Ticket Display
      //                 if (complaintTicket != null)
      //                   Center(
      //                     child: Text(
      //                       complaintTicket!,
      //                       style: TextStyle(
      //                           fontSize: 18,
      //                           fontWeight: FontWeight.bold,
      //                           color: primaryColor),
      //                     ),
      //                   ),
      //                 SizedBox(
      //                   height: Screens.bodyheight(context) * 0.12,
      //                 ),
      //                 // Submit Button
      //                 Padding(
      //                   padding: const EdgeInsets.only(bottom: 20),
      //                   child: Center(
      //                     child: ElevatedButton(
      //                       onPressed: () {
      //                         _submitComplaint();
      //                         _showComplaintDialog();
      //                       },
      //                       style: ElevatedButton.styleFrom(
      //                         backgroundColor: Colors.red.shade800,
      //                         minimumSize: const Size(360, 50),
      //                         shape: RoundedRectangleBorder(
      //                             borderRadius: BorderRadius.circular(8)),
      //                       ),
      //                       child: const Text("Register Complaint",
      //                           style: TextStyle(
      //                               color: Colors.white, fontSize: 18)),
      //                     ),
      //                   ),
      //                 ),
      //                 SizedBox(
      //                   height: Screens.bodyheight(context) * 0.12,
      //                 ),
      //               ],
      //             ),
      //           ),
      //         ],
      //       ),
      //     ),
      //   ),
      // ),
    );
  }

  Widget _buildSectionTitle(String title) {
    final theme = Theme.of(context);
    var groupvalue = context.read<Languagecontroller>().locale.languageCode;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
          child: Text(
            title,
            style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 255, 255, 255)),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: Screens.width(context) * 0.0,
              vertical: Screens.padingHeight(context) * 0.013),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              InkWell(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          insetPadding: const EdgeInsets.all(10),
                          contentPadding: const EdgeInsets.all(0),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                          alignment: Alignment.center,
                          content: Container(
                            // height: 300,
                            // color: Colors.amber,
                            width: Screens.width(context) * 0.1,
                            constraints: BoxConstraints(
                                maxHeight: Screens.padingHeight(context) * 0.2),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Expanded(
                                  child: ListView.builder(
                                      shrinkWrap: true,
                                      // ise:true,
                                      itemCount: LanguageModel.length,
                                      itemBuilder: (context, i) {
                                        var item = LanguageModel[i];
                                        return RadioListTile(
                                            value: item.languagecode,
                                            activeColor: theme.primaryColor,
                                            groupValue: groupvalue,
                                            title: Text(item.language!),
                                            subtitle: Text(item.sublanguage!),
                                            onChanged: (val) {
                                              groupvalue = val.toString();
                                              context
                                                  .read<Languagecontroller>()
                                                  .setlocate(Locale(
                                                      item.languagecode!));
                                              Navigator.pop(context);
                                            });
                                      }),
                                )
                              ],
                            ),
                          ),
                        );
                      });
                },
                child: Container(
                  alignment: Alignment.topRight,
                  width: Screens.width(context) * 0.30,
                  height: Screens.bodyheight(context) * 0.040,
                  // child: const Icon(
                  //   Icons.language,
                  //   color: Colors.black,
                  //   size: 30,
                  // )
                  decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      // color: const Color.fromARGB(255, 255, 255, 255),
                      border: Border.all(color: Colors.grey.shade400, width: 1),
                      borderRadius: BorderRadius.circular(6)),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: Screens.padingHeight(context) * 0.005),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'English',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                            // fontWeight: FontWeight.bold
                          ),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Icon(
                          Icons.arrow_drop_down,
                          color: Colors.red,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTextField(
    String hinttext,
    String label,
    TextEditingController controller, {
    TextInputType keyboardType = TextInputType.text,
    String? Function(String?)? validator,
    int? maxLength,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
      child: SizedBox(
        // height: 50,
        child: TextFormField(
          cursorColor: const Color.fromARGB(255, 180, 180, 180),
          controller: controller,
          keyboardType: keyboardType,
          maxLength: maxLength,
          decoration: InputDecoration(
            isDense: true,
            filled: true,
            fillColor: Colors.grey.shade100,
            labelText: label,
            // hintText: hinttext,
            labelStyle: const TextStyle(
                fontSize: 13, color: Color.fromARGB(255, 67, 67, 67)),
            counterText: "",
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 10, vertical: 9),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide:
                  const BorderSide(color: Color.fromARGB(255, 180, 180, 180)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(
                  color: Color.fromARGB(255, 180, 180, 180), width: 1),
              // backgroundColor: const Color.fromARGB(255, 1, 143, 154),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Colors.red, width: 1),
            ),
          ),
          validator: validator,
        ),
      ),
    );
  }

  /// State Dropdown with Border
  Widget _buildButtonField(
    String label, {
    String? selectedText,
    VoidCallback? onTap,
    String? errorText,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: onTap,
            child: Container(
              height: 50,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                border: Border.all(
                  color: errorText == null
                      ? const Color.fromARGB(255, 180, 180, 180)
                      : Colors.red,
                ),
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color:
                        Colors.grey.withOpacity(0.1), // Optional subtle shadow
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    selectedText ?? label,
                    style: const TextStyle(fontSize: 13),
                  ),
                  const Icon(
                    Icons.arrow_drop_down,
                    color: Colors.red,
                  ),
                ],
              ),
            ),
          ),
          if (errorText != null)
            Text(
              errorText,
              style: const TextStyle(
                color: Colors.red,
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildNotificationField(
    String label, {
    String? selectedText,
    VoidCallback? onTap,
    String? errorText,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: onTap,
            child: Container(
              // height: Screens.bodyheight(context) * 0.063,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                border: Border.all(
                    color: errorText == null
                        ? const Color.fromARGB(255, 180, 180, 180)
                        : const Color.fromARGB(255, 103, 76, 74)),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    selectedText ?? label,
                    style: const TextStyle(fontSize: 13),
                  ),
                  const Icon(Icons.arrow_drop_down),
                ],
              ),
            ),
          ),
          if (errorText != null)
            Text(errorText, style: const TextStyle(color: Colors.red)),
        ],
      ),
    );
  }
}

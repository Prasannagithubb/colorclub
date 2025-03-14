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
import 'package:provider/provider.dart';

import '../../../Service/regisservices.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final _formKey = GlobalKey<FormState>();

  String? selectedState;
  final List<String> states = [
    "California",
    "Texas",
    "New York",
    "Florida",
    "Illinois"
  ];
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
      backgroundColor: const Color.fromARGB(255, 1, 143, 154),
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          "Registration",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const SizedBox(height: 20),
              Center(
                child: Stack(
                  children: [
                    const CircleAvatar(
                      radius: 50,

                      backgroundColor: Color.fromARGB(255, 255, 255, 255),

                      foregroundColor: Colors.transparent,
                      backgroundImage: null,

                      // Wrap with Container to add border
                    ),
                    Container(
                      width: 100, // radius * 2 + border size
                      height: 100,
                      // padding: EdgeInsets.all(1), // Border thickness
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(220, 0, 0, 0),
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: const Color.fromARGB(
                              255, 255, 255, 255), // Border color
                          width: 0, // Border thickness
                        ),
                      ),
                      child: const CircleAvatar(
                        radius: 50,
                        backgroundColor: Color.fromARGB(255, 255, 255, 255),
                        backgroundImage: AssetImage('assets/UserLogofinal.png'),
                      ),
                    ),

                    // const Positioned(
                    //   bottom: 0,
                    //   right: 0,
                    //   child: CircleAvatar(
                    //     radius: 16,
                    //     backgroundColor: Colors.white,
                    //     child: Icon(Icons.camera_alt,
                    //         color: Colors.blue, size: 18),
                    //   ),
                    // ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              _buildSectionTitle(""),
              Container(
                padding: const EdgeInsets.all(18.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    _buildTextField(
                      "Full Name",
                      "Full Name",
                      fullNameController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Full Name is required';
                        }
                        if (value.length < 3) {
                          return 'Name should be at least 3 characters';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Expanded(
                          child: _buildTextField(
                            "WhatsApp No",
                            'WhatsApp No',
                            whatsappController,
                            keyboardType: TextInputType.number,
                            maxLength: 10,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'WhatsApp number required';
                              }
                              if (value.length != 10) {
                                return 'Enter a valid 10-digit number';
                              }
                              return null;
                            },
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: _buildTextField(
                            "Mobile No",
                            "Mobile No",
                            mobileController,
                            keyboardType: TextInputType.number,
                            maxLength: 10,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Mobile number required';
                              }
                              if (value.length != 10) {
                                return 'Enter a valid 10-digit number';
                              }
                              return null;
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    _buildNotificationField(
                      "Notification Via",
                      selectedText: selectedMessage,
                      onTap: () => _showNotificationPicker(context),
                      errorText: MessageError,
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Expanded(
                          child: _buildTextField(
                            "Address",
                            "Address",
                            addressController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Address is required';
                              }
                              if (value.length < 3) {
                                return 'Address should be at least 3 characters';
                              }
                              return null;
                            },
                          ),
                        ),
                        const SizedBox(width: 10),
                        SizedBox(
                          height: 50,
                          width: 120,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color.fromARGB(255, 1, 143, 154),
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(15),
                                ),
                              ),
                            ),
                            onPressed: _getCurrentLocation,
                            child: const Text(
                              "Via Google",
                              style: TextStyle(
                                fontSize: 13,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: Screens.padingHeight(context) * 0.009,
                    ),
                    _buildButtonField(
                      "State",
                      selectedText: selectedState,
                      onTap: () => _showStatePicker(context),
                      errorText: stateError,
                    ),
                    SizedBox(
                      height: Screens.padingHeight(context) * 0.009,
                    ),
                    // _buildSectionTitle("CONTACT DETAILS"),
                    _buildTextField(
                      "Email ID",
                      "Email ID",
                      emailController,
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Email is required';
                        }
                        if (!RegExp(
                                r'^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$')
                            .hasMatch(value)) {
                          return 'Enter a valid email address';
                        }
                        return null;
                      },
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: Screens.bodyheight(context) * 0.03),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          GestureDetector(
                            onTap: pickFile,
                            child: Container(
                              height: Screens.bodyheight(context) * 0.11,
                              width: Screens.width(context) * 0.2,
                              decoration: BoxDecoration(
                                image: _selectedFile != null
                                    ? DecorationImage(
                                        image: FileImage(
                                            _selectedFile!), // Display selected file
                                        fit: BoxFit.cover,
                                      )
                                    : null, // Don't show any image when file is not selected
                                border: Border.all(
                                  color: const Color.fromARGB(255, 82, 82, 82),
                                ),
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(10)),
                                color: const Color.fromARGB(255, 255, 255, 255)
                                    .withOpacity(0.8),
                              ),
                              child: _selectedFile == null
                                  ? const Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.upload_file,
                                          size: 40,
                                          color:
                                              Color.fromARGB(255, 73, 73, 73),
                                        ),
                                        Text(
                                          "Upload",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 15,
                                          ),
                                        ),
                                      ],
                                    )
                                  : null, // Hide text & icon once image is selected
                            ),
                          ),
                          GestureDetector(
                            onTap: pickImage,
                            child: Container(
                              height: Screens.bodyheight(context) * 0.11,
                              width: Screens.width(context) * 0.2,
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 255, 255, 255)
                                    .withOpacity(0.8),
                                image: _selectedImage != null
                                    ? DecorationImage(
                                        image: FileImage(_selectedImage!),
                                        fit: BoxFit
                                            .cover, // Adjust image to fit the container
                                      )
                                    : null,
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(10)),
                                border: Border.all(
                                  color: const Color.fromARGB(255, 82, 82, 82),
                                ),
                              ),
                              child: _selectedImage == null
                                  ? const Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.camera_alt,
                                          size: 40,
                                          color:
                                              Color.fromARGB(255, 73, 73, 73),
                                        ),
                                        Text(
                                          "Selfie",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 15,
                                          ),
                                        ),
                                      ],
                                    )
                                  : null, // Hide text & icon once image is selected
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: Screens.fullHeight(context) * 0.01,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 1, 143, 154),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        minimumSize: const Size(250, 50),
                      ),
                      onPressed: () {
                        log("🟢 Register Button Pressed.");
                        _saveProfile();
                      },
                      child: const Text(
                        "Register",
                        style: TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  // log("🟢 Register Button Pressed.");
//

  /// Section Title
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
              horizontal: Screens.width(context) * 0.018,
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
                                maxHeight: Screens.padingHeight(context) * 0.3),
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
                  height: Screens.fullHeight(context) * 0.040,
                  // child: const Icon(
                  //   Icons.language,
                  //   color: Colors.black,
                  //   size: 30,
                  // )
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 255, 255, 255),
                      // border: Border.all(
                      //     color: Color.fromARGB(255, 1, 101, 109), width: 3),
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: Screens.padingHeight(context) * 0.005),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Language',
                          style: TextStyle(
                              fontSize: 13,
                              color: Color.fromARGB(255, 1, 143, 154),
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Icon(
                          Icons.arrow_drop_down,
                          color: Color.fromARGB(255, 1, 143, 154),
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

  /// TextField with Border
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
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        maxLength: maxLength,
        decoration: InputDecoration(
          filled: true,
          fillColor: const Color.fromARGB(255, 245, 245, 245),
          labelText: label,
          // hintText: hinttext,
          // labelStyle: const TextStyle(color: Color.fromARGB(255, 1, 143, 154)),
          counterText: "",
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Colors.grey),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(
                color: Color.fromARGB(255, 1, 143, 154), width: 1),
            // backgroundColor: const Color.fromARGB(255, 1, 143, 154),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Colors.red, width: 1),
          ),
        ),
        validator: validator,
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
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 245, 245, 245),
                border: Border.all(
                  color: errorText == null ? Colors.grey.shade700 : Colors.red,
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
                    style: const TextStyle(fontSize: 16),
                  ),
                  const Icon(Icons.arrow_drop_down),
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
                color: const Color.fromARGB(255, 245, 245, 245),
                border: Border.all(
                    color:
                        errorText == null ? Colors.grey.shade700 : Colors.red),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    selectedText ?? label,
                    style: const TextStyle(fontSize: 16),
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

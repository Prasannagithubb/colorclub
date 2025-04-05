import 'dart:developer';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:new_one/Constant/AppConstant.dart';
import 'package:new_one/Constant/Sharedprfrence.dart';
import 'package:new_one/Models/LoginModels/ValidationModel.dart';
import 'package:new_one/Models/language_model.dart';
import 'package:new_one/Pages/homescreen/screens/home%20screen1.dart';
import 'package:new_one/Service/LoginApis/GetOtpApi.dart';
import 'package:new_one/Service/LoginApis/LoginValidateApi.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../Constant/screen.dart';
import '../../Pages/homescreen/screens/home.dart';

class LoginControllerrs extends ChangeNotifier {
  init() {
    clearAll();
    groupvalue = languageModel[0].sublanguage.toString();

    notifyListeners();
  }

  bool? locationbool = false;
  bool? tCbool = false;
  TextEditingController mobilenumberController = TextEditingController();
  TextEditingController otpController = TextEditingController();
  String groupvalue = '';

  bool? camerabool = false;
  bool? notificationbool = false;
  AudioPlayer audioPlayer = AudioPlayer();
  AudioPlayer otpAudioPlayer = AudioPlayer();

// Function to play sound
  void playAudio(String assetPath) async {
    log('assetPath::$assetPath');
    await audioPlayer.play(
      AssetSource(assetPath),
    );
    audioPlayer.onPlayerComplete.listen((event) {
      audioPlayer.play(
        AssetSource(assetPath),
      );
    });
  }

  @override
  void dispose() {
    mobilenumberController.dispose();
    otpController.dispose();
    super.dispose();
  }

  void OtpPlayAudio(String assetPath) async {
    log('assetPath::$assetPath');
    await otpAudioPlayer.play(
      AssetSource(assetPath),
    );
  }

  clearAll() {
    hidePassword = true;
    isLoading = false;
    erroMsgVisble = false;
    settingError = false;
    errorMsh = '';
    getOtp = '';
    locationbool = false;
    // groupvalue = null;
    mobilenumberController.text = '';
    otpController.text = '';
    notifyListeners();
  }

  // Config config =  Config();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  bool hidePassword = true;
  bool isLoading = false;
  bool erroMsgVisble = false;
  bool settingError = false;

  String errorMsh = '';
  static bool loginPageScrn = false;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool rememberMe = false;
  bool get getHidepassword => hidePassword;
  bool get getIsLoading => isLoading;
  bool get geterroMsgVisble => erroMsgVisble;
  bool get getsettingError => settingError;

  String get getErrorMshg => errorMsh;
  String getOtp = '';

  void obsecure() {
    hidePassword = !hidePassword;
    notifyListeners();
  }

  String errorText = '';
  callOtpApi(BuildContext context) async {
    getOtp = '';
    errorText = '';
    await GetOTPApi.getData(mobilenumberController.text.toString())
        .then((value) async {
      if (value.statusCode! >= 200 && value.statusCode! <= 210) {
        getOtp = value.data;
        audioPlayer.stop();
        await callOTPBottomSheet(context);
        notifyListeners();
      } else if (value.statusCode! >= 400 && value.statusCode! <= 410) {
        errorText = 'Something went wrong';
        notifyListeners();
      } else {}
    });
    notifyListeners();
  }

  GetValidateData? validateData;

  callOTPBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true, // Fullscreen modal behavior
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),

      builder: (context) => Padding(
        padding: EdgeInsets.only(
          bottom:
              MediaQuery.of(context).viewInsets.bottom, // Adjust for keyboard
        ),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
                color: const Color.fromARGB(255, 16, 57, 122), width: 2.0),
            borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min, // Adaptive modal size
            children: [
              Container(
                width: 50,
                height: 5,
                decoration: BoxDecoration(
                  color: Colors.grey[400],
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              const SizedBox(height: 10),
              // OTP Title
              // const SizedBox(height: 10),
              const Text(
                'OTP Verification', // Replace with your localization key S.current.otpverify
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
// getOtp
              Text(
                'Your Otp is : $getOtp', // Replace with your localization key S.current.otpverify
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              // OTP Fields
              PinCodeTextField(
                controller: otpController,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                keyboardType: TextInputType.number,
                length: 4,
                obscureText: false,
                animationType: AnimationType.fade,
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(8),
                  fieldHeight: 50,
                  fieldWidth: 50,
                  activeFillColor: Colors.white,
                  inactiveColor: Colors.grey,
                  selectedColor: Colors.blue,
                ),
                animationDuration: const Duration(milliseconds: 300),
                onChanged: (value) {
                  OtpPlayAudio('Sounds/beep-313342.mp3');
                },
                appContext: context,
                // appContext: context,
              ),

              // Instruction Text
              const Text(
                'Enter OTP ', // Replace with your localization key S.current.otpenter
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black54,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 15),

              // Buttons Row (Verify & Back)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      callValidateOtpApi(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 6, 18, 83),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text(
                      'Verify', // Replace with your localization key S.current.verify
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // Resend Code
              GestureDetector(
                onTap: () {},
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Didn\'t receive the code?', // Replace with your localization key S.current.didntrecivecode
                      style: TextStyle(
                          fontSize: 14,
                          color: Color.fromARGB(255, 6, 18, 83),
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(width: 20),
                    Text(
                      'Resend', // Replace with your localization key S.current.resend
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.red,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  callValidateOtpApi(BuildContext context) async {
    await ValidateOTPApi.getData(
            mobilenumberController.text.toString(), otpController.text)
        .then((value) async {
      if (value.statusCode! >= 200 && value.statusCode! <= 210) {
        // getOtp = value.data;
        if (otpController.text == getOtp) {
          validateData = value.data;
          SharedPref.saveMemberId(value.data!.memberId);
          String? memberid = await SharedPref.getMemberId();
          AppConstant.memberId = memberid!;
          AppConstant.userName = value.data!.memberName;
          AppConstant.userContact = value.data!.memberContact!;
          audioPlayer.stop();
          log('memberidmemberid::${value.data!.memberName}');
          Get.back();
          OtpPlayAudio("Sounds/successfinal.mp3"); // Play audio on success

          _showFinalSuccessPopup(context);
        } else {
          // ScaffoldMessenger.of(context).showSnackBar(
          //   const SnackBar(
          //     content: Text("Invalid OTP. Please try again."),
          //     backgroundColor: Colors.red,
          //   ),
          // );
          _showErrorPopup(context);
          playAudio("Sounds/Error.mp3");
        }
        // audioPlayer.stop();

        notifyListeners();
      } else if (value.statusCode! >= 400 && value.statusCode! <= 410) {
        notifyListeners();
      } else {}
    });
    notifyListeners();
  }

  void _showErrorPopup(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false, // Prevent closing without pressing the button
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: SizedBox(
            height: Screens.fullHeight(context) * 0.4,
            width: Screens.width(context) * 0.5,
            child: Padding(
              padding: EdgeInsets.symmetric(
                  vertical: Screens.padingHeight(context) * 0.03,
                  horizontal: Screens.width(context) * 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  // SUCCESS ANIMATION
                  Image.asset(
                    "assets/Error logo.png", // Green checkmark animation
                    width: 80,
                    height: 80,
                    // repeat: false,
                  ),
                  SizedBox(height: Screens.fullHeight(context) * 0.03),
                  const Text(
                    "InValid OTP",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  // const Text(
                  //   "Enter Valid OTP",
                  //   style: TextStyle(fontSize: 16, color: Colors.black54),
                  //   textAlign: TextAlign.center,
                  // ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                      //     MaterialPageRoute(
                      //         builder: (context) =>
                      //             const OtpBottomSheet())); // Close the popup
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 6, 18, 83),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text(
                      "Try Again",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void _showFinalSuccessPopup(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false, // Prevent closing without pressing the button
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // SUCCESS ANIMATION
                Lottie.asset(
                  'assets/sucess.json', // Green checkmark animation
                  width: 250,
                  repeat: false,
                ),
                const SizedBox(height: 20),
                const Text(
                  "Verification Successfull",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                const Text(
                  "Your OTP has been verified successfully.",
                  style: TextStyle(fontSize: 16, color: Colors.black54),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    audioPlayer.stop();

                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const HomeScreen())); // Close the popup
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 6, 18, 83),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    "Continue",
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  // Future<void> loadcreditials() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   mobilenumberController.text = prefs.getString('Mobilenumber') ?? '';

  //   rememberMe = prefs.getBool('rememberMe') ?? false;
  // }

  // Future<void> saveCredentials() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   if (rememberMe) {
  //     await prefs.setString('Mobilenumber', mobilenumberController.text);

  //     await prefs.setBool('rememberMe', true);
  //   } else {
  //     await prefs.remove('Mobilenumber');

  //     await prefs.setBool('rememberMe', false);
  //   }
  // }

  void handlelogin(BuildContext context) {
    if (mobilenumberController.text.isNotEmpty) {
      // saveCredentials();
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const BottomNavExample()));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Please enter Mobilenumber ')));
    }
  }
  // validateLogin(BuildContext context, ThemeData theme) async {
  //   // PermissionStatus locationStatus;

  //   //  locationStatus = await Permission.location.status;

  //   // // if (locationStatus.isGranted) {
  //   // // if(Platform.isIOS){
  //   // //   print('testLogin');
  //   // //   await checkLocation();
  //   // //   await Future.delayed(Duration(seconds: 3));
  //   // // }
  //   // if (mycontroller[3].text.toString().trim().isEmpty) {
  //   //   errorMsh = "Complete the setup..!!";
  //   // } else {
  //   //   // if (formkey.currentState!.validate()) {
  //   //   //   disableKeyBoard(context);
  //   //   //   isLoading = true;
  //   //   //   // await HelperFunctions.clearHost();
  //   //   //   String? Url = "";
  //   //   //   print("get Url Api call:" + mycontroller[3].text.toString());
  //   //   //   // await GetURLApi.getData(mycontroller[3].text.toString().trim())
  //   //   //       .then((value) async {
  //   //   //     if (value.stcode! >= 200 && value.stcode! <= 210) {
  //   //   //       if (value.url != null) {
  //   //   //         Url = value.url;
  //   //   //         log("url method::" + Url.toString());
  //   //   //         await HelperFunctions.saveHostSP(Url!.trim());
  //   //   //         await HelperFunctions.saveTenetIDSharedPreference(
  //   //   //             mycontroller[3].text.toString().trim());
  //   //   //         setURL();

  //   //   //         errorMsh = "";
  //   //   //         erroMsgVisble = false;
  //   //   //         settingError = false;
  //   //   //          validateloginfinal(context,theme);
  //   //   //         notifyListeners();
  //   //   //       } else {
  //   //   //         print("object1:" + value.exception.toString());
  //   //   //         erroMsgVisble = true;
  //   //   //         isLoading = false;
  //   //   //         validateloginfinal(context,theme);
  //   //           errorMsh = value.exception.toString();
  //   //         }
  //   //       } else {
  //   //         if (value.exception!.contains('Network is unreachable') ) {
  //   //       isLoading = false;
  //   //       erroMsgVisble = true;
  //   //       errorMsh = '';
  //   //       showpop500(context,theme);
  //   //     } else if (value.message =="Catch"){
  //   //        isLoading = false;
  //   //       erroMsgVisble = true;
  //   //       errorMsh =
  //   //           '${value.stcode!}..!!Network Issue..\nTry again Later..!!';
  //   //     }else{
  //   //        isLoading = false;
  //   //       erroMsgVisble = true;
  //   //       errorMsh =
  //   //           '${value.stcode!}..!!${value.exception!}..!!';

  //   //     }
  //   //         // print("object2:" + value.exception.toString());
  //   //         // erroMsgVisble = true;
  //   //         // isLoading = false;
  //   //         // errorMsh = value.exception.toString();
  //   //       }
  //   //     });

  //   //     //
  //   //     // await getUrlApi();

  //   //     //

  //   //     // Get.offAllNamed(ConstantRoutes.dashboard);
  //   //   }
  //   // }
  //   // } else {
  //   //   await showDialog<dynamic>(
  //   //         context: context,
  //   //         builder: (_) {
  //   //           return PermissionShowDialog(
  //   //             locationbool: locationbool,
  //   //             camerabool: camerabool,
  //   //             notificationbool: notificationbool,
  //   //           );
  //   //         }).then((value) async {
  //   //             permission = await Geolocator.checkPermission();

  //   //     });
  //   // }
  // }

  showpop500(BuildContext context, ThemeData theme) {
    showDialog(
        context: context,
        builder: (_) {
          return StatefulBuilder(builder: (context, st) {
            return AlertDialog(
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(4))),
              contentPadding: const EdgeInsets.all(0),
              insetPadding: EdgeInsets.all(Screens.bodyheight(context) * 0.02),
              content: Container(
                width: Screens.width(context) * 0.6,
                padding: const EdgeInsets.all(1),
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(10)),
                // color: Colors.amber,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      height: Screens.padingHeight(context) * 0.2,
                      width: Screens.width(context) * 0.4,
                      child: Image.asset("Assets/network-signal.png"),
                    ),
                    SizedBox(
                      height: Screens.padingHeight(context) * 0.01,
                    ),
                    Container(
                        child: Text(
                      "NO INTERNET CONNECTION",
                      style: theme.textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: theme.primaryColor),
                    )),
                    SizedBox(
                      height: Screens.padingHeight(context) * 0.01,
                    ),
                    Text(
                      "You are not connected to internet. Please connect to the internet and try again.",
                      textAlign: TextAlign.center,
                      style: theme.textTheme.bodyMedium!.copyWith(),
                    ),
                    SizedBox(
                      height: Screens.padingHeight(context) * 0.01,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          st(() {
                            Navigator.pop(context);
                          });
                        },
                        child: const Text("Ok"))
                  ],
                ),
              ),
            );
          });
        });
  }
// validateloginfinal(BuildContext context,ThemeData theme)async{
//    String? getUrl = await HelperFunctions.getHostDSP();
//          log("getUrl::"+getUrl.toString());
//    if(getUrl ==null || getUrl == 'null' ||getUrl ==''){
//      isLoading = false;
//           erroMsgVisble = true;
//          errorMsh =
//               'Invalid Customer Id..!!';
//               notifyListeners();

//          }
//          else{
//   String? fcm2 = await HelperFunctions.getFCMTokenSharedPreference();
//         if(fcm2 ==null){
//             fcm2 = (await getToken())!;
//     print("FCM Token: $fcm2");
//     await HelperFunctions.saveFCMTokenSharedPreference(fcm2);
//         }
//         String? deviceID = await HelperFunctions.getDeviceIDSharedPreference();
//  log("deviceID:::"+deviceID.toString());
//  if (deviceID == null){
//     deviceID = await Config.getdeviceId();
//       print("deviceID"+deviceID.toString());
//        await   HelperFunctions.saveDeviceIDSharedPreference(deviceID!);
//        notifyListeners();
//  }
//         LoginVerificationApi.getData(
//                 fcm2,
//                 deviceID,
//                 mycontroller[3].text.toString().trim(),
//                 3,
//                 mycontroller[0].text.toString().trim(),
//                 mycontroller[1].text.toString().trim()

//                 )
//             .then((value) async {
//               //  log("value.datalist!.devicename.toString()::"+value.datalist!.devicename.toString());
//           if (value.stcode! >= 200 && value.stcode! <= 210) {
//             if (value.status == true) {
//               await validateFinal(context,theme);
//               isLoading = false;
//               notifyListeners();
//             } else {
//               await showDialog<dynamic>(
//                   context: context,
//                   builder: (_) {
//                     return AlreadyLoginDialogbox(

//                         errormsg: '',
//                         msg: '${value.message} ${value.datalist!.devicename.toString()}',
//                         customerId: mycontroller[3].text.toString().trim(),
//                         userCode: '${mycontroller[0].text.toString().trim()}',
//                         password: '${mycontroller[1].text.toString().trim()}');
//                   }).then((value) {
//                 isLoading = false;
//                 notifyListeners();
//               });
//             }
//           } else if (value.stcode! >= 400 && value.stcode! <= 410) {
//             await showDialog<dynamic>(
//                 context: context,
//                 builder: (_) {
//                   return AlreadyLoginDialogbox(
//                       errormsg: '${value.message} ',
//                       msg: '',
//                       customerId: mycontroller[3].text.toString().trim(),
//                       userCode: '${mycontroller[0].text.toString().trim()}',
//                       password: '${mycontroller[1].text.toString().trim()}');
//                 }).then((value) {
//               isLoading = false;
//               notifyListeners();
//             });
//           } else {
//             if(value.message.contains('Network is unreachable')){
//                isLoading = false;
//               notifyListeners();
// showpop500(context,theme);
//             }else{
//  await showDialog<dynamic>(
//                 context: context,
//                 builder: (_) {
//                   return AlreadyLoginDialogbox(
//                     errormsg: '${value.stcode}..!!${value.exception}..!!',
//                     msg: '',
//                     customerId: mycontroller[3].text.toString().trim(),
//                     userCode: '${mycontroller[0].text.toString().trim()}',
//                     password: '${mycontroller[1].text.toString().trim()}',
//                   );
//                 }).then((value) {
//               isLoading = false;
//               notifyListeners();
//             });
//             }

//           }
//         });
//          }
// }
//   validateFinal(BuildContext context,ThemeData theme) async {
//     //**** */
//     //  await config.getSetup();

//     //Get URL APi

//     //Get Url Api

//     //**** */
//     log("is is is ");
//     notifyListeners();
//     PostLoginData postLoginData = new PostLoginData();
//     postLoginData.deviceCode =
//         await HelperFunctions.getDeviceIDSharedPreference();
//     postLoginData.licenseKey =
//         await HelperFunctions.getLicenseKeySharedPreference();
//     postLoginData.fcmToken =
//         await HelperFunctions.getFCMTokenSharedPreference();
//     // log("fcmmmm: "+postLoginData.fcmToken.toString());
//     postLoginData.username = mycontroller[0].text;
//     postLoginData.password = mycontroller[1].text;
//     String? model=await  Config.getdeviceModel() ;
//     String? brand=await  Config.getdeviceBrand() ;
// postLoginData. devicename='${brand} ${model}';
//     ConstantValues.tenetID = await HelperFunctions.getTenetIDSharedPreference();
//        // Config config=Config();
//   ConstantValues.dashoffer = "y";
//   log(" ConstantValues.dashoffer::"+ ConstantValues.dashoffer.toString());
//     await LoginAPi.getData(postLoginData).then((value) async {
//       if (value.resCode! >= 200 && value.resCode! <= 200) {
//         if (value.loginstatus!.toLowerCase().contains('success') &&
//             value.data != null) {
//           DashBoardController.isLogout = false;

//           isLoading = false;
//           erroMsgVisble = false;
//           errorMsh = '';
//           ConstantValues.userNamePM = mycontroller[0].text;
//           await HelperFunctions.saveUserName(mycontroller[0].text);

//           await HelperFunctions.saveLicenseKeySharedPreference(
//               value.data!.licenseKey);
//           await HelperFunctions.saveLogginUserCodeSharedPreference(
//               mycontroller[0].text);
//           // await HelperFunctions.saveSapUrlSharedPreference(
//           //     value.data!.endPointUrl);
//            await HelperFunctions.saveTokenSharedPreference(value.token!);
//           await HelperFunctions.saveTenetIDSharedPreference(
//               value.data!.tenantId);
//           await HelperFunctions.saveUserIDSharedPreference(value.data!.UserID);
//           ConstantValues.UserId = value.data!.UserID;
//           ConstantValues.Usercode = value.data!.userCode;
// ConstantValues.storeid=int.parse(value.data!.storeid.toString());
//           ConstantValues.Storecode = value.data!.storecode.toString();
//           await HelperFunctions.saveUserLoggedInSharedPreference(true);
//           await HelperFunctions.savePasswordSharedPreference(
//               mycontroller[1].text);

//           log("message");
//           // await HelperFunctions.saveuserDB(value.data!.userDB);
//           await HelperFunctions.savedbUserName(value.data!.UserID);
//           // await HelperFunctions.savedbPassword(value.data!.dbPassword);

//           await HelperFunctions.saveUserType(value.data!.userType);
//           await HelperFunctions.saveSlpCode(value.data!.slpcode);

//           mycontroller[0].clear();
//           mycontroller[1].clear();

//           final Database db = (await DBHelper.getInstance())!;
//           await DBOperation.truncateLoginVerficationDB(db);
//           List<LoginVerificationList>? loginVerifiList2 = [];
//           List<VerificationData> values = []; //DB VAriable
//           loginVerifiList2 = value.loginVerifiList; //Api data
//           //
//            if(loginVerifiList2 !=null &&  loginVerifiList2.isNotEmpty){
//  for (int i = 0; i < loginVerifiList2.length; i++) {
//             values.add(VerificationData(
//                 id: loginVerifiList2[i].id,
//                 code: loginVerifiList2[i].code,
//                 restrictionData: loginVerifiList2[i].restrictionData,
//                 restrictionType: loginVerifiList2[i].restrictionType,
//                 remarks: loginVerifiList2[i].remarks));
//           }

//           // checkLoginVerification();
//            }
//           await DBOperation.insertLoginVerifiDetails(values, db);
//          if(loginVerifiList2 !=null &&  loginVerifiList2.isNotEmpty){
// await checkLoginVerification();

//          }
//          else{
//  Get.offAllNamed(ConstantRoutes.download);
//           }

//           // Get.offAllNamed(ConstantRoutes.download);
//         } else if (value.loginstatus!.toLowerCase().contains("failed") &&
//             value.data == null) {
//           isLoading = false;
//           erroMsgVisble = true;
//           errorMsh = value.loginMsg!;
//           notifyListeners();
//         }
//       } else if (value.resCode! >= 400 && value.resCode! <= 410) {
//         erroMsgVisble = true;

//         isLoading = false;
//         errorMsh = value.excep!;
//         notifyListeners();
//       } else {
//         if (value.excep!.contains('Network is unreachable')) {
//           isLoading = false;
//           erroMsgVisble = true;
//           errorMsh = '';
//            showpop500(context,theme);
//         } else if (value.excep =="Software caused connection abort"){
//            isLoading = false;
//           erroMsgVisble = true;
//           errorMsh =
//               '${value.resCode!}..!!Software caused connection abort..!!';
//         }

//      else   {
//           isLoading = false;
//           erroMsgVisble = true;
//           errorMsh =
//               '${value.resCode!}..!!${value.excep!}';
//         }
//         notifyListeners();
//       }
//     });
//   }
//  checkLoginVerification() async {
//     final Database db = (await DBHelper.getInstance())!;
//     // Timer.periodic(const Duration(minutes: 1), (timer) async {
//       bool verifibool = false;

//       String? getUrl = await HelperFunctions.getHostDSP();
//       print("URL1:" + getUrl.toString());
//       if (getUrl != null && getUrl != 'null' && getUrl != '') {
//         List<Map<String, Object?>> VerificationDataDBData =
//             await DBOperation.getLoginVerifiDBData(db);
//         print("VerificationDataDBData bool:" +
//             VerificationDataDBData.length.toString());
// if (VerificationDataDBData.isNotEmpty) {
//   bool anyConditionSatisfied = false;

//   for (int i = 0; i < VerificationDataDBData.length; i++) {
//     print("VerificationDataDBData[i]['RestrictionType'].toString()::"+VerificationDataDBData[i]['RestrictionType'].toString());

//     if (VerificationDataDBData[i]['RestrictionType'].toString() == '1') {
//       if (VerificationDataDBData[i]['RestrictionData'].toString() == ConstantValues.ipaddress) {
//         verifibool = true;
//         anyConditionSatisfied = true;
//         break;
//       }
//     } else if (VerificationDataDBData[i]['RestrictionType'].toString() == '2') {
//            if (Platform.isAndroid) {
//                 await LocationTrack.determinePosition();
//               } else {
//                 await LocationTrack2.determinePosition();
//               }
//               List<String>? locatoindetals = await getLocation(
//                   VerificationDataDBData[i]['RestrictionData'].toString());
//               print("locatoindetals Dis:" + locatoindetals.toString());
//               // String? lat = locatoindetals[0];
//               // String? long = locatoindetals[1];
//               // String? dis = locatoindetals[2];
//               double totaldis = calculateDistance2(
//                   double.parse(locatoindetals[0]),
//                   double.parse(locatoindetals[1]),
//                   double.parse(ConstantValues.latitude.toString()),
//                   double.parse(ConstantValues.langtitude.toString()));
//               print("Total Dis:" + totaldis.toString());
//               int apiDis = int.parse(locatoindetals[2].toString());
//               if (totaldis < apiDis.toDouble()) {
//               verifibool = true;
//       anyConditionSatisfied = true;
//       break;
//               }

//     } else if (VerificationDataDBData[i]['RestrictionType'].toString() == '3') {
//       //  String ipname = ConstantValues.ipname.replaceAll('"', '');
//            if (VerificationDataDBData[i]['RestrictionData'].toString() ==
//                 ConstantValues.  ipname) {
//                 verifibool = true;
//       anyConditionSatisfied = true;
//       break;
//               }

//     }
//   }

//   if (!anyConditionSatisfied) {
//     Get.offAllNamed(ConstantRoutes.restrictionValue);
//   } else {
//     // if (RestrictionPageState.loginbool == true) {
//       Get.offAllNamed(ConstantRoutes.download);
//     // }else{
//     //    Get.offAllNamed(ConstantRoutes.login);
//     // }
//   }
// }
  // if (VerificationDataDBData.isNotEmpty) {
  //   for (int i = 0; i < VerificationDataDBData.length; i++) {
  //     if (VerificationDataDBData[i]['RestrictionType'].toString() ==
  //         '1') {
  //       if (VerificationDataDBData[i]['RestrictionData'].toString() ==
  //           ConstantValues.ipaddress) {
  //         verifibool = true;
  //          break;
  //       }
  //     }
  //      else if (VerificationDataDBData[i]['RestrictionType'].toString() ==
  //         '2') {
  //       if (Platform.isAndroid) {
  //         await LocationTrack.determinePosition();
  //       } else {
  //         await LocationTrack2.determinePosition();
  //       }
  //       List<String>? locatoindetals = await getLocation(
  //           VerificationDataDBData[i]['RestrictionData'].toString());
  //       String? lat = locatoindetals[0];
  //       String? long = locatoindetals[1];
  //       String? dis = locatoindetals[2];
  //       double totaldis = calculateDistance2(
  //           double.parse(locatoindetals[0]),
  //           double.parse(locatoindetals[1]),
  //           double.parse(ConstantValues.latitude.toString()),
  //           double.parse(ConstantValues.langtitude.toString()));
  //       print("Total Dis:" + totaldis.toString());
  //       int apiDis = int.parse(locatoindetals[2].toString());
  //       if (totaldis < apiDis.toDouble()) {
  //         verifibool = true;
  //          break;
  //       }
  //       //
  //     }
  //     else {
  //       String ipname = ConstantValues.ipname.replaceAll('"', '');
  //       if (VerificationDataDBData[i]['RestrictionData'].toString() ==
  //           ipname) {
  //         verifibool = true;
  //          break;
  //       }
  //     }
  //   }

  //   if (verifibool == false) {
  //     // await HelperFunctions.clearHost();
  //     // await DBOperation.truncateLoginVerficationDB(db);

  //     Get.offAllNamed(ConstantRoutes.restrictionValue);
  //   } else {
  //     if (RestrictionPageState.loginbool == true) {
  //     Get.offAllNamed(ConstantRoutes.dashboard);
  //     }
  //   }
  // }
  // }
  // print("verifi bool:" + verifibool.toString());
  // });
  // }
  // showShare(String deviceID) {
  //   Share.share(
  //     'Dear Sir/Madam,\n  Kindly Register My Mobile For Sellerkit App,\n My Device ID : \n $deviceID \n Thanks & Regards',
  //   );
  // }

  disableKeyBoard(BuildContext context) {
    FocusScopeNode focus = FocusScope.of(context);
    if (!focus.hasPrimaryFocus) {
      focus.unfocus();
    }
  }

  // testApi()async{
  //  await TestApi.getData();
  // }
  setTermsAConditionsValue(bool? val) {
    print(val);

    tCbool = (tCbool! == true) ? false : val;
    notifyListeners();
  }

//   getHost() async {
//     String? tenet2 = await HelperFunctions.getTenetIDSharedPreference();
//     log("tenet2::"+tenet2.toString());
//     mycontroller[2].clear();
//     mycontroller[3].clear();
//     tCbool = false;
//     await HelperFunctions.clearHost();
//     // await HelperFunctions.clearCheckedTennetIDSharedPref();
//     await HelperFunctions.clearhostIP();
//     final Database db = (await DBHelper.getInstance())!;
//     await DBOperation.truncustomerMaster(db);
//     await DBOperation.truncareItemMaster(db);
//     await DBOperation.truncareoutstandingmaste(db);
//       await DBOperation.truncareoutstandingline(db);
//     await DBOperation.truncareEnqType(db);
//     await DBOperation.truncarelevelofType(db);
//     await DBOperation.truncareparticularprice(db);
//     await DBOperation.truncareorderType(db);

//     await DBOperation.truncareCusTagType(db);
//     await DBOperation.trunstateMaster(db);
//     await DBOperation.truncareEnqReffers(db);
//     await DBOperation.truncateUserList(db);
//     await DBOperation.truncateLeadstatus(db);
//     await DBOperation.truncateOfferZone(db);
//     await DBOperation.truncateOfferZonechild1(db);
//     await DBOperation.truncateOfferZonechild2(db);
//     await DBOperation.truncatetableitemlist1(db);
//     await DBOperation.truncatetableitemlist2(db);
// //Existing Coding below
//     // String? host = await HelperFunctions.getHostDSP();
//     String? tenet = await HelperFunctions.getTenetIDSharedPreference();
//     log("tenet::"+tenet.toString());
//     if(tenet !=null && tenet.isNotEmpty){
//       mycontroller[3].text = tenet;
//        errorMsh = "";
//       erroMsgVisble = false;
//       settingError = false;
//     }else{
//       erroMsgVisble = true;
//     settingError = true;
//     errorMsh = "Complete the setup..!!";
//     notifyListeners();
//     }

//     // log("host ${host}");
//     // if (host != null) {
//     //   settingError = false;
//     //   erroMsgVisble = false;
//     //   mycontroller[2].text = host;
//     //   mycontroller[3].text = tenet!;
//     // }
//     // if (host == null) {
//     // erroMsgVisble = true;
//     // settingError = true;
//     // errorMsh = "Complete the setup..!!";
//     notifyListeners();
//     // }
//   }

  // bool progrestext = false;
  // void settingvalidate(BuildContext context) async {
  //   await checkLoc();
  //   // await  checkLocation();
  //   // await LocationTrack.determinePosition();
  //   notifyListeners();
  //   if (formkey2.currentState!.validate()) {
  //     progrestext = true;
  //     errorMsh = "";
  //     erroMsgVisble = false;
  //     settingError = false;
  //     // setURL();
  //     progrestext = false;
  //     notifyListeners();

  //     Navigator.pop(context);
  //   }
  // }

  // checkLoc() async {
  //   if (Platform.isAndroid) {
  //     await LocationTrack.determinePosition();
  //   } else {
  //     await LocationTrack2.determinePosition();
  //   } // await Future.delayed(Duration(seconds: 3));
  //   Connectivity()
  //       .onConnectivityChanged
  //       .listen((ConnectivityResult result) async {
  //     log("result:::" + result.name.toString());
  //     // Got a new connectivity status!

  //     if (result.name == 'none') {
  //       ConstantValues.ipaddress = '';
  //       ConstantValues.ipname = '';
  //     }
  //     else if (result.name == 'mobile') {
  //       if (Platform.isAndroid) {
  //         final MobileNetworkInfo mobileNetworkInfo = MobileNetworkInfo();

  //        String? name;
  //         try{
  // name = await Config.getipaddress();

  //         }catch(e){
  //           print("e"+e.toString());
  //         }
  //         // final String? name = await Config.getipaddress();

  //         // List<String>? wifiiInfo = await config.setNetwork();
  //         //
  //         final String? data = await mobileNetworkInfo.getMobileNetworkName();
  //       //   final String? datastrength = await mobileNetworkInfo.getMobileNetworkStrength();
  //       // log("datastrength:::"+datastrength.toString());
  //         //
  //         ConstantValues.ipaddress = name == null ? 'null' : name;
  //         ConstantValues.ipname = data == null ? 'null' : data;
  //       } else if (Platform.isIOS) {
  //         List<String>? wifiiInfo = await config.getIosNetworkInfo();
  //         ConstantValues.ipaddress = wifiiInfo[1];
  //         ConstantValues.ipname = wifiiInfo[0];
  //       }
  //     } else if (result.name == 'wifi') {String? name;
  //         try{
  // name = await Config.getipaddress();

  //         }catch(e){
  //           print("e"+e.toString());
  //         }
  //       //  String? name= await Config.getipaddress();
  //       List<String>? wifiiInfo = await config.setNetwork();
  //       ConstantValues.ipaddress = name == null ? 'null' : name;
  //       ConstantValues.ipname = wifiiInfo[0];
  //     }
  //     print("LocationTrack.Lat2::" + LocationTrack.Lat.toString());
  //     print("LocationTrack.Long2::" + LocationTrack.Long.toString());
  //     print("ConstantValues.lat::" + ConstantValues.latitude.toString());
  //     print("ConstantValues.lang::" + ConstantValues.langtitude.toString());
  //     ConstantValues.latitude = LocationTrack.Lat.isEmpty
  //         ? "${ConstantValues.latitude}"
  //         : '${LocationTrack.Lat}';
  //     ConstantValues.langtitude = LocationTrack.Long.isEmpty
  //         ? "${ConstantValues.langtitude}"
  //         : '${LocationTrack.Long}';
  //     //
  //     if (ConstantValues.langtitude!.isEmpty ||
  //         ConstantValues.langtitude == '') {
  //       ConstantValues.langtitude = '0.000';
  //     }
  //     if (ConstantValues.latitude!.isEmpty || ConstantValues.latitude == '') {
  //       ConstantValues.latitude = '0.000';
  //     }
  //     ConstantValues.headerSetup =
  //         "${ConstantValues.latitude};${ConstantValues.langtitude};${ConstantValues.ipname};${ConstantValues.ipaddress}";
  //     //
  //     print("Location Header::" + ConstantValues.headerSetup.toString());
  //     EncryptData enc = new EncryptData();
  //     String? encryValue = enc.encryptAES("${ConstantValues.headerSetup}");
  //     log("Encryped Location Header:::" + encryValue.toString());
  //     ConstantValues.EncryptedSetup = encryValue;
  //     log("ConstantValues.EncryptedSetup::" +
  //         ConstantValues.EncryptedSetup.toString());
  //     //  await config.getSetup();
  //   });

  // await LocationTrack.checkcamlocation();
}

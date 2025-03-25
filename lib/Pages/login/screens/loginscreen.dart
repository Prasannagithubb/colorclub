import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';
import 'package:new_one/Constant/Screen.dart';
import 'package:new_one/Constant/Sharedprfrence.dart';
import 'package:new_one/Controller/LoginController/LoginController.dart';
import 'package:new_one/Controller/logincontroller/languagecontroller.dart';
import 'package:new_one/Models/language_model.dart';
import 'package:new_one/Pages/homescreen/screens/home%20screen1.dart';
import 'package:new_one/Pages/homescreen/screens/home.dart';
import 'package:new_one/Pages/login/screens/registar3.dart';
import 'package:new_one/Pages/login/widgets/custom_elevatedBtn.dart';
import 'package:new_one/Pages/login/widgets/custom_shake_transtition.dart';
import 'package:new_one/Pages/login/widgets/forgetscreen.dart';
import 'package:new_one/generated/l10n.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Loginscreen extends StatefulWidget {
  const Loginscreen({super.key});

  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
  TextEditingController MobilenumberController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  bool rememberMe = false;
  void initstate() {
    super.initState();
    loadcreditials();
  }

  Future<void> loadcreditials() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      MobilenumberController.text = prefs.getString('Mobilenumber') ?? '';

      rememberMe = prefs.getBool('rememberMe') ?? false;
    });
  }

  Future<void> saveCredentials() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (rememberMe) {
      await prefs.setString('Mobilenumber', MobilenumberController.text);

      await prefs.setBool('rememberMe', true);
    } else {
      await prefs.remove('Mobilenumber');

      await prefs.setBool('rememberMe', false);
    }
  }

  void handlelogin() {
    if (MobilenumberController.text.isNotEmpty) {
      saveCredentials();
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const BottomNavExample()));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Please enter Mobilenumber ')));
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    var groupvalue = context.read<Languagecontroller>().locale.languageCode;
    return Scaffold(
      // backgroundColor: Colors.red.shade100,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          height: Screens.fullHeight(context),
          width: Screens.width(context),
          decoration:
              const BoxDecoration(color: Color.fromARGB(255, 16, 57, 122)),
          child: ChangeNotifierProvider<LoginController>(
            create: (context) => LoginController(context),
            builder: (context, child) {
              return Consumer<LoginController>(
                  builder: (BuildContext context, prdlog, Widget? child) {
                return Container(
                    width: Screens.width(context),
                    height: Screens.fullHeight(context),
                    // color: Colors.amber,
                    decoration: const BoxDecoration(),
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.only(
                              top: Screens.fullHeight(context) * 0.09),
                          width: Screens.width(context),
                          height: Screens.bodyheight(context) * 1.06,
                          decoration: const BoxDecoration(
                              color: Color.fromARGB(255, 255, 255, 255),
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(20),
                                  bottomRight: Radius.circular(20))
                              //borderRadius: BorderRadius.only(bottomLeft:Radius.circular( Screens.width(context)*0.2))
                              ),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            child: Form(
                              key: _formKey,
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: Screens.fullHeight(context) * 0.01,
                                  ),
                                  Container(
                                    height: Screens.fullHeight(context) * 0.23,
                                    width: Screens.width(context) * 0.43,
                                    decoration: const BoxDecoration(
                                      // color: Colors.amber,
                                      image: DecorationImage(
                                          image: AssetImage("assets/cp.png"),
                                          fit: BoxFit.fill),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                          left: Screens.width(context) * 0.065),
                                      child: const Text("Welcome to",
                                          style: TextStyle(
                                              // fontStyle: FontStyle.,
                                              fontFamily: "newasset",
                                              fontSize: 25,
                                              fontWeight: FontWeight.bold)),
                                    ),
                                  ),

                                  Container(
                                    height: Screens.bodyheight(context) * 0.33,
                                    width: Screens.width(context) * 0.75,
                                    decoration: const BoxDecoration(
                                      // color: Colors.amber,
                                      image: DecorationImage(
                                          image: AssetImage(
                                              "assets/LoginPage_Image.png"),
                                          fit: BoxFit.cover),
                                    ),
                                  ),
                                  SizedBox(
                                    height: Screens.fullHeight(context) * 0.05,
                                  ),

                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          showDialog(
                                              context: context,
                                              builder: (context) {
                                                return AlertDialog(
                                                  insetPadding:
                                                      const EdgeInsets.all(10),
                                                  contentPadding:
                                                      const EdgeInsets.all(0),
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8)),
                                                  alignment: Alignment.center,
                                                  content: Container(
                                                    // height: 300,
                                                    // color: Colors.amber,
                                                    width:
                                                        Screens.width(context) *
                                                            0.1,
                                                    constraints: BoxConstraints(
                                                        maxHeight: Screens
                                                                .padingHeight(
                                                                    context) *
                                                            0.3),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      children: [
                                                        Expanded(
                                                          child:
                                                              ListView.builder(
                                                                  shrinkWrap:
                                                                      true,
                                                                  // ise:true,
                                                                  itemCount:
                                                                      LanguageModel
                                                                          .length,
                                                                  itemBuilder:
                                                                      (context,
                                                                          i) {
                                                                    var item =
                                                                        LanguageModel[
                                                                            i];
                                                                    return RadioListTile(
                                                                        value: item
                                                                            .languagecode,
                                                                        activeColor:
                                                                            theme
                                                                                .primaryColor,
                                                                        groupValue:
                                                                            groupvalue,
                                                                        title: Text(item
                                                                            .language!),
                                                                        subtitle:
                                                                            Text(item
                                                                                .sublanguage!),
                                                                        onChanged:
                                                                            (val) {
                                                                          groupvalue =
                                                                              val.toString();
                                                                          context
                                                                              .read<Languagecontroller>()
                                                                              .setlocate(Locale(item.languagecode!));
                                                                          Navigator.pop(
                                                                              context);
                                                                        });
                                                                  }),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                );
                                              });
                                        },
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                            right:
                                                Screens.width(context) * 0.068,
                                          ),
                                          child: Container(
                                            alignment: Alignment.topRight,
                                            width: Screens.width(context) * 0.3,
                                            height:
                                                Screens.fullHeight(context) *
                                                    0.045,
                                            // child: const Icon(
                                            //   Icons.language,
                                            //   color: Colors.black,
                                            //   size: 30,
                                            // )
                                            decoration: BoxDecoration(
                                                color: const Color.fromARGB(
                                                    255, 248, 248, 248),
                                                border: Border.all(
                                                    color: const Color.fromARGB(
                                                        255, 132, 132, 132),
                                                    width: 0.5),
                                                borderRadius:
                                                    BorderRadius.circular(7)),
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(
                                                  vertical:
                                                      Screens.padingHeight(
                                                              context) *
                                                          0.01),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  const Text(
                                                    "language",
                                                    style: TextStyle(
                                                        fontSize: 15,
                                                        color: Color.fromARGB(
                                                            255, 95, 95, 95)),
                                                  ),
                                                  SizedBox(
                                                    width:
                                                        Screens.width(context) *
                                                            0.02,
                                                  ),
                                                  const Icon(
                                                    Icons.arrow_drop_down,
                                                    color: const Color.fromARGB(
                                                        255, 226, 0, 0),
                                                    size: 28,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),

                                  SizedBox(
                                      height: Screens.padingHeight(context) *
                                          0.015),

                                  CustomShakeTransition(
                                    duration: const Duration(milliseconds: 900),
                                    child: SizedBox(
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                          horizontal:
                                              Screens.width(context) * 0.065,
                                        ),
                                        child: TextFormField(
                                          inputFormatters: [
                                            LengthLimitingTextInputFormatter(10)
                                          ],
                                          onTap: () async {
                                            var name =
                                                await SharedPref.getlanguage();
                                            log("name" + name.toString());
                                          },
                                          controller: MobilenumberController,
                                          // maxLength: 10,
                                          keyboardType: TextInputType.number,
                                          style: theme.textTheme.bodyMedium,
                                          decoration: InputDecoration(
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                              borderSide: const BorderSide(
                                                  color: Color.fromARGB(
                                                      255, 131, 131, 131),
                                                  width: 0.5),
                                            ),
                                            contentPadding:
                                                const EdgeInsets.symmetric(
                                                    vertical: 10.0,
                                                    horizontal: 10.0),
                                            fillColor: const Color.fromARGB(
                                                    255, 255, 255, 255)
                                                .withOpacity(0.7),
                                            filled: true,
                                            labelText: S.current.Mobilenumber,
                                            labelStyle: const TextStyle(
                                                color: Color.fromARGB(
                                                    255, 97, 97, 97)),
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                            ),
                                          ),
                                          // validator that will display the error message if the mobile number is invalid
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return 'Please enter a mobile number';
                                            }
                                            if (value.length != 10) {
                                              return 'Mobile number must be 10 digits long';
                                            }
                                            // if (!RegExp(r'^[0-9]+$')
                                            //     .hasMatch(value)) {
                                            //   return 'Mobile number must contain only digits';
                                            // }
                                            return null;
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height:
                                        Screens.padingHeight(context) * 0.015,
                                  ),

                                  // SizedBox(
                                  //   height:
                                  //       Screens.padingHeight(context) * 0.019,
                                  // ),
                                  prdlog.tCbool == false
                                      ? Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal:
                                                  Screens.width(context) *
                                                      0.05),
                                          child: CustomSpinkitdButton(
                                            height:
                                                Screens.bodyheight(context) *
                                                    0.065,
                                            width:
                                                Screens.width(context) * 0.86,
                                            color: const Color.fromARGB(
                                                255, 226, 0, 0),
                                            onTap: () {
                                              // Check if the form is valid (validation from TextFormField)
                                              if (MobilenumberController
                                                      .text.isNotEmpty &&
                                                  MobilenumberController
                                                          .text.length ==
                                                      10) {
                                                setState(() {
                                                  showModalBottomSheet(
                                                    context: context,
                                                    isScrollControlled:
                                                        true, // Fullscreen modal behavior
                                                    shape:
                                                        const RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.vertical(
                                                              top: Radius
                                                                  .circular(
                                                                      20)),
                                                    ),
                                                    builder: (context) =>
                                                        const OtpBottomSheet(),
                                                  );
                                                });
                                              } else {
                                                if (_formKey.currentState
                                                        ?.validate() ??
                                                    false) {}
                                              }
                                            },
                                            isLoading: prdlog.isLoading,
                                            label: "Login",
                                            labelLoading: "Sending OTP...",
                                            textcolor: const Color.fromARGB(
                                                255, 255, 255, 255),
                                          ),
                                        )
                                      : CustomSpinkitdButton(
                                          // color: Colors.grey[300],
                                          onTap: () {
                                            // handlelogin();
                                          },

                                          isLoading: prdlog.isLoading,
                                          label: 'Get OTP',
                                          labelLoading: "Get OTP",
                                          textcolor: Colors.white,
                                          // labelLoading: AppLocalizations.of(context)!.signing,
                                          // label: AppLocalizations.of(context)!.sign_in,
                                        ),
                                  SizedBox(
                                      height:
                                          Screens.fullHeight(context) * 0.020),

                                  TextButton(
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const RegistarScreen()));
                                      },
                                      child: const Text(
                                        "New Register",
                                        style: TextStyle(
                                          fontSize: 19,
                                          fontWeight: FontWeight.bold,
                                          // fontWeight: FontWeight.bold,
                                          color:
                                              Color.fromARGB(255, 16, 57, 122),
                                        ),
                                      )),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ));
              });
            },
          ),
        ),
      ),
    );
  }
}

class OtpBottomSheet extends StatefulWidget {
  const OtpBottomSheet({
    super.key,
  });

  @override
  _OtpBottomSheetState createState() => _OtpBottomSheetState();
}

class _OtpBottomSheetState extends State<OtpBottomSheet> {
  TextEditingController otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom, // Adjust for keyboard
      ),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
              color: const Color.fromARGB(255, 16, 57, 122), width: 2.0),
          // color: Color.fromARGB(255, 16, 57, 122
          borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min, // Adaptive modal size
          children: [
            // Drag handle
            Container(
              width: 50,
              height: 5,
              decoration: BoxDecoration(
                color: Colors.grey[400],
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            const SizedBox(height: 10),

            // Image Placeholder
            // Container(
            //   height: 70,
            //   width: 70,
            //   decoration: BoxDecoration(
            //     color: Colors.grey[300],
            //     borderRadius: BorderRadius.circular(10),
            //   ),
            //   child: Center(
            //     child: Image.asset(
            //       "assets/cp.png",
            //       fit: BoxFit.cover,
            //     ),
            //   ),
            // ),
            // const SizedBox(height: 15),

            // OTP Title
            const SizedBox(height: 10),
            Text(S.current.otpverify,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            // OTP Fields
            PinCodeTextField(
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
              controller: otpController,
              onChanged: (value) {},
              appContext: context,
            ),

            // Instruction Text
            Text(S.current.otpenter,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 14, color: Colors.black54)),

            const SizedBox(height: 15),

            // Buttons Row (Verify & Back)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    if (otpController.text == "1234") {
                      Navigator.pop(context); // Close Bottom Sheet
                      _showFinalSuccessPopup(context);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Invalid OTP. Please try again."),
                          backgroundColor: Colors.red,
                        ),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 6, 18, 83),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(S.current.verify,
                      style: const TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.bold)),
                ),

                // ElevatedButton(
                //   onPressed: () => Navigator.pop(context), // Close Bottom Sheet
                //   style: ElevatedButton.styleFrom(
                //     backgroundColor: const Color.fromARGB(255, 6, 18, 83),
                //     padding: const EdgeInsets.symmetric(
                //         horizontal: 30, vertical: 12),
                //     shape: RoundedRectangleBorder(
                //       borderRadius: BorderRadius.circular(10),
                //     ),
                //   ),
                //   child: const Text("Back",
                //       style: TextStyle(fontSize: 16, color: Colors.white)),
                // ),
              ],
            ),

            const SizedBox(height: 20),

            // Resend Code
            GestureDetector(
              onTap: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(S.current.didntrecivecode,
                      style: const TextStyle(
                          fontSize: 14,
                          color: Color.fromARGB(255, 6, 18, 83),
                          fontWeight: FontWeight.bold)),
                  const SizedBox(width: 20),
                  Text(S.current.resend,
                      style: const TextStyle(
                          fontSize: 14,
                          color: Colors.red,
                          fontWeight: FontWeight.bold)),
                ],
              ),
            ),

            const SizedBox(height: 40),
          ],
        ),
      ),
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
                  "Verification Successful!",
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
}

class OtpBottomShee2 extends StatefulWidget {
  const OtpBottomShee2({
    super.key,
  });

  @override
  _OtpBottomShee2State createState() => _OtpBottomShee2State();
}

class _OtpBottomShee2State extends State<OtpBottomShee2> {
  TextEditingController otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom, // Adjust for keyboard
      ),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min, // Adaptive modal size
          children: [
            // Drag handle
            Container(
              width: 50,
              height: 5,
              decoration: BoxDecoration(
                color: Colors.grey[400],
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            const SizedBox(height: 10),

            const SizedBox(height: 10),
            const Text("OTP Verification",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            // OTP Fields
            PinCodeTextField(
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
              controller: otpController,
              onChanged: (value) {},
              appContext: context,
            ),

            // Instruction Text
            const Text("Enter the OTP sent to your phonee",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 14, color: Color.fromARGB(137, 0, 0, 0))),

            const SizedBox(height: 15),

            // Buttons Row (Verify & Back)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    if (otpController.text == "1234") {
                      Navigator.pop(context); // Close Bottom Sheet
                      _showFinalSuccessPopup(context);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Invalid OTP. Please try again."),
                          backgroundColor: Colors.red,
                        ),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 6, 18, 83),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text("Verifyr",
                      style: TextStyle(fontSize: 16, color: Colors.white)),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    showResetPasswordDialog(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text("Back",
                      style: TextStyle(fontSize: 16, color: Colors.white)),
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
                  Text("Didn't receive code?",
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.blue,
                          fontWeight: FontWeight.bold)),
                  Text(" Resend",
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.red,
                          fontWeight: FontWeight.bold)),
                ],
              ),
            ),

            const SizedBox(height: 40),
          ],
        ),
      ),
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
                  "Verification Successful!",
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
                    Navigator.pop(context);
                    showResetPasswordDialog(context);
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
}



// Function to show SUCCESS animation after loading




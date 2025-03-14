import 'dart:developer';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:new_one/Constant/Screen.dart';
import 'package:new_one/Constant/Sharedprfrence.dart';
import 'package:new_one/Controller/LoginController/LoginController.dart';
import 'package:new_one/Controller/logincontroller/languagecontroller.dart';
import 'package:new_one/Models/language_model.dart';
import 'package:new_one/Pages/homescreen/screens/home%20screen1.dart';
import 'package:new_one/Pages/homescreen/screens/home.dart';
import 'package:new_one/Pages/login/screens/registerscreen2.dart';
import 'package:new_one/Pages/login/widgets/custom_elevatedBtn.dart';
import 'package:new_one/Pages/login/widgets/custom_shake_transtition.dart';
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
      body:
          // Stack(children: [
          //   Positioned.fill(
          //     child: Stack(
          //       children: [
          //         Image.asset(
          //           "assets/background login2.jpg",
          //           fit: BoxFit.fitHeight,
          //         ),
          //         BackdropFilter(
          //           filter: ImageFilter.blur(
          //               sigmaX: 10, sigmaY: 10), // Adjust blur intensity
          //           child: Container(
          //             color: Colors.black
          //                 .withOpacity(0.1), // Adjust opacity for glassy effect
          //           ),
          //         ),
          //       ],
          //     ),
          //   ),
          SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          height: Screens.fullHeight(context),
          width: Screens.width(context),
          // decoration:
          //     BoxDecoration(color: const Color.fromARGB(255, 122, 141, 143)
          //         //   image: DecorationImage(
          //         // image: AssetImage("assets/background login 7.jpg"),
          //         // fit: BoxFit.fill,
          //         // )
          //         ),
          child: ChangeNotifierProvider<LoginController>(
            create: (context) => LoginController(context),
            builder: (context, child) {
              return Consumer<LoginController>(
                  builder: (BuildContext context, prdlog, Widget? child) {
                return Container(
                  width: Screens.width(context),
                  height: Screens.fullHeight(context),
                  // color: Colors.amber,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 1, 143, 154),
                    // image: DecorationImage(
                    //     image: AssetImage("assets/background login 7.jpg"),
                    //     fit: BoxFit.fill),
                  ),
                  child: Stack(
                    children: [
                      Positioned.fill(
                        child: BackdropFilter(
                          filter: ImageFilter.blur(
                              sigmaX: 10, sigmaY: 10), // Adjust blur intensity
                        ),
                      ),
                      // SizedBox(
                      //   height: Screens.padingHeight(context) * 0.2,
                      // ),
                      Center(
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical:
                                      Screens.padingHeight(context) * 0.05),
                              child: Container(
                                height: Screens.fullHeight(context) * 0.18,
                                width: Screens.width(context) * 0.5,
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          "assets/CoralLogo_Outline.png")),
                                ),
                              ),
                            ),
                            // Padding(
                            //   padding: EdgeInsets.symmetric(
                            //     horizontal: Screens.width(context) * 0.01,
                            //   ),
                            // ),
                            // SizedBox(
                            //   height: Screens.bodyheight(context) * 0.22,
                            // ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: Screens.width(context) * 0.080,
                                  vertical:
                                      Screens.padingHeight(context) * 0.017),
                              child: Row(
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
                                                      BorderRadius.circular(8)),
                                              alignment: Alignment.center,
                                              content: Container(
                                                // height: 300,
                                                // color: Colors.amber,
                                                width: Screens.width(context) *
                                                    0.1,
                                                constraints: BoxConstraints(
                                                    maxHeight:
                                                        Screens.padingHeight(
                                                                context) *
                                                            0.3),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    Expanded(
                                                      child: ListView.builder(
                                                          shrinkWrap: true,
                                                          // ise:true,
                                                          itemCount:
                                                              LanguageModel
                                                                  .length,
                                                          itemBuilder:
                                                              (context, i) {
                                                            var item =
                                                                LanguageModel[
                                                                    i];
                                                            return RadioListTile(
                                                                value: item
                                                                    .languagecode,
                                                                activeColor: theme
                                                                    .primaryColor,
                                                                groupValue:
                                                                    groupvalue,
                                                                title: Text(item
                                                                    .language!),
                                                                subtitle: Text(item
                                                                    .sublanguage!),
                                                                onChanged:
                                                                    (val) {
                                                                  groupvalue = val
                                                                      .toString();
                                                                  context
                                                                      .read<
                                                                          Languagecontroller>()
                                                                      .setlocate(
                                                                          Locale(
                                                                              item.languagecode!));
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
                                    child: Container(
                                      alignment: Alignment.topRight,
                                      width: Screens.width(context) * 0.30,
                                      height:
                                          Screens.fullHeight(context) * 0.042,
                                      // child: const Icon(
                                      //   Icons.language,
                                      //   color: Colors.black,
                                      //   size: 30,
                                      // )
                                      decoration: BoxDecoration(
                                          color: const Color.fromARGB(
                                              255, 255, 255, 255),
                                          // border: Border.all(
                                          //     color: Color.fromARGB(
                                          //         255, 1, 101, 109),
                                          // width: 3),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical:
                                                Screens.padingHeight(context) *
                                                    0.005),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              S.current.language,
                                              style: const TextStyle(
                                                  fontSize: 15,
                                                  color: Color.fromARGB(
                                                      255, 1, 101, 109),
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            SizedBox(
                                              width:
                                                  Screens.width(context) * 0.0,
                                            ),
                                            const Icon(
                                              Icons.arrow_drop_down,
                                              color: Color.fromARGB(
                                                  255, 1, 101, 109),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: Screens.width(context) * 0.99,
                              height: Screens.bodyheight(context) * 0.72,
                              decoration: const BoxDecoration(
                                  color: Color.fromARGB(225, 245, 245, 245),
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(40),
                                      topRight: Radius.circular(40))
                                  //borderRadius: BorderRadius.only(bottomLeft:Radius.circular( Screens.width(context)*0.2))
                                  ),
                              padding: const EdgeInsets.symmetric(
                                  // vertical: Screens.padingHeight(context) * 0.01,
                                  // horizontal: Screens.width(context) * 0.04
                                  ),
                              child: Form(
                                key: _formKey,
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical:
                                          Screens.padingHeight(context) * 0.05),
                                  child: Center(
                                    child: Column(
                                      children: [
                                        const Text(
                                          "Login",
                                          style: TextStyle(
                                            fontSize: 25,
                                          ),
                                        ),
                                        // Center(
                                        // child: Container(
                                        //   width: Screens.width(context) * 0.4,
                                        //   height:
                                        //       Screens.bodyheight(context) * 0.5,
                                        //   // decoration: BoxDecoration(
                                        //   //     color: Colors.amber),
                                        //   // child: Image.asset(
                                        //   //   "assets/cp.png",
                                        //   //   fit: BoxFit.fill,
                                        //   // )
                                        //   child: Padding(
                                        //     padding: EdgeInsets.symmetric(
                                        //         horizontal:
                                        //             Screens.width(context) *
                                        //                 0.09,
                                        //         vertical: Screens.bodyheight(
                                        //                 context) *
                                        //             0.02),
                                        //   ),
                                        //   ),
                                        // ),
                                        SizedBox(
                                            height:
                                                Screens.padingHeight(context) *
                                                    0.06),

                                        CustomShakeTransition(
                                          duration:
                                              const Duration(milliseconds: 900),
                                          child: SizedBox(
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(
                                                horizontal:
                                                    Screens.width(context) *
                                                        0.04,
                                              ),
                                              child: TextFormField(
                                                onTap: () async {
                                                  var name = await SharedPref
                                                      .getlanguage();
                                                  log("name" + name.toString());
                                                },
                                                controller:
                                                    MobilenumberController,
                                                maxLength: 10,
                                                keyboardType:
                                                    TextInputType.number,
                                                style:
                                                    theme.textTheme.bodyMedium,
                                                decoration: InputDecoration(
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                    borderSide: BorderSide.none,
                                                    // const BorderSide(
                                                    //     color:
                                                    //         Color.fromARGB(
                                                    //             255,
                                                    //             141,
                                                    //             38,
                                                    //             38),
                                                    //     width: 1),
                                                  ),
                                                  contentPadding:
                                                      const EdgeInsets
                                                          .symmetric(
                                                          vertical: 10.0,
                                                          horizontal: 10.0),
                                                  fillColor:
                                                      const Color.fromARGB(255,
                                                              255, 255, 255)
                                                          .withOpacity(0.7),
                                                  filled: true,
                                                  labelText:
                                                      S.current.Mobilenumber,
                                                  // labelStyle: const TextStyle(
                                                  //     color: Color.fromARGB(
                                                  //         255, 0, 0, 0)),
                                                  border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
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
                                              Screens.padingHeight(context) *
                                                  0.03,
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
                                                  height: Screens.bodyheight(
                                                          context) *
                                                      0.06,
                                                  width:
                                                      Screens.width(context) *
                                                          0.88,
                                                  color: const Color.fromARGB(
                                                      255, 1, 143, 154),
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
                                                  label: S.current.Sendotp,
                                                  labelLoading:
                                                      "Sending OTP...",
                                                  textcolor:
                                                      const Color.fromARGB(
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
                                                Screens.padingHeight(context) *
                                                    0.06),

                                        TextButton(
                                            onPressed: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          const EditProfileScreen()));
                                            },
                                            child: const Text(
                                              "Create new account?",
                                              style: TextStyle(
                                                fontSize: 17,
                                                // fontWeight: FontWeight.bold,
                                                color: Color.fromARGB(
                                                    255, 23, 46, 90),
                                              ),
                                            )),
                                        Expanded(
                                          child: Divider(
                                            color: Colors.black
                                                .withOpacity(0.2), // Line color
                                            thickness: 1, // Line thickness
                                            endIndent: 100,
                                            indent:
                                                100, // Spacing between line and text
                                          ),
                                        ),
                                        // SizedBox(
                                        //   height:
                                        //       Screens.padingHeight(context) * 0.03,
                                        // ),
                                        InkWell(
                                            onTap: () {
                                              LoginController.loginPageScrn =
                                                  true;
                                              // ForgotPasswordController.loginscrn = true;
                                              // print("LoginController.loginpage:${LoginController.loginPageScrn}");
                                              // Get.toNamed(ConstantRoutes.forgotregister);
                                            },
                                            child: const Row(
                                              children: [
                                                // Expanded(
                                                //   child: Divider(
                                                //     color: Colors.black
                                                //         .withOpacity(0.2), // Line color
                                                //     thickness: 1, // Line thickness
                                                //     endIndent:
                                                //         10, // Spacing between line and text
                                                //   ),
                                                // ),
                                                // InkWell(
                                                //   onTap: () {
                                                //     showModalBottomSheet(
                                                //       context: context,
                                                //       isScrollControlled: true,
                                                //       shape: const RoundedRectangleBorder(
                                                //         borderRadius:
                                                //             BorderRadius.vertical(
                                                //                 top: Radius.circular(20)),
                                                //       ),
                                                //       builder: (context) =>
                                                //           const OtpBottomShee2(),
                                                //     );
                                                //   },
                                                //   child: const Text(" Forgot password? ",
                                                //       style: TextStyle(
                                                //         fontSize: 12,

                                                //         color: Colors.black,
                                                //         // Optional: Change color
                                                //       )),
                                                // ),
                                                // Expanded(
                                                //   child: Divider(
                                                //     color: Colors.black
                                                //         .withOpacity(0.2), // Line color
                                                //     thickness: 1, // Line thickness
                                                //     endIndent:
                                                //         10, // Spacing between line and text
                                                //   ),
                                                // ),
                                              ],
                                            )),
                                        SizedBox(
                                          height:
                                              Screens.padingHeight(context) *
                                                  0.03,
                                        ),
                                        // InkWell(
                                        //   onTap: () {
                                        //     LoginController.loginPageScrn = true;
                                        //   },
                                        //   child: Row(
                                        //     children: [
                                        //       Expanded(
                                        //         child: Divider(
                                        //           color: Colors.black
                                        //               .withOpacity(0.2), // Line color
                                        //           thickness: 1, // Line thickness
                                        //           endIndent:
                                        //               10, // Spacing between line and text
                                        //         ),
                                        //       ),
                                        //       GestureDetector(
                                        //         onTap: () {
                                        //           log('OTP Sent');
                                        //           showModalBottomSheet(
                                        //             context: context,
                                        //             isScrollControlled:
                                        //                 true, // Fullscreen modal behavior
                                        //             shape: const RoundedRectangleBorder(
                                        //               borderRadius: BorderRadius.vertical(
                                        //                   top: Radius.circular(20)),
                                        //             ),
                                        //             builder: (context) =>
                                        //                 const OtpBottomSheet(),
                                        //           );
                                        //         },
                                        //         child: const Text(
                                        //           "Login with OTP",
                                        //           style: TextStyle(
                                        //             fontSize: 12, // Adjust font size
                                        //             color: Colors.black, // Text color
                                        //           ),
                                        //         ),
                                        //       ),
                                        //       Expanded(
                                        //         child: Divider(
                                        //           color: Colors.black
                                        //               .withOpacity(0.2), // Line color
                                        //           thickness: 1, // Line thickness
                                        //           indent:
                                        //               10, // Spacing between text and line
                                        //         ),
                                        //       ),
                                        //     ],
                                        //   ),
                                        // ),

                                        // Center(
                                        //   child: Container(
                                        //     width: Screens.width(context),
                                        //     alignment: Alignment.center,
                                        //     child: Row(
                                        //       mainAxisAlignment: MainAxisAlignment.center,
                                        //       children: [
                                        //         InkWell(
                                        //             onTap: () {
                                        //               //   Get.toNamed(ConstantRoutes.register);
                                        //             },
                                        //             child: Text("Do you have not account ")),
                                        //         InkWell(
                                        //             onTap: () {
                                        //               //  Get.toNamed(ConstantRoutes.register);
                                        //              prdlog.showShare("context");
                                        //             },
                                        //             child: Text("Register",
                                        //                 style: theme.textTheme.titleMedium
                                        //                     ?.copyWith(
                                        //                         color: theme.primaryColor))),
                                        //       ],
                                        //     ),
                                        //   ),
                                        // )

                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            InkWell(
                                                onTap: () async {
                                                  // bool res =
                                                  //     await prdlog.checkloc();
                                                  // if (res == true) {
                                                  showDialog(
                                                      context: context,
                                                      barrierDismissible: true,
                                                      builder: (BuildContext
                                                          context) {
                                                        return AlertDialog(
                                                            shape: const RoundedRectangleBorder(
                                                                borderRadius: BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            4))),
                                                            contentPadding:
                                                                const EdgeInsets
                                                                    .all(0),
                                                            insetPadding:
                                                                EdgeInsets.all(
                                                                    Screens.bodyheight(
                                                                            context) *
                                                                        0.02));
                                                        // content:
                                                        //     settings(context, prdlog));
                                                      });
                                                },
                                                child: Container(
                                                    //color: Colors.amber,
                                                    )),
                                            // Container(
                                            //   child: Text(
                                            //     ConstantValues.appversion.isEmpty
                                            //         ? "${AppConstant.version}"
                                            //         : "${ConstantValues.appversion}",
                                            //     // 'V 1.0.8',
                                            //     style: theme.textTheme.bodySmall,
                                            //   ),
                                            // ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                );
              });
            },
          ),
        ),
      ),
      // ]),
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
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min, // Adaptive modal size
          children: [
            // Drag handle
            // Container(
            //   width: Screens.width(context) * 0.02,
            //   height: Screens.bodyheight(context) * 0.04,
            //   decoration: BoxDecoration(
            //     color: const Color.fromARGB(255, 255, 255, 255),
            //     borderRadius: BorderRadius.circular(10),
            //   ),
            // ),
            // SizedBox(height: Screens.fullHeight(context) * 0.01),

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
            SizedBox(height: Screens.fullHeight(context) * 0.03),

            Text(S.current.otpverify,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: Screens.fullHeight(context) * 0.05),

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
            Text(S.current.otpenter,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 14, color: Colors.black54)),

            SizedBox(height: Screens.fullHeight(context) * 0.03),

            // Buttons Row (Verify & Back)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context); // Close Bottom Sheet
                    _showFinalSuccessPopup(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 1, 143, 154),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(S.current.verify,
                      style:
                          const TextStyle(fontSize: 16, color: Colors.white)),
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

            SizedBox(height: Screens.fullHeight(context) * 0.03),

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
                  SizedBox(width: Screens.width(context) * 0.03),
                  Text(S.current.resend,
                      style: const TextStyle(
                          fontSize: 14,
                          color: Colors.red,
                          fontWeight: FontWeight.bold)),
                ],
              ),
            ),

            SizedBox(height: Screens.fullHeight(context) * 0.03),
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
            padding: EdgeInsets.symmetric(
              horizontal: Screens.width(context) * 0.04,
              vertical: Screens.width(context) * 0.04,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // SUCCESS ANIMATION
                Lottie.asset(
                  'assets/sucess.json', // Green checkmark animation
                  width: Screens.width(context) * 0.6,

                  repeat: false,
                ),
                SizedBox(height: Screens.fullHeight(context) * 0.03),
                const Text(
                  "Verification Successful!",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: Screens.fullHeight(context) * 0.03),
                const Text(
                  "Your OTP has been verified successfully.",
                  style: TextStyle(fontSize: 16, color: Colors.black54),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: Screens.fullHeight(context) * 0.02),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const HomeScreen())); // Close the popup
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 1, 143, 154),
                    padding: EdgeInsets.symmetric(
                      horizontal: Screens.width(context) * 0.075,
                      vertical: Screens.width(context) * 0.025,
                    ),
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

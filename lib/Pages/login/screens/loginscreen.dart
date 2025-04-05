import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:new_one/Constant/Screen.dart';
import 'package:new_one/Constant/Sharedprfrence.dart';
import 'package:new_one/Controller/logincontrollerss/logincontroller.dart';
import 'package:new_one/Models/language_model.dart';
import 'package:new_one/Pages/login/screens/registar3.dart';
import 'package:new_one/Pages/login/widgets/custom_elevatedBtn.dart';
import 'package:new_one/Pages/login/widgets/custom_shake_transtition.dart';
import 'package:new_one/generated/l10n.dart';
import 'package:provider/provider.dart';

import '../../../Controller/LanguageControllers/languagecontroller.dart';

class Loginscreen extends StatefulWidget {
  const Loginscreen({super.key});

  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
  // void initstate() {
  //   super.initState();

  //   WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
  //     context.read<LoginControllerrs>().init();
  //     context.read<LoginControllerrs>().groupvalue =
  //         languageModel[0].sublanguage;
  //     log("groupvalue::::::${context.read<LoginControllerrs>().groupvalue}");
  //   });
  // }

  // // Function to play sound
  // // void playAudio(String assetPath) async {
  // //   log('assetPath::$assetPath');
  // //   await audioPlayer!.play(
  // //     AssetSource(assetPath),
  // //   );
  // //   audioPlayer!.onPlayerComplete.listen((event) {
  // //     audioPlayer!.play(
  // //       AssetSource(assetPath),
  // //     );
  // //   });
  // // }

  // @override

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<LoginControllerrs>().init();
    });
  }

  void handleSubmit() {
    // Always ensure that you're not using the controller after it's disposed
    if (mounted) {
      log('Text: ${context.read<LoginControllerrs>().mobilenumberController}');
      print(
          'Text: ${context.read<LoginControllerrs>().mobilenumberController}');
    }
  }

  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      // backgroundColor: Colors.red.shade100,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          height: Screens.fullHeight(context),
          width: Screens.width(context),
          decoration:
              const BoxDecoration(color: Color.fromARGB(255, 16, 57, 122)),
          child:

              // ChangeNotifierProvider<LoginControllerrs>(
              //   create: (context) => LoginControllerrs(context),
              //   builder: (context, child) {
              //     return Consumer<LoginControllerrs>(
              //         builder: (BuildContext context, prdlog, Widget? child) {
              //       return

              Container(
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
                          child: Column(
                            children: [
                              SizedBox(
                                height: Screens.fullHeight(context) * 0.001,
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
                                          fontSize: 28,
                                          fontWeight: FontWeight.bold)),
                                ),
                              ),

                              Container(
                                // height:
                                //     Screens.bodyheight(context) * 0.35,
                                width: Screens.width(context) * 0.75,
                                decoration: const BoxDecoration(
                                    // color: Colors.amber,
                                    ),
                                child: Image.asset(
                                    fit: BoxFit.contain,
                                    "assets/LoginPage_Image.png"),
                                // fit: BoxFit.cover,
                              ),
                              SizedBox(
                                height: Screens.fullHeight(context) * 0.05,
                              ),

                              // Container(
                              //   padding: EdgeInsets.only(
                              //       right: Screens.width(context) * 0.1),
                              //   // decoration: BoxDecoration(color: Colors.blue),
                              //   alignment: Alignment.centerRight,
                              //   child: Container(
                              //     color: Colors.blue,
                              //     child: DropdownButton(
                              //       iconEnabledColor: const Color.fromARGB(
                              //           255,
                              //           116,
                              //           60,
                              //           180), // Change the color of the dropdown icon when enabled
                              //       iconDisabledColor:
                              //           const Color.fromARGB(255, 165, 175, 55),
                              //       focusColor: Colors.amber,
                              //       value: context
                              //           .read<LoginControllerrs>()
                              //           .groupvalue,
                              //       items: languageModel
                              //           .map((item) => DropdownMenuItem<String>(
                              //                 value: item.sublanguage,
                              //                 child: Text(
                              //                   item.sublanguage.toString(),
                              //                   style: const TextStyle(
                              //                     fontSize: 14,
                              //                   ),
                              //                 ),
                              //               ))
                              //           .toList(),
                              //       onChanged: (value) {
                              //         setState(() {
                              //           context
                              //               .read<LoginControllerrs>()
                              //               .groupvalue = value!;
                              //           context
                              //               .read<Languagecontroller>()
                              //               .setlocate(Locale(context
                              //                   .read<LoginControllerrs>()
                              //                   .groupvalue!));
                              //         });
                              //       },
                              //     ),
                              //   ),
                              // ),

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
                                                          itemCount:
                                                              languageModel
                                                                  .length,
                                                          itemBuilder:
                                                              (context, i) {
                                                            var item =
                                                                languageModel[
                                                                    i];

                                                            return RadioListTile(
                                                                value: item
                                                                    .sublanguage,
                                                                activeColor: theme
                                                                    .primaryColor,
                                                                groupValue: context
                                                                    .read<
                                                                        LoginControllerrs>()
                                                                    .groupvalue,
                                                                title: Text(item
                                                                    .language!),
                                                                subtitle: Text(item
                                                                    .sublanguage!),
                                                                onChanged:
                                                                    (val) {
                                                                  setState(() {
                                                                    context
                                                                        .read<
                                                                            LoginControllerrs>()
                                                                        .groupvalue = val.toString();
                                                                    log('groupvaluegroupvalue:${context.read<LoginControllerrs>().groupvalue}');

                                                                    context
                                                                        .read<
                                                                            Languagecontroller>()
                                                                        .setlocate(
                                                                            Locale(item.languagecode!));
                                                                    Get.back();
                                                                  });
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
                                        right: Screens.width(context) * 0.068,
                                      ),
                                      child: Container(
                                        alignment: Alignment.topRight,
                                        width: Screens.width(context) * 0.3,
                                        height:
                                            Screens.fullHeight(context) * 0.04,
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
                                                    255, 172, 172, 172),
                                                width: 0.5),
                                            borderRadius:
                                                BorderRadius.circular(7)),
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: Screens.padingHeight(
                                                      context) *
                                                  0.00),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                // ise:true,
                                                context
                                                    .watch<LoginControllerrs>()
                                                    .groupvalue!,
                                                style: const TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.bold,
                                                    color: Color.fromARGB(
                                                        255, 95, 95, 95)),
                                              ),
                                              SizedBox(
                                                width: Screens.width(context) *
                                                    0.02,
                                              ),
                                              const Icon(
                                                Icons.arrow_drop_down,
                                                color: const Color.fromARGB(
                                                    255, 212, 14, 0),
                                                size: 35,
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
                                  height:
                                      Screens.padingHeight(context) * 0.015),

                              Form(
                                  key: context
                                      .watch<LoginControllerrs>()
                                      .formKey,
                                  child: Container(
                                    height: Screens.fullHeight(context) * 0.08,
                                    width: Screens.width(context) * 0.98,
                                    child: CustomShakeTransition(
                                      duration:
                                          const Duration(milliseconds: 900),
                                      child: SizedBox(
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                            horizontal:
                                                Screens.width(context) * 0.065,
                                          ),
                                          child: TextFormField(
                                            inputFormatters: [
                                              // playAudio("Sounds/Login1.mp3"),
                                              LengthLimitingTextInputFormatter(
                                                  10)
                                            ],
                                            onTap: () async {
                                              context
                                                  .read<LoginControllerrs>()
                                                  .playAudio(
                                                    "Sounds/Login_BGM(mp3cut.net).mp3",
                                                  );

                                              var name = await SharedPref
                                                  .getlanguage();
                                              log("name::$name");
                                            },
                                            controller: context
                                                .read<LoginControllerrs>()
                                                .mobilenumberController,

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
                                              errorBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                                borderSide: const BorderSide(
                                                    color: Color.fromARGB(
                                                        255, 202, 2, 2),
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
                                  )),
                              Text(
                                context
                                        .read<LoginControllerrs>()
                                        .errorText
                                        .isNotEmpty
                                    ? context
                                        .read<LoginControllerrs>()
                                        .errorText
                                    : '',
                                style: const TextStyle(color: Colors.red),
                              ),
                              SizedBox(
                                height: Screens.padingHeight(context) * 0.015,
                              ),

                              // SizedBox(
                              //   height:
                              //       Screens.padingHeight(context) * 0.019,
                              // ),
                              context.read<LoginControllerrs>().tCbool == false
                                  ? Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal:
                                              Screens.width(context) * 0.05),
                                      child: CustomSpinkitdButton(
                                        height:
                                            Screens.bodyheight(context) * 0.065,
                                        width: Screens.width(context) * 0.86,
                                        color: const Color.fromARGB(
                                            255, 226, 0, 0),
                                        onTap: () {
                                          // Check if the form is valid (validation from TextFormField)
                                          handleSubmit();
                                          if (context
                                                  .read<LoginControllerrs>()
                                                  .mobilenumberController
                                                  .text
                                                  .isNotEmpty &&
                                              context
                                                      .read<LoginControllerrs>()
                                                      .mobilenumberController
                                                      .text
                                                      .length ==
                                                  10) {
                                            setState(() {
                                              context
                                                  .read<LoginControllerrs>()
                                                  .callOtpApi(context);
                                            });
                                          } else {
                                            if (context
                                                    .read<LoginControllerrs>()
                                                    .formKey
                                                    .currentState
                                                    ?.validate() ??
                                                false) {}
                                          }
                                        },
                                        isLoading: context
                                            .read<LoginControllerrs>()
                                            .isLoading,
                                        label: "Login",
                                        labelSize: 20,
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

                                      isLoading: context
                                          .read<LoginControllerrs>()
                                          .isLoading,
                                      label: 'Get OTP',
                                      labelLoading: "Get OTP",
                                      textcolor: Colors.white,
                                      // labelLoading: AppLocalizations.of(context)!.signing,
                                      // label: AppLocalizations.of(context)!.sign_in,
                                    ),
                              // SizedBox(
                              //     height: Screens.fullHeight(context) *
                              //         0.005),

                              TextButton(
                                  onPressed: () {
                                    setState(() {
                                      context
                                          .read<LoginControllerrs>()
                                          .audioPlayer!
                                          .stop();
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const RegistarScreen()));
                                    });
                                  },
                                  child: const Text(
                                    "New Register",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      // fontWeight: FontWeight.bold,
                                      color: Color.fromARGB(255, 16, 57, 122),
                                    ),
                                  )),
                            ],
                          ),
                        ),
                      ),
                    ],
                  )),
        ),
      ),
    );
  }
}

// Ensure you import this package for audio

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:new_one/Constant/Screen.dart';
import 'package:new_one/Controller/LanguageControllers/languagecontroller.dart';
import 'package:new_one/Controller/scancontroller/scancontroller.dart';
import 'package:new_one/Pages/homescreen/screens/home%20screen1.dart';
import 'package:new_one/Pages/login/screens/loginscreen.dart';
import 'package:provider/provider.dart';

import '../../Constant/Configuration.dart';

class QRPopupScreen extends StatefulWidget {
  final String couponCode;

  const QRPopupScreen({super.key, required this.couponCode});

  @override
  State<QRPopupScreen> createState() => _QRPopupScreenState();
}

class _QRPopupScreenState extends State<QRPopupScreen> {
  @override
  void initState() {
    super.initState();

    // Use widget.couponCode inside initState()
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<Scancontroller>().init(widget.couponCode);
    });
  }

  Configure config = Configure();
  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            "Confirm Logout",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          content: const Text("Are you sure you want to log out?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close the dialog
              },
              child: const Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                log('logout');
                Navigator.pop(context); // Close the dialog
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const Loginscreen()),
                );
              },
              child: const Text("Logout", style: TextStyle(color: Colors.red)),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    var groupvalue = context.read<Languagecontroller>().locale.languageCode;
    final scanController = context.watch<Scancontroller>();
    return Scaffold(
      // backgroundColor: const Color.fromARGB(255, 6, 19, 138),
      body: Container(
        padding: const EdgeInsets.only(bottom: 30),
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 1, 53, 143),
        ),
        height: Screens.fullHeight(context),
        child: Container(
          height: Screens.fullHeight(context) * 0.01,
          padding: const EdgeInsets.only(top: 30),
          decoration: const BoxDecoration(
              color: Color.fromARGB(255, 212, 14, 0),
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20))),
          child: Column(children: [
            // const SizedBox(
            //   height: 32,
            // ),
            // User Profile Section
            Container(
              height: Screens.fullHeight(context) * 0.9285,
              width: Screens.width(context),
              decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 255, 255, 255),
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: Column(children: [
                // Container(
                //   height: Screens.padingHeight(context) * 0.15,
                //   width: Screens.width(context),
                //   decoration: const BoxDecoration(
                //       // color: Colors.amber,
                //       ),
                //   child: Image.asset("assets/cp.png"),
                // ),
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Container(
                    height: Screens.fullHeight(context) * 0.29,
                    width: Screens.width(context),
                    decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 255, 255, 255),
                        image: DecorationImage(
                            image: AssetImage('assets/ScanCouponHeader3.png'),
                            fit: BoxFit.fill)),
                  ),
                ),
                Container(
                    // height: Screens.padingHeight(context) * 0.001,
                    color: const Color.fromARGB(255, 16, 57, 122)),
                Container(
                    height: Screens.padingHeight(context) * 0.59,
                    width: Screens.width(context) * 0.88,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                          color: const Color.fromARGB(255, 132, 132, 132),
                          width: 0.5),
                    ),
                    child: Column(
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Row(
                        //     mainAxisAlignment: MainAxisAlignment.center,
                        //     children: [
                        //       InkWell(
                        //           onTap: () {
                        //             showDialog(
                        //                 context: context,
                        //                 builder: (context) {
                        //                   return AlertDialog(
                        //                     insetPadding:
                        //                         const EdgeInsets.all(10),
                        //                     contentPadding:
                        //                         const EdgeInsets.all(0),
                        //                     shape: RoundedRectangleBorder(
                        //                         borderRadius:
                        //                             BorderRadius.circular(8)),
                        //                     alignment: Alignment.center,
                        //                     content: Container(
                        //                       // height: 300,
                        //                       // color: Colors.amber,
                        //                       width:
                        //                           Screens.width(context) * 0.1,
                        //                       constraints: BoxConstraints(
                        //                           maxHeight: Screens.fullHeight(
                        //                                   context) *
                        //                               0.3),
                        //                       child: Column(
                        //                         mainAxisSize: MainAxisSize.min,
                        //                         children: [
                        //                           Expanded(
                        //                             child: ListView.builder(
                        //                                 shrinkWrap: true,
                        //                                 // ise:true,
                        //                                 itemCount: LanguageModel
                        //                                     .length,
                        //                                 itemBuilder:
                        //                                     (context, i) {
                        //                                   var item =
                        //                                       LanguageModel[i];
                        //                                   return RadioListTile(
                        //                                       value: item
                        //                                           .languagecode,
                        //                                       activeColor: theme
                        //                                           .primaryColor,
                        //                                       groupValue:
                        //                                           groupvalue,
                        //                                       title: Text(item
                        //                                           .language!),
                        //                                       subtitle: Text(item
                        //                                           .sublanguage!),
                        //                                       onChanged: (val) {
                        //                                         groupvalue = val
                        //                                             .toString();
                        //                                         context
                        //                                             .read<
                        //                                                 Languagecontroller>()
                        //                                             .setlocate(
                        //                                                 Locale(item
                        //                                                     .languagecode!));
                        //                                         Navigator.pop(
                        //                                             context);
                        //                                       });
                        //                                 }),
                        //                           )
                        //                         ],
                        //                       ),
                        //                     ),
                        //                   );
                        //                 });
                        //           },
                        //           child: Padding(
                        //             padding: const EdgeInsets.all(8.0),
                        //             child: Container(
                        //               alignment: Alignment.center,
                        //               width: Screens.width(context) * 0.3,
                        //               height:
                        //                   Screens.fullHeight(context) * 0.04,
                        //               // child: const Icon(
                        //               //   Icons.language,
                        //               //   color: Colors.black,
                        //               //   size: 30,
                        //               // )
                        //               decoration: BoxDecoration(
                        //                   color: const Color.fromARGB(
                        //                       255, 212, 14, 0),
                        //                   border: Border.all(
                        //                       color: const Color.fromARGB(
                        //                           255, 172, 172, 172),
                        //                       width: 0.5),
                        //                   borderRadius:
                        //                       BorderRadius.circular(7)),
                        //               child: Padding(
                        //                 padding: EdgeInsets.symmetric(
                        //                     vertical:
                        //                         Screens.padingHeight(context) *
                        //                             0.00),
                        //                 child: Row(
                        //                   mainAxisAlignment:
                        //                       MainAxisAlignment.center,
                        //                   children: [
                        //                     const Text(
                        //                       "English",
                        //                       style: TextStyle(
                        //                           fontSize: 16,
                        //                           fontWeight: FontWeight.bold,
                        //                           color: Color.fromARGB(
                        //                               255, 255, 255, 255)),
                        //                     ),
                        //                     SizedBox(
                        //                       width:
                        //                           Screens.width(context) * 0.02,
                        //                     ),
                        //                     const Icon(
                        //                       Icons.arrow_drop_down,
                        //                       color: Color.fromARGB(
                        //                           255, 255, 255, 255),
                        //                       size: 33,
                        //                     ),
                        //                   ],
                        //                 ),
                        //               ),
                        //             ),
                        //           ))
                        //     ]),

                        SizedBox(
                          height: Screens.padingHeight(context) * 0.01,
                        ),
                        // Container(
                        //   width: Screens.width(context) * 0.75,
                        //   child: Row(
                        //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //     children: [
                        //       Text(
                        //         'My Redeems : 2500',
                        //         style: theme.textTheme.bodyMedium
                        //             ?.copyWith(fontWeight: FontWeight.bold),
                        //       ),
                        //       Text(
                        //         'My Points : 3500',
                        //         style: theme.textTheme.bodyMedium
                        //             ?.copyWith(fontWeight: FontWeight.bold),
                        //       ),
                        //     ],
                        //   ),
                        // ),

                        Container(
                          height: Screens.padingHeight(context) * 0.19,
                          width: Screens.width(context) * 0.85,
                          decoration: BoxDecoration(
                              // color: Colors.amber,
                              borderRadius: BorderRadius.circular(8),
                              image: const DecorationImage(
                                  fit: BoxFit.fill,
                                  image:
                                      AssetImage('assets/BG_ScanPoint.png'))),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: Screens.width(context) * 0.03),
                                    child: const Column(
                                      children: [
                                        // Text(
                                        //   "3500",
                                        //   style: TextStyle(
                                        //       fontSize: 20,
                                        //       fontWeight: FontWeight.bold,
                                        //       color: Color.fromARGB(211, 0, 0, 0)),
                                        // ),
                                        Padding(
                                          padding: EdgeInsets.only(bottom: 40),
                                          child: Text(
                                            "Scaned Points",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20,
                                                color: Color.fromARGB(
                                                    255, 255, 255, 255)),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical:
                                            Screens.fullHeight(context) * 0.020,
                                        horizontal:
                                            Screens.width(context) * 0.03),
                                    child: Column(
                                      children: [
                                        Text(
                                          context
                                                  .watch<Scancontroller>()
                                                  .dataslist!
                                                  .isNotEmpty
                                              ? context
                                                  .watch<Scancontroller>()
                                                  .dataslist[0]
                                                  .points
                                                  .toString()
                                                  .substring(
                                                      0,
                                                      context
                                                                  .watch<
                                                                      Scancontroller>()
                                                                  .dataslist![0]
                                                                  .points
                                                                  .toString()
                                                                  .length >
                                                              8
                                                          ? 8
                                                          : context
                                                              .watch<
                                                                  Scancontroller>()
                                                              .dataslist![0]
                                                              .points
                                                              .toString()
                                                              .length)
                                              : '00',
                                          style: const TextStyle(
                                              fontSize: 40,
                                              fontWeight: FontWeight.bold,
                                              color: Color.fromARGB(
                                                  210, 255, 255, 255)),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        // SizedBox(),
                        // Expanded(
                        //   // color: Colors.pink,
                        //   // alignment: Alignment.topLeft,
                        //   // constraints: BoxConstraints(
                        //   //     maxHeight: Screens.padingHeight(context) * 0.3),
                        //   child: dummlist.isEmpty
                        //       ? Center(
                        //           child: Text("No Data..."),
                        //         )
                        //       : ListView.builder(
                        //           // reverse: true,
                        //           shrinkWrap: true,
                        //           padding: EdgeInsets.all(0),
                        //           itemCount: dummlist.length,
                        //           itemBuilder: (con, i) {
                        //             return Container(
                        //               padding: EdgeInsets.symmetric(
                        //                   horizontal:
                        //                       Screens.width(context) * 0.055,
                        //                   vertical:
                        //                       Screens.padingHeight(context) *
                        //                           0.001),
                        //               // color: Colors.red,
                        //               child: Container(
                        //                 padding: EdgeInsets.symmetric(
                        //                     horizontal:
                        //                         Screens.width(context) * 0.01,
                        //                     vertical:
                        //                         Screens.padingHeight(context) *
                        //                             0.01),
                        //                 decoration: BoxDecoration(
                        //                   color: dummlist[i].status == true
                        //                       ? Colors.grey[100]
                        //                       : Colors.white,
                        //                   borderRadius: BorderRadius.circular(7),
                        //                 ),
                        //                 child: Padding(
                        //                   padding: EdgeInsets.symmetric(
                        //                       horizontal:
                        //                           Screens.width(context) * 0.02),
                        //                   child: Column(
                        //                     crossAxisAlignment:
                        //                         CrossAxisAlignment.start,
                        //                     children: [
                        //                       Row(
                        //                         mainAxisAlignment:
                        //                             MainAxisAlignment
                        //                                 .spaceBetween,
                        //                         children: [
                        //                           Container(
                        //                             child: Text(
                        //                               "Scanned on",
                        //                               style: TextStyle(
                        //                                   fontSize: 17,
                        //                                   fontWeight:
                        //                                       FontWeight.bold),
                        //                             ),
                        //                           ),
                        //                           Padding(
                        //                             padding: EdgeInsets.symmetric(
                        //                                 horizontal: Screens.width(
                        //                                         context) *
                        //                                     0.02),
                        //                             child: Container(
                        //                               child: Text(
                        //                                 "${dummlist[i].date}",
                        //                                 style: TextStyle(
                        //                                   fontSize: 15,
                        //                                 ),
                        //                               ),
                        //                             ),
                        //                           ),
                        //                         ],
                        //                       ),
                        //                       SizedBox(
                        //                         height: Screens.padingHeight(
                        //                                 context) *
                        //                             0.008,
                        //                       ),
                        //                       Container(
                        //                         child: Row(
                        //                           children: [
                        //                             Text(
                        //                               "Scan Points :",
                        //                               style:
                        //                                   TextStyle(fontSize: 15),
                        //                             ),
                        //                             Text(
                        //                               "${dummlist[i].scanpoints}",
                        //                               style: TextStyle(
                        //                                   fontSize: 15,
                        //                                   color: Colors.green,
                        //                                   fontWeight:
                        //                                       FontWeight.bold),
                        //                             ),
                        //                           ],
                        //                         ),
                        //                       ),
                        //                       SizedBox(
                        //                         height: Screens.padingHeight(
                        //                                 context) *
                        //                             0.008,
                        //                       ),
                        //                       Container(
                        //                         child: Text(
                        //                           "Equivalent amount : 0.05",
                        //                           style: TextStyle(fontSize: 15),
                        //                         ),
                        //                       ),
                        //                     ],
                        //                   ),
                        //                 ),
                        //               ),
                        //             );
                        //           }),
                        // ),

                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.end,
                        //   children: [
                        //     Padding(
                        //       padding: EdgeInsets.symmetric(
                        //           horizontal: Screens.width(context) * 0.055),
                        //       child: ElevatedButton(
                        //         onPressed: () {},
                        //         child: Text(
                        //           "Continue",
                        //           style: TextStyle(
                        //               color: const Color.fromARGB(
                        //                   255, 255, 255, 255),
                        //               fontSize: 16,
                        //               fontWeight: FontWeight.bold),
                        //         ),
                        //         style: ElevatedButton.styleFrom(
                        //           backgroundColor:
                        //               const Color.fromARGB(255, 124, 124, 124),
                        //           shape: RoundedRectangleBorder(
                        //             borderRadius: BorderRadius.circular(5),
                        //             //  side: BorderSide(color: Colors.grey)
                        //           ),
                        //           minimumSize: const Size(110, 35),
                        //         ),
                        //       ),
                        //     ),
                        //   ],
                        // ),
                        // SizedBox(
                        //   height: 30,
                        // ),
                        Container(
                          height: Screens.bodyheight(context) * 0.35,
                          width: Screens.width(context) * 0.9,
                          decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(15))),
                          child: Padding(
                            padding: const EdgeInsets.all(18.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    const Text(
                                      "Coupon code:",
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 17),
                                    ),
                                    Text(
                                      context
                                                      .watch<Scancontroller>()
                                                      .apiresponsemessage !=
                                                  null &&
                                              context
                                                  .watch<Scancontroller>()
                                                  .apiresponsemessage!
                                                  .isNotEmpty
                                          ? context
                                              .watch<Scancontroller>()
                                              .apiresponsemessage! // ✅ Display API response message
                                          : (context
                                                  .watch<Scancontroller>()
                                                  .dataslist
                                                  .isNotEmpty
                                              ? context
                                                  .watch<Scancontroller>()
                                                  .dataslist[0]
                                                  .couponCode!
                                                  .substring(0,
                                                      8) // ✅ Show only first 8 characters
                                              : "No Coupon Found"), // ✅ Fallback message
                                      style: TextStyle(
                                        color: context
                                                .watch<Scancontroller>()
                                                .dataslist
                                                .isNotEmpty
                                            ? Colors
                                                .black // ✅ Black for valid coupon
                                            : Colors
                                                .red, // ✅ Red for errors or missing data
                                        fontSize: 15,
                                      ),
                                    ),

                                    // Text(

                                    //   scanController.dataslist.isNotEmpty ? scanController.dataslist![0].couponCode.toString().substring(0, scanController.dataslist![0].couponCode.toString().length > 8 ? 8 : context.watch<Scancontroller>().dataslist![0].couponCode.toString().length) : '0',
                                    //   style: const TextStyle(color: Colors.black, fontSize: 17),
                                    // )
                                  ],
                                ),
                                Row(
                                  children: [
                                    const Text(
                                      "Points:",
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 17),
                                    ),
                                    Text(
                                      context
                                              .watch<Scancontroller>()
                                              .dataslist!
                                              .isNotEmpty
                                          ? context
                                              .watch<Scancontroller>()
                                              .dataslist[0]
                                              .points
                                              .toString()
                                              .substring(
                                                  0,
                                                  context
                                                              .watch<
                                                                  Scancontroller>()
                                                              .dataslist![0]
                                                              .points
                                                              .toString()
                                                              .length >
                                                          8
                                                      ? 8
                                                      : context
                                                          .watch<
                                                              Scancontroller>()
                                                          .dataslist![0]
                                                          .points
                                                          .toString()
                                                          .length)
                                          : '0',
                                      style: const TextStyle(
                                          color: Colors.black, fontSize: 16),
                                    ),
                                    // Text("   100")
                                  ],
                                ),
                                Row(
                                  children: [
                                    const Text(
                                      "Earn Amount :",
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 17),
                                    ),
                                    Text(
                                      " ${context.watch<Scancontroller>().dataslist!.isNotEmpty ? context.watch<Scancontroller>().dataslist[0].equivalentAmount : '0'}",
                                      style: const TextStyle(
                                          color: Colors.black, fontSize: 16),
                                    ),
                                    // Text("   10")
                                  ],
                                ),
                                Row(
                                  children: [
                                    const Text(
                                      "Item name : ",
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 17),
                                    ),
                                    Text(
                                      context
                                              .watch<Scancontroller>()
                                              .dataslist!
                                              .isNotEmpty
                                          ? context
                                              .watch<Scancontroller>()
                                              .dataslist[0]
                                              .itemName
                                          : '0',
                                      style: const TextStyle(
                                          color: Colors.black, fontSize: 16),
                                    ),
                                    // Text("   Black paint 5L")
                                  ],
                                ),
                                Row(
                                  children: [
                                    const Text(
                                      "Date of MFG: ",
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 17),
                                    ),
                                    Text(
                                      context
                                              .watch<Scancontroller>()
                                              .dataslist
                                              .isNotEmpty
                                          ? config.alignDateT(context
                                              .watch<Scancontroller>()
                                              .dataslist[0]
                                              .dateOfMFG
                                              .toString())
                                          : 'No MFG Date',
                                      style: const TextStyle(
                                          color: Colors.black, fontSize: 16),
                                    ),
                                    // Text(
                                    //   "   15/03/2025",
                                    //   style: TextStyle(color: Colors.black, fontSize: 17),
                                    // )
                                  ],
                                ),
                                Row(
                                  children: [
                                    const Text(
                                      "Date of Expire : ",
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 17),
                                    ),
                                    Text(
                                      context
                                              .watch<Scancontroller>()
                                              .dataslist
                                              .isNotEmpty
                                          ? config.alignDateT(context
                                              .watch<Scancontroller>()
                                              .dataslist[0]
                                              .dateOfExpiry
                                              .toString()
                                              .split(' ')[0])
                                          : 'No Expiry Date',
                                      style: const TextStyle(
                                          color: Colors.black, fontSize: 16),
                                    ),
                                    // Text(
                                    //   "   15/09/2029",
                                    //   style: TextStyle(color: Colors.black, fontSize: 17),
                                    // )
                                  ],
                                ),
                                SizedBox(
                                  height: Screens.bodyheight(context) * 0.05,
                                  width: Screens.width(context) * 0.5,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      if (context
                                          .read<Scancontroller>()
                                          .dataslist
                                          .isNotEmpty) {
                                        context
                                            .read<Scancontroller>()
                                            .transpointapicall(
                                                int.parse(context
                                                    .read<Scancontroller>()
                                                    .dataslist[0]
                                                    .docEntry
                                                    .toString()),
                                                int.parse(context
                                                    .read<Scancontroller>()
                                                    .dataslist[0]
                                                    .points
                                                    .toString()),
                                                double.parse(context
                                                    .read<Scancontroller>()
                                                    .dataslist[0]
                                                    .equivalentAmount
                                                    .toString()));
                                      }

                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const HomeScreen()));
                                    },
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: const Color.fromARGB(
                                            255, 226, 0, 0),
                                        shape: const RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(8)))),
                                    child: const Text(
                                      "Continue",
                                      style: TextStyle(
                                          fontSize: 18, color: Colors.white),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    )),
              ]),
            ),

            //////////////////////////////////////
            // SizedBox(
            //   height: Screens.bodyheight(context) * 0.05,
            // ),

            // // y
            // SizedBox(
            //   height: Screens.bodyheight(context) * 0.05,
            // ),
            // SizedBox(
            //   height: Screens.bodyheight(context) * 0.06,
            //   width: Screens.width(context) * 0.6,
            //   child: ElevatedButton(
            //     onPressed: () {
            //       context.read<Scancontroller>().transpointapicall(
            //           int.parse(context
            //               .read<Scancontroller>()
            //               .dataslist[0]
            //               .docEntry
            //               .toString()),
            //           int.parse(context
            //               .read<Scancontroller>()
            //               .dataslist[0]
            //               .points
            //               .toString()),
            //           double.parse(context
            //               .read<Scancontroller>()
            //               .dataslist[0]
            //               .equivalentAmount
            //               .toString()));

            //       Navigator.push(context,
            //           MaterialPageRoute(builder: (context) => const Scanpoints()));
            //     },
            //     style: ElevatedButton.styleFrom(
            //         backgroundColor: const Color.fromARGB(255, 1, 143, 154),
            //         shape: const RoundedRectangleBorder(
            //             borderRadius: BorderRadius.all(Radius.circular(15)))),
            //     child: const Text(
            //       "Continue",
            //       style: TextStyle(fontSize: 18, color: Colors.white),
            //     ),
            //   ),
            // )
          ]),
        ),
      ),
    );
  }
}

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:new_one/Constant/Screen.dart';
import 'package:new_one/Controller/scancontroller/scancontroller.dart';
import 'package:new_one/Pages/homescreen/scanpoints.dart';
import 'package:new_one/Pages/login/screens/loginscreen.dart';
import 'package:provider/provider.dart';

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
    final scanController = context.watch<Scancontroller>();
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 241, 241, 241),
      body: Column(children: [
        const SizedBox(
          height: 32,
        ),
        // User Profile Section
        Container(
            height: Screens.bodyheight(context) * 0.15,
            width: Screens.width(context),
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 7, 107, 125),
            ),
            child: Row(
              children: [
                IconButton(
                  onPressed: () {
                    // Navigator.push(context,
                    //     MaterialPageRoute(builder: (context) => Scanpoints()));
                  },
                  icon: const Icon(Icons.arrow_back),
                  iconSize: 25,
                ),
                // SizedBox(
                //   width: Screens.width(context) * 0.005,
                // ),
                Container(
                  height: Screens.bodyheight(context) * 0.063,
                  width: Screens.width(context) * 0.80,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(10),
                      color: const Color.fromARGB(255, 255, 255, 255)),
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: Screens.padingHeight(context) * 0.01),
                    child: Row(
                      children: [
                        const CircleAvatar(
                          radius: 13,
                          backgroundColor: Colors.white,
                          backgroundImage: AssetImage('assets/user (1).png'),
                        ),
                        const SizedBox(width: 10),
                        const Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'User',
                              hintStyle:
                                  TextStyle(fontWeight: FontWeight.normal),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.notifications_active_outlined),
                          onPressed: () {
                            // setState(() {
                            //   log('logout');
                            //   Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) => const Loginscreen()),
                            //   );
                            // });

                            // Handle notifications
                          },
                        ),
                        IconButton(
                          color: const Color.fromARGB(255, 233, 26, 18),
                          icon: const Icon(Icons.logout),
                          onPressed: () {
                            _showLogoutDialog(context);
                            // Handle logout
                          },
                        ),
                      ],
                    ),
                  ),
                )
              ],
            )),

        SizedBox(
          height: Screens.bodyheight(context) * 0.05,
        ),

        Container(
          height: Screens.bodyheight(context) * 0.6,
          width: Screens.width(context) * 0.9,
          decoration: const BoxDecoration(
              color: Color.fromARGB(255, 255, 255, 255),
              borderRadius: BorderRadius.all(Radius.circular(15))),
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    // const Text(
                    //   "Coupon code :",
                    //   style: TextStyle(color: Colors.black, fontSize: 17),
                    // ),
                    // Text(
                    //   context.watch<Scancontroller>().exception!.isNotEmpty
                    //       ? context
                    //           .watch<Scancontroller>()
                    //           .exception! // Show error message
                    //       : "Coupon code: ${context.watch<Scancontroller>().dataslist.isNotEmpty ? context.watch<Scancontroller>().dataslist[0].couponCode : 'No data'}",
                    //   style: TextStyle(
                    //     color: context
                    //             .watch<Scancontroller>()
                    //             .exception!
                    //             .isNotEmpty
                    //         ? Colors.red
                    //         : Colors.black,
                    //     fontSize: 17,
                    //   ),
                    // ),

                    const Text(
                      "Coupon code:",
                      style: TextStyle(color: Colors.black, fontSize: 17),
                    ),
                    Text(
                      context.watch<Scancontroller>().apiresponsemessage !=
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
                                  .substring(
                                      0, 8) // ✅ Show only first 8 characters
                              : "No Coupon Found"), // ✅ Fallback message
                      style: TextStyle(
                        color: context
                                .watch<Scancontroller>()
                                .dataslist
                                .isNotEmpty
                            ? Colors.black // ✅ Black for valid coupon
                            : Colors.red, // ✅ Red for errors or missing data
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
                      style: TextStyle(color: Colors.black, fontSize: 17),
                    ),
                    Text(
                      context.watch<Scancontroller>().dataslist!.isNotEmpty
                          ? context
                              .watch<Scancontroller>()
                              .dataslist[0]
                              .points
                              .toString()
                              .substring(
                                  0,
                                  context
                                              .watch<Scancontroller>()
                                              .dataslist![0]
                                              .points
                                              .toString()
                                              .length >
                                          8
                                      ? 8
                                      : context
                                          .watch<Scancontroller>()
                                          .dataslist![0]
                                          .points
                                          .toString()
                                          .length)
                          : '0',
                      style: const TextStyle(color: Colors.black, fontSize: 16),
                    ),
                    // Text("   100")
                  ],
                ),
                Row(
                  children: [
                    const Text(
                      "Earn Amount :",
                      style: TextStyle(color: Colors.black, fontSize: 17),
                    ),
                    Text(
                      " ${context.watch<Scancontroller>().dataslist!.isNotEmpty ? context.watch<Scancontroller>().dataslist[0].equivalentAmount : '0'}",
                      style: const TextStyle(color: Colors.black, fontSize: 16),
                    ),
                    // Text("   10")
                  ],
                ),
                Row(
                  children: [
                    const Text(
                      "Item name : ",
                      style: TextStyle(color: Colors.black, fontSize: 17),
                    ),
                    Text(
                      context.watch<Scancontroller>().dataslist!.isNotEmpty
                          ? context
                              .watch<Scancontroller>()
                              .dataslist[0]
                              .itemName
                          : '0',
                      style: const TextStyle(color: Colors.black, fontSize: 16),
                    ),
                    // Text("   Black paint 5L")
                  ],
                ),
                Row(
                  children: [
                    const Text(
                      "Date of Packed: ",
                      style: TextStyle(color: Colors.black, fontSize: 17),
                    ),
                    Text(
                      context.watch<Scancontroller>().dataslist.isNotEmpty
                          ? DateFormat('yyyy-MM-dd').format(context
                              .watch<Scancontroller>()
                              .dataslist![0]
                              .dateOfMFG)
                          : 'No Packed Date',
                      style: const TextStyle(color: Colors.black, fontSize: 16),
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
                      style: TextStyle(color: Colors.black, fontSize: 17),
                    ),
                    Text(
                      context.watch<Scancontroller>().dataslist!.isNotEmpty
                          ? "${context.watch<Scancontroller>().dataslist![0].dateOfExpiry.toLocal()}"
                              .split(' ')[0]
                          : 'No Expiry Date',
                      style: const TextStyle(color: Colors.black, fontSize: 16),
                    ),
                    // Text(
                    //   "   15/09/2029",
                    //   style: TextStyle(color: Colors.black, fontSize: 17),
                    // )
                  ],
                )
              ],
            ),
          ),
        ),
        SizedBox(
          height: Screens.bodyheight(context) * 0.05,
        ),
        SizedBox(
          height: Screens.bodyheight(context) * 0.06,
          width: Screens.width(context) * 0.6,
          child: ElevatedButton(
            onPressed: () {
              context.read<Scancontroller>().transpointapicall(
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

              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Scanpoints()));
            },
            style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 1, 143, 154),
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15)))),
            child: const Text(
              "Continue",
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
          ),
        )
      ]),
    );
  }
}

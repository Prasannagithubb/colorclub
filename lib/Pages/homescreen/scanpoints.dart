import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:new_one/Constant/ConstantRoutes.dart';
import 'package:new_one/Constant/Screen.dart';
import 'package:new_one/Pages/login/screens/loginscreen.dart';

class Scanpoints extends StatefulWidget {
  const Scanpoints({super.key});

  @override
  State<Scanpoints> createState() => _ScanpointsState();
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

class _ScanpointsState extends State<Scanpoints> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 240, 240, 240),
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
                    setState(() {
                      Get.toNamed(ConstantRoutes.home);
                    });
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => const QRPopupScreen()));
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
        // SizedBox(height: Screens.padingHeight(context) * 0.02),

        Container(
          height: Screens.bodyheight(context) * 0.25,
          // width: Screens.width(context) * 0.93,
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 7, 107, 125),
          ),
          child: Container(
            height: Screens.bodyheight(context) * 0.25,
            // width: Screens.width(context) * 0.93,
            decoration: const BoxDecoration(
                color: Color.fromARGB(255, 255, 255, 255),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
                image: DecorationImage(
                    image: AssetImage("assets/5.jpg"), fit: BoxFit.fill)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: Screens.fullHeight(context) * 0.01,
                          horizontal: Screens.width(context) * 0.04),
                      child: const Text(
                        "User Points",
                        style: TextStyle(
                            color: Color.fromARGB(160, 255, 38, 0),
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                // SizedBox(
                //   height: Screens.bodyheight(context) * 0.02,
                // ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: Screens.fullHeight(context) * 0.01,
                      horizontal: Screens.width(context) * 0.04),
                  child: const Text(
                    "\$2600",
                    style: TextStyle(
                        color: Color.fromARGB(226, 255, 255, 255),
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
          ),
        ),
        SizedBox(height: Screens.padingHeight(context) * 0.02),
        // Container(
        //   height: Screens.bodyheight(context),
        //   width: Screens.width(context),decoration: BoxDecoration(
        //     color: Colors.
        //   ),
        // ),
        Container(
            height: Screens.bodyheight(context) * 0.19,
            width: Screens.width(context) * 0.93,
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 255, 255, 255),
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            child: Column(
              children: [
                // First Container
                redeemcards(
                  name: 'Earn Points History',
                  shortname: 'Track All Points',
                  iconimage: 'assets/2.jpg',
                ),
                redeemcards(
                  name: 'points to cash or paints',
                  shortname: 'Redeem to Whitegoods',
                  iconimage: 'assets/2.jpg',
                ),
              ],
            )),
        SizedBox(height: Screens.padingHeight(context) * 0.02),
        Container(
          height: Screens.bodyheight(context) * 0.27,
          width: Screens.width(context) * 0.93,
          decoration: const BoxDecoration(
              color: Color.fromARGB(255, 255, 255, 255),
              borderRadius: BorderRadius.all(Radius.circular(20))),
          child: Column(
            children: [
              redeemcards(
                name: 'Earn Points History',
                shortname: 'Track All Points',
                iconimage: 'assets/2.jpg',
              ),
              redeemcards(
                name: 'Track All Points',
                shortname: 'Redeem Points History',
                iconimage: 'assets/3.jpg',
              ),
              redeemcards(
                name: 'Benifits of all tier',
                shortname: 'View Benifits',
                iconimage: 'assets/2.jpg',
              ),
              // Container(
              //   height: Screens.bodyheight(context) * 0.09,
              //   width: Screens.width(context) * 0.93,
              //   decoration: const BoxDecoration(
              //       // color: Colors.amber,
              //       borderRadius: BorderRadius.all(Radius.circular(20))),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceAround,
              //     children: [
              //       CircleAvatar(
              //         radius: 25,
              //         backgroundColor: const Color.fromARGB(255, 255, 247, 203),
              //         // backgroundImage:
              //         //     AssetImage("assets/redeme cash icon.png"),
              //         child: Image.asset(
              //           "assets/graph.png",
              //           width: 30, // Adjust this to resize the image
              //           height: 30, // Adjust this to resize the image
              //           fit: BoxFit.cover, // Ensures the image scales correctly
              //         ),
              //       ),
              //       const Column(
              //         crossAxisAlignment: CrossAxisAlignment.start,
              //         mainAxisAlignment: MainAxisAlignment.center,
              //         children: [
              //           Text(
              //             "Earn Points History",
              //             style: TextStyle(
              //               fontSize: 20,
              //               fontWeight: FontWeight.bold,
              //             ),
              //           ),
              //           Text(
              //             "Track All Points",
              //             style: TextStyle(
              //               color: Color.fromARGB(255, 212, 212, 212),
              //               fontSize: 18,
              //             ),
              //           )
              //         ],
              //       ),
              //       IconButton(
              //           onPressed: () {},
              //           icon: const Icon(Icons.arrow_forward_ios))
              //     ],
              //   ),
              // ),
              // Container(
              //   height: Screens.bodyheight(context) * 0.09,
              //   width: Screens.width(context) * 0.93,
              //   decoration: const BoxDecoration(
              //       // color: const Color.fromARGB(255, 52, 182, 19),
              //       borderRadius: BorderRadius.all(Radius.circular(20))),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceAround,
              //     children: [
              //       CircleAvatar(
              //         radius: 25,
              //         backgroundColor: const Color.fromARGB(255, 255, 247, 203),
              //         // backgroundImage:
              //         //     AssetImage("assets/redeme cash icon.png"),
              //         child: Image.asset(
              //           "assets/badge.png",
              //           width: 30, // Adjust this to resize the image
              //           height: 30, // Adjust this to resize the image
              //           fit: BoxFit.cover, // Ensures the image scales correctly
              //         ),
              //       ),
              //       const Column(
              //         crossAxisAlignment: CrossAxisAlignment.start,
              //         mainAxisAlignment: MainAxisAlignment.center,
              //         children: [
              //           Text(
              //             "Redeem Points History",
              //             style: TextStyle(
              //               fontSize: 20,
              //               fontWeight: FontWeight.bold,
              //             ),
              //           ),
              //           Text(
              //             "Track All Points",
              //             style: TextStyle(
              //               color: Color.fromARGB(255, 212, 212, 212),
              //               fontSize: 18,
              //             ),
              //           )
              //         ],
              //       ),
              //       IconButton(
              //           onPressed: () {},
              //           icon: const Icon(Icons.arrow_forward_ios))
              //     ],
              //   ),
              // ),
              // Container(
              //   height: Screens.bodyheight(context) * 0.09,
              //   width: Screens.width(context) * 0.93,
              //   decoration: const BoxDecoration(
              //       // color: const Color.fromARGB(255, 52, 182, 19),
              //       borderRadius: BorderRadius.all(Radius.circular(20))),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceAround,
              //     children: [
              //       CircleAvatar(
              //         radius: 25,
              //         backgroundColor: const Color.fromARGB(255, 255, 247, 203),
              //         // backgroundImage:
              //         //     AssetImage("assets/redeme cash icon.png"),
              //         child: Image.asset(
              //           "assets/gift.png",
              //           width: 30, // Adjust this to resize the image
              //           height: 30, // Adjust this to resize the image
              //           fit: BoxFit.cover, // Ensures the image scales correctly
              //         ),
              //       ),
              //       const Column(
              //         crossAxisAlignment: CrossAxisAlignment.start,
              //         mainAxisAlignment: MainAxisAlignment.center,
              //         children: [
              //           Text(
              //             "View Benifits",
              //             style: TextStyle(
              //               fontSize: 20,
              //               fontWeight: FontWeight.bold,
              //             ),
              //           ),
              //           Text(
              //             "Benifits of all tier",
              //             style: TextStyle(
              //               color: Color.fromARGB(255, 212, 212, 212),
              //               fontSize: 18,
              //             ),
              //           )
              //         ],
              //       ),
              //       IconButton(
              //           onPressed: () {},
              //           icon: const Icon(Icons.arrow_forward_ios))
              //     ],
              //   ),
              // ),
            ],
          ),
        ),
        // ElevatedButton(
        //     onPressed: () {
        //       // Navigator.push(
        //       //     context,
        //       //     MaterialPageRoute(
        //       //         builder: (context) => MyTransactionscreen()));
        //     },
        //     child: Text("transactionpage")),
      ]),
    );
  }
}

class redeemcards extends StatelessWidget {
  String name;
  String shortname;
  String iconimage;

  redeemcards(
      {super.key,
      required this.name,
      required this.shortname,
      required this.iconimage});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Screens.bodyheight(context) * 0.09,
      width: Screens.width(context) * 0.93,
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 255, 255, 255),
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Column(
        children: [
          // First Container
          Container(
            height: Screens.bodyheight(context) * 0.075,
            width: Screens.width(context) * 0.93,
            decoration: const BoxDecoration(
              // color: Colors.amber,
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(width: 20),
                CircleAvatar(
                  radius: 25,
                  backgroundColor: const Color.fromARGB(255, 247, 247, 247),
                  child: Image.asset(
                    iconimage,
                    width: 30,
                    height: 30,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  // Added Expanded here to ensure the text takes available space
                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start, // Ensures left alignment
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        name,
                        style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      Text(
                        shortname,
                        style: const TextStyle(
                          color: Color.fromARGB(255, 177, 177, 177),
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: () {}, // Add action here if needed
                  icon: const Icon(Icons.arrow_forward_ios),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

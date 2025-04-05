// import 'package:flutter/material.dart';
// import 'package:new_one/Constant/Screen.dart';
// import 'package:new_one/Controller/logincontroller/languagecontroller.dart';
// import 'package:new_one/Controller/redeemcontroller/remaincontroller.dart';
// import 'package:new_one/Models/language_model.dart';
// import 'package:provider/provider.dart';

// class RedeemPointsScreen extends StatefulWidget {
//   const RedeemPointsScreen({super.key});

//   @override
//   _RedeemPointsScreenState createState() => _RedeemPointsScreenState();
// }

// class _RedeemPointsScreenState extends State<RedeemPointsScreen> {
//   int userPoints = 3500;
//   int redemptionThreshold = 10000;

//   @override
//   void initState() {
//     super.initState();
//     WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
//       adddata();
//     });
//   }

//   adddata() {
//     setState(() {
//       dummlist = [
//         dummydata(
//             amount: "amount",
//             date: "12-04-2025",
//             name: "ss",
//             status: false,
//             scanpoints: 100),
//         dummydata(
//             amount: "amount",
//             date: "12-04-2025",
//             name: "ss",
//             status: true,
//             scanpoints: 200),
//         dummydata(
//             amount: "amount",
//             date: "12-04-2025",
//             name: 'name',
//             status: false,
//             scanpoints: 300),
//         dummydata(
//             amount: "amount",
//             date: "12-04-2025",
//             name: "ss",
//             status: true,
//             scanpoints: 200),
//       ];
//     });
//   }

//   List<dummydata> dummlist = [];
//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);
//     var groupvalue = context.read<Languagecontroller>().locale.languageCode;
//     return Scaffold(
//         backgroundColor: Color.fromARGB(255, 16, 57, 122),
//         // appBar: AppBar(
//         //   title: const Text("Redeem Points"),
//         //   backgroundColor: Colors.teal,
//         //   centerTitle: true,
//         // ),
//         body: Padding(
//           padding: EdgeInsets.symmetric(
//               vertical: Screens.padingHeight(context) * 0.04),
//           child: Container(
//             height: Screens.fullHeight(context) * 0.973,
//             width: Screens.width(context),
//             decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.all(Radius.circular(20))),
//             child: Column(children: [
//               // Container(
//               //   height: Screens.padingHeight(context) * 0.15,
//               //   width: Screens.width(context),
//               //   decoration: const BoxDecoration(
//               //       // color: Colors.amber,
//               //       ),
//               //   child: Image.asset("assets/cp.png"),
//               // ),
//               Padding(
//                 padding: EdgeInsets.only(top: 15),
//                 child: Container(
//                   height: Screens.fullHeight(context) * 0.29,
//                   width: Screens.width(context),
//                   decoration: const BoxDecoration(
//                       color: Color.fromARGB(255, 255, 255, 255),
//                       image: DecorationImage(
//                           image: AssetImage('assets/ScanCouponHeader3.png'),
//                           fit: BoxFit.fill)),
//                 ),
//               ),
//               Container(
//                   // height: Screens.padingHeight(context) * 0.001,
//                   color: Color.fromARGB(255, 16, 57, 122)),
//               Container(
//                   height: Screens.padingHeight(context) * 0.63,
//                   width: Screens.width(context) * 0.88,
//                   decoration: BoxDecoration(
//                     color: Colors.grey.shade200,
//                     borderRadius: BorderRadius.circular(8),
//                     border: Border.all(
//                         color: const Color.fromARGB(255, 132, 132, 132),
//                         width: 0.5),
//                   ),
//                   child: Column(
//                     // crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             InkWell(
//                                 onTap: () {
//                                   showDialog(
//                                       context: context,
//                                       builder: (context) {
//                                         return AlertDialog(
//                                           insetPadding:
//                                               const EdgeInsets.all(10),
//                                           contentPadding:
//                                               const EdgeInsets.all(0),
//                                           shape: RoundedRectangleBorder(
//                                               borderRadius:
//                                                   BorderRadius.circular(8)),
//                                           alignment: Alignment.center,
//                                           content: Container(
//                                             // height: 300,
//                                             // color: Colors.amber,
//                                             width: Screens.width(context) * 0.1,
//                                             constraints: BoxConstraints(
//                                                 maxHeight: Screens.fullHeight(
//                                                         context) *
//                                                     0.3),
//                                             child: Column(
//                                               mainAxisSize: MainAxisSize.min,
//                                               children: [
//                                                 Expanded(
//                                                   child: ListView.builder(
//                                                       shrinkWrap: true,
//                                                       // ise:true,
//                                                       itemCount:
//                                                           LanguageModel.length,
//                                                       itemBuilder:
//                                                           (context, i) {
//                                                         var item =
//                                                             LanguageModel[i];
//                                                         return RadioListTile(
//                                                             value: item
//                                                                 .languagecode,
//                                                             activeColor: theme
//                                                                 .primaryColor,
//                                                             groupValue:
//                                                                 groupvalue,
//                                                             title: Text(
//                                                                 item.language!),
//                                                             subtitle: Text(item
//                                                                 .sublanguage!),
//                                                             onChanged: (val) {
//                                                               groupvalue = val
//                                                                   .toString();
//                                                               context
//                                                                   .read<
//                                                                       Languagecontroller>()
//                                                                   .setlocate(
//                                                                       Locale(item
//                                                                           .languagecode!));
//                                                               Navigator.pop(
//                                                                   context);
//                                                             });
//                                                       }),
//                                                 )
//                                               ],
//                                             ),
//                                           ),
//                                         );
//                                       });
//                                 },
//                                 child: Padding(
//                                   padding: EdgeInsets.all(8.0),
//                                   child: Container(
//                                     // alignment: Alignment.topRight,
//                                     width: Screens.width(context) * 0.28,
//                                     height:
//                                         Screens.padingHeight(context) * 0.04,

//                                     decoration: BoxDecoration(
//                                         color: const Color.fromARGB(
//                                             255, 221, 17, 17),
//                                         border: Border.all(
//                                             color: const Color.fromARGB(
//                                                 255, 132, 132, 132),
//                                             width: 0.5),
//                                         borderRadius: BorderRadius.circular(4)),
//                                     child: Row(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.center,
//                                       children: [
//                                         const Text(
//                                           "English",
//                                           style: TextStyle(
//                                               fontSize: 15,
//                                               fontWeight: FontWeight.bold,
//                                               color: Color.fromRGBO(
//                                                   255, 255, 255, 1)),
//                                         ),
//                                         SizedBox(
//                                           width: Screens.width(context) * 0.035,
//                                         ),
//                                         const Icon(
//                                           Icons.arrow_drop_down,
//                                           color: Color.fromARGB(
//                                               255, 255, 255, 255),
//                                           size: 32,
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 ))
//                           ]),
//                       SizedBox(
//                         height: Screens.padingHeight(context) * 0.01,
//                       ),
//                       // Container(
//                       //   width: Screens.width(context) * 0.75,
//                       //   child: Row(
//                       //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       //     children: [
//                       //       Text(
//                       //         'My Redeems : 2500',
//                       //         style: theme.textTheme.bodyMedium
//                       //             ?.copyWith(fontWeight: FontWeight.bold),
//                       //       ),
//                       //       Text(
//                       //         'My Points : 3500',
//                       //         style: theme.textTheme.bodyMedium
//                       //             ?.copyWith(fontWeight: FontWeight.bold),
//                       //       ),
//                       //     ],
//                       //   ),
//                       // ),

//                       Container(
//                         height: Screens.padingHeight(context) * 0.19,
//                         width: Screens.width(context) * 0.85,
//                         decoration: BoxDecoration(
//                             // color: Colors.amber,
//                             borderRadius: BorderRadius.circular(8),
//                             image: const DecorationImage(
//                                 fit: BoxFit.fill,
//                                 image: AssetImage('assets/BG_ScanPoint1.png'))),
//                         child: Column(
//                           children: [
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                               children: [
//                                 Padding(
//                                   padding: EdgeInsets.only(
//                                       left: Screens.width(context) * 0.03),
//                                   child: const Column(
//                                     children: [
//                                       // Text(
//                                       //   "3500",
//                                       //   style: TextStyle(
//                                       //       fontSize: 20,
//                                       //       fontWeight: FontWeight.bold,
//                                       //       color: Color.fromARGB(211, 0, 0, 0)),
//                                       // ),
//                                       Padding(
//                                         padding: EdgeInsets.only(bottom: 40),
//                                         child: Text(
//                                           "Scaned Points",
//                                           style: TextStyle(
//                                               fontWeight: FontWeight.bold,
//                                               fontSize: 20,
//                                               color: Color.fromARGB(
//                                                   255, 255, 255, 255)),
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                                 Padding(
//                                   padding: EdgeInsets.symmetric(
//                                       vertical:
//                                           Screens.fullHeight(context) * 0.020,
//                                       horizontal:
//                                           Screens.width(context) * 0.03),
//                                   child: Column(
//                                     children: [
//                                       Text(
//                                         "3500",
//                                         style: TextStyle(
//                                             fontSize: 40,
//                                             fontWeight: FontWeight.bold,
//                                             color: Color.fromARGB(
//                                                 210, 255, 255, 255)),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ],
//                             ),
                  
//                           ],
//                         ),
//                       ),
//                       // SizedBox(),
//                       // Expanded(
//                       //   // color: Colors.pink,
//                       //   // alignment: Alignment.topLeft,
//                       //   // constraints: BoxConstraints(
//                       //   //     maxHeight: Screens.padingHeight(context) * 0.3),
//                       //   child: dummlist.isEmpty
//                       //       ? Center(
//                       //           child: Text("No Data..."),
//                       //         )
//                       //       : ListView.builder(
//                       //           // reverse: true,
//                       //           shrinkWrap: true,
//                       //           padding: EdgeInsets.all(0),
//                       //           itemCount: dummlist.length,
//                       //           itemBuilder: (con, i) {
//                       //             return Container(
//                       //               padding: EdgeInsets.symmetric(
//                       //                   horizontal:
//                       //                       Screens.width(context) * 0.055,
//                       //                   vertical:
//                       //                       Screens.padingHeight(context) *
//                       //                           0.001),
//                       //               // color: Colors.red,
//                       //               child: Container(
//                       //                 padding: EdgeInsets.symmetric(
//                       //                     horizontal:
//                       //                         Screens.width(context) * 0.01,
//                       //                     vertical:
//                       //                         Screens.padingHeight(context) *
//                       //                             0.01),
//                       //                 decoration: BoxDecoration(
//                       //                   color: dummlist[i].status == true
//                       //                       ? Colors.grey[100]
//                       //                       : Colors.white,
//                       //                   borderRadius: BorderRadius.circular(7),
//                       //                 ),
//                       //                 child: Padding(
//                       //                   padding: EdgeInsets.symmetric(
//                       //                       horizontal:
//                       //                           Screens.width(context) * 0.02),
//                       //                   child: Column(
//                       //                     crossAxisAlignment:
//                       //                         CrossAxisAlignment.start,
//                       //                     children: [
//                       //                       Row(
//                       //                         mainAxisAlignment:
//                       //                             MainAxisAlignment
//                       //                                 .spaceBetween,
//                       //                         children: [
//                       //                           Container(
//                       //                             child: Text(
//                       //                               "Scanned on",
//                       //                               style: TextStyle(
//                       //                                   fontSize: 17,
//                       //                                   fontWeight:
//                       //                                       FontWeight.bold),
//                       //                             ),
//                       //                           ),
//                       //                           Padding(
//                       //                             padding: EdgeInsets.symmetric(
//                       //                                 horizontal: Screens.width(
//                       //                                         context) *
//                       //                                     0.02),
//                       //                             child: Container(
//                       //                               child: Text(
//                       //                                 "${dummlist[i].date}",
//                       //                                 style: TextStyle(
//                       //                                   fontSize: 15,
//                       //                                 ),
//                       //                               ),
//                       //                             ),
//                       //                           ),
//                       //                         ],
//                       //                       ),
//                       //                       SizedBox(
//                       //                         height: Screens.padingHeight(
//                       //                                 context) *
//                       //                             0.008,
//                       //                       ),
//                       //                       Container(
//                       //                         child: Row(
//                       //                           children: [
//                       //                             Text(
//                       //                               "Scan Points :",
//                       //                               style:
//                       //                                   TextStyle(fontSize: 15),
//                       //                             ),
//                       //                             Text(
//                       //                               "${dummlist[i].scanpoints}",
//                       //                               style: TextStyle(
//                       //                                   fontSize: 15,
//                       //                                   color: Colors.green,
//                       //                                   fontWeight:
//                       //                                       FontWeight.bold),
//                       //                             ),
//                       //                           ],
//                       //                         ),
//                       //                       ),
//                       //                       SizedBox(
//                       //                         height: Screens.padingHeight(
//                       //                                 context) *
//                       //                             0.008,
//                       //                       ),
//                       //                       Container(
//                       //                         child: Text(
//                       //                           "Equivalent amount : 0.05",
//                       //                           style: TextStyle(fontSize: 15),
//                       //                         ),
//                       //                       ),
//                       //                     ],
//                       //                   ),
//                       //                 ),
//                       //               ),
//                       //             );
//                       //           }),
//                       // ),

//                       SizedBox(
//                         height: 0,
//                       ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.end,
//                         children: [
//                           Padding(
//                             padding: EdgeInsets.symmetric(
//                                 horizontal: Screens.width(context) * 0.055),
//                             child: ElevatedButton(
//                               onPressed: () {},
//                               child: Text(
//                                 "Continue",
//                                 style: TextStyle(
//                                     color: const Color.fromARGB(
//                                         255, 255, 255, 255),
//                                     fontSize: 16,
//                                     fontWeight: FontWeight.bold),
//                               ),
//                               style: ElevatedButton.styleFrom(
//                                 backgroundColor:
//                                     const Color.fromARGB(255, 124, 124, 124),
//                                 shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(5),
//                                   //  side: BorderSide(color: Colors.grey)
//                                 ),
//                                 minimumSize: const Size(110, 35),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                       SizedBox(
//                         height: 30,
//                       ),
//                     ],
//                   ))
//             ]),
//           ),
//         )
//         );
//   }
// }

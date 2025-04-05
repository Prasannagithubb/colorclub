import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:new_one/Constant/Screen.dart';
import 'package:new_one/Controller/LanguageControllers/languagecontroller.dart';
import 'package:new_one/Controller/MyDealerCtrl.dart';
import 'package:new_one/Pages/finddealer/mapscreen.dart';
import 'package:provider/provider.dart';

import '../../Models/FindDealerModel.dart';

class MyDealerPartnerPage extends StatefulWidget {
  @override
  _MyDealerPartnerPageState createState() => _MyDealerPartnerPageState();
}

class _MyDealerPartnerPageState extends State<MyDealerPartnerPage> {
  List<Map<String, dynamic>> dealers = [
    {
      "name": "userlocation",
      "location": "Dar es Salaam",
      "phone": "+255 654 123 456",
      "rating": 4.7,
      "latitude": -3.3635,
      "longitude": 36.6336
    },
    {
      "name": "Tanzania Paints Ltd",
      "location": "Dar es Salaam",
      "phone": "+255 654 123 456",
      "rating": 4.7,
      "latitude": -3.3635,
      "longitude": 36.6338
    },
    {
      "name": "Arusha Color House",
      "location": "Arusha",
      "phone": "+255 767 234 567",
      "rating": 4.5,
      "latitude": -3.3629,
      "longitude": 36.6352
    },
    {
      "name": "Mwanza Paint Mart",
      "location": "Mwanza",
      "phone": "+255 768 345 678",
      "rating": 4.6,
      "latitude": -3.3642,
      "longitude": 36.6325
    },
    {
      "name": "Dodoma Paint Supplies",
      "location": "Dodoma",
      "phone": "+255 765 456 789",
      "rating": 4.4,
      "latitude": -3.3651,
      "longitude": 36.6341
    },
    {
      "name": "Shinyanga Paint Depot",
      "location": "Shinyanga",
      "phone": "+255 754 567 890",
      "rating": 4.3,
      "latitude": -3.3618,
      "longitude": 36.6319
    },
    {
      "name": "Mbeya Coatings",
      "location": "Mbeya",
      "phone": "+255 759 678 901",
      "rating": 4.5,
      "latitude": -3.3609,
      "longitude": 36.6358
    },
    {
      "name": "Morogoro Paint Center",
      "location": "Morogoro",
      "phone": "+255 765 789 012",
      "rating": 4.6,
      "latitude": -3.3645,
      "longitude": 36.6360
    },
    {
      "name": "Tanga Paint Suppliers",
      "location": "Tanga",
      "phone": "+255 768 890 123",
      "rating": 4.2,
      "latitude": -3.3623,
      "longitude": 36.6307
    },
    {
      "name": "Kigoma Color World",
      "location": "Kigoma",
      "phone": "+255 762 901 234",
      "rating": 4.3,
      "latitude": -3.3662,
      "longitude": 36.6332
    },
    {
      "name": "Tabora Paint Solutions",
      "location": "Tabora",
      "phone": "+255 765 012 345",
      "rating": 4.4,
      "latitude": -3.3612,
      "longitude": 36.6328
    },
    {
      "name": "Songea Paint Masters",
      "location": "Songea",
      "phone": "+255 754 123 678",
      "rating": 4.5,
      "latitude": -3.3635,
      "longitude": 36.6338
    },
    {
      "name": "Mtwara Paints & Colors",
      "location": "Mtwara",
      "phone": "+255 765 234 789",
      "rating": 4.2,
      "latitude": -3.3629,
      "longitude": 36.6352
    },
    {
      "name": "Iringa Paint Experts",
      "location": "Iringa",
      "phone": "+255 768 345 890",
      "rating": 4.6,
      "latitude": -7.770070,
      "longitude": 35.692747
    },
    {
      "name": "Lindi Paint Shop",
      "location": "Lindi",
      "phone": "+255 762 456 901",
      "rating": 4.3,
      "latitude": -3.3642,
      "longitude": 36.6325
    },
    {
      "name": "Zanzibar Paints & Supplies",
      "location": "Zanzibar",
      "phone": "+255 759 567 012",
      "rating": 4.7,
      "latitude": -3.3651,
      "longitude": 36.6341
    },
    {
      "name": "Bukoba Color Hub",
      "location": "Bukoba",
      "phone": "+255 765 678 123",
      "rating": 4.4,
      "latitude": -3.3618,
      "longitude": 31.812880
    },
    {
      "name": "Musoma Paint Experts",
      "location": "Musoma",
      "phone": "+255 768 789 234",
      "rating": 4.5,
      "latitude": -1.500591,
      "longitude": 33.797297
    },
    {
      "name": "Moshi Paint Masters",
      "location": "Moshi",
      "phone": "+255 762 890 345",
      "rating": 4.3,
      "latitude": -3.333333,
      "longitude": 37.333333
    },
    {
      "name": "Singida Paint Depot",
      "location": "Singida",
      "phone": "+255 759 901 456",
      "rating": 4.2,
      "latitude": -4.816284,
      "longitude": 34.743593
    },
    {
      "name": "Njombe Paint House",
      "location": "Njombe",
      "phone": "+255 765 012 567",
      "rating": 4.6,
      "latitude": -9.331792,
      "longitude": 34.774379
    }
  ];

  String searchQuery = "";
  final ScrollController _scrollController = ScrollController();
  final TextEditingController distanceController = TextEditingController();
  Map<String, dynamic>? dealerx;
  int? index;
  bool closeonclick = false;

  List<Map<String, dynamic>>? allDealers;

  @override
  void dispose() {
    distanceController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<GetMyDealerCtrlr>().init();
    });
    setState(() {});
  }

  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //     backgroundColor: const Color.fromARGB(255, 16, 57, 122),
      //     leading: const Icon(
      //       Icons.arrow_back,
      //       color: Colors.white,
      //     ),
      //     title: const Text(
      //       "Find Dealer",
      //       style: TextStyle(color: Colors.white),
      //     )),
      body: Container(
        padding: EdgeInsets.only(
          bottom: Screens.fullHeight(context) * 0.02,
        ),
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 1, 53, 143),
        ),
        height: Screens.fullHeight(context),
        child: Container(
          padding: EdgeInsets.only(
            top: Screens.fullHeight(context) * 0.035,
          ),
          decoration: const BoxDecoration(
              color: Color.fromARGB(255, 212, 14, 0),
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20))),
          child: Container(
            // padding: EdgeInsets.only(top:),
            height: Screens.bodyheight(context),
            decoration: BoxDecoration(
                color: const Color.fromARGB(255, 255, 255, 255),
                borderRadius: BorderRadius.circular(20)),
            child: Column(
              children: [
                SizedBox(height: Screens.fullHeight(context) * 0.02),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      'assets/CoralLogo_Outline.png',
                      height: 90,
                    ),
                    _buildSectionTitle(""),
                  ],
                ),
                const Text(
                  'MY DEALER PARTNER',
                  style: TextStyle(
                      color: Color.fromARGB(255, 226, 0, 0),
                      fontWeight: FontWeight.w900,
                      fontSize: 16),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start, // Align text left
                      children: [
                        SizedBox(
                          height: Screens.fullHeight(context) * 0.018,
                        ),
                        // Title Text
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: Screens.width(context) * 0.02,
                            ),
                            // Row(
                            //   children: [
                            //     const Text(
                            //       "Distance in",
                            //       style: TextStyle(
                            //         fontSize: 16,
                            //         fontWeight: FontWeight.bold,
                            //         color: Colors.grey,
                            //       ),
                            //     ),
                            //     const SizedBox(
                            //       width: 8,
                            //     ),
                            //     SizedBox(
                            //       width: 80, // Smaller width
                            //       height: 25, // Smaller height
                            //       child: DropdownButtonFormField<String>(
                            //         borderRadius: BorderRadius.circular(4),
                            //         value: "KM", // Default value
                            //         decoration: InputDecoration(
                            //           filled: true,
                            //           fillColor:
                            //               Colors.white, // Light background
                            //           contentPadding:
                            //               const EdgeInsets.symmetric(
                            //                   horizontal: 10, vertical: 3),
                            //           border: OutlineInputBorder(
                            //             borderRadius:
                            //                 BorderRadius.circular(4),
                            //             borderSide:
                            //                 BorderSide.none, // No border
                            //           ),
                            //         ),
                            //         dropdownColor: Colors
                            //             .white, // Background of dropdown items
                            //         icon: const Icon(
                            //           Icons
                            //               .arrow_drop_down, // Custom dropdown arrow
                            //           size:
                            //               16, // Change the size of the dropdown arrow
                            //           color:
                            //               Colors.black, // Set color if needed
                            //         ),
                            //         items: const [
                            //           DropdownMenuItem(
                            //             value: "KM",
                            //             child: Text(
                            //               "km",
                            //               style: TextStyle(fontSize: 13),
                            //             ),
                            //           ),
                            //           DropdownMenuItem(
                            //             value: "M",
                            //             child: Text(
                            //               "meter",
                            //               style: TextStyle(fontSize: 14),
                            //             ),
                            //           ),
                            //         ],
                            //         onChanged: (value) {
                            //           // Handle the selected unit (KM or M)
                            //         },
                            //       ),
                            //     )
                            //   ],
                            // ),
                            //     Row(
                            //       children: [
                            //         Container(
                            //           width: 25, // Adjust width of the circle
                            //           height: 25, // Adjust height of the circle
                            //           decoration: const BoxDecoration(
                            //             shape: BoxShape.circle,
                            //             color:
                            //                 Colors.red, // Red circular background
                            //           ),
                            //           child: Center(
                            //             child: IconButton(
                            //               onPressed: () {
                            //                 Navigator.push(
                            //                   context,
                            //                   MaterialPageRoute(
                            //                     builder: (context) =>
                            //                         DealerMapScreen(
                            //                       allDealers:
                            //                           dealers, // Pass all dealers
                            //                       userLocation:
                            //                           dealers.firstWhere(
                            //                         (d) =>
                            //                             d["name"]
                            //                                 .toString()
                            //                                 .toLowerCase() ==
                            //                             "userlocation",
                            //                         orElse: () => {
                            //                           "name": "User",
                            //                           "latitude": 0.0,
                            //                           "longitude": 0.0
                            //                         },
                            //                       ), // Find user location in the list
                            //                     ),
                            //                   ),
                            //                 );
                            //               },
                            //               icon: const Icon(
                            //                 Icons.close,
                            //                 color: Colors.white,
                            //                 size: 18,
                            //               ),
                            //               padding: EdgeInsets.zero,
                            //               constraints: const BoxConstraints(),
                            //             ),
                            //           ),
                            //         ),
                            //       ],
                            //     )
                          ],
                        ),

                        // SizedBox(height: Screens.bodyheight(context) * 0.01),

                        // Search Bar
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: TextField(
                            cursorColor: Colors.white,
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                              fillColor: const Color.fromARGB(255, 226, 0, 0),
                              filled: true, // Ensures the fill color is applied
                              hintText: "Search by location or dealer name",
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 12),
                              hintStyle: const TextStyle(
                                  color: Colors.white, fontSize: 15),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide:
                                    BorderSide.none, // Removes default border
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide
                                    .none, // Removes focused border color
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide
                                    .none, // Removes enabled border color
                              ),
                            ),
                            onChanged: (value) {
                              setState(() {
                                searchQuery = value.toLowerCase();
                              });
                            },
                          ),
                        ),

                        // const SizedBox(height: 5), // Add spacing
                        // Space before list
                        // Container(
                        //       height: Screens.fullHeight(context) * 0.1,
                        //       width: Screens.width(context),
                        //       decoration: BoxDecoration(
                        //         border: Border.all(
                        //             color: const Color.fromARGB(
                        //                 255, 192, 192, 192)),
                        //         color: Colors.white,
                        //         // containerColor, // Same as Card's background color
                        //         borderRadius:
                        //             BorderRadius.circular(7), // Rounded corners
                        //         // border: Border.all(
                        //         //   color: Colors.grey.shade600,
                        //         // ), // Border color and width
                        //       ),
                        //       child: Card(
                        //         elevation: 0,
                        //         color: Colors.white,
                        //         margin: const EdgeInsets.symmetric(
                        //             horizontal: 10, vertical: 0),
                        //         child: Container(
                        //           decoration: BoxDecoration(),
                        //           padding: EdgeInsets.symmetric(
                        //               vertical:
                        //                   Screens.padingHeight(context) * 0.01),
                        //           child: Column(
                        //             crossAxisAlignment:
                        //                 CrossAxisAlignment.start,
                        //             children: [
                        //               Row(
                        //                 mainAxisAlignment:
                        //                     MainAxisAlignment.spaceBetween,
                        //                 crossAxisAlignment:
                        //                     CrossAxisAlignment.start,
                        //                 children: [
                        //                   Container(
                        //                       child: Column(
                        //                     crossAxisAlignment:
                        //                         CrossAxisAlignment.start,
                        //                     children: [
                        //                       Text(
                        //                         transaction['details'],
                        //                         style: GoogleFonts.openSans(
                        //                           color: const Color.fromARGB(
                        //                               255, 0, 0, 0),
                        //                           fontSize: 17,
                        //                           fontWeight: FontWeight.bold,
                        //                         ),
                        //                         // style: TextStyle(
                        //                         //     fontSize: 17,
                        //                         //     fontWeight: FontWeight.bold,
                        //                         //     color: const Color.fromARGB(
                        //                         //         255, 0, 0, 0)),
                        //                       ),
                        //                       SizedBox(
                        //                         height: Screens.padingHeight(
                        //                                 context) *
                        //                             0.001,
                        //                       ),
                        //                       Text(
                        //                         transaction['date'],
                        //                         style: GoogleFonts.openSans(
                        //                           color: const Color.fromARGB(
                        //                               255, 122, 122, 122),
                        //                           fontSize: 14,
                        //                           fontWeight: FontWeight.bold,
                        //                         ),
                        //                         // style: TextStyle(
                        //                         //     fontSize: 14,
                        //                         //     color: const Color.fromARGB(
                        //                         //         255, 122, 122, 122)),
                        //                       ),
                        //                       Text(
                        //                         transaction['site'],
                        //                         style: GoogleFonts.openSans(
                        //                           color: const Color.fromARGB(
                        //                               255, 114, 114, 114),
                        //                           fontSize: 14,
                        //                           fontWeight: FontWeight.bold,
                        //                         ),
                        //                         // style: TextStyle(
                        //                         //     fontSize: 14,
                        //                         //     // fontWeight: FontWeight.bold,
                        //                         //     color: const Color.fromARGB(
                        //                         //         255, 114, 114, 114)),
                        //                       ),
                        //                     ],
                        //                   )),
                        //                   Text(
                        //                     transaction['amount'],
                        //                     style: GoogleFonts.openSans(
                        //                       color: const Color.fromARGB(
                        //                           255, 114, 114, 114),
                        //                       fontSize: 15,
                        //                       fontWeight: FontWeight.bold,
                        //                     ),
                        //                     // style: const TextStyle(
                        //                     //     fontSize: 15,
                        //                     //     fontWeight: FontWeight.bold,
                        //                     //     color: const Color.fromARGB(
                        //                     //         255, 114, 114, 114)
                        //                   ),
                        //                 ],
                        //               )
                        //             ],
                        //           ),
                        //         ),

                        //         // ListTile(

                        //         //   shape: Border(),
                        //         //   :

                        //         //   // minTileHeight: 0,
                        //         //   subtitle:
                        //         //   trailing:
                        //         // ),
                        //       ),
                        //     );
                        context
                                    .watch<GetMyDealerCtrlr>()
                                    .transDealerData
                                    .length >
                                0
                            ? Container(
                                // color: Colors.amber,
                                padding: EdgeInsets.symmetric(
                                  horizontal: Screens.width(context) * 0.05,
                                ),
                                height: Screens.fullHeight(context) * 0.45,
                                child: ListView.builder(
                                  padding: EdgeInsets.symmetric(
                                      vertical: Screens.fullHeight(context) * 0,
                                      horizontal: Screens.width(context) * 0),
                                  itemCount: context
                                      .watch<GetMyDealerCtrlr>()
                                      .transDealerData
                                      .length,
                                  itemBuilder: (context, index) {
                                    var transaction = context
                                        .read<GetMyDealerCtrlr>()
                                        .transDealerData[index];
                                    // Color containerColor = index % 2 == 0
                                    // ? Colors.grey.shade200
                                    // : Colors.white;
                                    // if (selectedFilter != "All" &&
                                    //     transaction['type'] != selectedFilter) {
                                    //   return const SizedBox.shrink();
                                    // }
                                    return Container(
                                      // height: Screens.fullHeight(context) * 0.13,
                                      width: Screens.width(context),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: const Color.fromARGB(
                                                255, 192, 192, 192)),
                                        color: Colors.white,
                                        // containerColor, // Same as Card's background color
                                        borderRadius: BorderRadius.circular(
                                            7), // Rounded corners
                                        // border: Border.all(
                                        //   color: Colors.grey.shade600,
                                        // ), // Border color and width
                                      ),
                                      child: Card(
                                        elevation: 0,
                                        color: Colors.white,
                                        margin: const EdgeInsets.symmetric(
                                            horizontal: 10, vertical: 0),
                                        child: Container(
                                          decoration: const BoxDecoration(),
                                          padding: EdgeInsets.symmetric(
                                              vertical: Screens.padingHeight(
                                                      context) *
                                                  0.01),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                width: Screens.width(context),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      transaction.dealername,
                                                      style:
                                                          GoogleFonts.openSans(
                                                        color: const Color
                                                            .fromARGB(
                                                            255, 0, 0, 0),
                                                        fontSize: 17,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                    Text(
                                                      "${transaction.distance.toString()} km",
                                                      style:
                                                          GoogleFonts.openSans(
                                                        color: const Color
                                                            .fromARGB(
                                                            255, 226, 0, 0),
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                      // style: TextStyle(
                                                      //     fontSize: 14,
                                                      //     color: const Color.fromARGB(
                                                      //         255, 122, 122, 122)),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              SizedBox(
                                                height: Screens.padingHeight(
                                                        context) *
                                                    0.001,
                                              ),
                                              Text(
                                                transaction.dealercontact,
                                                style: GoogleFonts.openSans(
                                                  color: const Color.fromARGB(
                                                      255, 122, 122, 122),
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                                // style: TextStyle(
                                                //     fontSize: 14,
                                                //     color: const Color.fromARGB(
                                                //         255, 122, 122, 122)),
                                              ),
                                              Text(
                                                transaction.dealeremail,
                                                style: GoogleFonts.openSans(
                                                  color: const Color.fromARGB(
                                                      255, 114, 114, 114),
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                                // style: TextStyle(
                                                //     fontSize: 14,
                                                //     // fontWeight: FontWeight.bold,
                                                //     color: const Color.fromARGB(
                                                //         255, 114, 114, 114)),
                                              ),
                                              Row(
                                                children: [
                                                  Text(
                                                    "${transaction.address1},",
                                                    style: GoogleFonts.openSans(
                                                      color:
                                                          const Color.fromARGB(
                                                              255,
                                                              114,
                                                              114,
                                                              114),
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                  Text(
                                                    "${transaction.address2},",
                                                    style: GoogleFonts.openSans(
                                                      color:
                                                          const Color.fromARGB(
                                                              255,
                                                              114,
                                                              114,
                                                              114),
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                  Text(
                                                    transaction.address3,
                                                    style: GoogleFonts.openSans(
                                                      color:
                                                          const Color.fromARGB(
                                                              255,
                                                              114,
                                                              114,
                                                              114),
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Text(
                                                    "${transaction.state},",
                                                    style: GoogleFonts.openSans(
                                                      color:
                                                          const Color.fromARGB(
                                                              255,
                                                              114,
                                                              114,
                                                              114),
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                  Text(
                                                    transaction.city,
                                                    style: GoogleFonts.openSans(
                                                      color:
                                                          const Color.fromARGB(
                                                              255,
                                                              114,
                                                              114,
                                                              114),
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),

                                        // ListTile(

                                        //   shape: Border(),
                                        //   :

                                        //   // minTileHeight: 0,
                                        //   subtitle:
                                        //   trailing:
                                        // ),
                                      ),
                                    );
                                  },
                                ),
                              )
                            : Container(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
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
        // Padding(
        //   padding:
        //       EdgeInsets.symmetric(horizontal: Screens.width(context) * 0.05),
        //   child:
        //    Row(
        //     mainAxisAlignment: MainAxisAlignment.center,
        //     children: [
        //       InkWell(
        //         onTap: () {
        //           showDialog(
        //               context: context,
        //               builder: (context) {
        //                 return AlertDialog(
        //                   insetPadding: const EdgeInsets.all(10),
        //                   contentPadding: const EdgeInsets.all(0),
        //                   shape: RoundedRectangleBorder(
        //                       borderRadius: BorderRadius.circular(8)),
        //                   alignment: Alignment.center,
        //                   content: Container(
        //                     decoration: BoxDecoration(
        //                         borderRadius:
        //                             BorderRadius.all(Radius.circular(15))),
        //                     // height: 300,
        //                     // color: Colors.amber,
        //                     width: Screens.width(context) * 0.1,
        //                     constraints: BoxConstraints(
        //                         maxHeight: Screens.padingHeight(context) * 0.3),
        //                     child: Column(
        //                       mainAxisSize: MainAxisSize.min,
        //                       children: [
        //                         Expanded(
        //                           child: ListView.builder(
        //                               shrinkWrap: true,
        //                               // ise:true,
        //                               itemCount: LanguageModel.length,
        //                               itemBuilder: (context, i) {
        //                                 var item = LanguageModel[i];
        //                                 return RadioListTile(
        //                                     value: item.languagecode,
        //                                     activeColor: theme.primaryColor,
        //                                     groupValue: groupvalue,
        //                                     title: Text(item.language!),
        //                                     subtitle: Text(item.sublanguage!),
        //                                     onChanged: (val) {
        //                                       groupvalue = val.toString();
        //                                       context
        //                                           .read<Languagecontroller>()
        //                                           .setlocate(Locale(
        //                                               item.languagecode!));
        //                                       Navigator.pop(context);
        //                                     });
        //                               }),
        //                         )
        //                       ],
        //                     ),
        //                   ),
        //                 );
        //               });
        //         },
        //         child: Container(
        //           alignment: Alignment.topRight,
        //           width: Screens.width(context) * 0.3,
        //           height: Screens.fullHeight(context) * 0.04,
        //           // child: const Icon(
        //           //   Icons.language,
        //           //   color: Colors.black,
        //           //   size: 30,
        //           // )
        //           decoration: BoxDecoration(
        //               color: const Color.fromARGB(255, 248, 248, 248),
        //               border: Border.all(
        //                   color: const Color.fromARGB(255, 172, 172, 172),
        //                   width: 0.5),
        //               borderRadius: BorderRadius.circular(7)),
        //           child: Padding(
        //             padding: EdgeInsets.symmetric(
        //                 vertical: Screens.padingHeight(context) * 0.00),
        //             child: Row(
        //               mainAxisAlignment: MainAxisAlignment.center,
        //               children: [
        //                 const Text(
        //                   "English",
        //                   style: TextStyle(
        //                       fontSize: 16,
        //                       fontWeight: FontWeight.bold,
        //                       color: Color.fromARGB(255, 95, 95, 95)),
        //                 ),
        //                 SizedBox(
        //                   width: Screens.width(context) * 0.02,
        //                 ),
        //                 const Icon(
        //                   Icons.arrow_drop_down,
        //                   color: const Color.fromARGB(255, 212, 14, 0),
        //                   size: 35,
        //                 ),
        //               ],
        //             ),
        //           ),
        //         ),
        //       ),
        //     ],
        //   ),
        // ),
      ],
    );
  }
}

class DealerCard extends StatelessWidget {
  FindDealerDataModel dealer;
  final int index;

  List<FindDealerDataModel> allDealers;

  DealerCard(this.dealer, this.index, this.allDealers);
  void navigateToMapScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MapScreen(
          dealer: dealer,
          allDealers: allDealers,
          onclicklist: false,
        ),
      ),
    );
  }

  // void _launchMaps(double latitude, double longitude) async {
  //   final url =
  //       "https://www.google.com/maps/search/?api=1&query=$latitude,$longitude";
  //   if (await canLaunch(url)) {
  //     await launch(url);
  //   } else {
  //     throw "Could not launch $url";
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => navigateToMapScreen(context),
      child: Card(
        margin: const EdgeInsets.all(1),
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8), // Rounded corners
          // side: const BorderSide(
          //     color: Colors.grey, width: 1), // Border color and width
        ),
        // elevation: 2,
        // margin: const EdgeInsets.all(10),
        child: ListTile(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(dealer.dealerName,
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.red)),
              Text(
                " ${dealer.distance} km",
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: Color.fromARGB(255, 16, 57, 122)),
              ),
            ],
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Text(
                    "${dealer.dealerName},",
                    style: const TextStyle(color: Colors.black),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text("${dealer.dealerContact}"),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                'www.coral.com',
                style: TextStyle(color: Colors.grey.shade600),
              ),

              // Row(
              //   children: [
              //     Text(dealer["rating"].toString(),
              //         style: const TextStyle(fontWeight: FontWeight.bold)),
              //   ],
              // ),
            ],
          ),
          // trailing: IconButton(
          //   icon: const Icon(Icons.directions, color: Colors.blue),
          //   onPressed: () => _launchMaps(dealer["latitude"], dealer["longitude"]),
          // ),
        ),
      ),
    );
  }
}

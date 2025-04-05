import 'package:flutter/material.dart';
import 'package:new_one/Constant/Screen.dart';
import 'package:new_one/Controller/LanguageControllers/languagecontroller.dart';
import 'package:new_one/Models/FindDealerModel.dart';
import 'package:new_one/Pages/finddealer/dealermapscreen.dart';
import 'package:new_one/Pages/finddealer/mapscreen.dart';
import 'package:provider/provider.dart';

import '../../Controller/FindDealerCtrlr.dart';

class FindDealerPage extends StatefulWidget {
  @override
  _FindDealerPageState createState() => _FindDealerPageState();
}

class _FindDealerPageState extends State<FindDealerPage> {
  // List<Map<String, dynamic>>? allDealers;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<FindDealerController>().init(context);
      setState(() {});
    });
  }

  @override
  void dispose() {
    // context.read<FindDealerController>().distanceController.dispose();
    super.dispose();
  }

  @override
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
        padding: const EdgeInsets.only(bottom: 30),
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 1, 53, 143),
        ),
        height: Screens.fullHeight(context),
        child: Container(
          padding: const EdgeInsets.only(top: 30),
          decoration: const BoxDecoration(
              color: Color.fromARGB(255, 212, 14, 0),
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20))),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(20)),
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
                  '       FIND DEALER',
                  style: TextStyle(
                      color: Color.fromARGB(255, 226, 0, 0),
                      fontWeight: FontWeight.w900,
                      fontSize: 16),
                ),
                Expanded(
                  child: Container(
                    height: Screens.padingHeight(context) * 0.8,
                    padding: const EdgeInsets.only(
                        top: 150, left: 10, right: 10, bottom: 10),
                    decoration: BoxDecoration(
                        // color: Colors.red,
                        image: const DecorationImage(
                          image: AssetImage(
                              'assets/gray-google-map.jpg'), // Your image asset
                          fit: BoxFit
                              .cover, // Adjust fit as needed (cover, contain, etc.)
                        ),
                        borderRadius: BorderRadius.circular(10)),
                    child: Container(
                      decoration: const BoxDecoration(color: Colors.white),
                      child: Column(
                        crossAxisAlignment:
                            CrossAxisAlignment.start, // Align text left
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          // Title Text
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const SizedBox(
                                width: 8,
                              ),
                              Row(
                                children: [
                                  const Text(
                                    "Distance in",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  SizedBox(
                                    width: 80, // Smaller width
                                    height: 25, // Smaller height
                                    child: DropdownButtonFormField<String>(
                                      borderRadius: BorderRadius.circular(4),
                                      value: "KM", // Default value
                                      decoration: InputDecoration(
                                        filled: true,
                                        fillColor:
                                            Colors.white, // Light background
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                                horizontal: 10, vertical: 3),
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(4),
                                          borderSide:
                                              BorderSide.none, // No border
                                        ),
                                      ),
                                      dropdownColor: Colors
                                          .white, // Background of dropdown items
                                      icon: const Icon(
                                        Icons
                                            .arrow_drop_down, // Custom dropdown arrow
                                        size:
                                            16, // Change the size of the dropdown arrow
                                        color:
                                            Colors.black, // Set color if needed
                                      ),
                                      items: const [
                                        DropdownMenuItem(
                                          value: "KM",
                                          child: Text(
                                            "km",
                                            style: TextStyle(fontSize: 13),
                                          ),
                                        ),
                                        DropdownMenuItem(
                                          value: "M",
                                          child: Text(
                                            "meter",
                                            style: TextStyle(fontSize: 14),
                                          ),
                                        ),
                                      ],
                                      onChanged: (value) {
                                        // Handle the selected unit (KM or M)
                                      },
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Container(
                                    width: 25, // Adjust width of the circle
                                    height: 25, // Adjust height of the circle
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color:
                                          Colors.red, // Red circular background
                                    ),
                                    child: Center(
                                      child: IconButton(
                                        onPressed: () {
                                          if (context
                                                  .read<FindDealerController>()
                                                  .searhfindDeaelerData
                                                  .length >
                                              0) {
                                            context
                                                .read<FindDealerController>()
                                                .closeonclick = true;
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    DealerMapScreen(
                                                  allDealers: context
                                                      .read<
                                                          FindDealerController>()
                                                      .findDealerData, // Pass all dealers
                                                  userLocation: context
                                                      .read<
                                                          FindDealerController>()
                                                      .dealers
                                                      .firstWhere(
                                                        (d) =>
                                                            d["name"]
                                                                .toString()
                                                                .toLowerCase() ==
                                                            "userlocation",
                                                        orElse: () => {
                                                          "name": "User",
                                                          "latitude": 0.0,
                                                          "longitude": 0.0
                                                        },
                                                      ), // Find user location in the list
                                                ),
                                              ),
                                            );
                                          }
                                        },
                                        icon: const Icon(
                                          Icons.close,
                                          color: Colors.white,
                                          size: 18,
                                        ),
                                        padding: EdgeInsets.zero,
                                        constraints: const BoxConstraints(),
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),

                          SizedBox(height: Screens.bodyheight(context) * 0.01),

                          // Search Bar
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: TextField(
                              cursorColor: Colors.white,
                              textAlign: TextAlign.center,
                              decoration: InputDecoration(
                                fillColor: const Color.fromARGB(255, 226, 0, 0),
                                filled:
                                    true, // Ensures the fill color is applied
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
                                  context
                                      .read<FindDealerController>()
                                      .searchQuery = value.toLowerCase();
                                });
                              },
                            ),
                          ),

                          // const SizedBox(height: 5), // Add spacing
                          // Space before list

                          // Dealer List

                          context
                                      .read<FindDealerController>()
                                      .findDealerData
                                      .length >
                                  0
                              ? Expanded(
                                  child: ListView.builder(
                                    shrinkWrap: true,
                                    controller: context
                                        .watch<FindDealerController>()
                                        .scrollController,
                                    physics: const ClampingScrollPhysics(),
                                    itemCount: context
                                        .watch<FindDealerController>()
                                        .searhfindDeaelerData
                                        .length,
                                    itemBuilder: (context, index) {
                                      final dealer = context
                                          .read<FindDealerController>()
                                          .searhfindDeaelerData[index];
                                      if (dealer.dealerName
                                              .toLowerCase()
                                              .contains(context
                                                  .read<FindDealerController>()
                                                  .searchQuery) ||
                                          dealer.dealerName
                                              .toLowerCase()
                                              .contains(context
                                                  .read<FindDealerController>()
                                                  .searchQuery)) {
                                        return
                                            // dealer["name"] != 'userlocation'
                                            //     ?
                                            DealerCard(
                                                context
                                                        .read<
                                                            FindDealerController>()
                                                        .searhfindDeaelerData[
                                                    index],
                                                index,
                                                context
                                                    .read<
                                                        FindDealerController>()
                                                    .findDealerData);
                                        // : Container();
                                      }
                                      return const SizedBox(); // Avoid rendering empty spaces
                                    },
                                  ),
                                )
                              : Container(),
                        ],
                      ),
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
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: Screens.width(context) * 0.05),
          // child: Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: [
          //     InkWell(
          //       onTap: () {
          //         showDialog(
          //             context: context,
          //             builder: (context) {
          //               return AlertDialog(
          //                 insetPadding: const EdgeInsets.all(10),
          //                 contentPadding: const EdgeInsets.all(0),
          //                 shape: RoundedRectangleBorder(
          //                     borderRadius: BorderRadius.circular(8)),
          //                 alignment: Alignment.center,
          //                 content: Container(
          //                   // height: 300,
          //                   // color: Colors.amber,
          //                   width: Screens.width(context) * 0.1,
          //                   constraints: BoxConstraints(
          //                       maxHeight: Screens.padingHeight(context) * 0.3),
          //                   child: Column(
          //                     mainAxisSize: MainAxisSize.min,
          //                     children: [
          //                       Expanded(
          //                         child: ListView.builder(
          //                             shrinkWrap: true,
          //                             // ise:true,
          //                             itemCount: LanguageModel.length,
          //                             itemBuilder: (context, i) {
          //                               var item = LanguageModel[i];
          //                               return RadioListTile(
          //                                   value: item.languagecode,
          //                                   activeColor: theme.primaryColor,
          //                                   groupValue: groupvalue,
          //                                   title: Text(item.language!),
          //                                   subtitle: Text(item.sublanguage!),
          //                                   onChanged: (val) {
          //                                     groupvalue = val.toString();
          //                                     context
          //                                         .read<Languagecontroller>()
          //                                         .setlocate(Locale(
          //                                             item.languagecode!));
          //                                     Navigator.pop(context);
          //                                   });
          //                             }),
          //                       )
          //                     ],
          //                   ),
          //                 ),
          //               );
          //             });
          //       },
          //       child: Container(
          //         alignment: Alignment.topRight,
          //         width: Screens.width(context) * 0.3,
          //         height: Screens.fullHeight(context) * 0.04,
          //         // child: const Icon(
          //         //   Icons.language,
          //         //   color: Colors.black,
          //         //   size: 30,
          //         // )
          //         decoration: BoxDecoration(
          //             color: const Color.fromARGB(255, 248, 248, 248),
          //             border: Border.all(
          //                 color: const Color.fromARGB(255, 172, 172, 172),
          //                 width: 0.5),
          //             borderRadius: BorderRadius.circular(7)),
          //         child: Padding(
          //           padding: EdgeInsets.symmetric(
          //               vertical: Screens.padingHeight(context) * 0.00),
          //           child: Row(
          //             mainAxisAlignment: MainAxisAlignment.center,
          //             children: [
          //               const Text(
          //                 "English",
          //                 style: TextStyle(
          //                     fontSize: 16,
          //                     fontWeight: FontWeight.bold,
          //                     color: Color.fromARGB(255, 95, 95, 95)),
          //               ),
          //               SizedBox(
          //                 width: Screens.width(context) * 0.02,
          //               ),
          //               const Icon(
          //                 Icons.arrow_drop_down,
          //                 color: const Color.fromARGB(255, 212, 14, 0),
          //                 size: 35,
          //               ),
          //             ],
          //           ),
          //         ),
          //       ),
          //     ),
          //   ],
          // ),
        ),
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

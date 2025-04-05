import 'package:flutter/material.dart';
import 'package:new_one/Constant/Screen.dart';

class PointsScreen extends StatefulWidget {
  const PointsScreen({super.key});

  @override
  State<PointsScreen> createState() => _PointsScreenState();
}

class _PointsScreenState extends State<PointsScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      adddata();
      pointsController.text = "0";
    });
  }

  Addmethod() {
    setState(() {
      int? value = int.parse(pointsController.text);
      value = value + 1;
      pointsController.text = value.toString();
    });
  }

  minusmethod() {
    setState(() {
      int? value = int.parse(pointsController.text);
      value = value - 1;
      pointsController.text = value.toString();
    });
  }

  adddata() {
    setState(() {
      dummlist = [
        dummydata(
            points: 1500.00,
            date: "12-03-2025",
            name: "ASIAN Paints",
            status: true),
        dummydata(
            points: 2500.00,
            date: "1-05-2025",
            name: "NEROLAC Paints",
            status: false),
        dummydata(
            points: 1800.00,
            date: "2-07-2025",
            name: "NIPPON Paints",
            status: true),
        dummydata(
            points: 4000.00,
            date: "18-08-2025",
            name: "CORAL Paints",
            status: false),
        dummydata(
            points: 2600.00,
            date: "1-04-2025",
            name: "IMPORT Paints",
            status: true),
        dummydata(
            points: 6000.00,
            date: "09-11-2025",
            name: "DULEX Paints",
            status: false),
      ];
    });
  }

  TextEditingController pointsController = TextEditingController();
  List<dummydata> dummlist = [];
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      // backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: Container(
        padding: EdgeInsets.only(bottom: 30),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 1, 53, 143),
        ),
        height: Screens.fullHeight(context),
        child: Container(
          padding: EdgeInsets.only(top: 30),
          decoration: BoxDecoration(
              color: const Color.fromARGB(255, 212, 14, 0),
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20))),
          child: Container(
            height: Screens.fullHeight(context) * 0.93,
            width: Screens.width(context),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(20))),
            child: Padding(
              padding: EdgeInsets.symmetric(
                  vertical: Screens.padingHeight(context) * 0.01,
                  horizontal: Screens.width(context) * 0.05),
              child: Column(
                children: [
                  Container(
                    // color: Colors.amber,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          height: Screens.bodyheight(context) * 0.01,
                        ),
                        Image.asset(
                          'assets/Img1.png',
                          height: 120,
                          width: 90,
                        ),
                        Image.asset(
                          'assets/CoralLogo_Outline.png',
                          height: 100,
                        ),
                        Image.asset(
                          'assets/Img2.png',
                          height: 120,
                          width: 90,
                        ),
                      ],
                    ),
                  ),
                  // Row(
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
                  //                       maxHeight:
                  //                           Screens.padingHeight(context) *
                  //                               0.3),
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
                  //                                   activeColor:
                  //                                       theme.primaryColor,
                  //                                   groupValue: groupvalue,
                  //                                   title: Text(item.language!),
                  //                                   subtitle:
                  //                                       Text(item.sublanguage!),
                  //                                   onChanged: (val) {
                  //                                     groupvalue =
                  //                                         val.toString();
                  //                                     context
                  //                                         .read<
                  //                                             Languagecontroller>()
                  //                                         .setlocate(Locale(item
                  //                                             .languagecode!));
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
                  //                 color:
                  //                     const Color.fromARGB(255, 172, 172, 172),
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

                  SizedBox(
                    height: Screens.fullHeight(context) * 0.03,
                  ),
                  Text(
                    " MY POINTS",
                    style: TextStyle(
                      color: const Color.fromARGB(255, 255, 22, 5),
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  // SizedBox(
                  //   height: Screens.fullHeight(context) * 0.01,
                  // ),
                  SizedBox(
                    height: Screens.fullHeight(context) * 0.03,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "AVALIABLE POINTS",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 131, 131, 131)),
                      ),
                      SizedBox(
                        width: Screens.width(context) * 0.03,
                      ),
                      Text(
                        "2500",
                        style: TextStyle(
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 0, 0, 0)),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: Screens.fullHeight(context) * 0.015,
                  ),
                  // Container(
                  //   height: Screens.fullHeight(context) * 0.085,
                  //   // width: Screens.width(context) * 0.9,
                  //   decoration: BoxDecoration(
                  //     color: const Color.fromARGB(255, 248, 248, 248),
                  //     borderRadius: BorderRadius.all(Radius.circular(10)),
                  //     border: Border.all(
                  //         color: const Color.fromARGB(255, 202, 202, 202)),
                  //   ),
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //     children: [
                  //       Text(
                  //         "REDEEM POINTS",
                  //         style: TextStyle(
                  //           color: const Color.fromARGB(255, 38, 162, 136),
                  //           fontSize: 15,
                  //           fontWeight: FontWeight.bold,
                  //         ),
                  //       ),
                  //       Container(
                  //           height: Screens.fullHeight(context) * 0.058,
                  //           width: Screens.width(context) * 0.3,
                  //           // color: Colors.amber,
                  //           child: TextField(
                  //             style: TextStyle(
                  //               fontSize: 25,
                  //             ),
                  //             controller: pointsController,
                  //             cursorColor: Colors.red,
                  //             keyboardType: TextInputType.number,
                  //             decoration: InputDecoration(
                  //               // hoverColor: Colors.red,
                  //               border: InputBorder.none,
                  //               filled: true,
                  //               fillColor:
                  //                   const Color.fromARGB(255, 255, 255, 255),
                  //             ),
                  //           )),
                  //       CircleAvatar(
                  //         radius: 18,
                  //         backgroundColor:
                  //             const Color.fromARGB(255, 38, 162, 136),
                  //         child: IconButton(
                  //            padding: EdgeInsets.all(0),
                  //             onPressed: () {
                  //               setState(() {
                  //                 Addmethod();
                  //               });
                  //             },
                  //             icon: Icon(Icons.add)),
                  //       ),
                  //       CircleAvatar(
                  //         radius: 18,
                  //         backgroundColor:
                  //             const Color.fromARGB(255, 38, 162, 136),
                  //         child: IconButton(
                  //             padding: EdgeInsets.all(0),
                  //             onPressed: pointsController.text == "0"
                  //                 ? () {}
                  //                 : () {
                  //                     setState(() {
                  //                       minusmethod();
                  //                     });
                  //                   },
                  //             icon: Icon(Icons.remove)),
                  //       )
                  //     ],
                  //   ),
                  // ),
                  // SizedBox(
                  //   height: Screens.fullHeight(context) * 0.02,
                  // ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   children: [
                  //     Text(
                  //       "EQUIV.AMOUNT",
                  //       style: TextStyle(
                  //         color: const Color.fromARGB(255, 38, 162, 136),
                  //         fontWeight: FontWeight.bold,
                  //         fontSize: 16,
                  //       ),
                  //     ),
                  //     SizedBox(
                  //       width: Screens.width(context) * 0.03,
                  //     ),
                  //     Text(
                  //       "0.00",
                  //       style: TextStyle(
                  //         color: Color.fromARGB(255, 109, 109, 109),
                  //         fontWeight: FontWeight.bold,
                  //         fontSize: 22,
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  // SizedBox(
                  //   height: Screens.fullHeight(context) * 0.03,
                  // ),
                  // SizedBox(
                  //   height: Screens.fullHeight(context) * 0.045,
                  //   width: Screens.width(context) * 0.3,
                  //   child: ElevatedButton(
                  //       onPressed: () {},
                  //       child: Text(
                  //         "Submit",
                  //         style: TextStyle(
                  //           color: Colors.white,
                  //           fontSize: 18,
                  //         ),
                  //       ),
                  //       style: ElevatedButton.styleFrom(
                  //           backgroundColor:
                  //               const Color.fromARGB(255, 212, 14, 0),
                  //           shape: RoundedRectangleBorder(
                  //               borderRadius:
                  //                   BorderRadius.all(Radius.circular(4))))),
                  // ),
                  SizedBox(
                    height: Screens.fullHeight(context) * 0.03,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "REDEEM HISTORY",
                        style: TextStyle(
                          color: const Color.fromARGB(255, 38, 162, 136),
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: Screens.fullHeight(context) * 0.008,
                  ),
                  Expanded(
                    // color: Colors.pink,
                    // alignment: Alignment.topLeft,
                    // constraints: BoxConstraints(
                    //     maxHeight: Screens.padingHeight(context) * 0.3),
                    child: dummlist.isEmpty
                        ? Center(
                            child: Text("No Data..."),
                          )
                        : ListView.builder(
                            // reverse: true,
                            // shrinkWrap: true,
                            padding: EdgeInsets.all(0),
                            itemCount: dummlist.length,
                            itemBuilder: (con, i) {
                              return Container(
                                // padding: EdgeInsets.symmetric(
                                //     horizontal:
                                //         Screens.width(context) * 0.055,
                                //     vertical: Screens.padingHeight(context) *
                                //         0.001),
                                // color: Colors.red,
                                child: Container(
                                  height: Screens.fullHeight(context) * 0.1,
                                  width: Screens.width(context),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: Screens.width(context) * 0.01,
                                      vertical:
                                          Screens.padingHeight(context) * 0.01),
                                  decoration: BoxDecoration(
                                    color: dummlist[i].status == true
                                        ? Colors.grey[100]
                                        : Colors.white,
                                    borderRadius: BorderRadius.circular(7),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal:
                                            Screens.width(context) * 0.02),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              child: Row(
                                                children: [
                                                  Container(
                                                    child: Text(
                                                      "Redeem On -->  ",
                                                      style: TextStyle(
                                                          fontSize: 17,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: const Color
                                                              .fromARGB(
                                                              255, 0, 0, 0)),
                                                    ),
                                                  ),
                                                  Container(
                                                    child: Text(
                                                      "${dummlist[i].date}",
                                                      style: TextStyle(
                                                          fontSize: 16,
                                                          color: const Color
                                                              .fromARGB(
                                                              255, 0, 0, 0)),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),

                                            // SizedBox(
                                            //   width: Screens.width(context) *
                                            //       0.25,
                                            // ),
                                            Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal:
                                                      Screens.width(context) *
                                                          0.05),
                                              child: Text(
                                                "${dummlist[i].points}\$",
                                                style: TextStyle(
                                                    color: Color.fromARGB(
                                                        255, 38, 162, 136),
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 16),
                                              ),
                                            ),
                                          ],
                                        ),

                                        SizedBox(
                                          height:
                                              Screens.padingHeight(context) *
                                                  0.008,
                                        ),
                                        Container(
                                          child: Row(
                                            children: [
                                              Text(
                                                "Dealer Name :  ",
                                                style: TextStyle(fontSize: 15),
                                              ),
                                              Text(
                                                "${dummlist[i].name}",
                                                style: TextStyle(
                                                  fontSize: 15,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        // SizedBox(
                                        //   height:
                                        //       Screens.padingHeight(context) *
                                        //           0.008,
                                        // ),
                                        // Container(
                                        //   child: Text(
                                        //     "Equivalent amount : 0.05",
                                        //     style: TextStyle(fontSize: 15),
                                        //   ),
                                        // ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            }),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class dummydata {
  String? date;
  String? name;

  bool? status;
  double? points;
  dummydata({
    required this.points,
    required this.date,
    required this.name,
    required this.status,
  });
}

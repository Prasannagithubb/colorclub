import 'package:flutter/material.dart';
import 'package:new_one/Constant/Configuration.dart';
import 'package:new_one/Constant/Screen.dart';
import 'package:new_one/Controller/LanguageControllers/languagecontroller.dart';
import 'package:new_one/Controller/redeemcontroller/remaincontroller.dart';
import 'package:new_one/generated/l10n.dart';
import 'package:provider/provider.dart';

class RedeemScreen extends StatefulWidget {
  const RedeemScreen({super.key});

  @override
  State<RedeemScreen> createState() => _RedeemScreenState();
}

class _RedeemScreenState extends State<RedeemScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<Redeemcontroller>().init();
    });
  }

  Configure config = Configure();
  // List<String> _selectedname = ['A', 'B', 'C'];
  // Addmethod() {
  //   setState(() {
  //     int? value = int.parse(pointsController.text);
  //     value = value + 1;
  //     pointsController.text = value.toString();
  //   });
  // }

  // minusmethod() {
  //   setState(() {
  //     int? value = int.parse(pointsController.text);
  //     value = value - 1;
  //     pointsController.text = value.toString();
  //   });
  // }

  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    var groupvalue = context.read<Languagecontroller>().locale.languageCode;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      // backgroundColor: const Color.fromARGB(255, 1, 53, 143),
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
          // height: Screens.fullHeight(context) * 0.9,

          child: Container(
            // height: Screens.fullHeight(context) * 0.93,
            width: Screens.width(context),
            decoration: const BoxDecoration(
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
                  const Text(
                    "MY REDEEMS",
                    style: TextStyle(
                      color: Color.fromARGB(255, 212, 14, 0),
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
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   children: [
                  //     Container(
                  //       // color: Colors.amber,
                  //       alignment: Alignment.center,
                  //       child: const Text(
                  //         "AVALIABLE POINTS",
                  //         style: TextStyle(
                  //             fontSize: 16,
                  //             fontWeight: FontWeight.bold,
                  //             color: Color.fromARGB(255, 99, 99, 99)),
                  //       ),
                  //     ),
                  //     SizedBox(
                  //       width: Screens.width(context) * 0.03,
                  //     ),
                  //     Container(
                  //       // color: Colors.red,
                  //       alignment: Alignment.center,
                  //       child: Text(
                  //         "${context.watch<Redeemcontroller>().pointsdata!.isNotEmpty ? context.watch<Redeemcontroller>().pointsdata![0].points : '0'}",
                  //         style: const TextStyle(
                  //             fontSize: 30,
                  //             fontWeight: FontWeight.bold,
                  //             color: Color.fromARGB(255, 0, 0, 0)),
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        // color: Colors.amber,
                        alignment: Alignment.center,
                        child: Row(
                          children: [
                            const Text(
                              "Avaliable Points",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 38, 162, 136)),
                            ),
                            SizedBox(
                              width: Screens.width(context) * 0.015,
                            ),
                            context
                                    .watch<Redeemcontroller>()
                                    .pointsdata
                                    .isNotEmpty
                                ? Text(
                                    "${context.watch<Redeemcontroller>().pointsdata[0].points ?? '0'}",
                                    style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Color.fromARGB(255, 0, 0, 0)),
                                  )
                                : const Text('0'),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Amount",
                            style: TextStyle(
                              color: Color.fromARGB(255, 38, 162, 136),
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(
                            width: Screens.width(context) * 0.02,
                          ),
                          context.watch<Redeemcontroller>().reamtdata.isNotEmpty
                              ? Text(
                                  "${context.watch<Redeemcontroller>().reamtdata[0].redeemamt}",
                                  style: const TextStyle(
                                    color: Color.fromARGB(255, 212, 14, 0),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                )
                              : Text('0'),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: Screens.fullHeight(context) * 0.015,
                  ),
                  Container(
                    height: Screens.fullHeight(context) * 0.085,
                    // width: Screens.width(context) * 0.9,
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 243, 243, 243),
                      // borderRadius: const BorderRadius.all(Radius.circular(10)),
                      // border: Border.all(
                      //     color: const Color.fromARGB(255, 202, 202, 202)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          child: Row(
                            children: [
                              Text(
                                S.current.redeempoints1,
                                style: const TextStyle(
                                  color: Color.fromARGB(255, 38, 162, 136),
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Container(
                                  height: Screens.fullHeight(context) * 0.045,
                                  width: Screens.width(context) * 0.2,
                                  // color: Colors.amber,
                                  child: TextFormField(
                                    readOnly: true,
                                    style: const TextStyle(
                                      fontSize: 20,
                                    ),
                                    controller: context
                                        .watch<Redeemcontroller>()
                                        .pointsController,
                                    cursorColor:
                                        const Color.fromARGB(255, 212, 14, 0),
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                      hintText: "0",
                                      hintStyle: const TextStyle(
                                          fontSize: 25,
                                          color: Color.fromARGB(
                                              255, 199, 199, 199)),
                                      isDense: true,
                                      contentPadding: EdgeInsets.symmetric(
                                          vertical:
                                              Screens.padingHeight(context) *
                                                  0.01,
                                          horizontal:
                                              Screens.width(context) * 0.02),
                                      focusedBorder: const OutlineInputBorder(
                                          // borderRadius:
                                          //     BorderRadius.all(Radius.circular(10)),
                                          borderSide: BorderSide.none),
                                      enabledBorder: const OutlineInputBorder(
                                          // borderRadius:
                                          //     BorderRadius.all(Radius.circular(10)),
                                          borderSide: BorderSide
                                              .none), // hoverColor: Colors.red,
                                      border: InputBorder.none,

                                      filled: true,
                                      fillColor: const Color.fromARGB(
                                          255, 255, 255, 255),
                                    ),
                                  )),
                            ],
                          ),
                        ),
                        DropdownMenu<String>(
                            inputDecorationTheme: InputDecorationTheme(
                                hintStyle: TextStyle(
                                    color: context
                                                .watch<Redeemcontroller>()
                                                .isNotSelect ==
                                            true
                                        ? Colors.red
                                        : Colors.grey),
                                border: InputBorder.none,
                                filled: true,
                                // isCollapsed: true,
                                isDense: true,
                                contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 10),
                                constraints: BoxConstraints.tight(
                                  const Size.fromHeight(40),
                                ),
                                fillColor:
                                    const Color.fromARGB(255, 255, 255, 255)),
                            // width: 100,
                            width: Screens.width(context) * 0.34,
                            hintText: "Dealer",
                            initialSelection:
                                context.watch<Redeemcontroller>().selectedCode,
                            onSelected: (String? value) {
                              setState(() {
                                context
                                    .read<Redeemcontroller>()
                                    .selectedDealer(value!);

                                // datecontroller.text = "";
                                // todatecontroller.text = "";
                              });
                            },
                            dropdownMenuEntries: context
                                .watch<Redeemcontroller>()
                                .transDealerData
                                .map((location) {
                              return DropdownMenuEntry<String>(
                                value: location.dealername,
                                label: location.dealername,
                              );
                            }).toList()),
                      ],
                    ),
                  ),

                  // Container(
                  //   height: Screens.fullHeight(context) * 0.085,
                  //   // width: Screens.width(context) * 0.9,
                  //   decoration: BoxDecoration(
                  //     color: const Color.fromARGB(255, 38, 162, 136),
                  //     borderRadius: const BorderRadius.all(Radius.circular(10)),
                  //     border: Border.all(
                  //         color: const Color.fromARGB(255, 202, 202, 202)),
                  //   ),
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //     children: [
                  //       const Text(
                  //         "REDEEM POINTS",
                  //         style: TextStyle(
                  //           color: Color.fromARGB(255, 255, 255, 255),
                  //           fontSize: 17,
                  //           fontWeight: FontWeight.bold,
                  //         ),
                  //       ),
                  //       Container(
                  //           // height: Screens.fullHeight(context) * 0.058,
                  //           width: Screens.width(context) * 0.3,
                  //           // color: Colors.amber,
                  //           child: TextFormField(
                  //             style: const TextStyle(
                  //               fontSize: 25,
                  //             ),
                  //             controller: context
                  //                 .read<Redeemcontroller>()
                  //                 .pointsController,
                  //             cursorColor:
                  //                 const Color.fromARGB(255, 212, 14, 0),
                  //             keyboardType: TextInputType.number,
                  //             decoration: InputDecoration(
                  //               hintText: "0",
                  //               hintStyle: const TextStyle(
                  //                   fontSize: 25,
                  //                   color: Color.fromARGB(255, 199, 199, 199)),
                  //               isDense: true,
                  //               contentPadding: EdgeInsets.symmetric(
                  //                   vertical:
                  //                       Screens.padingHeight(context) * 0.01,
                  //                   horizontal: Screens.width(context) * 0.02),
                  //               focusedBorder: const OutlineInputBorder(
                  //                   borderRadius:
                  //                       BorderRadius.all(Radius.circular(10)),
                  //                   borderSide: BorderSide.none),
                  //               enabledBorder: const OutlineInputBorder(
                  //                   borderRadius:
                  //                       BorderRadius.all(Radius.circular(10)),
                  //                   borderSide: BorderSide
                  //                       .none), // hoverColor: Colors.red,
                  //               border: InputBorder.none,

                  //               filled: true,
                  //               fillColor:
                  //                   const Color.fromARGB(255, 255, 255, 255),
                  //             ),
                  //           )),
                  //       // CircleAvatar(
                  //       //   radius: 16,
                  //       //   backgroundColor:
                  //       //       const Color.fromARGB(255, 255, 255, 255),
                  //       //   child: IconButton(
                  //       //       color: const Color.fromARGB(255, 38, 162, 136),
                  //       //       padding: const EdgeInsets.all(0),
                  //       //       onPressed: context
                  //       //                   .read<Redeemcontroller>()
                  //       //                   .pointsController
                  //       //                   .text ==
                  //       //               "0"
                  //       //           ? () {}
                  //       //           : () {
                  //       //               log("{error}" +
                  //       //                   context
                  //       //                       .read<Redeemcontroller>()
                  //       //                       .pointsController
                  //       //                       .text
                  //       //                       .toString());
                  //       //               if (context
                  //       //                   .read<Redeemcontroller>()
                  //       //                   .pointsController
                  //       //                   .text
                  //       //                   .isEmpty) {
                  //       //                 log("{second error}");
                  //       //               } else {
                  //       //                 setState(() {
                  //       //                   minusmethod();
                  //       //                 });
                  //       //               }
                  //       //             },
                  //       //       icon: const Icon(Icons.remove)),
                  //       // ),
                  //       // CircleAvatar(
                  //       //   radius: 16,
                  //       //   backgroundColor:
                  //       //       const Color.fromARGB(255, 255, 255, 255),
                  //       //   child: IconButton(
                  //       //       color: const Color.fromARGB(255, 38, 162, 136),
                  //       //       padding: const EdgeInsets.all(0),
                  //       //       onPressed: context
                  //       //               .read<Redeemcontroller>()
                  //       //               .pointsController
                  //       //               .text
                  //       //               .isEmpty
                  //       //           ? () {}
                  //       //           : () {
                  //       //               log("{error}" +
                  //       //                   context
                  //       //                       .read<Redeemcontroller>()
                  //       //                       .pointsController
                  //       //                       .text
                  //       //                       .toString());
                  //       //               if (context
                  //       //                   .read<Redeemcontroller>()
                  //       //                   .pointsController
                  //       //                   .text
                  //       //                   .isEmpty) {
                  //       //                 log("{second error}");
                  //       //               } else {
                  //       //                 setState(() {
                  //       //                   Addmethod();
                  //       //                 });
                  //       //               }
                  //       //             },
                  //       //       icon: const Icon(Icons.add)),
                  //       // ),
                  //     ],
                  //   ),
                  // ),

                  SizedBox(
                    height: Screens.fullHeight(context) * 0.02,
                  ),

                  SizedBox(
                    height: Screens.fullHeight(context) * 0.03,
                  ),
                  SizedBox(
                    height: Screens.fullHeight(context) * 0.045,
                    width: Screens.width(context) * 0.3,
                    child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            if (context.read<Redeemcontroller>().selectedCode !=
                                null) {
                              context.read<Redeemcontroller>().isNotSelect =
                                  false;

                              context
                                  .read<Redeemcontroller>()
                                  .callRedeemAmountApi();
                            } else {
                              context.read<Redeemcontroller>().isNotSelect =
                                  true;
                            }
                          });
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromARGB(255, 212, 14, 0),
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(4)))),
                        child: Text(
                          S.current.submit,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        )),
                  ),
                  SizedBox(
                    height: Screens.fullHeight(context) * 0.03,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        S.current.redeemhistory,
                        style: const TextStyle(
                          color: Color.fromARGB(255, 38, 162, 136),
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
                    child: context
                            .watch<Redeemcontroller>()
                            .addRedeemteddata
                            .isEmpty
                        ? const Center(
                            child: Text("No Data..."),
                          )
                        : ListView.builder(
                            // reverse: true,
                            shrinkWrap: true,
                            padding: const EdgeInsets.all(0),
                            itemCount: context
                                .watch<Redeemcontroller>()
                                .addRedeemteddata
                                .length,
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
                                    // color: dummlist[i].status == true
                                    //     ? Colors.grey[100]
                                    //     : Colors.white,
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
                                                    child: const Text(
                                                      "Redeem On -->  ",
                                                      style: TextStyle(
                                                          fontSize: 17,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Color.fromARGB(
                                                              255, 0, 0, 0)),
                                                    ),
                                                  ),
                                                  Container(
                                                    child: Text(
                                                      "${config.alignDate(context.watch<Redeemcontroller>().addRedeemteddata[i].docDate.toString())}",
                                                      style: const TextStyle(
                                                          fontSize: 16,
                                                          color: Color.fromARGB(
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
                                                "${context.watch<Redeemcontroller>().addRedeemteddata[i].amount}\$",
                                                style: const TextStyle(
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
                                              const Text(
                                                "Dealer Name :  ",
                                                style: TextStyle(fontSize: 15),
                                              ),
                                              Text(
                                                "${context.watch<Redeemcontroller>().addRedeemteddata[i].dealerName}",
                                                style: const TextStyle(
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

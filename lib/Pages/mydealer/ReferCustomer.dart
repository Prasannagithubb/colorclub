import 'package:flutter/material.dart';
import 'package:new_one/Constant/Screen.dart';

class ReferralScreen extends StatelessWidget {
  final Color primaryColor = const Color.fromARGB(255, 16, 57, 122);

  const ReferralScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // String title;
    final theme = Theme.of(context);
    return Scaffold(
      // backgroundColor: Colors.white,
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
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20))),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 2),
                  Container(
                    height: 100,
                    // color: Colors.blue,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Padding(
                        //   padding: EdgeInsets.symmetric(
                        //       horizontal: Screens.width(context) * 0.0,
                        //       vertical: Screens.padingHeight(context) * 0.013),
                        //   child: Row(
                        //     mainAxisAlignment: MainAxisAlignment.center,
                        //     children: [
                        //       InkWell(
                        //         onTap: () {
                        //           showDialog(
                        //               context: context,
                        //               builder: (context) {
                        //                 return AlertDialog(
                        //                   insetPadding:
                        //                       const EdgeInsets.all(10),
                        //                   contentPadding:
                        //                       const EdgeInsets.all(0),
                        //                   shape: RoundedRectangleBorder(
                        //                       borderRadius:
                        //                           BorderRadius.circular(8)),
                        //                   alignment: Alignment.center,
                        //                   content: Container(
                        //                     // height: 300,
                        //                     // color: Colors.amber,
                        //                     width: Screens.width(context) * 0.1,
                        //                     constraints: BoxConstraints(
                        //                         maxHeight: Screens.padingHeight(
                        //                                 context) *
                        //                             0.3),
                        //                     child: Column(
                        //                       mainAxisSize: MainAxisSize.min,
                        //                       children: [
                        //                         Expanded(
                        //                           child: ListView.builder(
                        //                               shrinkWrap: true,
                        //                               // ise:true,
                        //                               itemCount:
                        //                                   LanguageModel.length,
                        //                               itemBuilder:
                        //                                   (context, i) {
                        //                                 var item =
                        //                                     LanguageModel[i];
                        //                                 return RadioListTile(
                        //                                     value: item
                        //                                         .languagecode,
                        //                                     activeColor: theme
                        //                                         .primaryColor,
                        //                                     groupValue:
                        //                                         groupvalue,
                        //                                     title: Text(
                        //                                         item.language!),
                        //                                     subtitle: Text(item
                        //                                         .sublanguage!),
                        //                                     onChanged: (val) {
                        //                                       groupvalue = val
                        //                                           .toString();
                        //                                       context
                        //                                           .read<
                        //                                               Languagecontroller>()
                        //                                           .setlocate(
                        //                                               Locale(item
                        //                                                   .languagecode!));
                        //                                       Navigator.pop(
                        //                                           context);
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
                        //           // alignment: Alignment.topRight,
                        //           width: Screens.width(context) * 0.3,
                        //           height: Screens.fullHeight(context) * 0.04,
                        //           // child: const Icon(
                        //           //   Icons.language,
                        //           //   color: Colors.black,
                        //           //   size: 30,
                        //           // )
                        //           decoration: BoxDecoration(
                        //               color: const Color.fromARGB(
                        //                   255, 248, 248, 248),
                        //               border: Border.all(
                        //                   color: const Color.fromARGB(
                        //                       255, 172, 172, 172),
                        //                   width: 0.5),
                        //               borderRadius: BorderRadius.circular(7)),
                        //           child: Padding(
                        //             padding: EdgeInsets.symmetric(
                        //                 vertical:
                        //                     Screens.padingHeight(context) *
                        //                         0.00),
                        //             child: Row(
                        //               mainAxisAlignment:
                        //                   MainAxisAlignment.center,
                        //               children: [
                        //                 const Text(
                        //                   "English",
                        //                   style: TextStyle(
                        //                       fontSize: 16,
                        //                       fontWeight: FontWeight.bold,
                        //                       color: Color.fromARGB(
                        //                           255, 95, 95, 95)),
                        //                 ),
                        //                 SizedBox(
                        //                   width: Screens.width(context) * 0.02,
                        //                 ),
                        //                 const Icon(
                        //                   Icons.arrow_drop_down,
                        //                   color: const Color.fromARGB(
                        //                       255, 212, 14, 0),
                        //                   size: 33,
                        //                 ),
                        //               ],
                        //             ),
                        //           ),
                        //         ),
                        //       ),
                        //     ],
                        //   ),
                        // ),

                        Container(
                          height: 100,
                          // color: Colors.blue,
                          child: Image.asset(
                            'assets/cp.png',
                            // height: 300,
                            width: 110,
                            // scale: 1,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    // color: Colors.amber,
                    child: Image.asset(
                      'assets/referral23.png', // Replace with the actual image asset
                      height: 150,
                      width: 200,
                      // scale: 4,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Refer & Get Rewarded",
                    style: TextStyle(
                      fontFamily: "bahnschrift",
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 18),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Colors.grey,
                      ),
                      color: Colors.grey[200],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "ELAYASOFTY9087",
                          style: TextStyle(
                            fontSize: 18,
                            // fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 16, 57, 122),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  8), // Change the radius as needed
                            ),
                            backgroundColor:
                                const Color.fromARGB(255, 16, 57, 122),
                          ),
                          child: const Text(
                            "Copy",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),

                  const Text(
                    "For every Refferral,YOU BOTH ",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.black54,
                        fontWeight: FontWeight.bold),
                  ),
                  const Text(
                    "GET \$ 100 FREE",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: "bahnschrift",
                      fontSize: 20,
                      color: Color.fromARGB(255, 226, 0, 0),
                    ),
                  ),
                  // const SizedBox(height: 20),

                  const SizedBox(height: 20),
                  ElevatedButton.icon(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      // minimumSize: Size(100, 50),
                      maximumSize: const Size(300, 100),
                      backgroundColor: Colors.green,
                      padding: const EdgeInsets.symmetric(
                          vertical: 12, horizontal: 20),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    icon: const Icon(Icons.share, color: Colors.white),
                    label: const Text("Share via WhatsApp",
                        style: TextStyle(fontSize: 16, color: Colors.white)),
                  ),
                  const SizedBox(height: 30),
                  // Text(
                  //   "Rewards you've won",
                  //   style: TextStyle(
                  //     fontSize: 18,
                  //     fontWeight: FontWeight.bold,
                  //     color: Colors.grey,
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

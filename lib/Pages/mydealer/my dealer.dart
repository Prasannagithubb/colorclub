import 'package:flutter/material.dart';
import 'package:new_one/Constant/Screen.dart';
import 'package:new_one/Controller/logincontroller/languagecontroller.dart';
import 'package:new_one/Models/language_model.dart';
import 'package:provider/provider.dart';

class ReferralScreen extends StatelessWidget {
  final Color primaryColor = const Color.fromARGB(255, 16, 57, 122);

  const ReferralScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // String title;
    final theme = Theme.of(context);
    var groupvalue = context.read<Languagecontroller>().locale.languageCode;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        color: const Color.fromARGB(255, 16, 57, 122),
        padding: const EdgeInsets.only(top: 30, bottom: 30),
        child: Container(
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20),
                  topLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                  bottomLeft: Radius.circular(20))),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 2),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 255, 255, 255)),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: Screens.width(context) * 0.0,
                              vertical: Screens.padingHeight(context) * 0.013),
                          child: Row(
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
                                            width: Screens.width(context) * 0.1,
                                            constraints: BoxConstraints(
                                                maxHeight: Screens.padingHeight(
                                                        context) *
                                                    0.3),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Expanded(
                                                  child: ListView.builder(
                                                      shrinkWrap: true,
                                                      // ise:true,
                                                      itemCount:
                                                          LanguageModel.length,
                                                      itemBuilder:
                                                          (context, i) {
                                                        var item =
                                                            LanguageModel[i];
                                                        return RadioListTile(
                                                            value: item
                                                                .languagecode,
                                                            activeColor: theme
                                                                .primaryColor,
                                                            groupValue:
                                                                groupvalue,
                                                            title: Text(
                                                                item.language!),
                                                            subtitle: Text(item
                                                                .sublanguage!),
                                                            onChanged: (val) {
                                                              groupvalue = val
                                                                  .toString();
                                                              context
                                                                  .read<
                                                                      Languagecontroller>()
                                                                  .setlocate(
                                                                      Locale(item
                                                                          .languagecode!));
                                                              Navigator.pop(
                                                                  context);
                                                            });
                                                      }),
                                                )
                                              ],
                                            ),
                                          ),
                                        );
                                      });
                                },
                                child: Container(
                                  alignment: Alignment.topRight,
                                  width: Screens.width(context) * 0.30,
                                  height: Screens.bodyheight(context) * 0.040,
                                  // child: const Icon(
                                  //   Icons.language,
                                  //   color: Colors.black,
                                  //   size: 30,
                                  // )
                                  decoration: BoxDecoration(
                                      color: Colors.grey.shade100,
                                      // color: const Color.fromARGB(255, 255, 255, 255),
                                      border: Border.all(
                                          color: Colors.grey.shade400,
                                          width: 1),
                                      borderRadius: BorderRadius.circular(6)),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical:
                                            Screens.padingHeight(context) *
                                                0.005),
                                    child: const Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(
                                          'English',
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.black,
                                            // fontWeight: FontWeight.bold
                                          ),
                                        ),
                                        SizedBox(
                                          width: 15,
                                        ),
                                        Icon(
                                          Icons.arrow_drop_down,
                                          color: Colors.red,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Image.asset(
                      'assets/cp.png',
                      scale: 2,
                    ),
                  ],
                ),
                Image.asset(
                  'assets/referral23.png', // Replace with the actual image asset
                  height: 200,
                  width: 300,
                  // scale: 4,
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
                const SizedBox(height: 4),
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
                      fontSize: 18,
                      color: Color.fromARGB(255, 226, 0, 0),
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
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
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                12), // Change the radius as needed
                          ),
                          backgroundColor: const Color.fromARGB(255, 226, 0, 0),
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
    );
  }
}

import 'dart:developer';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_one/Constant/ConstantRoutes.dart';
import 'package:new_one/Constant/Screen.dart';
import 'package:new_one/Controller/logincontroller/languagecontroller.dart';
import 'package:new_one/Models/language_model.dart';
import 'package:new_one/Pages/login/screens/loginscreen.dart';
import 'package:new_one/generated/l10n.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final CarouselSliderController _carouselController =
      CarouselSliderController();
  int currentIndexcarousel = 0;
  final List<Map<String, String>> adOffers = [
    {
      'text': 'Get 12% off on Coral Delux Hi Cover Emulsion!',
      'image': 'assets/IMG_2303.jpeg'
    },
    {
      'text': 'Buy 10 packs, Get 1 Absolutely Free!',
      'image': 'assets/offer102.jpg'
    },
    {
      'text':
          'Extended! Extra Savings on Hi-Gloss Enamel - only Till Month-End!',
      'image': 'assets/offer104.jpg'
    },
    {
      'text': 'Pay in Advance & Get Up to 5% Flat Cash Discount!',
      'image': 'assets/offer101.jpg'
    },
    {
      'text': 'Pay in Advance & Get Up to 5% Flat Cash Discount!',
      'image': 'assets/img_HomeScreen1.png'
    },
    {
      'text': 'Pay in Advance & Get Up to 5% Flat Cash Discount!',
      'image': 'assets/img_HomeScreen2.png'
    },
    {
      'text': 'Pay in Advance & Get Up to 5% Flat Cash Discount!',
      'image': 'assets/img_HomeScreen3.png'
    },
    {
      'text': 'Pay in Advance & Get Up to 5% Flat Cash Discount!',
      'image': 'assets/img_HomeScreen4.png'
    },
  ];

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
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 16, 57, 122),
      // appBar: AppBar(
      //   backgroundColor: Colors.grey.shade200,
      //   // title: const Text(
      //   //   "Dashboard",
      //   //   style: TextStyle(
      //   //     fontSize: 22,
      //   //     fontWeight: FontWeight.bold,
      //   //     color: Colors
      //   //         .black, // Set to white as the gradient will be applied over the text
      //   //   ),
      //   // ),
      //   centerTitle: true,
      // ),
      body: Container(
        height: Screens.fullHeight(context) * 0.965,
        width: Screens.width(context),
        decoration: const BoxDecoration(
            color: Color.fromARGB(255, 255, 255, 255),
            borderRadius: BorderRadius.all(Radius.circular(16))),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: Screens.fullHeight(context) * 0.34,
                width: Screens.width(context),
                decoration: const BoxDecoration(
                    // color: Color.fromARGB(255, 228, 100, 100),
                    ),
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Container(
                          height: Screens.fullHeight(context) * 0.19,
                          width: Screens.width(context),
                          decoration: const BoxDecoration(
                              // color: Color.fromARGB(255, 104, 228, 100),
                              ),
                          child: Image.asset(
                            "assets/Top6.png",
                            height: Screens.fullHeight(context) * 0.2,
                            width: Screens.width(context),
                            fit: BoxFit.cover,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                  left: Screens.width(context) * 0.01,
                                  top: Screens.fullHeight(context) * 0.06),
                              child: Image.asset(
                                "assets/CoralLogo_Outline.png",
                                alignment: Alignment.topLeft,
                                height: Screens.fullHeight(context) * 0.1,
                                width: Screens.width(context) * 0.3,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: Screens.fullHeight(context) * 0.05,
                                  right: Screens.fullHeight(context) * 0.05),
                              // child: Container(
                              //   height: Screens.fullHeight(context) * 0.09,
                              //   width: Screens.width(context) * 0.18,
                              //   decoration: BoxDecoration(
                              //       // border: Border.all(
                              //       //     color: const Color.fromARGB(
                              //       //         255, 7, 126, 126),
                              //       //     width: 0.5),
                              //       image: DecorationImage(
                              //           image:
                              //               AssetImage("assets/logo user.png"),
                              //           fit: BoxFit.cover),
                              //       // color: Colors.amber,
                              //       borderRadius:
                              //           BorderRadius.all(Radius.circular(25))),
                              // ),
                              child: Stack(
                                children: [
                                  const CircleAvatar(
                                    radius: 53,
                                    backgroundColor:
                                        Color.fromARGB(255, 245, 245, 245),
                                    // child: Image.asset(
                                    //   "assets/logo user.png",
                                    // ),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: CircleAvatar(
                                      radius: 45,
                                      backgroundColor:
                                          Color.fromARGB(255, 206, 206, 206),
                                      // child: Image.asset(
                                      //   "assets/logo user.png",
                                      // ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(13.0),
                                    child: CircleAvatar(
                                      radius: 40,
                                      child: Image.asset(
                                        "assets/logo user.png",
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  _showLogoutDialog(context);
                                });
                              },
                              child: Padding(
                                padding: EdgeInsets.only(
                                  top: Screens.fullHeight(context) * 0.025,
                                  right: Screens.fullHeight(context) * 0.02,
                                ),
                                child: Container(
                                  height: Screens.fullHeight(context) * 0.055,
                                  width: Screens.width(context) * 0.12,
                                  decoration: const BoxDecoration(
                                      image: DecorationImage(
                                          image:
                                              AssetImage("assets/switch.png"),
                                          fit: BoxFit.cover),
                                      // color: Colors.amber,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(25))),
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                    Stack(
                      children: [
                        Container(
                          height: Screens.fullHeight(context) * 0.15,
                          width: Screens.width(context),
                          constraints: BoxConstraints(
                              minHeight: Screens.fullHeight(context) * 0.13),
                          alignment: Alignment.bottomLeft,
                          padding: EdgeInsets.only(
                              bottom: Screens.fullHeight(context) * 0.01,
                              left: Screens.width(context) * 0.02),
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 255, 255, 255),
                            image: DecorationImage(
                              alignment: Alignment.bottomCenter,
                              image: AssetImage(
                                "assets/GiftPopper1.png",
                              ),
                              fit: BoxFit.contain,
                            ),
                          ),
                          child: Stack(
                            children: [
                              Container(
                                alignment: Alignment.center,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Container(
                                      height:
                                          Screens.fullHeight(context) * 0.07,
                                      width: Screens.width(context) * 0.20,
                                      // width: Scree,
                                      padding: const EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          border:
                                              Border.all(color: Colors.grey)),
                                      child: Center(
                                        child: Text(
                                          "${S.current.redeem}",
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      height:
                                          Screens.fullHeight(context) * 0.07,
                                      width: Screens.width(context) * 0.20,
                                      padding: const EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          border:
                                              Border.all(color: Colors.grey)),
                                      child: Center(
                                        child: Text(
                                          "${S.current.rewards}",
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      height:
                                          Screens.fullHeight(context) * 0.07,
                                      width: Screens.width(context) * 0.20,
                                      padding: const EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          border:
                                              Border.all(color: Colors.grey)),
                                      child: Center(
                                        child: Text(
                                          "${S.current.points}",
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),

                                    // RewardCard(
                                    //   textColorsub: Colors.redAccent.shade700,
                                    //   width: 110,
                                    //   colors: Colors.blue,
                                    //   height: Screens.fullHeight(context) * 0.03,
                                    //   title: "  Points",
                                    //   subtitle: "1000 points",
                                    //   imagePath: 'assets/redeem points2.png',
                                    // ),
                                    // RewardCard(
                                    //   colors: Colors.blue,
                                    //   height: Screens.fullHeight(context) * 0.03,
                                    //   width: 110,
                                    //   title: "Rewards",
                                    //   subtitle: "Gold",
                                    //   imagePath: 'assets/earned points.png',
                                    // ),
                                    // RewardCard(
                                    //   textColorsub: Colors.redAccent.shade700,
                                    //   width: 110,
                                    //   colors: Colors.blue,
                                    //   height: Screens.fullHeight(context) * 0.03,
                                    //   title: "Redeems",
                                    //   subtitle: "\$1000",
                                    //   imagePath: 'assets/reward.png',
                                    // ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          left: 58,
                          bottom: 85,
                          child: Container(
                            height: Screens.fullHeight(context) * 0.05,
                            width: Screens.width(context) * 0.15,
                            decoration:
                                const BoxDecoration(color: Colors.white),
                            child: Image.asset(
                              "assets/redeem points2.png", // Load image from assets
                              width: Screens.fullHeight(context) * 0.05,

                              height: Screens.width(context) * 0.15,
                              // fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Positioned(
                          left: 178,
                          bottom: 85,
                          child: Container(
                            height: Screens.fullHeight(context) * 0.05,
                            width: Screens.width(context) * 0.15,
                            decoration:
                                const BoxDecoration(color: Colors.white),
                            child: Image.asset(
                              "assets/earned points.png", // Load image from assets
                              width: Screens.fullHeight(context) * 0.05,

                              height: Screens.width(context) * 0.15,
                              // fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Positioned(
                          right: 49,
                          bottom: 85,
                          child: Container(
                            height: Screens.fullHeight(context) * 0.05,
                            width: Screens.width(context) * 0.15,
                            decoration:
                                const BoxDecoration(color: Colors.white),
                            child: Image.asset(
                              "assets/reward.png", // Load image from assets
                              width: Screens.fullHeight(context) * 0.05,

                              height: Screens.width(context) * 0.15,
                              // fit: BoxFit.cover,
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),

              // Container(
              //   height: Screens.fullHeight(context) * 0.007,
              //   width: Screens.width(context),
              //   decoration: const BoxDecoration(
              //       color: Color.fromARGB(255, 255, 255, 255)),
              // ),
              // SizedBox(
              //   height: Screens.fullHeight(context) * 0.01,
              // ),

              Container(
                height: Screens.fullHeight(context) * 0.17,
                width: Screens.width(context),
                // color: Colors.amber,
                child: CarouselSlider(
                  carouselController: _carouselController,
                  options: CarouselOptions(
                    autoPlayInterval: const Duration(seconds: 4),
                    viewportFraction: 1.0,
                    onPageChanged: (index, reason) {
                      setState(() {
                        currentIndexcarousel = index;
                      });
                    },
                  ),
                  items: adOffers.map((offer) {
                    return Stack(
                      children: [
                        ClipRRect(
                          child: Image.asset(
                            offer['image']!,
                            width: double.infinity,
                            height: 150,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned(
                          top: 135,
                          left: 0,
                          right: 0,
                          child: Center(
                            child: AnimatedSmoothIndicator(
                              activeIndex: currentIndexcarousel,
                              count: adOffers.length,
                              effect: const ExpandingDotsEffect(
                                dotHeight: 8,
                                dotWidth: 7,
                                activeDotColor:
                                    Color.fromARGB(255, 22, 86, 102),
                                dotColor: Color.fromARGB(255, 255, 255, 255),
                              ),
                              onDotClicked: (index) {
                                _carouselController.animateToPage(index);
                              },
                            ),
                          ),
                        ),
                      ],
                    );
                  }).toList(),
                ),
              ),
              SizedBox(
                height: Screens.fullHeight(context) * 0.01,
              ),

              Container(
                // color: Colors.amber,
                child: InkWell(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            insetPadding: const EdgeInsets.all(10),
                            contentPadding: const EdgeInsets.all(0),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                            alignment: Alignment.center,
                            content: Container(
                              // height: 300,
                              // color: Colors.amber,
                              width: Screens.width(context) * 0.1,
                              constraints: BoxConstraints(
                                  maxHeight: Screens.fullHeight(context) * 0.3),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Expanded(
                                    child: ListView.builder(
                                        shrinkWrap: true,
                                        // ise:true,
                                        itemCount: LanguageModel.length,
                                        itemBuilder: (context, i) {
                                          var item = LanguageModel[i];
                                          return RadioListTile(
                                              value: item.languagecode,
                                              activeColor: theme.primaryColor,
                                              groupValue: groupvalue,
                                              title: Text(item.language!),
                                              subtitle: Text(item.sublanguage!),
                                              onChanged: (val) {
                                                groupvalue = val.toString();
                                                context
                                                    .read<Languagecontroller>()
                                                    .setlocate(Locale(
                                                        item.languagecode!));
                                                Navigator.pop(context);
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
                    // alignment: Alignment.topRight,
                    width: Screens.width(context) * 0.3,
                    height: Screens.fullHeight(context) * 0.040,
                    // child: const Icon(
                    //   Icons.language,
                    //   color: Colors.black,
                    //   size: 30,
                    // )
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 227, 6, 19),
                        border: Border.all(
                            color: const Color.fromARGB(255, 132, 132, 132),
                            width: 0.5),
                        borderRadius: BorderRadius.circular(7)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "${S.current.language}",
                          style: TextStyle(
                            letterSpacing: 1,
                            fontSize: 13,
                            color: Color.fromARGB(255, 255, 255, 255),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        // SizedBox(
                        //   width: Screens.width(context) * 0.01,
                        // ),
                        const Icon(
                          Icons.arrow_drop_down,
                          color: Color.fromARGB(255, 255, 255, 255),
                          size: 30,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              // SizedBox(
              //   height: Screens.fullHeight(context) * 0.00,
              // ),

              // const SizedBox(height: 10),
              // AnimatedSmoothIndicator(
              //   activeIndex: currentIndexcarousel,
              //   count: adOffers.length,
              //   effect: const ExpandingDotsEffect(
              //     dotHeight: 8,
              //     dotWidth: 7,
              //     activeDotColor: Colors.lightBlueAccent,
              //     dotColor: Colors.black,
              //   ),
              //   onDotClicked: (index) {
              //     _carouselController.animateToPage(index);
              //   },
              // ),
              // const SizedBox(
              //   height: 5,
              // ),
              // Menu Items as Icons
              Container(
                // color: Colors.amber,
                height: Screens.padingHeight(context) * 0.4,
                padding: EdgeInsets.symmetric(
                    horizontal: Screens.width(context) * 0.05,
                    vertical: Screens.padingHeight(context) * 0.02),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _buildMenuItem(
                              "${S.current.scancoupon}", 'assets/scan.png',
                              onTap: () {
                            log('scancoupon');
                            Get.toNamed(ConstantRoutes.qrpage);
                          }),
                          _buildMenuItem(
                              "${S.current.redeempoints}", 'assets/order.png',
                              onTap: () {
                            log('redeempoints');
                            Get.toNamed(ConstantRoutes.redeempoints);
                          }),
                          _buildMenuItem("${S.current.mytransactions}",
                              "assets/referal.png", onTap: () {
                            log('mytransactions');
                            Get.toNamed(ConstantRoutes.transactionscreen);
                          }),
                        ],
                      ),
                      SizedBox(
                        height: Screens.padingHeight(context) * 0.01,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _buildMenuItem(
                              S.current.mydealerpartner, "assets/referal.png",
                              onTap: () {
                            log('redeempoints');
                            Get.toNamed(ConstantRoutes.referral);
                          }),
                          _buildMenuItem(
                              S.current.finddealer, "assets/referal.png",
                              onTap: () {
                            log('refercustomer');
                            Get.toNamed(ConstantRoutes.finddealer);
                          }),
                          _buildMenuItem(
                              S.current.refercustomer, "assets/referal.png",
                              onTap: () {
                            log('findproduct');

                            Get.toNamed(ConstantRoutes.referral);
                          }),
                        ],
                      ),
                      SizedBox(
                        height: Screens.padingHeight(context) * 0.01,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _buildMenuItem(
                              S.current.ProductComplaints, "assets/referal.png",
                              onTap: () {
                            log('refercustomer');
                            Get.toNamed(ConstantRoutes.productcomplaints);
                          }),
                          _buildMenuItem(
                              S.current.findproduct, "assets/complaint.png",
                              onTap: () {
                            log('productcomplaints');

                            Get.toNamed(ConstantRoutes.productcomplaints);
                          }),
                          _buildMenuItem(S.current.kyc, "assets/kyc.png",
                              onTap: () {
                            log('scan');
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(builder: (context) => KYCApp()),
                            // );
                            Get.toNamed(ConstantRoutes.kyc);
                          }),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              // Container(
              //   height: Screens.fullHeight(context) * 0.09,
              //   width: Screens.width(context),
              //   decoration: BoxDecoration(color: Colors.amber),
              //   child: Column(
              //     children: [
              //       Container(
              //         height: Screens.fullHeight(context) * 0.04,
              //         width: Screens.width(context),
              //         decoration: BoxDecoration(
              //             color: const Color.fromARGB(255, 255, 255, 255),
              //             borderRadius: BorderRadius.all(Radius.circular(10))),
              //       ),
              //     ],
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMenuItem(String label, String imagePath, {VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Material(
            // elevation: 5, // Adds shadow on click
            // borderRadius: BorderRadius.circular(8),
            // color: const Color.fromARGB(255, 255, 255, 255),
            child: InkWell(
              borderRadius: BorderRadius.circular(8),
              onTap: onTap,
              child: Container(
                height: Screens.fullHeight(context) * 0.07,
                width: Screens.width(context) * 0.15,
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  border: Border.all(
                      color: const Color.fromARGB(255, 230, 230, 230)),
                  // color: Colors.amber,
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Image.asset(
                  imagePath,
                  width: Screens.fullHeight(context) * 0.05,

                  height: Screens.width(context) * 0.15,
                  // fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          SizedBox(height: Screens.fullHeight(context) * 0.005),
          Container(
            width: Screens.width(context) * 0.3,
            child: Text(
              label,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}

// class RewardCategory extends StatelessWidget {
//   final IconData icon;
//   final String title;

//   const RewardCategory({super.key, required this.icon, required this.title});

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Container(
//           width: Screens.fullHeight(context) * 0.05,
//           height: Screens.width(context) * 0.15,
//           decoration: const BoxDecoration(
//             color: Colors.blue,
//             shape: BoxShape.circle,
//           ),
//           child: Icon(
//             icon,
//             color: Colors.white,
//             size: 30,
//           ),
//         ),
//         const SizedBox(height: 8),
//         Text(
//           title,
//           style: const TextStyle(
//             color: Colors.black,
//             fontSize: 14,
//             fontWeight: FontWeight.bold,
//           ),
//           textAlign: TextAlign.center,
//         ),
//       ],
//     );
//   }
// }

class RewardCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String imagePath;
  double height;
  final Color? textColor;
  final Color? textColorsub;

  Color colors;
  final Color? borderColor;
  final double width;
  // Changed from IconData to String for image path

  RewardCard({
    super.key,
    required this.colors,
    required this.height,
    required this.title,
    required this.subtitle,
    required this.imagePath,
    this.textColor,
    this.borderColor,
    required this.width,
    this.textColorsub, // Marked as required
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(0.2),
      color: Colors.red,
      child: Container(
        width: width,
        color: Colors.amber,
        child: Padding(
          padding: const EdgeInsets.all(0.01),
          child: Column(
            children: [
              // Text("hi"),
              Stack(
                children: [
                  Container(
                    height: Screens.fullHeight(context) * 0.09,
                    width: Screens.width(context) * 0.20,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(
                          255, 190, 177, 153), // Background color
                      // border: Border.all(
                      //     color: Color.fromRGBO(255, 255, 255, 1),
                      //     width: 1), // Border color & width
                      // borderRadius: BorderRadius.circular(50), // Rounded corners
                      boxShadow: [
                        BoxShadow(
                          color: const Color.fromARGB(255, 255, 255, 255)
                              .withOpacity(0.3), // Light shadow
                          blurRadius: 4,
                          offset: const Offset(2, 2),
                        ),
                      ],
                      // image: DecorationImage(
                      //   image: AssetImage(imagePath),
                      // )
                    ),

                    // padding: EdgeInsets.only(
                    //     bottom:
                    //         Screens.fullHeight(context) * 0.08), // Inner spacing
                    child: Column(
                      children: [
                        SizedBox(
                          height: Screens.fullHeight(context) * 0.00,
                        ),
                        Text(
                          title,
                          style: TextStyle(
                            color: textColor,
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              // SizedBox(
              //   height: Screens.fullHeight(context) * 0.01,
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

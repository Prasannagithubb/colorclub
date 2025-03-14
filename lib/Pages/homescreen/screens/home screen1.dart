import 'dart:developer';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:new_one/Constant/Screen.dart';
import 'package:new_one/Pages/finddealer.dart';
import 'package:new_one/Pages/findproduct.dart';
import 'package:new_one/Pages/homescreen/screens/QRpage.dart';
import 'package:new_one/Pages/kyc.dart';
import 'package:new_one/Pages/login/screens/loginscreen.dart';
import 'package:new_one/Pages/my%20dealer.dart';
import 'package:new_one/Pages/mytransactions.dart';
import 'package:new_one/Pages/productcomplaints.dart';
import 'package:new_one/Pages/redeem.dart';
import 'package:new_one/Pages/refercustomer.dart';
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
      'text': 'Register a painter & Enjoy 10,000 TSH Discount!',
      'image': 'assets/IMG_2303.jpeg'
    },
    {
      'text':
          'Extended! Extra Savings on Hi-Gloss Enamel - only Till Month-End!',
      'image': 'assets/offer104.jpg'
    },
    {
      'text': 'Exclusive! Claim your Free Product Today!',
      'image': 'assets/IMG_2303.jpeg'
    },
    {
      'text': 'Pay in Advance & Get Up to 5% Flat Cash Discount!',
      'image': 'assets/offer101.jpg'
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
    return Scaffold(
      backgroundColor: Colors.white,
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 32,
            ),
            // User Profile Section
            Container(
              color: const Color.fromARGB(255, 7, 107, 125),
              // color: const Color.fromARGB(255, 1, 132, 142),

              //  rgba(1,132,142,255)
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 1),
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
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
                          color: Colors.red,
                          icon: const Icon(Icons.logout),
                          onPressed: () {
                            _showLogoutDialog(context);
                            // Handle logout
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            // const SizedBox(
            //   height: 10,
            // ),

            // KPIs Cards
            // KPIs Cards
            // KPIs Cards
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // const SizedBox(height: 30),
                Container(
                  // width: 800,
                  // height: 150,
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    // border: Border.all(color: Colors.black, width: 1),

                    // borderRadius: BorderRadius.circular(10),
                    color: Colors.lightBlue.shade50,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      RewardCard(
                        textColorsub: Colors.redAccent.shade700,
                        width: 110,
                        colors: Colors.blue,
                        height: Screens.bodyheight(context) * 0.03,
                        title: "Points Earned",
                        subtitle: "1000 points",
                        imagePath: 'assets/wallet.png',
                      ),
                      RewardCard(
                        colors: Colors.blue,
                        height: Screens.bodyheight(context) * 0.03,
                        width: 110,
                        title: "Ranking",
                        subtitle: "Gold",
                        imagePath: 'assets/trophy.png',
                      ),
                      RewardCard(
                        textColorsub: Colors.redAccent.shade700,
                        width: 110,
                        colors: Colors.blue,
                        height: Screens.bodyheight(context) * 0.03,
                        title: "Earned Amt",
                        subtitle: "\$1000",
                        imagePath: 'assets/pricing.png',
                      ),
                    ],
                  ),
                ),
              ],
            ),
            // const SizedBox(
            //   height: 10,
            // ),

            CarouselSlider(
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
                        height: 200,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      bottom: 40,
                      left: 0,
                      right: 0,
                      child: Center(
                        child: AnimatedSmoothIndicator(
                          activeIndex: currentIndexcarousel,
                          count: adOffers.length,
                          effect: const ExpandingDotsEffect(
                            dotHeight: 8,
                            dotWidth: 7,
                            activeDotColor: Colors.white,
                            dotColor: Colors.white,
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
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                height: 300,
                decoration: BoxDecoration(
                    // color: Colors.cyanAccent,
                    border: Border.all(color: Colors.black, width: 0.5),
                    borderRadius: BorderRadius.circular(10)),
                child: GridView.count(
                  mainAxisSpacing: 0.0,
                  crossAxisSpacing: 0.0,
                  childAspectRatio: 1.5,
                  crossAxisCount: 3,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    _buildMenuItem("Scan Coupon", 'assets/scan.png', onTap: () {
                      log('scan');
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const QRpage()),
                      );
                    }),
                    _buildMenuItem("Redeem Points", 'assets/order.png',
                        onTap: () {
                      log('scan');
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RedeemPointsScreen()),
                      );
                    }),
                    _buildMenuItem("My Transactions", "assets/referal.png",
                        onTap: () {
                      log('scan');
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => TransactionsScreen()),
                      );
                    }),
                    _buildMenuItem("My Dealer Partner", "assets/referal.png",
                        onTap: () {
                      log('scan');
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Referal()),
                      );
                    }),
                    _buildMenuItem("Find Dealer", "assets/referal.png",
                        onTap: () {
                      log('scan');
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Finddealer()),
                      );
                    }),
                    _buildMenuItem("Find Product", "assets/referal.png",
                        onTap: () {
                      log('scan');
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Findproduct()),
                      );
                    }),
                    _buildMenuItem("Refer Customer", "assets/referal.png",
                        onTap: () {
                      log('scan');
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Refercustomer()),
                      );
                    }),
                    _buildMenuItem("Product Complaints", "assets/complaint.png",
                        onTap: () {
                      log('scan');
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Productcomplaints()),
                      );
                    }),
                    _buildMenuItem("KYC", "assets/kyc.png", onTap: () {
                      log('scan');
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => KYCApp()),
                      );
                    }),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem(String label, String imagePath, {VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Material(
            elevation: 5, // Adds shadow on click
            borderRadius: BorderRadius.circular(8),
            color: Colors.white,
            child: InkWell(
              borderRadius: BorderRadius.circular(8),
              onTap: onTap,
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Image.asset(
                  imagePath,
                  width: 30,
                  height: 30,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          const SizedBox(height: 5),
          Text(
            label,
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.black, fontSize: 10),
          ),
        ],
      ),
    );
  }
}

class RewardCategory extends StatelessWidget {
  final IconData icon;
  final String title;

  const RewardCategory({super.key, required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: const BoxDecoration(
            color: Colors.blue,
            shape: BoxShape.circle,
          ),
          child: Icon(
            icon,
            color: Colors.white,
            size: 30,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          title,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

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
    return SizedBox(
      width: width,
      child: Padding(
        padding: const EdgeInsets.all(7.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white, // Background color
            border: Border.all(
                color: Colors.black, width: 1), // Border color & width
            borderRadius: BorderRadius.circular(10), // Rounded corners
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3), // Light shadow
                blurRadius: 4,
                offset: const Offset(2, 2),
              ),
            ],
          ),
          padding: const EdgeInsets.all(8), // Inner spacing
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: textColor,
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 5),
              Image.asset(
                // scale: 2.0,
                // color: Colors.amber,
                imagePath, // Load image from assets
                width: 30,
                height: height,
              ),
              const SizedBox(height: 5),
              Text(
                subtitle,
                style: TextStyle(
                  color: textColorsub,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

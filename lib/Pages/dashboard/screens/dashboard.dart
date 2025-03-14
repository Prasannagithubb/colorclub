import 'dart:developer';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:new_one/Constant/Screen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  void initState() {
    super.initState();
    if (views.isEmpty) {
      // viewss(views[0].title.toString());
      // Automatically select first item
    }
  }

  final CarouselSliderController _carouselController =
      CarouselSliderController();
  int currentIndexcarousel = 0;
  bool showMore = false;
  bool showPopularList = false;
  bool showMyOrdersList = false;
  bool showcatelogues = false;
  bool showMy = false;
  int selectedIndex = 0;
  String selectedCategory = "";
  List<Map<String, dynamic>> displayedItems = [];
  List<Viewdetails> views = [];
  bool showAll = false;

  final List<Map<String, dynamic>> mainItems = [
    {'name': 'My \nOrders', 'icon': Icons.shopping_bag},
    {'name': 'Points & Earnings', 'icon': Icons.monetization_on},
    {'name': 'Discount Schemes', 'icon': Icons.percent},
    {'name': 'More \nlist', 'icon': Icons.more_horiz},
    // {'name': 'Category', 'icon': Icons.category},
    // {'name': 'My Invoices', 'icon': Icons.receipt},
    // {'name': 'Painters', 'icon': Icons.brush},
    // {'name': 'Queries', 'icon': Icons.help},
  ];

  // final List<Map<String, dynamic>> moreItems = [
  //   {'name': 'Category', 'icon': Icons.category},
  //   {'name': 'My Invoices', 'icon': Icons.receipt},
  //   {'name': 'Painters', 'icon': Icons.brush},
  //   {'name': 'Queries', 'icon': Icons.help},
  // ];

  final List<Map<String, dynamic>> popularItems = [
    {
      'title': 'Place New Order',
      'desc': 'Easily place new orders with just a few clicks',
      'icon': Icons.add_shopping_cart,
      'button': 'create'
    },
    {
      'title': 'Earnings History',
      'desc': 'View detailed insights into your accumulated earnings',
      'icon': Icons.attach_money,
      'button': 'View'
    },
    {
      'title': 'Ongoing Discounts',
      'desc': 'Enjoy exclusive discounts available all year round',
      'icon': Icons.local_offer,
      'button': 'View'
    },
    {
      'title': 'View Invoices',
      'desc': 'Access and review all your invoices in one place',
      'icon': Icons.receipt_long,
      'button': 'View'
    },
    {
      'title': 'Product Catalogue',
      'desc': 'Explore our complete range of products in one place',
      'icon': Icons.menu_book,
      'button': 'View'
    },
    {
      'title': 'Find a Painter',
      'desc': 'Easily locate professional painters near you',
      'icon': Icons.format_paint,
      'button': 'FindNow'
    },
  ];

  final List<Map<String, dynamic>> myOrders = [
    {
      'title': 'Place New Order',
      'desc': 'Easily place new orders with just a few clicks',
      'icon': Icons.add_shopping_cart,
      'button': 'find Now'
    },
    {
      'title': 'Order History',
      'desc': 'View and manage all your past orders in one place',
      'icon': Icons.history,
      'button': 'Find Now'
    },
    {
      'title': 'Track My Order',
      'desc': 'Stay updated on the real-time status of your order',
      'icon': Icons.track_changes,
      'button': 'Find Now'
    },
    {
      'title': 'Order Status',
      'desc': 'Get instant updates on your order progress and delivery',
      'icon': Icons.update,
      'button': 'Find Now'
    },
    {
      'title': 'Reorder History',
      'desc': 'Quickly reorder from your previous purchases',
      'icon': Icons.history,
      'button': 'Find Now'
    },
    {
      'title': 'Bulk Order Upload',
      'desc': 'Effortlessly place bulk orders with a single upload',
      'icon': Icons.upload_file,
      'button': 'Find Now'
    },
    {
      'title': 'Reorder History',
      'desc': 'Quickly reorder from your previous purchases',
      'icon': Icons.history,
      'button': 'Find Now'
    },
    {
      'title': 'Bulk Order Upload',
      'desc': 'Effortlessly place bulk orders with a single upload',
      'icon': Icons.upload_file,
      'button': 'Find Now'
    },
  ];

  final List<Map<String, dynamic>> pointsAndEarnings = [
    {
      'title': 'My Points Summary',
      'desc': 'Track and manage your reward points effortlessly',
      'icon': Icons.add_shopping_cart,
      'button': 'find Now'
    },
    {
      'title': 'Earnings History',
      'desc': 'View detailed insights into your accumulated earnings',
      'icon': Icons.history,
      'button': 'view Details'
    },
    {
      'title': 'Redeem Points',
      'desc': 'Exchange your points for exciting rewards and benefits',
      'icon': Icons.track_changes,
      'button': 'Redeem Now'
    },
    {
      'title': 'Reward Catalogue',
      'desc': 'Explore a variety of rewards you can redeem with your points',
      'icon': Icons.update,
      'button': 'View Details'
    },
    {
      'title': 'Transaction History',
      'desc': 'Review all your point transactions in one place',
      'icon': Icons.history,
      'button': 'View Details'
    },
    {
      'title': 'Referal Rewards',
      'desc': 'Earn exclusive rewards by referring friends and partners',
      'icon': Icons.upload_file,
      'button': 'Refer Now'
    },
    {
      'title': 'Transaction History',
      'desc': 'Review all your point transactions in one place',
      'icon': Icons.history,
      'button': 'View Details'
    },
    {
      'title': 'Referal Rewards',
      'desc': 'Earn exclusive rewards by referring friends and partners',
      'icon': Icons.upload_file,
      'button': 'Refer Now'
    },
  ];

  final List<Map<String, dynamic>> catelogues = [
    {
      'title': 'Product Catalogue',
      'desc': 'Explore our complete range of products in one place',
      'icon': Icons.add_shopping_cart,
      'button': 'find Now'
    },
    {
      'title': 'New Arrivals',
      'desc': 'Discover the latest additions to our product lineup',
      'icon': Icons.history,
      'button': 'view Details'
    },
    {
      'title': 'Best     Sellers',
      'desc': 'Check out our top-selling and most popular products',
      'icon': Icons.track_changes,
      'button': 'Redeem Now'
    },
    {
      'title': 'Paint Calculator',
      'desc': 'Estimate the right amount of paint needed for your project',
      'icon': Icons.update,
      'button': 'View Details'
    },
    {
      'title': 'Technical Datasheets',
      'desc':
          'Access detailed product specifications and technical information',
      'icon': Icons.history,
      'button': 'View Details'
    },
    {
      'title': 'Marketing Materials',
      'desc': 'Download brochures, flyers, and promotional content',
      'icon': Icons.upload_file,
      'button': 'Refer Now'
    },
  ];

  final List<Map<String, dynamic>> discountschemes = [
    {
      'title': 'Ongoing Discounts',
      'desc': 'Explore our complete range of products in one place',
      'icon': Icons.add_shopping_cart,
      'button': 'find Now'
    },
    {
      'title': 'Seasonal & Festival Offers',
      'desc': 'Discover the latest additions to our product lineup',
      'icon': Icons.history,
      'button': 'view Details'
    },
    {
      'title': 'Volume Based Discounts',
      'desc': 'Check out our top-selling and most popular products',
      'icon': Icons.track_changes,
      'button': 'Redeem Now'
    },
    {
      'title': 'Loyalty Discounts',
      'desc': 'Estimate the right amount of paint needed for your project',
      'icon': Icons.update,
      'button': 'View Details'
    },
    {
      'title': 'Promotional Schemes',
      'desc':
          'Access detailed product specifications and technical information',
      'icon': Icons.history,
      'button': 'View Details'
    },
    {
      'title': 'Custom Dealer Offers',
      'desc': 'Download brochures, flyers, and promotional content',
      'icon': Icons.upload_file,
      'button': 'Refer Now'
    },
    {
      'title': 'Promotional Schemes',
      'desc':
          'Access detailed product specifications and technical information',
      'icon': Icons.history,
      'button': 'View Details'
    },
    {
      'title': 'Custom Dealer Offers',
      'desc': 'Download brochures, flyers, and promotional content',
      'icon': Icons.upload_file,
      'button': 'Refer Now'
    },
  ];

  final List<Map<String, dynamic>> myinvoices = [
    {
      'title': 'View Invoices',
      'desc': 'Explore our complete range of products in one place',
      'icon': Icons.add_shopping_cart,
      'button': 'find Now'
    },
    {
      'title': 'Download Invoices(Pdf/Excel)',
      'desc': 'Discover the latest additions to our product lineup',
      'icon': Icons.history,
      'button': 'view Details'
    },
    {
      'title': 'Payment Status',
      'desc': 'Check out our top-selling and most popular products',
      'icon': Icons.track_changes,
      'button': 'Redeem Now'
    },
    {
      'title': 'Outstanding Dues',
      'desc': 'Estimate the right amount of paint needed for your project',
      'icon': Icons.update,
      'button': 'View Details'
    },
    {
      'title': 'Make Payment',
      'desc':
          'Access detailed product specifications and technical information',
      'icon': Icons.history,
      'button': 'View Details'
    },
    {
      'title': 'Invoice Disputes & Claims',
      'desc': 'Download brochures, flyers, and promotional content',
      'icon': Icons.upload_file,
      'button': 'Refer Now'
    },
  ];

  final List<Map<String, dynamic>> moreitemss = [
    // {
    //   'title': 'Category',
    //   'desc': 'Explore our complete range of products in one place',
    //   'icon': Icons.category,
    //   'button': 'find Now'
    // },
    // {
    //   'title': 'My Invoices',
    //   'desc': 'Discover the latest additions to our product lineup',
    //   'icon': Icons.receipt,
    //   'button': 'view Details'
    // },
    // {
    //   'title': 'Painters',
    //   'desc': 'Check out our top-selling and most popular products',
    //   'icon': Icons.brush,
    //   'button': 'Redeem Now'
    // },
    // {
    //   'title': 'Queries',
    //   'desc': 'Estimate the right amount of paint needed for your project',
    //   'icon': Icons.help,
    //   'button': 'View Details'
    // },
/////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////Catalogue
    {
      'title': 'Product Catalogue',
      'desc': 'Explore our complete range of products in one place',
      'icon': Icons.add_shopping_cart,
      'button': 'find Now'
    },
    {
      'title': 'New Arrivals',
      'desc': 'Discover the latest additions to our product lineup',
      'icon': Icons.history,
      'button': 'view Details'
    },
    {
      'title': 'Best Sellers',
      'desc': 'Check out our top-selling and most popular products',
      'icon': Icons.track_changes,
      'button': 'Redeem Now'
    },
    {
      'title': 'Paint Calculator',
      'desc': 'Estimate the right amount of paint needed for your project',
      'icon': Icons.update,
      'button': 'View Details'
    },
    {
      'title': 'Technical Datasheets',
      'desc':
          'Access detailed product specifications and technical information',
      'icon': Icons.history,
      'button': 'View Details'
    },
    {
      'title': 'Marketing Materials',
      'desc': 'Download brochures, flyers, and promotional content',
      'icon': Icons.upload_file,
      'button': 'Refer Now'
    },
    /////Catalogue//////////
    ///painters//////
    {
      'title': 'Find a Painter',
      'desc': 'Explore our complete range of products in one place',
      'icon': Icons.find_in_page,
      'button': 'find Now'
    },
    {
      'title': 'Register Painter',
      'desc': 'Discover the latest additions to our product lineup',
      'icon': Icons.app_registration,
      'button': 'view Details'
    },
    {
      'title': 'Painter Loyalty Program',
      'desc': 'Check out our top-selling and most popular products',
      'icon': Icons.format_paint_rounded,
      'button': 'Redeem Now'
    },
    {
      'title': 'Painter Loyalty Redeem',
      'desc': 'Estimate the right amount of paint needed for your project',
      'icon': Icons.redeem,
      'button': 'View Details'
    },
    {
      'title': 'Transfer Painter Points',
      'desc':
          'Access detailed product specifications and technical information',
      'icon': Icons.transfer_within_a_station,
      'button': 'View Details'
    },
    {
      'title': 'Refer a Painter',
      'desc': 'Download brochures, flyers, and promotional content',
      'icon': Icons.refresh_rounded,
      'button': 'Refer Now'
    },
    /////painters////////
  ];

  final List<Map<String, dynamic>> painters = [
    {
      'title': 'Find a Painter',
      'desc': 'Explore our complete range of products in one place',
      'icon': Icons.find_in_page,
      'button': 'find Now'
    },
    {
      'title': 'Register a Painter',
      'desc': 'Discover the latest additions to our product lineup',
      'icon': Icons.app_registration,
      'button': 'view Details'
    },
    {
      'title': 'Painter Loyalty Program',
      'desc': 'Check out our top-selling and most popular products',
      'icon': Icons.format_paint_rounded,
      'button': 'Redeem Now'
    },
    {
      'title': 'Painter Loyalty Redeem',
      'desc': 'Estimate the right amount of paint needed for your project',
      'icon': Icons.redeem,
      'button': 'View Details'
    },
    {
      'title': 'Transfer Painter Points',
      'desc':
          'Access detailed product specifications and technical information',
      'icon': Icons.transfer_within_a_station,
      'button': 'View Details'
    },
    {
      'title': 'Refer a Painter',
      'desc': 'Download brochures, flyers, and promotional content',
      'icon': Icons.refresh_rounded,
      'button': 'Refer Now'
    },
  ];

  final List<Map<String, String>> adOffers = [
    {
      'text': 'Get 12% off on Coral Delux Hi Cover Emulsion!',
      'image': 'assets/offer101.jpg'
    },
    {
      'text': 'Buy 10 packs, Get 1 Absolutely Free!',
      'image': 'assets/offer102.jpg'
    },
    {
      'text': 'Register a painter & Enjoy 10,000 TSH Discount!',
      'image': 'assets/offer103.jpg'
    },
    {
      'text':
          'Extended! Extra Savings on Hi-Gloss Enamel - only Till Month-End!',
      'image': 'assets/offer104.jpg'
    },
    {
      'text': 'Exclusive! Claim your Free Product Today!',
      'image': 'assets/offer105.jpg'
    },
    {
      'text': 'Pay in Advance & Get Up to 5% Flat Cash Discount!',
      'image': 'assets/offer101.jpg'
    },
  ];

  List<Map<String, dynamic>> getSelectedItems() {
    if (showPopularList) return popularItems;
    if (showMyOrdersList) return myOrders;
    return [];
  }

  // void _onItemTapped(String name) {
  //   setState(() {
  //     if (name == 'More') {
  //       showMore = !showMore;
  //     } else if (name == 'Popular') {
  //       displayedItems = popularItems;
  //     } else if (name == 'My Orders') {
  //       displayedItems = myOrders;
  //     } else if (name == 'Points & Earnings') {
  //       displayedItems = pointsAndEarnings;
  //     }
  //   });
  // }

  void viewss(String name) {
    setState(() {
      log('Name:$name');
      views.clear();
      selectedCategory = name;

      if (name == "Popular") {
        for (var item in popularItems) {
          views.add(Viewdetails(
            title: item['title'],
            desc: item['desc'],
            icon: item['icon'],
            button: item['button'],
          ));
        }
      } else if (name == "My \nOrders") {
        for (var item in myOrders) {
          views.add(Viewdetails(
            title: item['title'],
            desc: item['desc'],
            icon: item['icon'],
            button: item['button'],
          ));
        }
      } else if (name == "Points & Earnings") {
        for (var item in pointsAndEarnings) {
          views.add(Viewdetails(
            title: item['title'],
            desc: item['desc'],
            icon: item['icon'],
            button: item['button'],
          ));
        }
      } else if (name == "Category") {
        for (var item in catelogues) {
          views.add(Viewdetails(
            title: item['title'],
            desc: item['desc'],
            icon: item['icon'],
            button: item['button'],
          ));
        }
      } else if (name == 'My Invoices') {
        for (var item in myinvoices) {
          views.add(Viewdetails(
            title: item['title'],
            desc: item['desc'],
            icon: item['icon'],
            button: item['button'],
          ));
        }
      } else if (name == 'Discount Schemes') {
        for (var item in discountschemes) {
          views.add(Viewdetails(
            title: item['title'],
            desc: item['desc'],
            icon: item['icon'],
            button: item['button'],
          ));
        }
      } else if (name == 'Painters') {
        for (var item in painters) {
          views.add(Viewdetails(
            title: item['title'],
            desc: item['desc'],
            icon: item['icon'],
            button: item['button'],
          ));
        }
      } else if (name == 'More \nlist') {
        for (var item in moreitemss) {
          views.add(Viewdetails(
            title: item['title'],
            desc: item['desc'],
            icon: item['icon'],
            button: item['button'],
          ));
        }
      }
      log('$name views length: ${views.length}');
      log('$name views contents: ${views[0].title.toString()}');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade200, // Ensure consistency
        appBar: AppBar(
          toolbarHeight: 80,
          surfaceTintColor: Colors.white,
          backgroundColor: Colors.white, // Ensure consistency
          elevation: 0, // Optional: Remove shadow for a clean look
          leading: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Align(
              alignment: Alignment.center, // Ensures the image is centered
              child: SizedBox(
                width: 40,
                height: 40,
                child: Image.asset(
                  "assets/cp.png",
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 250, // Set width explicitly for the search bar
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search...',
                    hintStyle: const TextStyle(color: Colors.black54),
                    prefixIcon: const Icon(Icons.search, color: Colors.black54),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding:
                        const EdgeInsets.symmetric(vertical: 10), // Fix height
                  ),
                ),
              ),
            ],
          ),
          centerTitle: true, // Ensure the search bar remains centered
          actions: [
            Builder(
              builder: (context) {
                return IconButton(
                  icon: const Icon(Icons.account_circle,
                      color: Colors.black54, size: 30),
                  onPressed: () {
                    final RenderBox button =
                        context.findRenderObject() as RenderBox;
                    final RenderBox overlay = Overlay.of(context)
                        .context
                        .findRenderObject() as RenderBox;
                    final Offset position =
                        button.localToGlobal(Offset.zero, ancestor: overlay);

                    showMenu(
                      context: context,
                      position: RelativeRect.fromLTRB(
                        position.dx,
                        position.dy + button.size.height,
                        position.dx + button.size.width,
                        position.dy + button.size.height + 50,
                      ),
                      items: [
                        const PopupMenuItem(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Dealer Name: John Doe",
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                              SizedBox(height: 4),
                              Text("Phone: +1 234 567 890"),
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Column(
              children: [
                _buildHotelBookingCard(),
                SizedBox(
                  width: Screens.width(context),
                  child: GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      childAspectRatio: 1,
                    ),
                    itemCount: mainItems.length,
                    itemBuilder: (context, index) {
                      bool isSelected = selectedIndex == index;
                      var item = mainItems[index];

                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedIndex = index;
                            viewss(item['name']);
                          });
                        },
                        child: Card(
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Icon(item['icon'],
                                      color: isSelected
                                          ? const Color.fromRGBO(0, 140, 255, 1)
                                          : Colors.blue.shade400,
                                      size: 25),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  item['name'],
                                  style: const TextStyle(
                                    color: Colors.black87,
                                    // fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                views.isEmpty
                    ? const Center(
                        child: Text("Select a category to display items"))
                    : Column(
                        children: [
                          ClipPath(
                            clipper: NotchedContainerClipper(),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.circular(20), // Curved edges
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.black12,
                                    blurRadius: 10,
                                    spreadRadius: 2,
                                  ),
                                ],
                              ),
                              child: Column(
                                children: [
                                  Container(
                                    width: Screens.width(context) * 0.97,
                                    decoration: const BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(20),
                                        topRight: Radius.circular(20),
                                        bottomLeft: Radius.circular(30),
                                        // bottomRight: Radius.circular(10),
                                      ),
                                    ),
                                    child: Wrap(
                                      alignment: WrapAlignment.center,
                                      // spacing: 2,
                                      // runSpacing: 1,
                                      children: List.generate(
                                        showAll ? views.length : 8,
                                        (index) {
                                          var item = views[index];
                                          bool isSelected =
                                              selectedIndex == index;
                                          return GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                selectedIndex = index;
                                                viewss(views[index]
                                                    .title
                                                    .toString());
                                              });
                                            },
                                            child: SizedBox(
                                              height:
                                                  Screens.bodyheight(context) *
                                                      0.15,
                                              width: (Screens.width(context) *
                                                          0.99 -
                                                      32) /
                                                  4,
                                              child: Container(
                                                padding:
                                                    const EdgeInsets.all(8),
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  // boxShadow: [
                                                  //   // BoxShadow(
                                                  //   //   color:
                                                  //   //       Colors.grey.withOpacity(0.2),
                                                  //   //   blurRadius: 4,
                                                  //   //   spreadRadius: 2,
                                                  //   //   offset: const Offset(0, 2),
                                                  //   // ),
                                                  // ],
                                                ),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Icon(item.icon,
                                                        weight: 0.5,
                                                        size: 25,
                                                        color: const Color
                                                            .fromRGBO(
                                                            0, 140, 255, 1)),
                                                    const SizedBox(height: 5),
                                                    SizedBox(
                                                      width: 80,
                                                      child: Text(
                                                        item.title!,
                                                        style: const TextStyle(
                                                          // fontWeight: FontWeight.bold,
                                                          fontSize: 12,
                                                        ),
                                                        textAlign:
                                                            TextAlign.center,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                  if (views.length > 8)
                                    IconButton(
                                      onPressed: () {
                                        setState(() {
                                          showAll = !showAll;
                                        });
                                      },
                                      icon: AnimatedRotation(
                                        turns: showAll
                                            ? 0.5
                                            : 0.0, // 0.5 = 180 degrees
                                        duration: const Duration(
                                            milliseconds:
                                                900), // Smooth animation duration
                                        curve: Curves
                                            .easeInOut, // Easing curve for a smooth effect
                                        child: const Icon(
                                          Icons
                                              .keyboard_arrow_down, // Use only one icon and rotate it
                                          size: 30,
                                          color: Colors.blue,
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          ),
                          // if (views.length > 8)
                          //   IconButton(
                          //     onPressed: () {
                          //       setState(() {
                          //         showAll = !showAll;
                          //       });
                          //     },
                          //     icon: Icon(
                          //       showAll
                          //           ? Icons.arrow_drop_up
                          //           : Icons.arrow_drop_down,
                          //       size: 30, // Larger for more impact
                          //       color: Colors.blue, // Stylish blue color
                          //     ),
                          //   ),
                          const SizedBox(height: 10),
                          // Offers Section
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 8.0),
                                child: Text("Offers",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold)),
                              ),
                              Padding(
                                padding: EdgeInsets.only(right: 8.0),
                                child: Row(
                                  children: [
                                    Text("View All",
                                        style: TextStyle(color: Colors.blue)),
                                    Icon(Icons.arrow_forward_ios,
                                        color: Colors.blue, size: 14),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          CarouselSlider(
                            carouselController: _carouselController,
                            options: CarouselOptions(
                              height: 200,
                              autoPlayInterval: const Duration(seconds: 4),
                              viewportFraction: 0.9,
                              onPageChanged: (index, reason) {
                                setState(() {
                                  currentIndexcarousel = index;
                                });
                              },
                            ),
                            items: adOffers.map((offer) {
                              return Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12)),
                                elevation: 6,
                                shadowColor: Colors.grey.withOpacity(0.7),
                                child: Stack(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(12),
                                      child: Image.asset(
                                        offer['image']!,
                                        width: double.infinity,
                                        height: 200,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Positioned(
                                      bottom: 20,
                                      left: 20,
                                      right: 20,
                                      top: 70,
                                      child: Text(
                                        offer['text']!,
                                        style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                          shadows: [
                                            Shadow(
                                                blurRadius: 5,
                                                color: Colors.black54)
                                          ],
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }).toList(),
                          ),
                          const SizedBox(height: 10),
                          AnimatedSmoothIndicator(
                            activeIndex: currentIndexcarousel,
                            count: adOffers.length,
                            effect: ExpandingDotsEffect(
                              dotHeight: 8,
                              dotWidth: 7,
                              activeDotColor: Colors.lightBlueAccent,
                              dotColor: Colors.grey.withOpacity(0.5),
                            ),
                            onDotClicked: (index) {
                              _carouselController.animateToPage(index);
                            },
                          ),
                        ],
                      ),
              ],
            ),
          ),
        )
        // bottomNavigationBar: BottomNavigationBar(
        //   backgroundColor: const Color(0xFFFFCDD2), // Light Red
        //   selectedItemColor: Colors.red.shade700,
        //   unselectedItemColor: Colors.grey.shade600,
        //   items: const [
        //     BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        //     BottomNavigationBarItem(
        //         icon: Icon(Icons.shopping_cart), label: 'sales'),
        //     BottomNavigationBarItem(
        //         icon: Icon(Icons.campaign), label: 'marketing'),
        //     BottomNavigationBarItem(icon: Icon(Icons.inventory), label: 'Stocks'),
        //     BottomNavigationBarItem(icon: Icon(Icons.support), label: 'Help'),
        //   ],
        //   currentIndex: _selectedIndex,
        //   onTap: (context) {
        //     setState(() {
        //       _selectedIndex = context;
        //     });
        //   },
        // ),
        );
  }
}

class Viewdetails {
  final String? title;
  final String? desc;
  final IconData? icon;
  final String? button;

  Viewdetails({this.title, this.desc, this.icon, this.button});
}

Widget _buildHotelBookingCard() {
  return Padding(
    padding: const EdgeInsets.all(10),
    child: Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.white, Colors.blue.shade100],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.all(12),
      child: const Row(
        children: [
          CircleAvatar(
            backgroundColor: Colors.white,
            backgroundImage: AssetImage("assets/cp.png"),
            radius: 25,
          ),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Buson digital services Ltd",
                    style:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                Text("Gandhipuram",
                    style: TextStyle(
                      fontSize: 14,
                    )),
                Row(
                  children: [
                    Icon(Icons.calendar_today, size: 14),
                    SizedBox(width: 5),
                    Text("13 Feb'25 - 26 Feb'25",
                        style: TextStyle(fontSize: 14)),
                  ],
                ),
              ],
            ),
          ),
          Icon(Icons.arrow_forward_ios, color: Colors.blue),
        ],
      ),
    ),
  );
}

class NotchedContainerClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(0, 0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width * 0.6, size.height);
    path.lineTo(size.width * 0.5, size.height + 20); // Notch at bottom center
    path.lineTo(size.width * 0.4, size.height);
    path.lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

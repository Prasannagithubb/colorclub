import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class FindDealerPage extends StatefulWidget {
  @override
  _FindDealerPageState createState() => _FindDealerPageState();
}

class _FindDealerPageState extends State<FindDealerPage> {
  List<Map<String, dynamic>> dealers = [
    {
      "name": "Tanzania Paints Ltd",
      "location": "Dar es Salaam",
      "phone": "+255 654 123 456",
      "rating": 4.7,
      "latitude": -6.792354,
      "longitude": 39.208328
    },
    {
      "name": "Arusha Color House",
      "location": "Arusha",
      "phone": "+255 767 234 567",
      "rating": 4.5,
      "latitude": -3.386925,
      "longitude": 36.682995
    },
    {
      "name": "Mwanza Paint Mart",
      "location": "Mwanza",
      "phone": "+255 768 345 678",
      "rating": 4.6,
      "latitude": -2.516431,
      "longitude": 32.917058
    },
    {
      "name": "Dodoma Paint Supplies",
      "location": "Dodoma",
      "phone": "+255 765 456 789",
      "rating": 4.4,
      "latitude": -6.162959,
      "longitude": 35.751606
    },
    {
      "name": "Shinyanga Paint Depot",
      "location": "Shinyanga",
      "phone": "+255 754 567 890",
      "rating": 4.3,
      "latitude": -3.663703,
      "longitude": 33.421423
    },
    {
      "name": "Mbeya Coatings",
      "location": "Mbeya",
      "phone": "+255 759 678 901",
      "rating": 4.5,
      "latitude": -8.914050,
      "longitude": 33.439379
    },
    {
      "name": "Morogoro Paint Center",
      "location": "Morogoro",
      "phone": "+255 765 789 012",
      "rating": 4.6,
      "latitude": -6.821340,
      "longitude": 37.661220
    },
    {
      "name": "Tanga Paint Suppliers",
      "location": "Tanga",
      "phone": "+255 768 890 123",
      "rating": 4.2,
      "latitude": -5.070189,
      "longitude": 39.098810
    },
    {
      "name": "Kigoma Color World",
      "location": "Kigoma",
      "phone": "+255 762 901 234",
      "rating": 4.3,
      "latitude": -4.876582,
      "longitude": 29.626960
    },
    {
      "name": "Tabora Paint Solutions",
      "location": "Tabora",
      "phone": "+255 765 012 345",
      "rating": 4.4,
      "latitude": -5.021185,
      "longitude": 32.826473
    },
    {
      "name": "Songea Paint Masters",
      "location": "Songea",
      "phone": "+255 754 123 678",
      "rating": 4.5,
      "latitude": -10.689676,
      "longitude": 35.650482
    },
    {
      "name": "Mtwara Paints & Colors",
      "location": "Mtwara",
      "phone": "+255 765 234 789",
      "rating": 4.2,
      "latitude": -10.317609,
      "longitude": 40.175018
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
      "latitude": -10.002094,
      "longitude": 39.717010
    },
    {
      "name": "Zanzibar Paints & Supplies",
      "location": "Zanzibar",
      "phone": "+255 759 567 012",
      "rating": 4.7,
      "latitude": -6.165917,
      "longitude": 39.202640
    },
    {
      "name": "Bukoba Color Hub",
      "location": "Bukoba",
      "phone": "+255 765 678 123",
      "rating": 4.4,
      "latitude": -1.331848,
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 16, 57, 122),
          leading: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          title: const Text(
            "Find Dealer",
            style: TextStyle(color: Colors.white),
          )),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Search by location or dealer name...",
                prefixIcon: const Icon(Icons.search),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
              onChanged: (value) {
                setState(() {
                  searchQuery = value.toLowerCase();
                });
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              physics: const ClampingScrollPhysics(),
              itemCount: dealers.length,
              itemBuilder: (context, index) {
                final dealer = dealers[index];
                if (dealer["name"].toLowerCase().contains(searchQuery) ||
                    dealer["location"].toLowerCase().contains(searchQuery)) {
                  return DealerCard(dealer);
                }
                return const SizedBox(); // Avoid rendering empty spaces
              },
              // children: dealers
              //     .where((dealer) =>
              //         dealer["name"].toLowerCase().contains(searchQuery) ||
              //         dealer["location"].toLowerCase().contains(searchQuery))
              //     .map((dealer) => DealerCard(dealer))
              //     .toList(),
            ),
          ),
        ],
      ),
    );
  }
}

class DealerCard extends StatelessWidget {
  final Map<String, dynamic> dealer;

  const DealerCard(this.dealer);

  void _launchMaps(double latitude, double longitude) async {
    final url =
        "https://www.google.com/maps/search/?api=1&query=$latitude,$longitude";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw "Could not launch $url";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      child: ListTile(
        title: Text(dealer["name"],
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("📍 ${dealer["location"]}"),
            Text("📞 ${dealer["phone"]}"),
            Row(
              children: [
                const Icon(Icons.star, color: Colors.amber),
                Text(dealer["rating"].toString(),
                    style: const TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
          ],
        ),
        trailing: IconButton(
          icon: const Icon(Icons.directions, color: Colors.blue),
          onPressed: () => _launchMaps(dealer["latitude"], dealer["longitude"]),
        ),
      ),
    );
  }
}

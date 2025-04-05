import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DealerCard extends StatefulWidget {
  final Map<String, dynamic> dealer;

  const DealerCard(this.dealer);

  @override
  State<DealerCard> createState() => _DealerCardState();
}

class _DealerCardState extends State<DealerCard> {
  void _launchMaps(double latitude, double longitude) async {
    final Uri url = Uri.parse(
        "https://www.google.com/maps/search/?api=1&query=$latitude,$longitude");
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw "Could not launch $url";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      child: InkWell(
        onTap: () {
          setState(() {
            try {
              _launchMaps(
                  widget.dealer["latitude"], widget.dealer["longitude"]);
            } catch (e) {
              log("error::" + e.toString());
            }
          });
        },
        child: ListTile(
          title: Text(widget.dealer["name"],
              style:
                  const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("📍 ${widget.dealer["location"]}"),
              Text("📞 ${widget.dealer["phone"]}"),
              Row(
                children: [
                  const Icon(Icons.star, color: Colors.amber),
                  Text(widget.dealer["rating"].toString(),
                      style: const TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
            ],
          ),
          trailing: IconButton(
            icon: const Icon(Icons.directions, color: Colors.blue),
            onPressed: () => _launchMaps(
                widget.dealer["latitude"], widget.dealer["longitude"]),
          ),
        ),
      ),
    );
  }
}

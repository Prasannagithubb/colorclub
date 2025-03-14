import 'package:flutter/material.dart';

class Scanpoints extends StatelessWidget {
  final int points; // Points from API

  const Scanpoints({super.key, required this.points});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Scan Points")),
      body: Center(
        child: Text(
          "You have earned $points points!",
          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class Refercustomer extends StatefulWidget {
  const Refercustomer({super.key});

  @override
  State<Refercustomer> createState() => _RefercustomerState();
}

class _RefercustomerState extends State<Refercustomer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,

      // appBar: AppBar(
      //   backgroundColor: Colors.grey.shade200,
      //   title: const Text(
      //     "",
      //     style: TextStyle(
      //       fontSize: 22,
      //       fontWeight: FontWeight.bold,
      //       color: Colors
      //           .black, // Set to white as the gradient will be applied over the text
      //     ),
      //   ),
      //   centerTitle: true,
      // ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(
            child: Text("Refer customer"),
          ),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
              elevation: 5, // Adjust elevation for the raised effect
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              textStyle: const TextStyle(fontSize: 16),
            ),
            child: const Text("Go Back"),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class Productcomplaints extends StatefulWidget {
  const Productcomplaints({super.key});

  @override
  State<Productcomplaints> createState() => _ProductcomplaintsState();
}

class _ProductcomplaintsState extends State<Productcomplaints> {
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
          Center(
            child: Text("Product complaints"),
          ),
          SizedBox(
            height: 10,
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text("Go Back"),
            style: ElevatedButton.styleFrom(
              elevation: 5, // Adjust elevation for the raised effect
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              textStyle: TextStyle(fontSize: 16),
            ),
          )
        ],
      ),
    );
  }
}

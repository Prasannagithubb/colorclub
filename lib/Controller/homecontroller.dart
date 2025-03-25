import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:new_one/Pages/login/screens/loginscreen.dart';

class homecontroller extends ChangeNotifier {
  int currentIndexcarousel = 0;

  void showLogoutDialog(BuildContext context) {
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
}

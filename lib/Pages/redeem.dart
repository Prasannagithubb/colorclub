import 'package:flutter/material.dart';

class RedeemPointsScreen extends StatefulWidget {
  @override
  _RedeemPointsScreenState createState() => _RedeemPointsScreenState();
}

class _RedeemPointsScreenState extends State<RedeemPointsScreen> {
  int userPoints = 90;
  int redemptionThreshold = 150;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Redeem Points"),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "Earn Points For Every Dollar Spent",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            Text("$redemptionThreshold Points = \$10 Reward"),
            const SizedBox(height: 20),
            Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  width: 150,
                  height: 150,
                  child: CircularProgressIndicator(
                    value: userPoints / redemptionThreshold,
                    backgroundColor: Colors.grey.shade300,
                    color: Colors.teal,
                    strokeWidth: 8,
                  ),
                ),
                Column(
                  children: [
                    Text(
                      "$userPoints",
                      style: const TextStyle(
                          fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    const Text("POINTS"),
                  ],
                )
              ],
            ),
            const SizedBox(height: 10),
            Text(
                "REWARD BALANCE: \$${(userPoints / redemptionThreshold * 10).toStringAsFixed(2)}"),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: const Text("EARN"),
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.white),
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text("Redeem"),
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.white),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: RedeemPointsScreen(),
  ));
}

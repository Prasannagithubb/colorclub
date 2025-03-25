import 'package:flutter/material.dart';
import 'package:new_one/Controller/redeemcontroller/remaincontroller.dart';
import 'package:provider/provider.dart';

class RedeemPointsScreen extends StatefulWidget {
  const RedeemPointsScreen({super.key});

  @override
  _RedeemPointsScreenState createState() => _RedeemPointsScreenState();
}

class _RedeemPointsScreenState extends State<RedeemPointsScreen> {
  int userPoints = 90;
  int redemptionThreshold = 150;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<Redeemcontroller>().init();

      // .getLocation(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Redeem Points"),
        backgroundColor: Colors.teal,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Text(
              "Earn Points For Every Dollar Spent",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 12),
            Text(
              "$redemptionThreshold Points = \$10 Reward",
              style: const TextStyle(fontSize: 16),
            ),
            // const SizedBox(height: 20),

            /// Circular Progress Indicator with Points Display
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
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "$userPoints",
                      style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Text("POINTS"),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 12),

            /// Reward Balance
            Text(
              "REWARD BALANCE: \$${(userPoints / redemptionThreshold * 10).toStringAsFixed(2)}",
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 20),

            /// User Data Info
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Get Points: ${context.watch<Redeemcontroller>().pointsdata!.isNotEmpty ? context.watch<Redeemcontroller>().pointsdata![0].points : '0'}",
                ),
                Text(
                  "Redeem Amount: ${context.watch<Redeemcontroller>().reamtdata!.isNotEmpty ? context.watch<Redeemcontroller>().reamtdata![0].redeemamt : '0.0'}",
                ),
                Text(
                  "Badge Level: ${context.watch<Redeemcontroller>().catedata!.isNotEmpty ? context.watch<Redeemcontroller>().catedata![0].categorybadge : ''}",
                ),
                Text(
                  "Dealer: ${context.watch<Redeemcontroller>().deldata!.isNotEmpty ? context.watch<Redeemcontroller>().deldata![0].dealername : ''}",
                ),
              ],
            ),
            const SizedBox(height: 20),

            /// Buttons Row
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    "EARN",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    "REDEEM",
                    style: TextStyle(color: Colors.black),
                  ),
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
  runApp(const MaterialApp(
    home: RedeemPointsScreen(),
  ));
}

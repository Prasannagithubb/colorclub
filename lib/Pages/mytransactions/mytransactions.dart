import 'package:flutter/material.dart';

class TransactionsScreen extends StatefulWidget {
  @override
  _TransactionsScreenState createState() => _TransactionsScreenState();
}

class _TransactionsScreenState extends State<TransactionsScreen> {
  List<Map<String, dynamic>> transactions = [
    {
      "date": "2025-03-10",
      "type": "Purchase",
      "amount": "\$50",
      "details": "Paint Purchase"
    },
    {
      "date": "2025-03-08",
      "type": "Redemption",
      "amount": "-150 Points",
      "details": "Points Redeemed"
    },
    {
      "date": "2025-03-07",
      "type": "Coupon Scan",
      "amount": "+10 Points",
      "details": "Scanned Coupon"
    },
  ];

  String selectedFilter = "All";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(
          Icons.arrow_back,
          color: Colors.white,
        ),
        title: const Text(
          "My Transcations",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(255, 16, 57, 122),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.download,
              color: Colors.white,
            ),
            onPressed: () {
              // Implement export functionality
            },
          )
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: DropdownButton<String>(
              borderRadius: BorderRadius.circular(10),
              value: selectedFilter,
              onChanged: (value) {
                setState(() {
                  selectedFilter = value!;
                });
              },
              items: ["All", "Purchase", "Redemption", "Coupon Scan"]
                  .map((type) => DropdownMenuItem(
                        value: type,
                        child: Text(type),
                      ))
                  .toList(),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: transactions.length,
              itemBuilder: (context, index) {
                var transaction = transactions[index];
                if (selectedFilter != "All" &&
                    transaction['type'] != selectedFilter) {
                  return const SizedBox.shrink();
                }
                return Card(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: ListTile(
                    title: Text(transaction['details']),
                    subtitle: Text(transaction['date']),
                    trailing: Text(transaction['amount'],
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.teal)),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

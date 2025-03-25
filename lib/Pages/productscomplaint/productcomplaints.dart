import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';

class ComplaintsListPage extends StatefulWidget {
  @override
  _ComplaintsListPageState createState() => _ComplaintsListPageState();
}

class _ComplaintsListPageState extends State<ComplaintsListPage> {
  final TextEditingController complaintController = TextEditingController();
  String? selectedProduct;
  File? _image;
  String? complaintTicket;
  void _showComplaintDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Complaint Submitted"),
          content: const Text(
              "Your complaint has been taken. Our team will review it soon."),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text("OK", style: TextStyle(color: primaryColor)),
            ),
          ],
        );
      },
    );
  }

  final List<String> products = [
    "Paint - Red",
    "Paint - Blue",
    "Paint - White",
    "Paint - Green",
    "Paint - Black"
  ];

  final ImagePicker _picker = ImagePicker();
  final Color primaryColor = const Color.fromARGB(255, 16, 57, 122);
  final Color greyBorder = Colors.grey.shade400;

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  void _submitComplaint() {
    if (selectedProduct != null && complaintController.text.isNotEmpty) {
      String ticketCode = const Uuid().v4().substring(0, 8).toUpperCase();
      setState(() {
        complaintTicket = "TICKET: $ticketCode";
      });
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Complaint submitted successfully! Ticket: $ticketCode"),
        backgroundColor: primaryColor,
      ));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Please fill in all details!")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: const Icon(
          Icons.arrow_back,
          color: Colors.white,
        ),
        title: const Text(
          "Product Complaints",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: primaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // **Styled Dropdown for Product Selection**
            Text("Select Product",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: primaryColor)),
            const SizedBox(height: 8),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: greyBorder, width: 1.5),
                borderRadius: BorderRadius.circular(8),
                color: Colors.grey.shade100,
              ),
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: DropdownButtonFormField<String>(
                borderRadius: BorderRadius.circular(10),
                value: selectedProduct,
                items: products.map((product) {
                  return DropdownMenuItem(value: product, child: Text(product));
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    selectedProduct = value;
                  });
                },
                decoration: InputDecoration(
                    border: InputBorder.none,
                    prefixIcon: Icon(Icons.inventory, color: primaryColor),
                    hintText: "Choose Product",
                    hintStyle: const TextStyle(color: Colors.grey)),
              ),
            ),
            const SizedBox(height: 20),

            // **Styled Complaint Input Field**
            Text("Enter Complaint Details",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: primaryColor)),
            const SizedBox(height: 8),
            TextField(
              controller: complaintController,
              maxLines: 3,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: greyBorder)),
                hintText: "Describe your complaint",
                hintStyle: const TextStyle(color: Colors.grey),
                filled: true,
                fillColor: Colors.grey.shade100,
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: primaryColor, width: 2.0),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // **Attach Image Button**
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton.icon(
                  onPressed: _pickImage,
                  icon: const Icon(Icons.image, color: Colors.white),
                  label: const Text("Attach Image",
                      style: TextStyle(color: Colors.white)),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(6), // Change radius as needed
                    ),
                    backgroundColor: primaryColor,
                  ),
                ),
                if (_image != null)
                  Icon(Icons.check_circle, color: primaryColor),
              ],
            ),
            const SizedBox(height: 20),

            // **Complaint Ticket Display**
            if (complaintTicket != null)
              Center(
                child: Text(
                  complaintTicket!,
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: primaryColor),
                ),
              ),

            // **Submit Button at the Bottom**
            const Spacer(),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  _submitComplaint();
                  _showComplaintDialog(); // Show the popup after submitting
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryColor,
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                ),
                child: const Text("Submit Complaint",
                    style: TextStyle(color: Colors.white, fontSize: 18)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

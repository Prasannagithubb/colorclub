import 'package:flutter/material.dart';

class EditProfileScreen extends StatefulWidget {
  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          "Edit Profile",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text(
              "Save",
              style: TextStyle(
                color: Colors.blue,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Center(
              child: Stack(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.grey.shade300,
                    child: const Text(
                      "my",
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const Positioned(
                    bottom: 0,
                    right: 0,
                    child: CircleAvatar(
                      radius: 16,
                      backgroundColor: Colors.white,
                      child:
                          Icon(Icons.camera_alt, color: Colors.blue, size: 18),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            _buildSectionTitle("GENERAL DETAILS"),
            _buildTextField("FULL NAME", "Enter your full name"),
            Row(
              children: [
                Expanded(child: _buildButtonField("DATE OF BIRTH")),
                const SizedBox(width: 10),
                Expanded(child: _buildButtonField("GENDER")),
              ],
            ),
            Row(
              children: [
                Expanded(child: _buildButtonField("MARITAL STATUS")),
                const SizedBox(width: 10),
                Expanded(child: _buildButtonField("ANNIVERSARY ")),
              ],
            ),
            _buildButtonField("NATIONALITY",
                showInfo: true,
                infoText:
                    "Adding your nationality helps in booking a flight faster."),
            _buildButtonField("CITY",
                showInfo: true,
                infoText:
                    "Adding your location helps us recommend trips & offers."),
            _buildButtonField("STATE",
                isDropdown: true,
                infoText:
                    "This is required for GST purpose on your tax invoice."),
            _buildSectionTitle("CONTACT DETAILS"),
            _buildButtonField("EMAIL ID"),
          ],
        ),
      ),
    );
  }

  /// Builds section title (e.g., GENERAL DETAILS, CONTACT DETAILS)
  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Text(
        title,
        style: const TextStyle(
            fontSize: 14, fontWeight: FontWeight.bold, color: Colors.green),
      ),
    );
  }

  /// Builds a text input field
  Widget _buildTextField(String label, String hint) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: label,
          labelStyle: const TextStyle(
              fontWeight: FontWeight.bold, fontSize: 12, color: Colors.blue),
          hintText: hint,
          hintStyle: const TextStyle(fontSize: 14, color: Colors.black),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Colors.black),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Colors.black),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Colors.blue, width: 2),
          ),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
        ),
      ),
    );
  }

  /// Builds a button-like input field for dropdowns and date pickers
  Widget _buildButtonField(String label,
      {bool showInfo = false, String? infoText, bool isDropdown = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              // Add action for date picker or gender selection
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade700),
                borderRadius: BorderRadius.circular(8),
                color: Colors.grey.shade200,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(label,
                      style:
                          const TextStyle(fontSize: 14, color: Colors.black)),
                  if (isDropdown)
                    const Icon(Icons.arrow_drop_down, color: Colors.black),
                ],
              ),
            ),
          ),
          if (showInfo)
            Padding(
              padding: const EdgeInsets.only(top: 4, left: 8),
              child: Row(
                children: [
                  const Icon(Icons.info_outline, size: 14, color: Colors.grey),
                  const SizedBox(width: 4),
                  Expanded(
                    child: Text(
                      infoText ?? "",
                      style: const TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}

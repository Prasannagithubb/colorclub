import 'package:flutter/material.dart';
import 'package:new_one/Constant/Screen.dart';

class KYCScreen extends StatefulWidget {
  const KYCScreen({super.key});

  @override
  _KYCScreenState createState() => _KYCScreenState();
}

class _KYCScreenState extends State<KYCScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Upload KYC"),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        bottom: TabBar(
          controller: tabController,
          indicatorColor: const Color.fromARGB(255, 251, 123, 114),
          labelColor: Colors.black,
          unselectedLabelColor: Colors.grey,
          tabs: const [
            Tab(text: "Personal Details"),
            Tab(text: "ID Proof"),
            Tab(text: "Bank Details"),
          ],
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: [
          _buildPersonalDetails(),
          _buildIDProof(),
          _buildBankDetails(),
        ],
      ),
    );
  }

  Widget _buildPersonalDetails() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildTextField("Name", "Ankit Mahajan"),
          buildTextField("Mobile", "9899999999"),
          buildTextField("Email", "mn.ankit@yahoo.in"),
          buildTextField("Pincode", "122003"),
          const Spacer(),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(450, 50),
              backgroundColor: const Color.fromARGB(255, 226, 0, 0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                    12), // Change this value to adjust the curve
              ),
            ),
            child: const Text(
              "Next",
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
          ),
          SizedBox(
            height: Screens.bodyheight(context) * 0.01,
          )
        ],
      ),
    );
  }

  Widget _buildIDProof() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildDocumentSelector(),
          _buildUploadContainer("Front"),
          _buildUploadContainer("Back"),
          const Spacer(),
        ],
      ),
    );
  }

  Widget _buildBankDetails() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildTextField("Name", ""),
          buildTextField("Account Number", ""),
          buildTextField("Confirm Account Number", ""),
          buildTextField("IFSC Code", ""),
          const Spacer(),
        ],
      ),
    );
  }

  Widget _buildDocumentSelector() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: ["Aadhar Card", "PAN Card", "Driving License"].map((doc) {
        return ElevatedButton(
          onPressed: () {},
          child: Text(doc, style: const TextStyle(fontSize: 11)),
        );
      }).toList(),
    );
  }

  Widget _buildUploadContainer(String label) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      height: 100,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey[200],
        border: Border.all(color: Colors.black45),
      ),
      child: Center(child: Text("Upload $label Side")),
    );
  }

  Widget buildTextField(String label, String initialValue) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: TextFormField(
        initialValue: initialValue,
        cursorColor: Colors.red,
        decoration: InputDecoration(
          labelText: label,
          filled: true,
          fillColor: Colors.grey[200],
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}

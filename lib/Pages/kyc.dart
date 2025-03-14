import 'package:flutter/material.dart';
import 'package:new_one/Constant/Screen.dart';

void main() {
  runApp(const KYCApp());
}

class KYCApp extends StatelessWidget {
  const KYCApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: KYCScreen(),
    );
  }
}

class KYCScreen extends StatefulWidget {
  const KYCScreen({super.key});

  @override
  _KYCScreenState createState() => _KYCScreenState();
}

class _KYCScreenState extends State<KYCScreen> {
  int _currentStep = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text("Upload KYC"),
      //   centerTitle: true,
      //   backgroundColor: Colors.white,
      //   foregroundColor: Colors.black,
      //   elevation: 0,
      // ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: Screens.bodyheight(context) * 0.03,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(onPressed: () {}, icon: const Icon(Icons.arrow_back)),
              IconButton(onPressed: () {}, icon: const Icon(Icons.close)),
            ],
          ),
          Row(
            children: [
              SizedBox(
                width: Screens.width(context) * 0.04,
              ),
              const Text(
                'Upload KYC',
                style: TextStyle(fontSize: 25),
              ),
            ],
          ),
          _buildStepIndicator(),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: _buildStepContent(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStepIndicator() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildStep("Personal Details", 0),
          _buildStep("ID Proof", 1),
          _buildStep("Bank Details", 2),
        ],
      ),
    );
  }

  Widget _buildStep(String title, int step) {
    bool isActive = _currentStep == step;
    return Column(
      children: [
        Text(
          title,
          style: TextStyle(
            fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
            color: isActive ? Colors.black : Colors.grey,
          ),
        ),
        const SizedBox(height: 4),
        Container(
          width: 123,
          height: 4,
          decoration: BoxDecoration(
              color: isActive ? Colors.green : Colors.grey[300],
              borderRadius: BorderRadius.circular(4)),
        ),
      ],
    );
  }

  Widget _buildStepContent() {
    switch (_currentStep) {
      case 0:
        return _buildPersonalDetails();
      case 1:
        return _buildIDProof();
      case 2:
        return _buildBankDetails();
      default:
        return _buildPersonalDetails();
    }
  }

  Widget _buildPersonalDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Enter Your Details",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(height: 16),
        buildTextField("Name", "Ankit Mahajan"),
        buildTextField("Mobile", "9899999999"),
        buildTextField("Email", "mn.ankit@yahoo.in"),
        buildTextField("Pincode", "122003"),
        const Spacer(),
        _buildNextButton(),
      ],
    );
  }

  Widget _buildIDProof() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Choose Document Type",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(height: 16),
        _buildDocumentSelector(),
        const SizedBox(height: 20),
        const Text("Upload ID Proof"),
        _buildUploadContainer("Front"),
        _buildUploadContainer("Back"),
        const Spacer(),
        _buildNextButton(),
      ],
    );
  }

  Widget _buildBankDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Enter Bank Details",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(height: 16),
        buildTextField("Name", ""),
        buildTextField("Account Number", ""),
        buildTextField("Confirm Account Number", ""),
        buildTextField("IFSC Code", ""),
        const Spacer(),
        _buildSubmitButton(),
      ],
    );
  }

  Widget _buildDocumentSelector() {
    List<String> documents = ["Aadhar Card", "PAN Card", "Driving License"];
    int _currentStep = 0;
    String _selectedDocument = "";

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: documents.map((doc) {
        bool isSelected = _selectedDocument == doc;

        return SizedBox(
          width: 110,
          child: ElevatedButton(
            onPressed: () {
              setState(() {
                _selectedDocument = doc; // Update selected document
              });
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: isSelected ? Colors.green : Colors.grey[300],
            ),
            child: Text(
              doc,
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.black,
                fontSize: 11,
              ),
            ),
          ),
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

  Widget _buildNextButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            if (_currentStep < 2) _currentStep++;
          });
        },
        style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
        child: const Text("Next",
            style: TextStyle(fontSize: 16, color: Colors.white)),
      ),
    );
  }

  Widget _buildSubmitButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(backgroundColor: Colors.greenAccent),
        child: const Text("Submit",
            style: TextStyle(fontSize: 16, color: Colors.white)),
      ),
    );
  }

  Widget buildTextField(String label, String initialValue) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: TextFormField(
        initialValue: initialValue,
        cursorColor: Colors.green.shade100,
        // showCursor: true,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: const TextStyle(fontSize: 16, color: Colors.green),
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

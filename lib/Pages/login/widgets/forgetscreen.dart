import 'package:flutter/material.dart';
import 'package:new_one/Pages/login/widgets/custom_elevatedBtn.dart';

class ResetPasswordDialog extends StatefulWidget {
  @override
  _ResetPasswordDialogState createState() => _ResetPasswordDialogState();
}

class _ResetPasswordDialogState extends State<ResetPasswordDialog> {
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool isButtonActive = false;

  void _validateFields() {
    setState(() {
      isButtonActive = _newPasswordController.text.isNotEmpty &&
          _confirmPasswordController.text.isNotEmpty &&
          _newPasswordController.text == _confirmPasswordController.text;
    });
  }

  @override
  void initState() {
    super.initState();
    _newPasswordController.addListener(_validateFields);
    _confirmPasswordController.addListener(_validateFields);
  }

  @override
  void dispose() {
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      // title: const Text("Reset Password"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Image.asset(
              'assets/cp.png',
              height: 100,
            ),
          ),
          const SizedBox(height: 5),
          const Center(
              child: Text(
            "Reset Password",
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          )),
          const SizedBox(height: 15),
          Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: _newPasswordController,
                  keyboardType: TextInputType.text,
                  obscureText: true,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(
                          color: Colors.grey), // Default border color
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 10.0),
                    fillColor: Colors.grey[200],
                    filled: true,
                    prefixIcon: Icon(
                      Icons.lock_outline,
                      size: 25,
                      color: Colors.black.withOpacity(0.8),
                    ),
                    labelText: "New Password",
                    labelStyle: const TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide:
                          const BorderSide(color: Colors.lightBlueAccent),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Required*";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 15),
                TextFormField(
                  controller: _confirmPasswordController,
                  keyboardType: TextInputType.text,
                  obscureText: true,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(
                          color: Colors.grey), // Default border color
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 10.0),
                    fillColor: Colors.grey[200],
                    filled: true,
                    prefixIcon: Icon(
                      Icons.lock_outline,
                      size: 25,
                      color: Colors.black.withOpacity(0.8),
                    ),
                    labelText: "Confirm Password",
                    labelStyle: const TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide:
                          const BorderSide(color: Colors.lightBlueAccent),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Required*";
                    } else if (value != _newPasswordController.text) {
                      return "Passwords do not match";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 30),
                CustomSpinkitdButton(
                  color: isButtonActive ? Colors.blue : Colors.grey[300],
                  onTap: isButtonActive
                      ? () {
                          if (_formKey.currentState!.validate()) {
                            // Handle password reset logic
                            Navigator.pop(context);
                          }
                        }
                      : null,
                  isLoading: false,
                  label: 'Submit',
                  labelLoading: "Submitting",
                  textcolor: Colors.white,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

void showResetPasswordDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => ResetPasswordDialog(),
  );
}

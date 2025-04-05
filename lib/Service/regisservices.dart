import 'dart:convert';
import 'dart:developer'; // Import for logging

import 'package:http/http.dart' as http;
import 'package:new_one/Models/registration.dart';

class ApiService {
//   static const String baseUrl =
//       "http://dev.sellerkit.in:5468/api/Coupon/v1/AddMembers";

//   // Fetch data from API
//   static Future<List<Map<String, dynamic>>> fetchRegistrationData() async {
//     try {
//       log("Fetching user data from API...");
//       final response = await http.post(
//         Uri.parse(baseUrl),

//         headers: {
//           "content-type": "application/json",

//           "accept": "*/*",
//         },
//           // body: jsonEncode(qrmodel.map((e) => e.tojson()).toList()),
//       );

//       if (response.statusCode == 200) {
//         Map<String, dynamic> jsonResponse = jsonDecode(response.body);

//         if (jsonResponse.containsKey('data')) {
//           List<dynamic> data = jsonDecode(jsonResponse['data']);
//           log("Successfully fetched user data: ${data.length} records.");
//           return List<Map<String, dynamic>>.from(data);
//         } else {
//           throw Exception("Invalid response format: Missing 'data' field");
//         }
//       } else {
//         log("Failed to fetch users. Status Code: ${response.statusCode}");
//         throw Exception("Failed to load data");
//       }
//     } catch (e) {
//       log("Error fetching users: $e");
//       throw Exception("Error: $e");
//     }
//   }

  // ✅ Function to register user
  static Future<bool> registerUser(List<MemberData> userdata) async {
    try {
      // log("Sending user data to API:${baseUrl} ${jsonEncode(MemberData)}");
      log("aaaa::${jsonEncode(userdata.map((e) => e.tojson()).toList())}");

      final response = await http.post(
          Uri.parse("http://dev.sellerkit.in:5468/api/Coupon/v1/AddMembers"),
          headers: {
            "Content-Type": "application/json",
          },
          body: jsonEncode(userdata.map((e) => e.tojson()).toList()));

      log("API Response: ${response.statusCode}, Body: ${response.body}");

      if (response.statusCode == 200 || response.statusCode == 201) {
        log("User registered successfully!");
        return true;
      } else {
        log("User registration failed. Status Code: ${response.statusCode}");
        return false;
      }
    } catch (e) {
      log("Error registering user: $e");
      return false;
    }
  }
}

import 'dart:convert';
import 'dart:developer' as developer; // Alias for logging
import 'dart:math';

import 'package:http/http.dart' as http;
import 'package:new_one/Models/scanmodel.dart';

class CouponService {
  static const String baseUrl = "http://dev.sellerkit.in:5468/api/Coupon/v1";

  // Generate a random coupon code
  static String generateCouponCode() {
    const String chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
    Random random = Random();
    return List.generate(6, (index) => chars[random.nextInt(chars.length)])
        .join();
  }

  // Fetch coupon details
  static Future<CouponResponse> fetchCoupon(String couponCode) async {
    try {
      final response = await http.get(
        Uri.parse("$baseUrl/GetCoupon?couponcode=$couponCode"),
        headers: {"Accept": "application/json"},
      );

      developer.log("Fetching coupon data for: $couponCode");

      if (response.statusCode == 200) {
        Map<String, dynamic> jsonResponse = jsonDecode(response.body);
        return CouponResponse.fromJson(jsonResponse, response.statusCode);
      } else {
        throw Exception("Failed to load coupon data");
      }
    } catch (e) {
      developer.log("Error fetching coupon: $e");
      return CouponResponse.error(e.toString(), 500);
    }
  }

  // Register a new coupon
  static Future<bool> registerCoupon(List<CouponData> couponDataList) async {
    try {
      String randomCouponCode = generateCouponCode();
      developer.log("Generated Coupon Code: $randomCouponCode");

      // Assign the generated coupon code to all coupons in the list
      for (var coupon in couponDataList) {
        coupon.couponCode = randomCouponCode;
      }

      final response = await http.post(
        Uri.parse("$baseUrl/AddCoupon"),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(couponDataList.map((e) => e.toJson()).toList()),
      );

      developer
          .log("API Response: ${response.statusCode}, Body: ${response.body}");

      if (response.statusCode == 200 || response.statusCode == 201) {
        developer.log("Coupon registered successfully!");
        return true;
      } else {
        developer.log(
            "Coupon registration failed. Status Code: ${response.statusCode}");
        return false;
      }
    } catch (e) {
      developer.log("Error registering coupon: $e");
      return false;
    }
  }
}

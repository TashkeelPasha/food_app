import 'package:food_app/screens/login/login.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LoginController extends GetxController {
  var email = ''.obs;
  var password = ''.obs;

  // Signup method
  void signup() async {
    final url = Uri.parse(
        "http://your-backend-url:3000/api/register"); // Replace with your backend URL

    final response = await http.post(
      url,
      headers: {
        "Content-Type": "application/json",
      },
      body: jsonEncode({
        "email": email.value,
        "password": password.value,
      }),
    );

    if (response.statusCode == 201) {
      Get.snackbar("Success", "User registered successfully");
      Get.to(() =>
          LoginScreen()); // Redirect to Login screen on successful registration
    } else {
      final errorMessage = json.decode(response.body)["message"];
      Get.snackbar("Error", errorMessage ?? "Registration failed");
    }
  }
}

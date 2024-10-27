import 'package:flutter/material.dart';
import 'package:food_app/screens/home/home.dart';
import 'package:food_app/screens/login/login_controller.dart';
import 'package:food_app/screens/signup/signup.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  final LoginController controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/background1.png'),
          fit: BoxFit.cover, // Ensure the image covers the full screen
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Logo
                      Image.asset(
                        'assets/images/logo.png', // Add your logo path
                        height: 100,
                      ),
                      const SizedBox(height: 20),
                      // Title
                      Text(
                        "Deliver Favourite Food",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 30),
                      // Login Container
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.7),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          children: [
                            Text("Login",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 35,
                                    fontWeight: FontWeight.bold)),
                            // Email Field
                            TextField(
                              onChanged: (val) => controller.email.value = val,
                              style: TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                prefixIcon:
                                    Icon(Icons.email, color: Colors.white),
                                hintText: 'example@gmail.com',
                                hintStyle: TextStyle(color: Colors.white70),
                                filled: true,
                                fillColor: Colors.black.withOpacity(0.2),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                            ),
                            const SizedBox(height: 16),
                            // Password Field
                            TextField(
                              obscureText: true,
                              onChanged: (val) =>
                                  controller.password.value = val,
                              style: TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                prefixIcon:
                                    Icon(Icons.lock, color: Colors.white),
                                hintText: 'Password',
                                hintStyle: TextStyle(color: Colors.white70),
                                filled: true,
                                fillColor: Colors.black.withOpacity(0.2),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            // Forgot Password
                            Align(
                              alignment: Alignment.centerRight,
                              child: TextButton(
                                onPressed: () {},
                                child: Text(
                                  "Forget Password?",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                            const SizedBox(height: 16),
                            // Login Button
                            ElevatedButton(
                              onPressed: () {
                                // controller.login();
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.deepPurple,
                                padding: EdgeInsets.symmetric(
                                  horizontal: 40,
                                  vertical: 15,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              child: Text(
                                "Login",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            const SizedBox(height: 10),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      // Register Text
                      TextButton(
                        onPressed: () {
                          Get.to(FoodDeliveryHome());
                        },
                        child: Text(
                          "Don't have an account? REGISTER",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

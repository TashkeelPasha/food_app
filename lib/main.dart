import 'package:flutter/material.dart';
import 'package:food_app/screens/admin/fetch.dart';
import 'package:food_app/screens/admin/update_del.dart';
import 'package:food_app/screens/login/login.dart';
import 'package:get/get.dart';

void main() {
  Get.lazyPut(() => FetchController());
  Get.lazyPut(() => ProductOperationsController());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Foodie App',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: LoginScreen(),
    );
  }
}

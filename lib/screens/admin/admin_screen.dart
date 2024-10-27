import 'package:flutter/material.dart';
import 'package:food_app/screens/admin/create.dart';
import 'package:food_app/screens/admin/fetch.dart';
import 'package:food_app/screens/admin/update_del.dart';
import 'package:get/get.dart';

class AdminScreen extends StatelessWidget {
  const AdminScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/background1.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    Get.to(() => createScreen());
                  },
                  child: const Text("Create")),
              ElevatedButton(
                  onPressed: () {
                    Get.to(() => FetchScreen());
                  },
                  child: const Text("Read")),
              ElevatedButton(
                  onPressed: () {
                    Get.to(() => ProductOperationsScreen());
                  },
                  child: const Text("update and delete")),
            ],
          ),
        ),
      ),
    );
  }
}

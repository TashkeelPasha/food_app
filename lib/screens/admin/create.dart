import 'package:flutter/material.dart';
import 'package:food_app/screens/admin/fetch.dart';
import 'package:food_app/services/api.dart';
import 'package:get/get.dart';

class CreateController extends GetxController {
  var nameController = TextEditingController();
  var priceController = TextEditingController();
  var descriptionController = TextEditingController();
}

class createScreen extends StatelessWidget {
  final CreateController controller = Get.put(CreateController());

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background1.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextField(
                    controller: controller.nameController,
                    decoration: const InputDecoration(
                      labelText: 'Name',
                      border: OutlineInputBorder(),
                    ),
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(height: 10),
                  TextField(
                    controller: controller.priceController,
                    decoration: const InputDecoration(
                      labelText: 'Price',
                      border: OutlineInputBorder(),
                    ),
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(height: 10),
                  TextField(
                    controller: controller.descriptionController,
                    decoration: const InputDecoration(
                      labelText: 'Description',
                      border: OutlineInputBorder(),
                    ),
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      var data = {
                        "name": controller.nameController.text,
                        "price": controller.priceController.text,
                        "description": controller.descriptionController.text,
                      };
                      Api.AddProducts(data);
                    },
                    child: Text('Add Product'),
                  ),
                  ElevatedButton(
                      onPressed: () => Get.to(() => FetchScreen()),
                      child: Text("Go to read")),
                ],
              ),
            ),
          ),
        ));
  }
}

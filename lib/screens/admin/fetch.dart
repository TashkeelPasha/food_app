import 'package:flutter/material.dart';
import 'package:food_app/models/product_model.dart';
import 'package:food_app/services/api.dart';
import 'package:get/get.dart';

class FetchController extends GetxController {
  var nameController = TextEditingController();
  var priceController = TextEditingController();
  var descriptionController = TextEditingController();

  // Use an observable list for products
  var productList = <ProductModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchProducts();
  }

  void fetchProducts() async {
    var products = await Api.getProducts();
    if (products != null) {
      productList.value = products;
    }
    print(products);
  }
}

class FetchScreen extends StatelessWidget {
  final FetchController controller = Get.put(FetchController());

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
            child: Obx(() {
              if (controller.productList.isEmpty) {
                return Center(child: CircularProgressIndicator());
              } else {
                return ListView.builder(
                  itemCount: controller.productList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      leading: Icon(Icons.storage),
                      title: Text(
                        controller.productList[index].description ?? '',
                        style: TextStyle(color: Colors.white),
                      ),
                      trailing: Text(
                        controller.productList[index].price.toString(),
                        style: TextStyle(color: Colors.white),
                      ),
                    );
                  },
                );
              }
            }),
          ),
        ));
  }
}

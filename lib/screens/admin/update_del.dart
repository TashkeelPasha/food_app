import 'package:flutter/material.dart';
import 'package:food_app/models/product_model.dart';
import 'package:food_app/services/api.dart';
import 'package:get/get.dart';

class ProductOperationsController extends GetxController {
  var nameController = TextEditingController();
  var priceController = TextEditingController();
  var descriptionController = TextEditingController();

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

  void updateProduct(String name, ProductModel updatedData) async {
    bool isUpdated = await Api.updateProductByName(name, updatedData.toMap());
    if (isUpdated) {
      fetchProducts(); // Refresh product list
    }
  }

  void deleteProduct(String name) async {
    bool isDeleted = await Api.deleteProductByName(name);
    if (isDeleted) {
      fetchProducts(); // Refresh product list
    }
  }
}

class ProductOperationsScreen extends StatelessWidget {
  final ProductOperationsController controller =
      Get.put(ProductOperationsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Operations'),
      ),
      body: Obx(() {
        return ListView.builder(
          itemCount: controller.productList.length,
          itemBuilder: (BuildContext context, int index) {
            final product = controller.productList[index];
            return ListTile(
              leading: Icon(Icons.storage),
              title: Text(product.name ?? ''),
              subtitle: Text(product.description ?? ''),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: () {
                      _showUpdateDialog(context, product);
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      controller.deleteProduct(product.name!);
                    },
                  ),
                ],
              ),
            );
          },
        );
      }),
    );
  }

  void _showUpdateDialog(BuildContext context, ProductModel product) {
    final TextEditingController descriptionController =
        TextEditingController(text: product.description);
    final TextEditingController priceController =
        TextEditingController(text: product.price.toString());

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Update Product'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: descriptionController,
                decoration: InputDecoration(labelText: 'Description'),
              ),
              TextField(
                controller: priceController,
                decoration: InputDecoration(labelText: 'Price'),
                keyboardType: TextInputType.number,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                // Validate and update the product
                final updatedData = ProductModel(
                  name: product.name,
                  description: descriptionController.text,
                  price: double.tryParse(priceController.text) ?? product.price,
                );
                controller.updateProduct(product.name!, updatedData);
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('Confirm'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('Cancel'),
            ),
          ],
        );
      },
    );
  }
}

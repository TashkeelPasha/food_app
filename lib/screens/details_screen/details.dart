import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:food_app/models/product_model.dart';

class DetailsScreen extends StatelessWidget {
  final ProductModel product;

  DetailsScreen({required this.product});

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
          backgroundColor:
              Colors.transparent, // Background color similar to screenshot
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () => Get.back(),
            ),
            actions: [
              IconButton(
                icon: Icon(Icons.favorite_border, color: Colors.white),
                onPressed: () {},
              ),
            ],
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Main Image Section (hardcoded)
                  Container(
                    height: 200,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      image: DecorationImage(
                        image: AssetImage(
                            'assets/images/sample_food.png'), // Replace with your image path
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(height: 16),

                  // Restaurant Name and Location
                  Text(
                    product.name ?? 'Unknown',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '2972 Westheimer Rd. Santa Ana', // Hardcoded location
                    style: TextStyle(color: Colors.grey, fontSize: 16),
                  ),
                  SizedBox(height: 10),

                  // Delivery Information Section
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _deliveryInfo('\$3.99'),
                      _deliveryInfo('\$3.99'),
                      _deliveryInfo('\$3.99'),
                    ],
                  ),
                  SizedBox(height: 20),

                  // Delivery Options
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _optionButton('Delivery', isSelected: true),
                      _optionButton('Take Out'),
                      _optionButton('Group Order'),
                    ],
                  ),
                  SizedBox(height: 20),

                  // Featured Items Title
                  Text(
                    'Featured Items',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  Divider(color: Colors.blue, thickness: 2),

                  // Featured Items List
                  ListView.builder(
                    itemCount: 5, // Adjust based on API data
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return _featuredItem(product);
                    },
                  ),
                ],
              ),
            ),
          ),
        ));
  }

  Widget _deliveryInfo(String fee) {
    return Column(
      children: [
        Text('Delivery fee', style: TextStyle(color: Colors.grey)),
        Text(fee, style: TextStyle(color: Colors.white)),
      ],
    );
  }

  Widget _optionButton(String text, {bool isSelected = false}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: isSelected ? Colors.blue : Colors.transparent,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.blue),
      ),
      child: Text(
        text,
        style: TextStyle(
            color: Colors.white,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal),
      ),
    );
  }

  Widget _featuredItem(ProductModel product) {
    return Card(
      color: Color(0xFF1E2432),
      margin: EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        contentPadding: EdgeInsets.all(12),
        leading: CircleAvatar(
          backgroundImage:
              AssetImage('assets/images/sample_image.jpg'), // Hardcoded image
          radius: 30,
        ),
        title: Text(
          product.name ?? 'Unknown',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          product.description ?? '',
          style: TextStyle(color: Colors.grey),
        ),
        trailing: Text(
          '\$${product.price?.toStringAsFixed(2)}',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}

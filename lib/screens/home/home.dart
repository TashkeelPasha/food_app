import 'package:flutter/material.dart';
import 'package:food_app/screens/admin/admin_screen.dart';
import 'package:food_app/screens/admin/fetch.dart';
import 'package:food_app/screens/details_screen/details.dart';
import 'package:get/get.dart';
import 'dart:ui';

class HomeController extends GetxController {
  var selectedCategory = 0.obs;
}

class FoodDeliveryHome extends StatelessWidget {
  final HomeController controller = Get.put(HomeController());
  final FetchController fetchController =
      Get.put(FetchController()); // Initialize FetchController

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
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Delivery",
                style: TextStyle(fontSize: 14, color: Colors.white70),
              ),
              Text(
                "Maplewood Suites",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ],
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.settings),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.delivery_dining),
              onPressed: () {},
            ),
          ],
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              // Search bar
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Your order?',
                    filled: true,
                    fillColor: Colors.white12,
                    prefixIcon: Icon(Icons.search, color: Colors.white54),
                    hintStyle: TextStyle(color: Colors.white54),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  style: TextStyle(color: Colors.white),
                ),
              ),
              // Categories
              Container(
                height: 100,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        controller.selectedCategory.value = index;
                      },
                      child: Obx(() {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Column(
                            children: [
                              CircleAvatar(
                                backgroundColor:
                                    controller.selectedCategory.value == index
                                        ? Colors.deepPurple
                                        : Colors.white24,
                                radius: 30,
                                child: Icon(
                                  Icons.fastfood,
                                  color:
                                      controller.selectedCategory.value == index
                                          ? Colors.white
                                          : Colors.white70,
                                ),
                              ),
                              SizedBox(height: 5),
                              Text(
                                'Category ${index + 1}',
                                style: TextStyle(color: Colors.white70),
                              ),
                            ],
                          ),
                        );
                      }),
                    );
                  },
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  height: 200, // Set the height for the carousel
                  child: PageView.builder(
                    itemCount: 3, // The number of slides (can be dynamic)
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Stack(
                          children: [
                            // Glassmorphism container with blur and transparency
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white
                                    .withOpacity(0.1), // Translucent white
                                border: Border.all(
                                  color: Colors.white.withOpacity(
                                      0.2), // Border for glass look
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.1),
                                    blurRadius: 10,
                                    spreadRadius: 5,
                                  ),
                                ],
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: BackdropFilter(
                                  filter: ImageFilter.blur(
                                      sigmaX: 10, sigmaY: 10), // Blur effect
                                  child: Container(
                                    padding: const EdgeInsets.all(16.0),
                                    decoration: BoxDecoration(
                                      color: Colors.white.withOpacity(
                                          0.1), // More translucency
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Row(
                                      children: [
                                        // Image of the food (logo or icon)
                                        Image.asset('assets/images/logo.png',
                                            height: 80),
                                        SizedBox(width: 20),
                                        // Discount text and button
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                '30% OFF',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 24,
                                                ),
                                              ),
                                              SizedBox(height: 8),
                                              Text(
                                                'Discover discounts in your favorite local restaurants!',
                                                style: TextStyle(
                                                    color: Colors.white70),
                                              ),
                                              SizedBox(height: 10),
                                              ElevatedButton(
                                                onPressed: () {
                                                  // Handle order action
                                                },
                                                style: ElevatedButton.styleFrom(
                                                  backgroundColor:
                                                      Colors.blueAccent,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                  ),
                                                ),
                                                child: Text("Order Now"),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),

              SizedBox(height: 10),
              // Near You Section
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Fastest near you',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    Text(
                      'See all',
                      style: TextStyle(color: Colors.white54, fontSize: 16),
                    ),
                  ],
                ),
              ),
              // Product List Section
              // Product List Section
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Obx(() {
                  if (fetchController.productList.isEmpty) {
                    return Center(child: CircularProgressIndicator());
                  } else {
                    return SizedBox(
                      height: 300, // Specify a fixed height
                      child: ListView.builder(
                        itemCount: fetchController.productList.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white12,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: ListTile(
                                onTap: () {
                                  Get.to(() => DetailsScreen(
                                      product:
                                          fetchController.productList[index]));
                                },
                                leading: CircleAvatar(
                                  backgroundImage: AssetImage(
                                      'assets/images/food_image.png'), // Use appropriate image
                                  radius: 30,
                                ),
                                title: Text(
                                  fetchController
                                          .productList[index].description ??
                                      '',
                                  style: TextStyle(color: Colors.white),
                                ),
                                subtitle: Text(
                                  'Price: ${fetchController.productList[index].price.toString()}',
                                  style: TextStyle(color: Colors.white70),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  }
                }),
              ),
            ],
          ),
        ),
        bottomNavigationBar: GlassmorphicBottomNavBar(),
      ),
    );
  }
}

class GlassmorphicBottomNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        color: Colors.white.withOpacity(0.1), // Translucent white
        border: Border.all(
          color: Colors.white.withOpacity(0.2), // Border for glass look
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            spreadRadius: 5,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10), // Blur effect
          child: BottomNavigationBar(
            backgroundColor:
                Colors.transparent, // Make the background transparent
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.search),
                label: 'Search',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Admin',
              ),
            ],
            currentIndex: 0, // Set the current index
            selectedItemColor: Colors.blueAccent,
            unselectedItemColor: Colors.white70,
            onTap: (index) {
              switch (index) {
                case 2:
                  // Navigate to Admin screen
                  Get.to(() => AdminScreen());
                  break;
              }
            },
          ),
        ),
      ),
    );
  }
}

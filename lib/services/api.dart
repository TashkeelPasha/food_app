import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:food_app/models/product_model.dart';
import 'package:http/http.dart' as http;

class Api {
  static const baseUrl = "http://192.168.10.194:3000/api/";
  static AddProducts(Map<String, dynamic> productData) async {
    print(productData);
    var url = Uri.parse("${baseUrl}add_product");
    try {
      final response = await http.post(
        url,
        headers: {
          "Content-Type": "application/json",
        },
        body: jsonEncode(productData),
      );
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        print(data);
      } else {
        print(
            "Failed to get response: ${response.statusCode} ${response.body}");
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  static getProducts() async {
    List<ProductModel> products = [];
    var url = Uri.parse("${baseUrl}get_product");
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        data['products'].forEach(
          (value) => {
            products.add(ProductModel(
                name: value["name"],
                description: value['description'],
                price: value['price'])),
          },
        );
        return products;
      } else {
        return [];
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  static updateProductByName(
      String name, Map<String, dynamic> updatedData) async {
    var url = Uri.parse("${baseUrl}update_product/$name");
    try {
      final response = await http.put(
        url,
        headers: {
          "Content-Type": "application/json",
        },
        body: jsonEncode(updatedData),
      );
      return response.statusCode == 200;
    } catch (e) {
      debugPrint(e.toString());
      return false;
    }
  }

  static deleteProductByName(String name) async {
    var url = Uri.parse("${baseUrl}delete_product/$name");
    try {
      final response = await http.delete(url);
      return response.statusCode == 200;
    } catch (e) {
      debugPrint(e.toString());
      return false;
    }
  }
}

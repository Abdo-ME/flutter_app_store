import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../consts/api_consts.dart';
import '../models/products_model.dart';

class APIHandler {
  static Future<List<ProductsModel>> getAllProducts() async {
    var uri = Uri.https(BaseURL, 'api/v1/products');
    final response = await http.get(uri);
    var data = jsonDecode(response.body);
    List tempProducts = [];
    for (var product in data) {
      tempProducts.add(product);
    }

    return ProductsModel.productsFromSnapshot(tempProducts);
  }
}

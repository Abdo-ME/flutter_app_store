import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:store_api_flutter_course/models/categories_model.dart';

import '../consts/api_consts.dart';
import '../models/products_model.dart';

class APIHandler {
  static Future<List<dynamic>> getData({required String target}) async {
    var uri = Uri.https(BaseURL, 'api/v1/$target');
    final response = await http.get(uri);
    var data = jsonDecode(response.body);
    List tempdata = [];
    for (var product in data) {
      tempdata.add(product);
    }
    return tempdata;
  }

  static Future<List<ProductsModel>> getAllProducts() async {
    List tempProducts = [];
    tempProducts = await getData(target: 'products');
    return ProductsModel.productsFromSnapshot(tempProducts);
  }

  static Future<List<CategoriesModel>> getCategories() async {
    List tempGategories = [];
    tempGategories = await getData(target: 'categories');
    return CategoriesModel.productsFromSnapshot(tempGategories);
  }
}

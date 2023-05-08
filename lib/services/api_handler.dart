import 'dart:convert';
import 'dart:math';

// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;
import 'package:store_api_flutter_course/models/categories_model.dart';
import 'package:store_api_flutter_course/models/users_model.dart';

import '../consts/api_consts.dart';
import '../models/products_model.dart';

class APIHandler {
  static Future<List<dynamic>> getData(
      {required String target, String? limit}) async {
    try {
      var uri = Uri.https(BaseURL, 'api/v1/$target',
          target == 'products' ? {'offset': '0', 'limit': limit} : {});
      final response = await http.get(uri);
      var data = jsonDecode(response.body);
      List tempdata = [];
      if (response.statusCode != 200) {
        throw data['message'];
      }

      for (var product in data) {
        tempdata.add(product);
      }
      return tempdata;
    } catch (error) {
      print("en error while getting products : $error");
      throw error.toString();
    }
  }

  static Future<List<ProductsModel>> getAllProducts(
      {required String limit}) async {
    List tempProducts = [];
    tempProducts = await getData(target: 'products', limit: limit);
    return ProductsModel.productsFromSnapshot(tempProducts);
  }

  static Future<List<CategoriesModel>> getCategories() async {
    List tempGategories = [];
    tempGategories = await getData(target: 'categories');
    return CategoriesModel.productsFromSnapshot(tempGategories);
  }

  static Future<List<UsersModel>> getUsers() async {
    List tempusers = [];
    tempusers = await getData(target: 'users');
    return UsersModel.usersFromSnapshot(tempusers);
  }

  static Future<ProductsModel> getProductByID({required String id}) async {
    try {
      var uri = Uri.https(BaseURL, 'api/v1/products/$id');
      final response = await http.get(uri);
      var data = jsonDecode(response.body);
      if (response.statusCode != 200) {
        throw data['message'];
      }

      return ProductsModel.fromJson(data);
    } catch (error) {
      throw error.toString();
    }
  }
}

import 'package:flutter/material.dart';
import 'package:store_api_flutter_course/models/categories_model.dart';

class ProductsModel with ChangeNotifier {
  int? id;
  String? title;
  int? price;
  String? description;
  List<String>? images;

  CategoriesModel? category;

  ProductsModel(
      {this.id,
      this.title,
      this.price,
      this.description,
      this.images,
      this.category});

  ProductsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    price = json['price'];
    description = json['description'];
    images = json['images'].cast<String>();
    category = json['category'] != null
        ? CategoriesModel.fromJson(json['category'])
        : null;
  }

  static List<ProductsModel> productsFromSnapshot(List products) {
    return products.map((product) {
      return ProductsModel.fromJson(product);
    }).toList();
  }

  static ProductsModel productFromSnapshot(product) {
    return ProductsModel.fromJson(product);
    // return product.map((product) {
    // }).toList();
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store_api_flutter_course/services/api_handler.dart';
import 'package:store_api_flutter_course/widgets/feeds_grid_widget.dart';
import 'package:store_api_flutter_course/widgets/feeds_widget.dart';

import '../models/products_model.dart';

class FeedsScreen extends StatefulWidget {
  const FeedsScreen({super.key});

  @override
  State<FeedsScreen> createState() => _FeedsScreenState();
}

class _FeedsScreenState extends State<FeedsScreen> {
  List<ProductsModel> productList = [];

  @override
  void didChangeDependencies() {
    getProducts();

    super.didChangeDependencies();
  }

  Future<void> getProducts() async {
    productList = await APIHandler.getAllProducts();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All products'),
      ),
      body: SingleChildScrollView(
          child: productList.isEmpty
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : FeedsGridWidget(
                  productsList: productList,
                  count: productList.length,
                )),
    );
  }
}

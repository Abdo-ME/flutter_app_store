import 'package:flutter/material.dart';
import 'package:store_api_flutter_course/services/api_handler.dart';
import 'package:store_api_flutter_course/widgets/feeds_grid_widget.dart';

import '../models/products_model.dart';

class FeedsScreen extends StatefulWidget {
  const FeedsScreen({super.key});

  @override
  State<FeedsScreen> createState() => _FeedsScreenState();
}

class _FeedsScreenState extends State<FeedsScreen> {
  late int count;
  late List<ProductsModel> productsList;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All products'),
      ),
      body: SingleChildScrollView(
        child: futureWidget(),
      ),
    );
  }

  FutureBuilder<List<ProductsModel>> futureWidget() {
    return FutureBuilder<List<ProductsModel>>(
        future: APIHandler.getAllProducts(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return SizedBox(
              // width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.7,
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else if (snapshot.hasError) {
            Center(
              child: Text('An error Occoured ${snapshot.error}'),
            );
          } else if (snapshot.data == null) {
            return const Text('No Products');
          }
          return FeedsGridWidget(
            productsList: snapshot.data!,
            count: snapshot.data!.length,
          );
        });
  }
}

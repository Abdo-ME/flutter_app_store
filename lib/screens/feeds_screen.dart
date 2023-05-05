import 'package:flutter/material.dart';
import 'package:store_api_flutter_course/services/api_handler.dart';
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
        child: GridView.builder(
            itemCount: productList.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 2,
                crossAxisSpacing: 2,
                childAspectRatio: 0.7),
            itemBuilder: (_, index) {
              return FeedWidget(
                imgUrl: productList[index].images![0],
                title: productList[index].title.toString(),
                product: productList[index],
              );
            }),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store_api_flutter_course/models/products_model.dart';
import 'package:store_api_flutter_course/widgets/feeds_widget.dart';

class FeedsGridWidget extends StatelessWidget {
  const FeedsGridWidget(
      {super.key, required this.productsList, required this.count});
  final List<ProductsModel> productsList;
  final int count;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: count,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 5,
            crossAxisSpacing: 5,
            mainAxisExtent: 270),
        itemBuilder: (_, index) {
          return ChangeNotifierProvider.value(
            value: productsList[index],
            child: const FeedWidget(),
          );
        });
  }
}

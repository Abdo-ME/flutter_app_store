import 'package:flutter/material.dart';
import 'package:store_api_flutter_course/models/products_model.dart';
import 'package:store_api_flutter_course/widgets/feeds_widget.dart';

class FeedsGridWidget extends StatelessWidget {
  const FeedsGridWidget({super.key, required this.productsList});
  final List<ProductsModel> productsList;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: 3,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 5,
            crossAxisSpacing: 5,
            mainAxisExtent: 270),
        itemBuilder: (_, index) {
          return FeedWidget(
            imgUrl: productsList[index].images![0],
            title: productsList[index].title.toString(),
            product: productsList[index],
          );
        });
  }
}

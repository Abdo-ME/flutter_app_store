import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';
import 'package:store_api_flutter_course/consts/global_colors.dart';
import 'package:store_api_flutter_course/models/categories_model.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final categoryModelProvider = Provider.of<CategoriesModel>(context);

    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: FancyShimmerImage(
            // height: size.height * 0.45,
            // width: size.height * 0.45,
            errorWidget: const Icon(
              IconlyBold.danger,
              color: Colors.red,
              size: 28,
            ),
            imageUrl: categoryModelProvider.image.toString(),
            boxFit: BoxFit.fill,
          ),
        ),
        Center(
            child: Container(
          padding: const EdgeInsets.all(8),
          color: lightCardColor.withOpacity(0.5),
          child: Text(
            categoryModelProvider.name.toString(),
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ))
      ],
    );
  }
}

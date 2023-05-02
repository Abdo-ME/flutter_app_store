import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class UsersWidget extends StatelessWidget {
  const UsersWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.all(8),
      child: ListTile(
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: FancyShimmerImage(
            height: size.width * 0.15,
            width: size.width * 0.15,
            errorWidget: const Icon(
              IconlyBold.danger,
              color: Colors.red,
              size: 28,
            ),
            imageUrl:
                'https://as2.ftcdn.net/v2/jpg/02/14/74/61/1000_F_214746128_31JkeaP6rU0NzzzdFC4khGkmqc8noe6h.jpg',
            boxFit: BoxFit.fill,
          ),
        ),
        title: Text(
          'Abdelhak',
          style: TextStyle(fontWeight: FontWeight.w400),
        ),
        subtitle: Text(
          'Abdelhak@test.com',
        ),
        trailing: Text(
          'Customer',
          style: TextStyle(
              color: Color.fromARGB(235, 226, 90, 12),
              fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}

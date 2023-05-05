import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:store_api_flutter_course/consts/global_colors.dart';

import '../widgets/appbar_icons.dart';
import '../widgets/sale_widget.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    String title = 'title';
    String description = 'description';
    String category = 'category';
    String image = 'image';
    int price = 123;

    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    category,
                    style: const TextStyle(
                        fontWeight: FontWeight.w400, fontSize: 25),
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        flex: 3,
                        child: Text(title,
                            style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 28,
                              overflow: TextOverflow.ellipsis,
                            ),
                            maxLines: 1),
                      ),
                      Flexible(
                        flex: 1,
                        child: RichText(
                          text: TextSpan(
                              text: '\$',
                              style: const TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 28,
                                color: Color.fromRGBO(33, 150, 243, 1),
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                  text: price.toString(),
                                  style: TextStyle(
                                      color: lightTextColor,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 28),
                                ),
                              ]),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: size.height * 0.40,
              child: Swiper(
                itemBuilder: (context, index) {
                  return Image(
                    width: double.infinity,
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      image,
                    ),
                  );
                },
                indicatorLayout: PageIndicatorLayout.COLOR,
                autoplay: true,
                itemCount: 3,
                pagination: const SwiperPagination(
                    margin: EdgeInsets.all(5),
                    builder: DotSwiperPaginationBuilder(
                        activeColor: Colors.red, color: Colors.black)),
              ),
            ),
            const SizedBox(
              height: 18,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Description',
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 28),
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  Text(
                    description,
                    style: const TextStyle(
                        fontWeight: FontWeight.w400, fontSize: 20),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

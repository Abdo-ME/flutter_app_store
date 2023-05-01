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
                  const Text(
                    'Category',
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 25),
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Product one',
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 28),
                      ),
                      Flexible(
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
                                  text: '168.00',
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
                  return const Image(
                    width: double.infinity,
                    fit: BoxFit.contain,
                    image: NetworkImage(
                      'https://www.transparentpng.com/download/running-shoes/MQ02nC-running-shoes-hd-image.png',
                    ),
                  );
                },
                indicatorLayout: PageIndicatorLayout.COLOR,
                // autoplay: true,
                itemCount: 5,
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
                children: const [
                  Text(
                    'Description',
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 28),
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  Text(
                    'Lorem Ipsum is simply dummy text of the printing and typesetting industry.Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 20),
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

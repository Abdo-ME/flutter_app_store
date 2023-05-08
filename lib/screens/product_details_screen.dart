import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:store_api_flutter_course/consts/global_colors.dart';
import 'package:store_api_flutter_course/models/products_model.dart';
import 'package:store_api_flutter_course/services/api_handler.dart';

import '../widgets/appbar_icons.dart';
import '../widgets/sale_widget.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({
    super.key,
    required this.id,
  });

  final String id;

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  ProductsModel? product;
  bool isError = false;
  String errorMsg = '';
  Future<void> getproductinfo() async {
    try {
      product = await APIHandler.getProductByID(id: widget.id);
    } catch (error) {
      isError = true;
      errorMsg = error.toString();
    }
    setState(() {});
  }

  @override
  void didChangeDependencies() {
    getproductinfo();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(),
      body: isError
          ? Center(
              child: Text(
              errorMsg,
              style: const TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
            ))
          : SafeArea(
              child: SingleChildScrollView(
                child: product == null
                    ? SizedBox(
                        height: size.height,
                        child: const Center(child: CircularProgressIndicator()),
                      )
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  product!.category!.name.toString(),
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 25),
                                ),
                                const SizedBox(
                                  height: 18,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Flexible(
                                      flex: 3,
                                      child: Text(product!.title.toString(),
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
                                              color: Color.fromRGBO(
                                                  33, 150, 243, 1),
                                            ),
                                            children: <TextSpan>[
                                              TextSpan(
                                                text: product!.price.toString(),
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
                                    product!.images![index].toString(),
                                  ),
                                );
                              },
                              indicatorLayout: PageIndicatorLayout.COLOR,
                              autoplay: true,
                              itemCount: product!.images!.length,
                              pagination: const SwiperPagination(
                                  margin: EdgeInsets.all(5),
                                  builder: DotSwiperPaginationBuilder(
                                      activeColor: Colors.red,
                                      color: Colors.black)),
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
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 28),
                                ),
                                const SizedBox(
                                  height: 18,
                                ),
                                Text(
                                  product!.description!.toString(),
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 20),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
              ),
            ),
    );
  }
}

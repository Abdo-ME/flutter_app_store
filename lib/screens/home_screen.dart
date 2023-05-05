import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:store_api_flutter_course/consts/global_colors.dart';
import 'package:store_api_flutter_course/models/products_model.dart';
import 'package:store_api_flutter_course/screens/categories_screen.dart';
import 'package:store_api_flutter_course/screens/feeds_screen.dart';
import 'package:store_api_flutter_course/screens/users_screen.dart';
import 'package:store_api_flutter_course/services/api_handler.dart';
import 'package:store_api_flutter_course/widgets/appbar_icons.dart';
import 'package:store_api_flutter_course/widgets/feeds_grid_widget.dart';
import 'package:store_api_flutter_course/widgets/feeds_widget.dart';
import 'package:store_api_flutter_course/widgets/sale_widget.dart';
import 'package:page_transition/page_transition.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late TextEditingController _textEditingController;
  @override
  void initState() {
    // TODO: implement initState
    _textEditingController = TextEditingController();
    super.initState();
  }

  @override
  // Add dispose to empty the cash from input value after navigate to other screens
  void dispose() {
    _textEditingController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Home'),
          leading: AppBarIcons(
              function: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Categories()),
                );
              },
              icon: IconlyBold.category),
          actions: [
            AppBarIcons(
                function: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Users()),
                  );
                },
                icon: IconlyBold.user3)
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 18,
                ),
                TextField(
                  controller: _textEditingController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    hintText: 'Search',
                    filled: true,
                    fillColor: Theme.of(context).cardColor,
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide:
                            BorderSide(color: Theme.of(context).cardColor)),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        width: 1,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                    suffixIcon: Icon(
                      IconlyLight.search,
                      color: lightIconsColor,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: size.height * 0.25,
                  child: Swiper(
                    itemBuilder: (context, index) {
                      return const SaleWidget();
                    },
                    indicatorLayout: PageIndicatorLayout.COLOR,
                    // autoplay: true,
                    itemCount: 5,
                    pagination: const SwiperPagination(
                        builder: DotSwiperPaginationBuilder(
                            activeColor: Colors.red)),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(6),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Latset Products',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        AppBarIcons(
                            function: () {
                              Navigator.push(
                                  context,
                                  PageTransition(
                                      type: PageTransitionType.leftToRight,
                                      duration:
                                          const Duration(milliseconds: 300),
                                      child: const FeedsScreen()));
                            },
                            icon: IconlyBold.arrowRight2)
                      ]),
                ),
                const SizedBox(
                  height: 10,
                ),
                FutureBuilder<List<ProductsModel>>(
                    future: APIHandler.getAllProducts(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (snapshot.hasError) {
                        Center(
                          child: Text('An error Occoured ${snapshot.error}'),
                        );
                      } else if (snapshot.data == null) {
                        return const Text('No Products');
                      }
                      return FeedsGridWidget(productsList: snapshot.data!);
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

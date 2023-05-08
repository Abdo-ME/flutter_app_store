import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store_api_flutter_course/services/api_handler.dart';

import '../models/products_model.dart';
import '../widgets/feeds_widget.dart';

class FeedsScreen extends StatefulWidget {
  const FeedsScreen({super.key});

  @override
  State<FeedsScreen> createState() => _FeedsScreenState();
}

class _FeedsScreenState extends State<FeedsScreen> {
  final ScrollController _scrollController = ScrollController();
  List<ProductsModel> productsList = [];
  int _limit = 10;
  bool _isLimit = false;
  @override
  void initState() {
    getAllProducts();
    super.initState();
  }

  Future<void> getAllProducts() async {
    productsList = await APIHandler.getAllProducts(limit: _limit.toString());
    setState(() {});
  }

  @override
  void didChangeDependencies() {
    _scrollController.addListener(() async {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _limit += 10;
        if (_limit >= 200) {
          _isLimit = true;
          setState(() {});
          return;
        }
        await getAllProducts();
      }
    });

    super.didChangeDependencies();
  }

  @override
  // Add dispose to empty the cash from input value after navigate to other screens
  void dispose() {
    _scrollController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All products'),
      ),
      body: productsList.isEmpty
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              controller: _scrollController,
              child: Column(
                children: [
                  GridView.builder(
                      itemCount: productsList.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 5,
                              crossAxisSpacing: 5,
                              mainAxisExtent: 270),
                      itemBuilder: (_, index) {
                        return ChangeNotifierProvider.value(
                          value: productsList[index],
                          child: const FeedWidget(),
                        );
                      }),
                  if (!_isLimit)
                    const Center(
                      child: CircularProgressIndicator(),
                    )
                ],
              ),
            ),
    );
  }
}

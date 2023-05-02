import 'package:flutter/material.dart';
import 'package:store_api_flutter_course/widgets/feeds_widget.dart';

class FeedsScreen extends StatelessWidget {
  const FeedsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All products'),
      ),
      body: SingleChildScrollView(
        child: GridView.builder(
            itemCount: 8,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 2,
                crossAxisSpacing: 2,
                childAspectRatio: 0.7),
            itemBuilder: (_, index) {
              return const FeedWidget();
            }),
      ),
    );
  }
}

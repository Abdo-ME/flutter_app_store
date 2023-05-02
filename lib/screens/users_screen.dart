import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:store_api_flutter_course/widgets/users_widget.dart';

class Users extends StatelessWidget {
  const Users({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Users'),
      ),
      body: ListView.builder(
          itemCount: 10,
          itemBuilder: (_, index) {
            return const UsersWidget();
          }),
    );
  }
}

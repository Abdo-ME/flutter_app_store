import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';
import 'package:store_api_flutter_course/models/users_model.dart';
import 'package:store_api_flutter_course/services/api_handler.dart';
import 'package:store_api_flutter_course/widgets/users_widget.dart';

class Users extends StatelessWidget {
  const Users({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Users'),
      ),
      body: FutureBuilder<List<UsersModel>>(
          future: APIHandler.getUsers(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return SizedBox(
                // width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.5,
                child: const Center(
                  child: CircularProgressIndicator(),
                ),
              );
            } else if (snapshot.hasError) {
              Center(
                child: Text('An error Occoured ${snapshot.error}'),
              );
            } else if (snapshot.data == null) {
              return const Text('No Users');
            }
            return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (_, index) {
                  return ChangeNotifierProvider.value(
                    value: snapshot.data![index],
                    child: UsersWidget(user: snapshot.data![index]),
                  );
                });
          }),

      // ListView.builder(
      //     itemCount: 10,
      //     itemBuilder: (_, index) {
      //       return const UsersWidget();
      //     }),
    );
  }
}

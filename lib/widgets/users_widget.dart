import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:store_api_flutter_course/models/users_model.dart';

class UsersWidget extends StatelessWidget {
  const UsersWidget({super.key, required this.user});
  final UsersModel user;
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
            imageUrl: user.avatar.toString(),
            boxFit: BoxFit.fill,
          ),
        ),
        title: Text(
          user.name.toString(),
          style: const TextStyle(fontWeight: FontWeight.w400),
        ),
        subtitle: Text(
          user.email.toString(),
        ),
        trailing: Text(
          user.role.toString(),
          style: const TextStyle(
              color: Color.fromARGB(235, 226, 90, 12),
              fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}

import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:store_api_flutter_course/consts/global_colors.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: FancyShimmerImage(
            // height: size.height * 0.45,
            // width: size.height * 0.45,
            errorWidget: const Icon(
              IconlyBold.danger,
              color: Colors.red,
              size: 28,
            ),
            imageUrl:
                'https://www.ukri.org/wp-content/uploads/2021/09/GettyImages-1257563298-735x490.jpg',
            boxFit: BoxFit.fill,
          ),
        ),
        Center(
            child: Container(
          padding: const EdgeInsets.all(8),
          color: lightCardColor.withOpacity(0.5),
          child: const Text(
            'Category',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ))
      ],
    );
  }
}


// Material(
//       borderRadius: BorderRadius.circular(10.0),
//       color: Theme.of(context).cardColor,
//       child: InkWell(
//         borderRadius: BorderRadius.circular(8.0),
//         onTap: () {},
//         child: Container(
//           width: 200,
//           height: 200,
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(10),
//             image: const DecorationImage(
//                 image: NetworkImage(
//                   'https://www.ukri.org/wp-content/uploads/2021/09/GettyImages-1257563298-735x490.jpg',
//                 ),
//                 fit: BoxFit.cover),
//           ),
//           child: Center(
//             child: Container(
//               padding: const EdgeInsets.all(5),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(5),
//                 color: Colors.white.withOpacity(0.6),
//               ),
//               child: const Text(
//                 'Clothes',
//                 textAlign: TextAlign.center,
//                 style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:max_clean_arch/domain/product.entities/product.dart';
// import 'package:max_clean_arch/const.dart';
// import 'package:transparent_image/transparent_image.dart';
//
// class ProductListItemWidget extends StatelessWidget {
//   const ProductListItemWidget({required this.product, Key? key}) : super(key: key);
//
//   final Product product;
//
//   @override
//   Widget build(BuildContext context) {
//     const imageSize = kProductPreviewImageSize;
//     return Container(
//       padding: const EdgeInsets.symmetric(vertical: 8),
//       margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         children: [
//           Row(
//             children: [
//               Hero(
//                 tag: 'image-tag-${product.id}',
//                 child: SizedBox(
//                   width: imageSize,
//                   height: imageSize,
//                   child: Stack(
//                     fit: StackFit.expand,
//                     children: [
//                       const Center(
//                         child: Icon(
//                           Icons.image_outlined,
//                           color: Colors.grey,
//                           size: imageSize * 0.35,
//                         ),
//                       ),
//                       // FadeInImage.assetNetwork(placeholder: kProductPlaceholderImageAsset,
//                       Center(
//                         child: FadeInImage.memoryNetwork(
//                           placeholder: kTransparentImage,
//                           image: product.image,
//                           fit: BoxFit.contain,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               // Image.network(product.image, width: 60, height: 60, fit: BoxFit.contain,),
//               const SizedBox(width: 8),
//               Expanded(
//                 child: Hero(
//                   tag: 'name-tag-${product.id}',
//                   child: Text(
//                     product.name,
//                     maxLines: 2,
//                     overflow: TextOverflow.clip,
//                     style: Theme.of(context).textTheme.headline6,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           const SizedBox(height: 4),
//           Text(
//             product.description,
//             maxLines: 3,
//             overflow: TextOverflow.ellipsis,
//             style: Theme.of(context).textTheme.bodyText2,
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:max_clean_arch/domain/product.entities/product.dart';
import 'package:max_clean_arch/presentation/const.dart';

class ProductDetailsWidget extends StatelessWidget {
  const ProductDetailsWidget({
    required this.product,
    Key? key,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    const imageSize = kProductDetailsImageSize;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Hero(
            tag: 'image-tag-${product.id}',
            child: Stack(
              children: <Widget>[
                //firstly show small image as initial
                Center(
                  child: Image.network(
                    product.image,
                    fit: BoxFit.cover,
                    alignment: Alignment.center,
                    height: imageSize,
                    errorBuilder: (ctx, error, stackTrace) => const SizedBox.shrink(),
                  ),
                ),
                //then load and show hq image atop
                Center(
                  child: Image(
                    image: NetworkImage(product.imageHq),
                    fit: BoxFit.cover,
                    alignment: Alignment.center,
                    height: imageSize,
                    errorBuilder: (ctx, error, stackTrace) => const SizedBox.shrink(),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Hero(
            tag: 'name-tag-${product.id}',
            child: Text(
              product.name,
              overflow: TextOverflow.clip,
              style: Theme.of(context).textTheme.headline5?.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            product.description,
            style: Theme.of(context).textTheme.bodyText2?.apply(fontSizeDelta: 2),
          ),
        ],
      ),
    );
  }
}

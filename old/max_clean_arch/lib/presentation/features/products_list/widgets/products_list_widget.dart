import 'package:flutter/material.dart';
import 'package:kt_dart/collection.dart';
import 'package:max_clean_arch/domain/product.entities/product.dart';

import 'product_list_item_widget.dart';

class ProductsListWidget extends StatelessWidget {
  const ProductsListWidget({
    required this.products,
    required this.onProductClick,
    Key? key,
  }) : super(key: key);

  final KtList<Product> products;
  final void Function(Product) onProductClick;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      itemCount: products.size,
      itemBuilder: (context, idx) {
        final product = products[idx];
        return InkWell(
          onTap: () => onProductClick(product),
          child: ProductListItemWidget(
            key: Key(product.id),
            product: product,
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) => const Divider(),
    );
  }
}

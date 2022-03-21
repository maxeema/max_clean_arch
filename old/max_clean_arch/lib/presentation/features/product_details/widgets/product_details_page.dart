import 'package:flutter/material.dart';
import 'package:max_clean_arch/domain/product.entities/product.dart';
import 'package:max_clean_arch/presentation/generated/l10n.dart';
import 'package:max_clean_arch/presentation/features/product_details/widgets/product_details_widget.dart';

class ProductDetailsPage extends StatelessWidget {
  const ProductDetailsPage({
    required this.product,
    Key? key,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(S.of(context).productDetails),
      ),
      // extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: ProductDetailsWidget(product: product),
      ),
    );
  }
}

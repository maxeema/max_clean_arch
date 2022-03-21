import 'package:max_clean_arch/domain/product.entities/product.dart';

import 'fake_product.dart';

class FakeProductMapper {
  static Product toDomain(FakeProduct dto) {
    return Product(
      id: dto['id'],
      name: dto['name'],
      description: dto['description'],
      image: dto['pre_image'],
      imageHq: dto['big_image'],
    );
  }
}

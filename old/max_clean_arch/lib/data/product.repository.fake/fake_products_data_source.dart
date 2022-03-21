import 'dart:convert';
import 'dart:math';

import 'package:injectable/injectable.dart';
import 'package:kt_dart/collection.dart';

import 'fake_product.dart';

part 'fake_data.dart';

const _errorChancePercent = 10;

@injectable
class FakeProductsDataSource {
  const FakeProductsDataSource();

  Future<KtList<FakeProduct>> list() {
    final random = Random.secure();
    if (random.nextInt(100) <= _errorChancePercent) {
      throw _fakeErrors[random.nextInt(_fakeErrors.length)];
    } else {
      final rawProducts = (jsonDecode(_fakeProducts)['products'] as List).cast<Map<String, dynamic>>();
      final fakeProducts = rawProducts.map((raw) => FakeProduct(raw));
      return Future.value(KtList.from(fakeProducts));
    }
  }
}

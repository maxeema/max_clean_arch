import 'dart:math';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:kt_dart/collection.dart';
import 'package:max_clean_arch/domain/product.entities/product.dart';
import 'package:max_clean_arch/domain/product.repository/products_repository.dart';
import 'package:rxdart/rxdart.dart';

import 'fake_product_mapper.dart';
import 'fake_products_data_source.dart';

const _minExecutionTimeMs = 200;
const _maxExecutionTimeMs = 1500;

@Injectable(as: ProductsRepository)
class FakeProductsRepository extends ProductsRepository {
  const FakeProductsRepository({required this.dataSource});

  final FakeProductsDataSource dataSource;

  @override
  Future<Either<ErrorAndStackTrace, KtList<Product>>> list() async {
    try {
      await Future.delayed(_getFakeExecutionTime(), () {});
      final result = await dataSource.list();
      final products = result.map(FakeProductMapper.toDomain);
      final shuffled = products.asList()..shuffle();
      return right(KtList.from(shuffled));
    } catch (error, stackTrace) {
      return left(ErrorAndStackTrace(error, stackTrace));
    }
  }
}

Duration _getFakeExecutionTime() => Duration(
    milliseconds: Random.secure().nextInt(_maxExecutionTimeMs).clamp(_minExecutionTimeMs, _maxExecutionTimeMs));

import 'package:dartz/dartz.dart';
import 'package:kt_dart/collection.dart';
import 'package:rxdart/rxdart.dart';

import '../product.entities/product.dart';

abstract class ProductsRepository {
  const ProductsRepository();

  Future<Either<ErrorAndStackTrace, KtList<Product>>> list();
}

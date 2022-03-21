import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:kt_dart/collection.dart';
import 'package:rxdart/rxdart.dart';

import '../product.repository/products_repository.dart';
import '../product.entities/product.dart';
import '../usecase.dart';

@injectable
class ListProductsUsecase implements Usecase<Future<Either<ErrorAndStackTrace, KtList<Product>>>> {
  const ListProductsUsecase(this.repository);

  final ProductsRepository repository;

  @override
  Future<Either<ErrorAndStackTrace, KtList<Product>>> call([_]) => repository.list();
}

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:kt_dart/collection.dart';
import 'package:max_clean_arch/domain/product.entities/product.dart';
import 'package:max_clean_arch/domain/product.usecases/list_products_usecase.dart';
import 'package:max_clean_arch/presentation/actions/product.actions/open_product_action.dart';
import 'package:rxdart/rxdart.dart';
import 'package:single_bloc/single_bloc.dart';

@injectable
class ProductsListBloc extends SingleBloc<void, ErrorAndStackTrace, KtList<Product>> {
  ProductsListBloc({
    required ListProductsUsecase listProducts,
    required OpenProductAction openProduct,
  })  : _listProducts = listProducts,
        _openProduct = openProduct,
        super((SingleBlocState(SingleBlocStatus.inProgress))) {
    load();
  }

  final ListProductsUsecase _listProducts;
  final OpenProductAction _openProduct;

  void load() => execute(null);

  @override
  Future<KtList<Product>> action({required void args, required IsCanceled isCanceled}) async {
    final result = await _listProducts();
    return result.fold((l) => throw (result as Left).value, (r) => r);
  }

  void openProduct(Product product) => _openProduct(product);
}

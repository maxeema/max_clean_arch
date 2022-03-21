// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'app_actions_delegate.dart' as _i8;
import 'data/product.repository.fake/fake_products_data_source.dart' as _i4;
import 'data/product.repository.fake/fake_products_repository.dart' as _i6;
import 'domain/product.repository/products_repository.dart' as _i5;
import 'domain/product.usecases/list_products_usecase.dart' as _i10;
import 'presentation/actions/actions_delegate.dart' as _i7;
import 'presentation/actions/product.actions/open_product_action.dart' as _i11;
import 'presentation/features/products_list/blocs/products_list_bloc.dart'
    as _i12;
import 'presentation/navigation/app_router.dart' as _i9;
import 'state/app_state_manager.dart'
    as _i3; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.singleton<_i3.AppStateManager>(_i3.AppStateManager());
  gh.factory<_i4.FakeProductsDataSource>(() => _i4.FakeProductsDataSource());
  gh.factory<_i5.ProductsRepository>(() => _i6.FakeProductsRepository(
      dataSource: get<_i4.FakeProductsDataSource>()));
  gh.singleton<_i7.ActionsDelegate>(
      _i8.AppActionsDelegate(get<_i3.AppStateManager>()));
  gh.factory<_i9.AppRouter>(() =>
      _i9.AppRouter(get<_i7.ActionsDelegate>(), get<_i3.AppStateManager>()));
  gh.factory<_i10.ListProductsUsecase>(
      () => _i10.ListProductsUsecase(get<_i5.ProductsRepository>()));
  gh.factory<_i11.OpenProductAction>(
      () => _i11.OpenProductAction(get<_i7.ActionsDelegate>()));
  gh.factory<_i12.ProductsListBloc>(() => _i12.ProductsListBloc(
      listProducts: get<_i10.ListProductsUsecase>(),
      openProduct: get<_i11.OpenProductAction>()));
  return get;
}

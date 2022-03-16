// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:navigation_repository/navigation_repository.dart' as _i4;

import 'actions/actions_delegate.dart' as _i5;
import 'di_module.dart' as _i13;
import 'features/navigation/actions/open_item_action.dart' as _i9;
import 'features/navigation/actions/show_item_image_action.dart' as _i10;
import 'features/navigation/actions/switch_page_action.dart' as _i11;
import 'features/navigation/blocs/navigation_bloc.dart' as _i8;
import 'features/navigation/blocs/page_items_bloc.dart' as _i12;
import 'features/navigation/usecases/get_navigation_usecase.dart' as _i7;
import 'router/app_router.dart' as _i6;
import 'state/app_state_manager.dart'
    as _i3; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final registerModule = _$RegisterModule(get);
  gh.singleton<_i3.AppStateManager>(registerModule.appStateManager);
  gh.factory<_i4.NavigationRepository>(
      () => registerModule.navigationRepository);
  gh.lazySingleton<_i5.ActionsDelegate>(
      () => registerModule.createActionsDelegate(get<_i3.AppStateManager>()));
  gh.factory<_i6.AppRouter>(() =>
      _i6.AppRouter(get<_i5.ActionsDelegate>(), get<_i3.AppStateManager>()));
  gh.factory<_i7.GetNavigationUsecase>(
      () => _i7.GetNavigationUsecase(get<_i4.NavigationRepository>()));
  gh.lazySingleton<_i8.NavigationBloc>(() => registerModule.navigationBloc);
  gh.factory<_i9.OpenItemAction>(
      () => _i9.OpenItemAction(get<_i5.ActionsDelegate>()));
  gh.factory<_i10.ShowItemImageAction>(
      () => _i10.ShowItemImageAction(get<_i5.ActionsDelegate>()));
  gh.factory<_i11.SwitchPageAction>(
      () => _i11.SwitchPageAction(get<_i5.ActionsDelegate>()));
  gh.factoryParam<_i12.PageItemsBloc, _i4.NavigationData, dynamic>(
      (navigationData, _) => _i12.PageItemsBloc(
          switchPageAction: get<_i11.SwitchPageAction>(),
          openItemAction: get<_i9.OpenItemAction>(),
          showItemImageAction: get<_i10.ShowItemImageAction>(),
          navigationData: navigationData));
  return get;
}

class _$RegisterModule extends _i13.RegisterModule {
  _$RegisterModule(this._getIt);

  final _i1.GetIt _getIt;

  @override
  _i3.AppStateManager get appStateManager => _i3.AppStateManager();
  @override
  _i8.NavigationBloc get navigationBloc =>
      _i8.NavigationBloc(_getIt<_i7.GetNavigationUsecase>());
}

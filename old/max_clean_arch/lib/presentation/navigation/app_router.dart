import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';
import 'package:max_clean_arch/domain/product.entities/product.dart';
import 'package:max_clean_arch/extensions/duration_x.dart';
import 'package:max_clean_arch/presentation/actions/actions_delegate.dart';
import 'package:max_clean_arch/presentation/features/product_details/widgets/product_details_page.dart';
import 'package:max_clean_arch/presentation/features/products_list/widgets/products_list_page.dart';
import 'package:max_clean_arch/presentation/features/splash/widgets/splash_page.dart';
import 'package:max_clean_arch/presentation/generated/assets.gen.dart';
import 'package:max_clean_arch/state/app_state_manager.dart';

import 'app_routes.dart';

const _initialLocation = AppRoutes.productsList;

@injectable
class AppRouter extends GoRouter {
  final ActionsDelegate _actionsDelegate; //
  final AppStateManager _appStateManager;

  AppRouter(this._actionsDelegate, this._appStateManager)
      : super(
          refreshListenable: Listenable.merge([
            // Declare here listenable items we want to react on
            // (it also could be streams wrapped with GoRouterRefreshStream)
            _appStateManager,
          ]),
          redirect: (state) {
            if (state.subloc != AppRoutes.splash && _appStateManager.state.initialized != true) {
              var splashLoc = AppRoutes.splash;
              if (state.subloc != '/') {
                splashLoc += '?from=${state.subloc}';
              }
              return splashLoc;
            }
            if (state.subloc == AppRoutes.splash && _appStateManager.state.initialized == true) {
              final from = state.queryParams['from'];
              return from ?? _initialLocation;
            }
            return null;
          },
          initialLocation: _initialLocation,
          routes: [
            GoRoute(
              path: AppRoutes.splash,
              pageBuilder: (context, state) {
                return MaterialPage(
                  key: state.pageKey,
                  child: SplashPage(
                    splashImage: Assets.splash,
                    onFirstFrame: () async {
                      await 1000.ms.delay;
                      // We just emulate the initializing process with a small delay
                      _appStateManager.setInitialized(true);
                    },
                  ),
                );
              },
            ),
            GoRoute(
                path: AppRoutes.productsList,
                pageBuilder: (context, state) {
                  return MaterialPage(
                    key: state.pageKey,
                    child: const ProductsListPage(),
                  );
                },
                routes: [
                  GoRoute(
                    path: AppRoutes.productDetails,
                    pageBuilder: (context, state) {
                      return MaterialPage(
                        key: state.pageKey,
                        child: ProductDetailsPage(product: state.extra as Product),
                      );
                    },
                  ),
                ]),
          ],
        ) {
    //
    _init();
  }

  late final List<StreamSubscription> _subscriptions;

  void _init() {
    _subscriptions = [
      _actionsDelegate.productOpen.listen((product) {
        go('${AppRoutes.productsList}/${AppRoutes.productDetails}', extra: product);
      }),
    ];
  }

  @override
  void dispose() {
    for (var subscription in _subscriptions) {
      subscription.cancel();
    }
    super.dispose();
  }
}

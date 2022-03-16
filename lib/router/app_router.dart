import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';
import 'package:max_clean_arch/actions/actions_delegate.dart';
import 'package:max_clean_arch/di.dart';
import 'package:max_clean_arch/extensions/duration_x.dart';
import 'package:max_clean_arch/features/navigation/widgets/image_page.dart';
import 'package:max_clean_arch/features/navigation/widgets/navigation_page.dart';
import 'package:max_clean_arch/features/splash/widgets/splash_page.dart';
import 'package:max_clean_arch/generated/assets.gen.dart';
import 'package:max_clean_arch/state/app_state_manager.dart';

import 'app_routes.dart';

const _initialRoute = AppRoutes.navigation; // Will be shown after Splash or on a fallback

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
            // if (kDebugMode) print('>> router, redirect(), subloc: ${state.subloc}, path: ${state.path}, fullpath: ${state.fullpath},\nstate: $state');
            if (state.subloc != AppRoutes.splash && _appStateManager.state.initialized != true) {
              var splashLoc = AppRoutes.splash;
              if (state.subloc != '/') {
                splashLoc += '?from=${state.subloc}';
              }
              return splashLoc;
            }
            if (state.subloc == AppRoutes.splash && _appStateManager.state.initialized == true) {
              final from = state.queryParams['from'];
              return from ?? '/';
            }
            return null;
          },
          routes: [
            GoRoute(
              path: '/',
              redirect: ((state) => _appStateManager.state.initialized == true ? _initialRoute : AppRoutes.splash),
            ),
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
              path: AppRoutes.navigation,
              pageBuilder: (context, state) {
                return MaterialPage(
                  key: state.pageKey,
                  child: NavigationPage(bloc: getIt()),
                );
              },
              routes: [
                GoRoute(
                  path: AppRoutes.image,
                  // like image?url=https://www.google.com/images/branding/googlelogo/1x/googlelogo_light_color_272x92dp.png
                  pageBuilder: (context, state) {
                    if (kDebugMode) print('>> open image: ${state.queryParams}');
                    final url = state.queryParams['url']!;
                    return MaterialPage(
                      key: state.pageKey,
                      child: ImagePage(url),
                    );
                  },
                ),
              ],
            ),
          ],
        ) {
    //
    _init();
  }

  late final List<StreamSubscription> _subscriptions;

  void _init() {
    _subscriptions = [
      _actionsDelegate.shownItemImage.listen((item) {
        final imageUrlEncoded = Uri.encodeComponent(item.imageUrl);
        final itemIdEncoded = Uri.encodeComponent(item.id);
        go('${AppRoutes.navigation}/${AppRoutes.image}?url=$imageUrlEncoded&itemId=$itemIdEncoded', extra: item);
      }),
      // _actionsDelegate.switchedPage.listen((page) {
// go('${AppRoutes.navigation}/${AppRoutes.navigationLink}', extra: page);
//       }),
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

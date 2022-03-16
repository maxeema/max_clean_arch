import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:max_clean_arch/const.dart';

import 'di.dart';
import 'generated/l10n.dart';
import 'router/app_router.dart';

class MyApp extends HookWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appRouter = useMemoized(() => getIt<AppRouter>());
    final darkTheme = useMemoized(() => ThemeData.dark());
    //
    return MaterialApp.router(
      color: kSplashColor,
      routeInformationParser: appRouter.routeInformationParser,
      routerDelegate: appRouter.routerDelegate,
      localizationsDelegates: const [
        S.delegate,
      ],
      title: S.current.appTitle,
      themeMode: ThemeMode.dark,
      // use Dark theme only
      darkTheme: darkTheme.copyWith(
        colorScheme: darkTheme.colorScheme.copyWith(
          secondary: kAppColor,
        ),
      ),
      scrollBehavior: const MaterialScrollBehavior().copyWith(
        // Enable scrolling on all devices (without it ListView doesn't react on pointer-scroll events)
        dragDevices: PointerDeviceKind.values.toSet(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

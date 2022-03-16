import 'dart:async';

import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'di.config.dart';

final GetIt getIt = GetIt.I;

@injectableInit
Future<GetIt> configureDependencies({String? environment, EnvironmentFilter? environmentFilter}) async =>
    $initGetIt(getIt, environment: environment, environmentFilter: environmentFilter);

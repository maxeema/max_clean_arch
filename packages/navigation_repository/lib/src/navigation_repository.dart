import 'package:dartz/dartz.dart';

import 'aggregates/aggregates.dart';
import 'errors/errors.dart';

typedef GetNavigationResult = Either<Failure<FailureDetails>, NavigationData>;

abstract class NavigationRepository {
  const NavigationRepository();

  Future<GetNavigationResult> getNavigation(String id);
}

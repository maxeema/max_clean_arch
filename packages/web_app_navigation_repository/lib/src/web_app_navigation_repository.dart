import 'package:dartz/dartz.dart';
import 'package:navigation_repository/navigation_repository.dart';

import 'web_failure_details.dart';

typedef WebAppGetNavigationResult = Either<Failure<WebFailureDetails>, NavigationData>;

abstract class WebAppNavigationRepository extends NavigationRepository {
  const WebAppNavigationRepository();

  @override
  Future<WebAppGetNavigationResult> getNavigation(String id);
}

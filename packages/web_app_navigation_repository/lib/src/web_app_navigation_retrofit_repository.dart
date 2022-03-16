import 'dart:async';
import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:navigation_repository/navigation_repository.dart';

import 'error_helper.dart';
import 'web_app_navigation_repository.dart';
import 'web_app_navigation_retrofit_client.dart';
import 'web_failure_details.dart';

class WebAppNavigationRetrofitRepository extends WebAppNavigationRepository {
  const WebAppNavigationRetrofitRepository({required WebAppNavigationRetrofitClient client}) //
      : _apiClient = client;

  final WebAppNavigationRetrofitClient _apiClient;

  @override
  Future<WebAppGetNavigationResult> getNavigation(String id) async {
    try {
      final result = await _apiClient.getNavigation(id);
      return result.value.fold(
        (l) => left(l.when(
          emptyData: Failure.emptyData,
          dataIntegrityError: Failure.dataIntegrity,
        )),
        right,
      );
    } catch (error, stackTrace) {
      print('>> caught error: $error');
      if (ErrorHelper.guessIsTypeCastError(error)) {
        return left(Failure.dataIntegrity(error, stackTrace));
      }
      final badResponse = ErrorHelper.guessBadResponseByError(error);
      if (badResponse.isSome()) {
        return left(Failure.detailed(WebFailureDetails.badResponse(badResponse.fold(() => throw Never, (a) => a))));
      }
      if (ErrorHelper.guessIsTimeout(error)) {
        return left(Failure.detailed(WebFailureDetails.timeoutError(error, stackTrace)));
      }
      if (ErrorHelper.guessIsSomeNetworkIssue(error)) {
        return left(Failure.detailed(WebFailureDetails.networkProblem(error, stackTrace)));
      }
      return left(Failure.unknown(error, stackTrace));
    }
  }
}

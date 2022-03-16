import 'dart:async';
import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:navigation_repository/navigation_repository.dart';

import 'bad_response.dart';
import 'error_helper.dart';
import 'web_app_navigation_repository.dart';
import 'web_failure_details.dart';

class WebAppNavigationHttpClient {
  const WebAppNavigationHttpClient(
    http.Client httpClient, {
    required String baseUrl,
  })  : _httpClient = httpClient,
        _baseUrl = baseUrl;

  final http.Client _httpClient;
  final String _baseUrl;

  Future<WebAppGetNavigationResult> getNavigation(String id) async {
    try {
      final dataPath = 'data/$id.json';
      final request = Uri.parse('$_baseUrl$dataPath');

      print('>> call $request');
      final response = await _httpClient.get(request);

      if (ErrorHelper.guessBadResponseByCode(response.statusCode)) {
        return left(Failure.detailed(WebFailureDetails.badResponse(BadResponse(response.statusCode, response.body))));
      }

      final Map<String, dynamic> json;
      try {
        json = jsonDecode(
          response.body,
        ) as Map<String, dynamic>;
      } catch (error, stackTrace) {
        // Even if the response code is 200 we can receive data from a proxy
        // when it is not actually our data or even not a json a all
        return left(Failure.dataIntegrity(error, stackTrace));
      }

      final either = NavigationData.factory.createWithJson(id, json);
      return either.fold(
        (l) => left(l.when(
          emptyData: Failure.emptyData,
          dataIntegrityError: Failure.dataIntegrity,
        )),
        right,
      );
    } catch (error, stackTrace) {
      if (ErrorHelper.guessIsTypeCastError(error)) {
        return left(Failure.dataIntegrity(error, stackTrace));
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

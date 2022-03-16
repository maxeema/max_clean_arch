import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:navigation_repository/navigation_repository.dart';

import 'bad_response.dart';

part 'web_failure_details.freezed.dart';

@freezed
class WebFailureDetails with _$WebFailureDetails implements FailureDetails {
  const factory WebFailureDetails.badResponse(BadResponse details) = _BadResponse;

  const factory WebFailureDetails.timeoutError(Object error, StackTrace stackTrace) = _TimeoutError;

  const factory WebFailureDetails.networkProblem(Object error, StackTrace stackTrace) = _NetworkProblem;
}

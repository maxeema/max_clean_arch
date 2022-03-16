import 'package:freezed_annotation/freezed_annotation.dart';

import 'failure_details.dart';

part 'failure.freezed.dart';

@freezed
class Failure<R extends FailureDetails> with _$Failure {
  // The 'reason' parameter is dynamic cuz repositories could be local, remote, or even dummy.
  // And we can specify any kind of error that in the future could be used on a client side
  // eg. to localize the 'reason' at presentation layer. Obviously, that for different type
  // of repositories we will support different types of such a reason.
  const factory Failure.detailed(R reason) = _DetailedReason;

  // When got nothing, an empty response or an empty json for instance
  const factory Failure.emptyData() = _EmptyData;

  // When the response's format/data of a repository/service is incompatible with expected format
  const factory Failure.dataIntegrity(Object error, StackTrace stackTrace) = _DataIntegrityError;

  // This is a fallback that could contains any error/exception that we didn't recognized before
  const factory Failure.unknown(Object error, StackTrace stackTrace) = _UnknownError;
}

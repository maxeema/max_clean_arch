import 'dart:async';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'bad_response.dart';

class ErrorHelper {
  static const dioTimeoutTypes = [DioErrorType.connectTimeout, DioErrorType.receiveTimeout, DioErrorType.sendTimeout];

  static bool guessBadResponseByCode(code) {
    return code != 200;
  }

  static Option<BadResponse> guessBadResponseByError(error) {
    if (error is DioError && error.response?.statusCode != null) {
      final response = error.response!;
      return some(BadResponse(response.statusCode!, response.statusMessage));
    }
    return none();
  }

  static bool guessIsTypeCastError(error) {
    // when tried to cast List to Map via operator 'as'
    return error is TypeError || error is CastError;
  }

  static bool guessIsTimeout(error) {
    if (error is TimeoutException) {
      return true;
    }
    if (error is SocketException && error.message.contains('timed out')) {
      return true;
    }
    if (error is DioError && dioTimeoutTypes.contains(error.type)) {
      return true;
    }
    return false;
  }

  static bool guessIsSomeNetworkIssue(error) {
    return error is IOException ||
        error is SocketException ||
        error is DioError ||
        error.toString().contains('XMLHttpRequest');
  }
}

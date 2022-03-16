import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart' hide Headers;
import 'package:navigation_repository/navigation_repository.dart';
import 'package:retrofit/retrofit.dart';

export 'package:dio/src/dio.dart';

part 'web_app_navigation_retrofit_client.g.dart';

@RestApi()
abstract class WebAppNavigationRetrofitClient {

  factory WebAppNavigationRetrofitClient(
    Dio dio, {
    required String baseUrl,
  }) = _WebAppNavigationRetrofitClient;

  @GET("data/{id}.json")
  Future<NavigationDataRetrofitWrap> getNavigation(@Path("id") String id);
}

class NavigationDataRetrofitWrap {
  const NavigationDataRetrofitWrap(this.value);

  final Either<NavigationDataInstanceError, NavigationData> value;

  factory NavigationDataRetrofitWrap.fromJson(String? id, response) {
    final json = jsonDecode(
      response,
    ) as Map<String, dynamic>;
    return NavigationDataRetrofitWrap(NavigationData.factory.createWithJson(id, json));
  }
}

import 'package:dio/dio.dart';
import 'package:navigation_repository/navigation_repository.dart';
import 'package:test/test.dart';
import 'package:web_app_navigation_repository/web_app_navigation_repository.dart';

const _kApiEndpoint = 'https://raw.githubusercontent.com/maxeema/max_clean_arch/master/';

void main() {
  group(WebAppNavigationRetrofitClient, () {
    late WebAppNavigationRetrofitClient client;

    setUpAll(() {
      client = WebAppNavigationRetrofitClient(
        Dio(),
        baseUrl: _kApiEndpoint,
      );
    });

    group('getNavigation', () {
      const spaceId = 'space';
      test('$spaceId id - we expect that data exists', () async {
        final result = (await client.getNavigation(spaceId)).value;
        expect(result.isRight(), isTrue);
        final data = result.foldRight(null, (r, previous) => r);
        expect(data, isA<NavigationData>());
        print('data: $data');
      });

      final randomId = '🐦${Object().hashCode}💙';
      test('random $randomId id - we expect an error cuz data does not exist for this id', () async {
        expect(() => client.getNavigation(randomId), throwsA(anyOf(isA<DioError>(), isA<Exception>())));
      });
    });
  });
}

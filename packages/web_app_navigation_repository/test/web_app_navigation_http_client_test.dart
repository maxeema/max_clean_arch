import 'package:http/http.dart' as http;
import 'package:test/test.dart';
import 'package:web_app_navigation_repository/web_app_navigation_repository.dart';

const _kApiEndpoint = 'https://raw.githubusercontent.com/maxeema/max_clean_arch/master/';

void main() {
  group(WebAppNavigationHttpClient, () {
    late WebAppNavigationHttpClient client;

    setUpAll(() {
      client = WebAppNavigationHttpClient(
        http.Client(),
        baseUrl: _kApiEndpoint,
      );
    });

    group('getNavigation', () {
      const spaceId = 'space';
      test('id: $spaceId', () async {
        final result = await client.getNavigation(spaceId);
        print(result);
        expect(result.isRight(), isTrue);
        final data = result.foldRight(null, (r, previous) => r)!;
        expect(data.pages.size, greaterThan(0));
        expect(data.items.size, greaterThan(0));
      });
    });
  });
}

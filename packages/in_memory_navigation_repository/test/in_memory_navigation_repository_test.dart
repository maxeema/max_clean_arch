import 'package:in_memory_navigation_repository/in_memory_navigation_repository.dart';
import 'package:navigation_repository/navigation_repository.dart';
import 'package:test/test.dart';

void main() {
  group(InMemoryNavigationRepository, () {
    final inMemoryData = {
      null: kInMemoryNavigationRepositorySampleData,
      'single': {
        'pages': [kInMemoryNavigationRepositorySampleData['pages']!.first],
        'items': [kInMemoryNavigationRepositorySampleData['items']!.first]
      },
    };
    const inMemoryDataWithoutNull = {
      'some': kInMemoryNavigationRepositorySampleData,
    };

    late final InMemoryNavigationRepository repository;
    late final InMemoryNavigationRepository repositoryWithoutNull;

    setUpAll(() {
      repository = InMemoryNavigationRepository(data: inMemoryData);
      repositoryWithoutNull = InMemoryNavigationRepository(data: inMemoryDataWithoutNull);
    });

    group('getNavigation', () {
      test('use null id - expect to get a default value of null', () async {
        final id = null;
        final result = await repository.getNavigation(id);
        print('id: $id, result: $result');
        final data = result.foldRight(null, (r, previous) => r)!;
        print('data: $data');
        expect(data.pages.size, equals(kInMemoryNavigationRepositorySampleData['pages']!.length));
        expect(data.items.size, equals(kInMemoryNavigationRepositorySampleData['items']!.length));
      });

      test("use *random* id - expect to get the default value of null", () async {
        final id = DateTime.now().hashCode.toString();
        final result = await repository.getNavigation(id);
        print('id: $id, result: $result');
        final data = result.foldRight(null, (r, previous) => r)!;
        print('data: $data');
        expect(data.pages.size, equals(kInMemoryNavigationRepositorySampleData['pages']!.length));
        expect(data.items.size, equals(kInMemoryNavigationRepositorySampleData['items']!.length));
      });

      test("use 'single' id - expect to get the exact value with a single key/value", () async {
        const id = 'single';
        final result = await repository.getNavigation(id);
        print('id: $id, result: $result');
        final data = result.foldRight(null, (r, previous) => r)!;
        print('data: $data');
        expect(data.pages.size, equals(1));
        expect(data.items.size, equals(1));
        expect(data.pages.get(0), Page.fromJson(inMemoryData[id]!['pages']!.first));
        expect(data.items.get(0), Item.fromJson(inMemoryData[id]!['items']!.first));
      });

      test("use null id on inMemoryDataWithoutNull - expect to get any first value", () async {
        const id = null;
        final result = await repositoryWithoutNull.getNavigation(id);
        print('id: $id, result: $result');
        final data = result.foldRight(null, (r, previous) => r)!;
        print('data: $data');
        expect(data.items.size, inMemoryDataWithoutNull.values.first['items']!.length);
        expect(data.pages.size, inMemoryDataWithoutNull.values.first['pages']!.length);
      });
    });
  });
}

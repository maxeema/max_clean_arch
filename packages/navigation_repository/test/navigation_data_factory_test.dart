import 'package:dartz/dartz.dart';
import 'package:kt_dart/kt.dart';
import 'package:navigation_repository/navigation_repository.dart';
import 'package:test/test.dart';

const _items = [
  Item(id: 'item1', title: 'Title 1', imageUrl: 'some://image.url', body: 'Item 2 body'),
  Item(id: 'item2', title: 'Title 2', imageUrl: 'some://image.url', body: 'Item 2 body'),
];
const _pages = [
  Page(id: 'page1', title: 'Page 1', itemId: 'item1'),
  Page(id: 'page2', title: 'Page 2', itemId: 'item2'),
];

void main() {
  group(NavigationDataFactory, () {
    group('create()', () {
      test('expect Right - on non empty data', () {
        final pages = KtList.from(_pages);
        final items = KtList.from(_items);
        final either = NavigationDataFactory.instance.create(null, pages, items);
        expect(either.isLeft(), isFalse);
        expect(either.isRight(), isTrue);
        expect(either, allOf(isA<Right>(), isNot(isA<Left>())));
      });
      test('expect Left - on empty items', () {
        final pages = KtList.from(_pages);
        final items = KtList.from(const <Item>[]);
        final either = NavigationDataFactory.instance.create(null, pages, items);
        expect(either.isLeft(), isTrue);
        expect(either.isRight(), isFalse);
        expect(either, allOf(isA<Left>(), isNot(isA<Right>())));
      });
      test('expect Left - on empty pages', () {
        final pages = KtList.from(const <Page>[]);
        final items = KtList.from(_items);
        final either = NavigationDataFactory.instance.create(null, pages, items);
        expect(either.isLeft(), isTrue);
        expect(either.isRight(), isFalse);
        expect(either, allOf(isA<Left>(), isNot(isA<Right>())));
      });
    });
    //
    group('createWithJson()', () {
      test('expect Right - on non empty data', () {
        final json = {
          'items': _items.map((e) => e.toJson()),
          'pages': _pages.map((e) => e.toJson()),
        };
        final either = NavigationDataFactory.instance.createWithJson('id1', json);
        expect(
            either,
            isA<Right<Object, NavigationData>>()
                .having((data) => data.foldRight(null, (r, _) => r)?.id, 'id', equals('id1')));
        final data = either.foldRight(null, (r, _) => r)!;
        expect(data.pages.asList(), allOf(isNotEmpty, equals(_pages)));
        expect(data.items.asList(), allOf(isNotEmpty, equals(_items)));
      });
    });
  });
}

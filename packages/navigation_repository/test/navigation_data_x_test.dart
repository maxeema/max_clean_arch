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
  group('NavigationDataX', () {
    group('itemById()', () {
      final pages = KtList.from(_pages);
      final items = KtList.from(_items);
      final data = NavigationDataFactory.instance.create(null, pages, items).foldRight(null, (r, _) => r)!;
      //
      test('expect null - on non existing item', () {
        expect(data.itemById('some-non-existing-id-${Object().hashCode}'), isNull);
      });
      test('expect Item - on existing Item with a specified id', () {
        expect(data.itemById(_items.first.id), _items.first);
      });
    });
    //
    group('getItemForPage()', () {
      final pages = KtList.from(_pages);
      final items = KtList.from(_items);
      final data = NavigationDataFactory.instance.create(null, pages, items).foldRight(null, (r, _) => r)!;
      //
      test('expect null - on Page with non existing item id', () {
        expect(data.getItemForPage(Page(id: 'x', title: 'X-title', itemId: '-non-item-id')), isNull);
      });
      test('expect Item - on Page with a existing item id', () {
        final page = _pages.first;
        expect(data.getItemForPage(page), _items.firstWhere((item) => page.itemId == item.id));
      });
    });
  });
}

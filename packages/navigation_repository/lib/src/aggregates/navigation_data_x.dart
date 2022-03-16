part of 'navigation_data.dart';

extension NavigationDataX on NavigationData {
  Item? itemById(String itemId) => items.firstOrNull((item) => item.id == itemId);

  Item? getItemForPage(Page page) => itemById(page.itemId);
}

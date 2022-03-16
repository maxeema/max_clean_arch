part of 'navigation_data.dart';

class NavigationDataFactory {
  static const instance = NavigationDataFactory._();

  const NavigationDataFactory._();

  Either<NavigationDataInstanceError, NavigationData> create(String? id, KtList<Page> pages, KtList<Item> items) {
    final invalid = _validate(pages, items);
    if (invalid.isSome()) {
      return left((invalid as Some).value);
    }
    return right(NavigationData._(id, pages, items));
  }

  Either<NavigationDataInstanceError, NavigationData> createWithJson(String? id, Map<String, dynamic> json) {
    try {
      final pages = json['pages'] as Iterable?;
      if (pages == null) {
        return left(NavigationDataInstanceError.dataIntegrityError(ArgumentError.notNull('pages'), StackTrace.current));
      }
      final items = json['items'] as Iterable?;
      if (items == null) {
        return left(NavigationDataInstanceError.dataIntegrityError(ArgumentError.notNull('items'), StackTrace.current));
      }
      return create(id, KtList.from(pages).cast<Map<String, dynamic>>().map(Page.fromJson),
          KtList.from(items).cast<Map<String, dynamic>>().map((Item.fromJson)));
    } catch (error, stackTrace) {
      return left(NavigationDataInstanceError.dataIntegrityError(error, stackTrace));
    }
  }

  Option<NavigationDataInstanceError> _validate(KtList<Page> pages, KtList<Item> items) {
    if (pages.isEmpty() || items.isEmpty()) {
      return some(NavigationDataInstanceError.emptyData());
    }
    return none();
  }
}

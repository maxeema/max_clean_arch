part of 'page_items_bloc.dart';

class PageItemsState extends Equatable {
  const PageItemsState({
    required this.data,
    required this.page,
    required this.itemsStack,
  });

  final NavigationData data;
  final Page page;
  final Map<Page, List<Item>> itemsStack;

  KtList<Page> get pages => data.pages;

  Item getCurrentItemFor(Page page) => itemsStack[page]!.last;

  PageItemsState copyWith({Page? page, Map<Page, List<Item>>? itemsStack}) {
    return PageItemsState(
      data: data,
      page: page ?? this.page,
      itemsStack: itemsStack ?? this.itemsStack,
    );
  }

  @override
  List<Object?> get props => [data, page, itemsStack];
}

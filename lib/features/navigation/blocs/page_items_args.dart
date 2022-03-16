part of 'page_items_bloc.dart';

@freezed
class PageItemsArgs with _$PageItemsArgs {
  const factory PageItemsArgs.switchPage(Page page) = _SwitchPage; //
  const factory PageItemsArgs.openItem(Item item) = _OpenItem; //
  const factory PageItemsArgs.popBack() = _PopBack; //
}

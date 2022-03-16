import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:kt_dart/kt.dart';
import 'package:max_clean_arch/features/navigation/blocs/navigation_bloc.dart';
import 'package:navigation_repository/navigation_repository.dart';

import '../actions/open_item_action.dart';
import '../actions/show_item_image_action.dart';
import '../actions/switch_page_action.dart';

export 'package:single_bloc/single_bloc.dart';

part 'page_items_args.dart';

part 'page_items_bloc.freezed.dart';

part 'page_items_state.dart';

@injectable
class PageItemsBloc extends SingleBloc<PageItemsArgs, void, PageItemsState> {
  PageItemsBloc({
    required SwitchPageAction switchPageAction,
    required OpenItemAction openItemAction,
    required ShowItemImageAction showItemImageAction,
    @factoryParam required NavigationData navigationData,
  })  : _switchPageAction = switchPageAction,
        _openItemAction = openItemAction,
        _showItemImageAction = showItemImageAction,
        super(SingleBlocState(
          SingleBlocStatus.completed,
          PageItemsState(
            data: navigationData,
            page: navigationData.pages[0],
            itemsStack: Map.from(
              Map.fromEntries(
                navigationData.pages.asList().map(
                      (page) => MapEntry(page, [navigationData.items.first((item) => item.id == page.itemId)]),
                    ),
              ),
            ),
          ),
        ));

  final SwitchPageAction _switchPageAction;
  final OpenItemAction _openItemAction;
  final ShowItemImageAction _showItemImageAction;

  Page get page => data.value!.page;

  void onPageSwitched(Page newPage) {
    if (newPage != page) {
      if (kDebugMode) print('>> onPageChanged, equal: ${newPage == page}, cur: $page, new: $newPage');
      _switchPageAction(newPage);
      execute(PageItemsArgs.switchPage(newPage));
    }
  }

  void openItem(Item item) {
    if (kDebugMode) print('>> openItem: $item');
    _openItemAction(item);
    execute(PageItemsArgs.openItem(item));
  }

  bool mayPopItemFor(Page page) => state.data.value!.itemsStack[page]!.length > 1;

  void popItem() {
    if (kDebugMode) print('>> popItem');
    if (mayPopItemFor(page)) {
      execute(const PageItemsArgs.popBack());
    }
  }

  void showItemImage(Item item) {
    if (kDebugMode) print('>> showItemImage: $item');
    _showItemImageAction(item);
  }

  @override
  Future<PageItemsState> action({required PageItemsArgs args, required IsCanceled isCanceled}) async {
    final dataState = state.data.value!;
    if (kDebugMode) print('>> action: $args');
    return args.when(
      switchPage: (page) {
        return dataState.copyWith(page: page);
      },
      openItem: (item) {
        final newItemsStack = Map.of(dataState.itemsStack);
        newItemsStack[page] = [...dataState.itemsStack[page]!];
        newItemsStack[page]!.add(item);
        return dataState.copyWith(itemsStack: newItemsStack);
      },
      popBack: () {
        final newItemsStack = Map.of(dataState.itemsStack);
        newItemsStack[page] = [...dataState.itemsStack[page]!];
        newItemsStack[page]!.removeLast();
        return dataState.copyWith(itemsStack: newItemsStack);
      },
    );
  }
}

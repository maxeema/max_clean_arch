import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:max_clean_arch/extensions/dartz_x.dart';
import 'package:max_clean_arch/features/navigation/widgets/item_link_widget.dart';
import 'package:navigation_repository/navigation_repository.dart' as repository;

import '../markdown/markdown_spans_factory.dart';
import '../markdown/typedefs.dart';
import '../utils/link_utils.dart';

typedef ResolvePreviewItem = repository.Item? Function(String itemId);

class ItemBodyWidget extends HookWidget {
  const ItemBodyWidget({
    required this.item,
    required this.onLinkTap,
    required this.resolvePreviewItem,
    Key? key,
  }) : super(key: key);

  final repository.Item item;
  final OnLinkTap onLinkTap;
  final ResolvePreviewItem resolvePreviewItem;

  @override
  Widget build(BuildContext context) {
    // Build the RichText once cuz it should be parsed every time on the build() call
    // but we need to make RichText with the parsed content just once for the specific item
    return useMemoized(
      () => RichText(
        textScaleFactor: 1.1,
        text: _prepareBodyPreview(context),
      ),
      [item],
    );
  }

  InlineSpan _prepareBodyPreview(BuildContext context) {
    final either = MarkdownSpansFactory.instance.buildByLines(
      item.body,
      textTheme: Theme.of(context).textTheme,
      onLinkTap: onLinkTap,
      linkBuilder: (link, linkStyle) {
        if (LinkUtils.isOpenItem(link.href)) {
          final openItemId = LinkUtils.tryExtractOpenItemId(link.href);
          final openItem = resolvePreviewItem((openItemId as Some).value);
          return WidgetSpan(
            child: ItemLinkWidget(openItem!, link, linkStyle, onTap: () {
              onLinkTap(link);
            }),
          );
        }
        return null;
      },
    );
    if (either.isRight()) {
      return TextSpan(
        style: DefaultTextStyle.of(context).style,
        children: either.asRight().data,
      );
    } else {
      //TODO What to show if couldn't get item's body
      return const TextSpan();
    }
  }
}

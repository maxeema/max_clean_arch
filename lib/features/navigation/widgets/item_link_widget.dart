import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:max_clean_arch/extensions/duration_x.dart';
import 'package:max_clean_arch/features/navigation/markdown/typedefs.dart';
import 'package:max_clean_arch/features/navigation/widgets/item_link_preview_widget.dart';
import 'package:navigation_repository/navigation_repository.dart' as repository;

final _waitDurationTimeout = 1500.ms;
const _previewSize = BoxConstraints(maxWidth: 250, maxHeight: 170);
const _preferTooltipBelowLink = false;

class ItemLinkWidget extends StatelessWidget {
  const ItemLinkWidget(this.item, this.link, this.style, {required this.onTap, Key? key}) : super(key: key);

  final repository.Item item;
  final LinkInfo link;
  final TextStyle style;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Tooltip(
        preferBelow: _preferTooltipBelowLink,
        waitDuration: _waitDurationTimeout,
        padding: EdgeInsets.zero,
        richMessage: WidgetSpan(
          child: ItemLinkPreviewWidget(item, preferredSize: _previewSize),
        ),
        child: Text(
          link.text,
          style: style,
        ),
      ),
    );
  }
}

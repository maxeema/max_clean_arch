import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:max_clean_arch/extensions/dartz_x.dart';
import 'package:max_clean_arch/extensions/duration_x.dart';
import 'package:max_clean_arch/extensions/insets_x.dart';
import 'package:max_clean_arch/features/navigation/markdown/markdown_spans_factory.dart';
import 'package:navigation_repository/navigation_repository.dart' as repository;

import 'progress_widget.dart';

final _firstAppearanceDelay = 500.ms;

class ItemLinkPreviewWidget extends HookWidget {
  const ItemLinkPreviewWidget(this.item, {required this.preferredSize, Key? key}) : super(key: key);

  final repository.Item item;
  final BoxConstraints preferredSize;

  @override
  Widget build(BuildContext context) {
    final firstAppearanceFuture = useMemoized(() => _firstAppearanceDelay.delay.then((value) => true), [item]);
    final isFirstDelayEnd = useFuture(firstAppearanceFuture).data == true;
    return Container(
      constraints: preferredSize,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.all(4),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Positioned.fill(
            child: Container(color: Colors.grey.shade800),
          ),
          Positioned.fill(
            child: Image.network(
              item.imageUrl,
              // "https://svs.gsfc.nasa.gov/vis/a030000/a030800/a030877/frames/5760x3240_16x9_01p/BlackMarble_2016_1200m_africa_s_labeled.png",
              errorBuilder: (_, __, ___) {
                //TODO What to show if couldn't get item's image
                return const SizedBox.shrink();
              },
              frameBuilder: (BuildContext context, Widget child, int? frame, bool? wasSynchronouslyLoaded) {
                // Before showing just show undetermined progress
                // In preview there is not need to show the real percentage
                return frame == null ? ProgressWidget.infinite(compact: true) : child;
              },
              fit: BoxFit.cover,
            ),
          ),
          const Positioned.fill(
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment(0, 0.3),
                  colors: [Colors.black, Colors.transparent],
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: 4.insets.all,
              child: AnimatedOpacity(
                duration: 250.ms,
                opacity: isFirstDelayEnd ? 1 : 0,
                child: RichText(
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  textScaleFactor: .9,
                  text: _prepareBodyPreview(context),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  InlineSpan _prepareBodyPreview(BuildContext context) {
    final either = MarkdownSpansFactory.instance.buildByLines(
      item.body,
      textTheme: Theme.of(context).textTheme,
      // In preview we create un-highlighted links without tapping and colorizing
      linkBuilder: (info, style) => TextSpan(text: info.text),
    );
    if (either.isRight()) {
      return TextSpan(
          children: either.asRight().data,
          style: const TextStyle(
            color: Colors.white,
          ));
    } else {
      //TODO What to show if couldn't get item's body
      return const TextSpan();
    }
  }
}

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:markdown/markdown.dart' as md;

import 'typedefs.dart';

const _newLineTextSpan = TextSpan(text: '\n\n');

class MarkdownSpansByLinesBuilder {
  const MarkdownSpansByLinesBuilder(
    this.source, {
    required this.textTheme,
    required this.onLinkTap,
    this.linkBuilder,
  });

  final String source;
  final TextTheme textTheme;
  final OnLinkTap? onLinkTap;
  final LinkBuilder? linkBuilder;

  InlineSpan buildSpan(md.Node node, bool newLine, [String? parentTag]) {
    if (node is md.Text) {
      return TextSpan(text: node.text + (newLine ? "\n\n" : ''));
    } else if (node is md.Element) {
      final tag = node.tag;
      final children = node.children ?? const [];
      final isSingleText = children.length == 1 && children.first is md.Text;
      final isSingleChild = children.isEmpty || isSingleText;
      //
      if (tag == 'a' && isSingleChild && linkBuilder != null) {
        final href = node.attributes['href'] ?? node.textContent;
        final linkSpan = linkBuilder!(LinkInfo(href, node.textContent), prepareStyle(tag));
        if (linkSpan != null) {
          return linkSpan;
        }
      }
      //
      return TextSpan(
        style: prepareStyle(tag),
        recognizer: tag == 'a' && onLinkTap != null
            ? buildTapRecognizer(node.attributes['href']?.trim() ?? node.textContent, node.textContent)
            : null,
        text: isSingleChild ? node.textContent : null,
        children: isSingleChild
            ? (newLine ? [_newLineTextSpan] : null)
            : [...children.map((inline) => buildSpan(inline, false)), if (newLine) _newLineTextSpan],
      );
    } else {
      return const TextSpan();
    }
  }

  TapGestureRecognizer buildTapRecognizer(String href, String text) {
    final recognizer = TapGestureRecognizer();
    recognizer.onTap = () => onLinkTap?.call(LinkInfo(href, text));
    return recognizer;
  }

  TextStyle prepareStyle(String tag) {
    switch (tag) {
      case "a":
        return const TextStyle(color: Colors.blue);
      case "em":
        return const TextStyle(fontStyle: FontStyle.italic);
      case "strong":
        return const TextStyle(fontWeight: FontWeight.bold);
      case "h1":
        return textTheme.headline1!;
      case "h2":
        return textTheme.headline2!;
      case "h3":
        return textTheme.headline3!;
      case "h4":
        return textTheme.headline4!;
      case "h5":
        return textTheme.headline5!;
      case "h6":
        return textTheme.headline6!;
    }
    return const TextStyle();
  }
}

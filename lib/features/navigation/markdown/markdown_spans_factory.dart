import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:markdown/markdown.dart' as md;
import 'package:rxdart/rxdart.dart';

import 'markdown_spans.dart';
import 'markdown_spans_by_lines_builder.dart';
import 'typedefs.dart';

class MarkdownSpansFactory {
  static const instance = MarkdownSpansFactory._();

  const MarkdownSpansFactory._();

  Either<ErrorAndStackTrace, MarkdownSpans> buildByLines(String source,
      {required TextTheme textTheme, OnLinkTap? onLinkTap, LinkBuilder? linkBuilder}) {
    try {
      final doc = md.Document(extensionSet: md.ExtensionSet.gitHubWeb);
      final nodes = doc.parseLines(source.split('\n'));
      final builder =
          MarkdownSpansByLinesBuilder(source, textTheme: textTheme, onLinkTap: onLinkTap, linkBuilder: linkBuilder);
      final spans = nodes.map((line) => builder.buildSpan(line, true)).toList();
      return right(MarkdownSpans(source, spans));
    } catch (error, stackTrace) {
      return left(ErrorAndStackTrace(error, stackTrace));
    }
  }
}

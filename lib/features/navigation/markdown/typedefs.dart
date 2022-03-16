import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

typedef OnLinkTap = void Function(LinkInfo link);

typedef LinkBuilder = InlineSpan? Function(LinkInfo link, TextStyle style);

class LinkInfo extends Equatable {
  const LinkInfo(this.href, this.text);

  final String href;
  final String text;

  @override
  List<Object?> get props => [href, text];
}

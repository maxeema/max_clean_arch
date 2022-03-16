import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'page.g.dart';

@JsonSerializable()
class Page extends Equatable {
  const Page({
    required this.id,
    required this.title,
    required this.itemId,
  });

  final String id;
  final String title;
  final String itemId;

  @override
  List<Object?> get props => [id];

  factory Page.fromJson(Map<String, dynamic> json) => _$PageFromJson(json);

  Map<String, dynamic> toJson() => _$PageToJson(this);
}

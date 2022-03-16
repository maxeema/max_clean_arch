import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'item.g.dart';

@JsonSerializable()
class Item extends Equatable {
  const Item({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.body,
  });

  final String id;
  final String title;
  final String imageUrl;
  final String body;

  @override
  List<Object?> get props => [id];

  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);

  Map<String, dynamic> toJson() => _$ItemToJson(this);
}

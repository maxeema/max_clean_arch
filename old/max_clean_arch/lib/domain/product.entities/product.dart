import 'package:freezed_annotation/freezed_annotation.dart';

part 'product.freezed.dart';

@freezed
class Product with _$Product {
  const factory Product({
    required String id,
    required String name,
    required String description,
    required String image,
    required String imageHq,
  }) = _Product;

  @override
  String toString() => '$id: $name';
}

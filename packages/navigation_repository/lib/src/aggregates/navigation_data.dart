import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kt_dart/kt.dart';
import 'package:navigation_repository/navigation_repository.dart';

part 'navigation_data.freezed.dart';

part 'navigation_data_factory.dart';

part 'navigation_data_instance_error.dart';

part 'navigation_data_x.dart';

class NavigationData extends Equatable {
  static const NavigationDataFactory factory = NavigationDataFactory.instance;

  const NavigationData._(this.id, this.pages, this.items);

  final String? id;

  final KtList<Page> pages;
  final KtList<Item> items;

  @override
  List<Object?> get props => [id, pages, items];
}

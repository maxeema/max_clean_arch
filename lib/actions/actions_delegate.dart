import 'package:navigation_repository/navigation_repository.dart';
import 'package:rxdart/rxdart.dart';

abstract class ActionsDelegate {
  final switchedPage = PublishSubject<Page>();
  final openedItem = PublishSubject<Item>();
  final shownItemImage = PublishSubject<Item>();
}

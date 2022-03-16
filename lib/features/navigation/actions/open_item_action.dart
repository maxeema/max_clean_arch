import 'package:injectable/injectable.dart';
import 'package:navigation_repository/navigation_repository.dart';
import 'package:max_clean_arch/actions/action.dart';
import 'package:max_clean_arch/actions/actions_delegate.dart';

@injectable
class OpenItemAction implements Action {
  const OpenItemAction(
    this.delegate,
  );

  final ActionsDelegate delegate;

  @override
  void call(covariant Item item) => delegate.openedItem.add(item);
}

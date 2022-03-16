import 'package:injectable/injectable.dart';
import 'package:navigation_repository/navigation_repository.dart';
import 'package:max_clean_arch/actions/action.dart';
import 'package:max_clean_arch/actions/actions_delegate.dart';

@injectable
class SwitchPageAction implements Action {
  const SwitchPageAction(
    this.delegate,
  );

  final ActionsDelegate delegate;

  @override
  void call(covariant Page page) => delegate.switchedPage.add(page);
}

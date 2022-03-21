import 'package:injectable/injectable.dart';

import 'presentation/actions/actions_delegate.dart';
import 'state/app_state_manager.dart';

@Singleton(as: ActionsDelegate)
class AppActionsDelegate extends ActionsDelegate {
  AppActionsDelegate(this._appStateManager) {
    _init();
  }

  final AppStateManager _appStateManager;

  void _init() {
    productOpen.listen((product) {
      _appStateManager.setLastProduct(product.id);
    });
    // productOpen.pipe(appState.lastProduct);
    // Rx.concat([loggedInStream, loggedOutStream.map((event) => const AuthInfo.unknown())]).pipe(appState.authInfo);
  }
}

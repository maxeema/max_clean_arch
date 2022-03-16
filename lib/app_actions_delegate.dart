import 'package:injectable/injectable.dart';

import 'actions/actions_delegate.dart';
import 'state/app_state_manager.dart';

class AppActionsDelegate extends ActionsDelegate {
  AppActionsDelegate(@factoryParam this._appStateManager) {
    _init();
  }

  final AppStateManager _appStateManager;

  void _init() {
    switchedPage.listen((page) {
      _appStateManager.setPage(page.id);
    });
    // itemOpened.pipe(appState.lastItem);
    // Rx.concat([loggedInStream, loggedOutStream.map((event) => const AuthInfo.unknown())]).pipe(appState.authInfo);
  }
}

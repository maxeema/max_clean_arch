import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

import 'app_state.dart';

class AppStateManager extends ValueNotifier<AppStateInfo> {
  AppStateManager() : super(const AppStateInfo()) {
    addListener(() {
      if (kDebugMode) print('app state changed: $value');
    });
  }

  AppStateInfo get state => value;

  void setInitialized(bool initialized) => value = value.copyWith(initialized: initialized); //
  void setPage(String pageId) => value = value.copyWith(pageId: pageId); //
}

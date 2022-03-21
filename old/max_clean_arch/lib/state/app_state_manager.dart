import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';

import 'app_state.dart';

@singleton
class AppStateManager extends ValueNotifier<AppStateInfo> {
  AppStateManager() : super(const AppStateInfo()) {
    addListener(() => print('app state changed: $value'));
  }

  AppStateInfo get state => value;

  void setInitialized(bool initialized) => value = value.copyWith(initialized: initialized); //
  void setLastProduct(ProductId productId) => value = value.copyWith(lastProductId: productId); //

}

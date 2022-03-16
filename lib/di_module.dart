import 'package:injectable/injectable.dart';
import 'package:max_clean_arch/const.dart';
import 'package:navigation_repository/navigation_repository.dart';
import 'package:max_clean_arch/features/navigation/blocs/navigation_bloc.dart';
import 'package:max_clean_arch/state/app_state_manager.dart';
import 'package:web_app_navigation_repository/web_app_navigation_repository.dart';

import 'actions/actions_delegate.dart';
import 'app_actions_delegate.dart';

@module
abstract class RegisterModule {
  @singleton
  AppStateManager get appStateManager;

  @lazySingleton
  ActionsDelegate createActionsDelegate(AppStateManager appStateManager) => AppActionsDelegate(appStateManager);

  @lazySingleton
  NavigationBloc get navigationBloc;

  NavigationRepository get navigationRepository =>
      WebAppNavigationRetrofitRepository(
          client: WebAppNavigationRetrofitClient(
            Dio(),
            baseUrl: kApiEndpoint,
          ));

}

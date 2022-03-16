import 'package:web_app_navigation_repository/web_app_navigation_repository.dart';

class WebAppNavigationHttpRepository extends WebAppNavigationRepository {
  const WebAppNavigationHttpRepository({required WebAppNavigationHttpClient apiClient}) //
      : _apiClient = apiClient;

  final WebAppNavigationHttpClient _apiClient;

  @override
  Future<WebAppGetNavigationResult> getNavigation(String id) => _apiClient.getNavigation(id);
}

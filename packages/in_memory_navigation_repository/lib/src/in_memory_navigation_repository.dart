import 'package:dartz/dartz.dart';
import 'package:navigation_repository/navigation_repository.dart';

class InMemoryNavigationRepository extends NavigationRepository {
  InMemoryNavigationRepository({required Map<String?, Map<String, dynamic>> data})
      : assert(data.isNotEmpty),
        _data = data;

  // We use null-key as the default value if we didn't find a value for an optional 'id' param which can be omitted
  final Map<String?, Map<String, dynamic>> _data;

  @override
  Future<GetNavigationResult> getNavigation(String? id) async {
    try {
      final either = NavigationData.factory.createWithJson(id, _data[id] ?? _data[null] ?? _data.values.first);
      return either.fold(
        (l) => left(l.when(
          emptyData: Failure.emptyData,
          dataIntegrityError: Failure.dataIntegrity,
        )),
        right,
      );
    } catch (error, stackTrace) {
      // normally, it shouldn't happen
      return left(Failure.unknown(error, stackTrace));
    }
  }
}

import 'package:flutter/foundation.dart';
import 'package:in_memory_navigation_repository/in_memory_navigation_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:navigation_repository/navigation_repository.dart';

import 'usecase.dart';

const _dummy = 'dummy';
final _myMemoryNavigationRepository = InMemoryNavigationRepository(data: {
  _dummy: kInMemoryNavigationRepositorySampleData,
});

class GetNavigationUsecaseArgs {
  const GetNavigationUsecaseArgs({this.id}); //
  final String? id;
}

@injectable
class GetNavigationUsecase implements Usecase<GetNavigationUsecaseArgs, Future<GetNavigationResult>> {
  const GetNavigationUsecase(this._repository);

  final NavigationRepository _repository;

  @override
  Future<GetNavigationResult> call(GetNavigationUsecaseArgs args) {
    final id = args.id;
    if (kDebugMode) print('>> GetNavigationUsecase, id: $id');
    switch (id) {
      case _dummy:
      case null:
        if (kDebugMode) print('>> call in-memory repository with "$id", repository: $_myMemoryNavigationRepository');
        return _myMemoryNavigationRepository.getNavigation(id);
      default:
        if (kDebugMode) print('>> call "$id" from $_repository');
        return _repository.getNavigation(id!);
    }
  }
}

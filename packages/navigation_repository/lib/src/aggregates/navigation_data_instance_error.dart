part of 'navigation_data.dart';

@freezed
class NavigationDataInstanceError with _$NavigationDataInstanceError {
  const factory NavigationDataInstanceError.emptyData() = _EmptyData;

  const factory NavigationDataInstanceError.dataIntegrityError(Object error, StackTrace stackTrace) =
      _DataIntegrityError;
}

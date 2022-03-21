part of 'single_bloc.dart';

class SingleBlocState<A, E, D> extends Equatable {
  SingleBlocState([
    SingleBlocStatus initialStatus = SingleBlocStatus.idle,
    D? initialData,
    SingleBlocErrorInfo<A, E>? initialError,
  ]) {
    status._subject.value = initialStatus;
    if (initialData != null) data._subject.value = initialData;
    if (initialError != null) error._subject.value = initialError;
  }

  late final status = SingleBlocStateItem<SingleBlocStatus>();
  late final data = SingleBlocStateItem<D>(); //
  late final error = SingleBlocStateItem<SingleBlocErrorInfo<A, E>?>(); //

  @override
  List<Object?> get props => [status.value, data.value, error.value];

  SingleBlocState<A, E, D> copyWith({
    SingleBlocStatus Function()? newStatus,
    D Function()? newData,
    SingleBlocErrorInfo<A, E> Function()? newError,
  }) {
    return SingleBlocState(
      newStatus?.call() ?? status.value!,
      newData == null ? data.value : newData.call(),
      newError == null ? error.value : newError.call(),
    );
  }
}

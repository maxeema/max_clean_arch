part of 'single_bloc.dart';

extension SingleBlocStateX<A, E, D> on SingleBlocState<A, E, D> {
  bool get isIdle => status.value == SingleBlocStatus.idle; //
  bool get inProgress => status.value == SingleBlocStatus.inProgress; //
  bool get completed => status.value == SingleBlocStatus.completed;

  bool get hasData => data.hasValue; //
  bool get hasError => error.hasValue;
}

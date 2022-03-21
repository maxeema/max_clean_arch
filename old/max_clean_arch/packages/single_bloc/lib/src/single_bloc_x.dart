part of 'single_bloc.dart';

extension SingleBlocX<A, E, D> on SingleBloc<A, E, D> {
  SingleBlocStateItem<SingleBlocStatus> get status => state.status; //
  SingleBlocStateItem<D> get data => state.data; //
  SingleBlocStateItem<SingleBlocErrorInfo<A, E>?> get error => state.error; //

  bool get hasData => state.data.hasValue; //
  bool get hasError => state.error.hasValue;

  void resetError() {
    state.error._value = null;
  }
}

part of 'single_bloc.dart';

class SingleBlocEvent<A> extends Equatable {
  const SingleBlocEvent._(this.args, {this.preExecute});

  final A args;
  final Future? preExecute;

  factory SingleBlocEvent.execute(A args, {Future? preExecute}) => SingleBlocEvent._(args, preExecute: preExecute);

  @override
  List<Object?> get props => [args];

  @override
  bool? get stringify => true;
}

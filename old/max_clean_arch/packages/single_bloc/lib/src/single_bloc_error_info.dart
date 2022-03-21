part of 'single_bloc.dart';

class SingleBlocErrorInfo<A, S> extends Equatable {
  const SingleBlocErrorInfo({required this.args, required this.error, required this.source, this.stackTrace});

  // Original args that were used with an action that caused error
  final A args;

  // Bloc's specific error (it could be a detailed failure of an interaction with a back-end server)
  // Then in UI we can detect ad type of error and show a properly localized message
  final S? error;

  // It is an original error and could be the same as 'error' but also could be as just any Dart error/exception
  final Object source;

  // StackTrace information
  final StackTrace? stackTrace;

  @override
  List<Object?> get props => [error, source, stackTrace];

  @override
  bool? get stringify => true;
}

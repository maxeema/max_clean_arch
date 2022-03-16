part of 'single_bloc.dart';

class SingleBlocStateItem<T> extends Equatable {
  final _subject = BehaviorSubject<T?>(); //
  set _value(T newValue) => _subject.value = newValue;

  T? get value => _subject.valueOrNull; //
  bool get hasValue => _subject.hasValue && _subject.value != null; //
  Subject<T?> get asStream => _subject;

  @override
  List<Object?> get props => [value];
}

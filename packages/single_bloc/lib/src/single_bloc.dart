import 'dart:core';

import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:rxdart/rxdart.dart';

part 'single_bloc_error_info.dart'; //
part 'single_bloc_event.dart'; //
part 'single_bloc_state.dart'; //
part 'single_bloc_state_item.dart'; //
part 'single_bloc_state_x.dart'; //
part 'single_bloc_status.dart'; //
part 'single_bloc_x.dart'; //

typedef IsCanceled = bool Function();

abstract class SingleBloc<A, E, D> extends Bloc<SingleBlocEvent, SingleBlocState<A, E, D>> {
  SingleBloc([SingleBlocState<A, E, D>? initialState]) : super(initialState ?? SingleBlocState()) {
    _registerEventHandler();
  }

  /// The action you have to implement
  ///
  /// **[args] - whatever you need or specify Never
  ///
  /// **[isCanceled] - this callback is aimed to check if do we need to continue computations at our action
  /// or the result of the action will be ignored because the bloc processes a next event. If the callback return true at
  /// some point of the execution it probably the case of the "restartable()" transformer usage
  Future<D> action({required A args, required IsCanceled isCanceled});

  // Only this method is responsible to adding events and execute the bloc
  void execute(A args, {Future? delay}) {
    // Call super.add() cuz we disabled the direct add() access
    super.add(SingleBlocEvent.execute(args, preExecute: delay));
  }

  @override
  // Don't allow the bloc clients to add events directly - use 'execute()' instead
  Never add(event) => throw Never;

  void _registerEventHandler() {
    on<SingleBlocEvent>(
      (event, emit) async {
        emit(state.copyWith(newStatus: () => SingleBlocStatus.inProgress));
        try {
          await event.preExecute;
          if (emit.isDone) return;
          final result = await action(args: event.args, isCanceled: () => emit.isDone);
          if (emit.isDone) return;
          //
          late D data;
          if (result is Either) {
            result as Either<SingleBlocErrorInfo<A, E>, D>; // ensure that our either is with appropriate types
            if (result.isLeft()) {
              throw (result as Left).value;
            }
            data = result.foldRight(null, (r, _) => r)!;
          } else {
            data = result;
          }
          state.data._value = data;
          state.error._value = null;
        } catch (error, stackTrace) {
          if (error is SingleBlocErrorInfo<A, E>) {
            state.error._value = error;
          } else {
            state.error._value = SingleBlocErrorInfo<A, E>(
              args: event.args,
              error: error is E ? error as E : null,
              source: error,
              stackTrace: stackTrace,
            );
          }
        } finally {
          emit(state.copyWith(newStatus: () => SingleBlocStatus.completed));
        }
      },
      // With the "restartable()" we ensure that only the latest event matter
      transformer: restartable(),
    );
  }
}

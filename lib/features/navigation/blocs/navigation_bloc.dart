import 'package:max_clean_arch/extensions/duration_x.dart';
import 'package:max_clean_arch/features/navigation/usecases/get_navigation_usecase.dart';
import 'package:navigation_repository/navigation_repository.dart' as repository;
import 'package:single_bloc/single_bloc.dart';

export 'package:single_bloc/single_bloc.dart';

const _kFirstLoadDelay = Duration(milliseconds: 500);
const _kNextLoadDelay = Duration(milliseconds: 500);

class NavigationBlocArgs {
  const NavigationBlocArgs({this.id}); //
  final String? id;
}

class NavigationBloc extends SingleBloc<NavigationBlocArgs, repository.Failure, repository.NavigationData> {
  NavigationBloc(
    this._getNavigationUsecase,
  ) : super(SingleBlocState(SingleBlocStatus.inProgress)) {
    execute(const NavigationBlocArgs(), delay: _kFirstLoadDelay.delay);
  }

  final GetNavigationUsecase _getNavigationUsecase;

  void load(String? id) => execute(NavigationBlocArgs(id: id), delay: _kNextLoadDelay.delay);

  @override
  Future<repository.NavigationData> action({required NavigationBlocArgs args, required IsCanceled isCanceled}) async {
    final result = await _getNavigationUsecase(GetNavigationUsecaseArgs(id: args.id));
    return result.fold((l) => throw l, (r) => r);
  }
}

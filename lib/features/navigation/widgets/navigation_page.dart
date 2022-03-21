import 'package:dartz/dartz.dart' hide State;
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:max_clean_arch/features/navigation/blocs/navigation_bloc.dart';
import 'package:max_clean_arch/features/navigation/widgets/search_fab.dart';
import 'package:max_clean_arch/generated/l10n.dart';

import 'data_load_error_widget.dart';
import 'data_loading_widget.dart';
import 'data_widget.dart';

class NavigationPage extends StatefulHookWidget {
  const NavigationPage({required this.bloc, Key? key}) : super(key: key);

  final NavigationBloc bloc;

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  Tuple2<dynamic, TabController>? _tabController;

  NavigationBloc get bloc => widget.bloc;

  @override
  void dispose() {
    _tabController?.last.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Subscribe and update widget on the bloc's state changes
    useStream(widget.bloc.stream);
    // Listen to errors and show a snackbar message with it
    useEffect(() {
      final subscription = widget.bloc.stream.listen((state) {
        if (state.hasError && state.hasData) {
          final queryId = state.error.value!.args.id;
          _showLoadError(queryId);
          widget.bloc.resetError();
        } else {
          _hideLoadError();
        }
      });
      return subscription.cancel;
    });
    //
    final state = widget.bloc.state;
    //
    final searchFabKey = useMemoized(() => GlobalKey<SearchFabState>());
    final hookKeys = [state.data.value?.id ?? 'default'];
    final ticker = useSingleTickerProvider(keys: hookKeys);
    //
    return Scaffold(
      body: () {
        if (state.hasData) {
          final data = state.data.value!;
          if (_tabController?.value1 != data) {
            _tabController?.last.dispose();
            _tabController = Tuple2(data, TabController(length: data.pages.size, vsync: ticker));
          }
          return Listener(
            onPointerDown: (event) {
              searchFabKey.currentState?.close();
            },
            child: WillPopScope(
              onWillPop: () {
                if (searchFabKey.currentState?.isOpen == true) {
                  searchFabKey.currentState?.close();
                  return Future.value(false);
                }
                return Future.value(true);
              },
              child: DataWidget(
                tabController: _tabController!.last,
                data: state.data.value!,
              ),
            ),
          );
        }
        // There is no data at this time
        if (state.inProgress) {
          return const DataLoadingWidget();
        } else {
          final s = S.of(context);
          final queryId = state.error.value!.args.id;
          return DataLoadErrorWidget(
            message: s.failedLoadingContent(queryId ?? s.defaultContentId),
            onRetryClicked: () {
              widget.bloc.load(queryId);
            },
          );
        }
      }(),
      floatingActionButton: !state.hasData
          ? null
          : SearchFab(
              key: searchFabKey,
              state: state,
              onSearch: (newId) => bloc.load(newId),
            ),
      bottomNavigationBar: !state.hasData
          ? null
          : Listener(
              onPointerDown: (_) {
                searchFabKey.currentState?.close();
              },
              child: Container(
                margin: const EdgeInsets.only(top: 4),
                child: TabBar(
                  controller: _tabController?.last,
                  labelColor: Theme.of(context).colorScheme.secondary,
                  indicator: ShapeDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      stops: const [0.1, 0.1],
                      colors: [Theme.of(context).colorScheme.secondary, Colors.transparent],
                    ),
                    shape: const RoundedRectangleBorder(),
                  ),
                  tabs: [
                    ...state.data.value!.pages.asList().map((page) {
                      return Tab(
                        child: Text(
                          page.title,
                          textAlign: TextAlign.center,
                        ),
                      );
                    })
                  ],
                ),
              ),
            ),
    );
  }

  void _hideLoadError() {
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
  }
  void _showLoadError(String? queryId) {
    ScaffoldMessenger.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(SnackBar(
        behavior: SnackBarBehavior.fixed,
        content: Text(
          S.of(context).failedLoadingContent(queryId ?? 'default'),
          textAlign: TextAlign.center,
        ),
        action: SnackBarAction(
          label: S.of(context).retryButton,
          onPressed: () {
            widget.bloc.load(queryId);
          },
        ),
      ));
  }
}

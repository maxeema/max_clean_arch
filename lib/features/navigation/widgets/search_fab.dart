import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:max_clean_arch/extensions/duration_x.dart';
import 'package:max_clean_arch/features/navigation/blocs/navigation_bloc.dart';
import 'package:max_clean_arch/features/navigation/widgets/enter_new_id_widget.dart';
import 'package:max_clean_arch/features/navigation/widgets/progress_widget.dart';
import 'package:max_clean_arch/features/navigation/widgets/search_fab_content_widget.dart';

const _enterNewIdPreferredSize = 250.0;

typedef SearchAction = void Function(String id);

//TODO maybe extract the business logic for SearchFab, SearchFabContentWidget, and NavigationPage to a bloc?
class SearchFab extends StatefulHookWidget {
  const SearchFab({required this.state, required this.onSearch, Key? key}) : super(key: key);

  final SingleBlocState state;
  final SearchAction onSearch;

  @override
  State<SearchFab> createState() => SearchFabState();
}

class SearchFabState extends State<SearchFab> {
  final _contentKey = GlobalKey<SearchFabContentState>();

  void close() {
    _contentKey.currentState?.close();
  }

  bool get isOpen => _contentKey.currentState?.open == true;

  @override
  Widget build(BuildContext context) {
    final newIdTextValue = useValueNotifier('');
    // final fabPostponeFuture = useMemoized(() => Future.delayed(1000.ms, () => true), ['only-first-appearance']);
    return SearchFabContentWidget(
      key: _contentKey,
      fabBuilder: (context, isOpen) {
        return ValueListenableBuilder<String>(
            valueListenable: newIdTextValue,
            builder: (context, newIdValue, child) {
              final newId = newIdValue.trim();
              Widget child;
              if (widget.state.inProgress) {
                child = ProgressWidget.infinite(
                  key: const Key('progress'),
                  compact: true,
                  color: const AlwaysStoppedAnimation(Colors.white),
                );
              } else {
                if (isOpen) {
                  if (newId.isEmpty) {
                    child = const Icon(Icons.close, key: Key('close'));
                  } else {
                    child = const Icon(Icons.done, key: Key('done'));
                  }
                } else {
                  child = const Icon(Icons.search, key: Key('search'));
                }
              }
              return FloatingActionButton(
                child: AnimatedSwitcher(
                  duration: 300.ms,
                  child: child,
                ),
                onPressed: widget.state.inProgress
                    ? null
                    : () {
                        // if (newId.isNotEmpty && expandableFabKey.currentState?.open == true) {
                        if (newId.isNotEmpty && isOpen) {
                          widget.onSearch(newId);
                          newIdTextValue.value = "";
                        }
                        _contentKey.currentState?.toggle();
                      },
              );
            });
      },
      expandedBuilder: (context, isOpen) {
        return EnterNewIdWidget(
          expanded: isOpen,
          preferredWidth: _enterNewIdPreferredSize,
          onChanged: (newId) {
            newIdTextValue.value = newId;
          },
          onSubmitted: (newId) {
            newId = newId.trim();
            newIdTextValue.value = newId;
            if (newId.isNotEmpty) {
              widget.onSearch(newId);
              _contentKey.currentState?.close();
              newIdTextValue.value = "";
            }
          },
        );
      },
    );
  }
}

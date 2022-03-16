import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:max_clean_arch/di.dart';
import 'package:max_clean_arch/extensions/duration_x.dart';
import 'package:max_clean_arch/features/navigation/widgets/item_body_widget.dart';
import 'package:navigation_repository/navigation_repository.dart' as repository;
import 'package:palette_generator/palette_generator.dart';
import 'package:transparent_image/transparent_image.dart';

import '../blocs/page_items_bloc.dart';
import '../utils/link_utils.dart';

class DataWidget extends HookWidget {
  const DataWidget({
    required this.data,
    required this.tabController,
    Key? key,
  }) : super(key: key);

  final repository.NavigationData data;
  final TabController tabController;

  @override
  Widget build(BuildContext context) {
    final bloc = useMemoized(() => getIt<PageItemsBloc>(param1: data), [data]);
    useStream(bloc.stream.asBroadcastStream());
    //
    useEffect(() {
      void tabChangesListener() {
        final newPage = data.pages[tabController.index];
        bloc.onPageSwitched(newPage);
      }

      tabController.addListener(tabChangesListener);
    }, [data]);
    //
    final pages = data.pages.asList();
    //
    // TODO think about how to optimize tab rendering
    // if (pages.length > 4) {
    // cuz currently if there is too much tabs then they will be too thin for good UX
    // }
    //
    return WillPopScope(
      onWillPop: () {
        if (bloc.mayPopItemFor(bloc.page)) {
          bloc.popItem();
          return Future.value(false);
        }
        if (tabController.indexIsChanging) {
          return Future.value(false);
        }
        if (tabController.index > 0) {
          tabController.index = tabController.index - 1;
          return Future.value(false);
        }
        return Future.value(true);
      },
      child: AnimatedSwitcher(
        duration: 250.ms,
        child: TabBarView(
          key: ValueKey(data),
          controller: tabController,
          children: [
            ...pages.map((page) {
              final item = bloc.data.value!.getCurrentItemFor(page);
              return AnimatedSwitcher(
                duration: 250.ms,
                child: CustomScrollView(
                  key: PageStorageKey('${page.id}:$item'),
                  physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                  slivers: [
                    SliverAppBar(
                      backgroundColor: Colors.transparent,
                      pinned: true,
                      stretch: true,
                      expandedHeight: 300.0,
                      flexibleSpace: FlexibleSpaceBar(
                        collapseMode: CollapseMode.pin,
                        stretchModes: const <StretchMode>[
                          StretchMode.zoomBackground,
                          StretchMode.fadeTitle,
                        ],
                        centerTitle: true,
                        title: Text(item.title),
                        background: Stack(
                          fit: StackFit.expand,
                          children: <Widget>[
                            FadeInImage.memoryNetwork(
                              placeholder: kTransparentImage,
                              image: item.imageUrl,
                              imageErrorBuilder: (_, __, ___) {
                                //TODO What to show if couldn't get item's image
                                return const SizedBox.shrink();
                              },
                              fit: BoxFit.cover,
                            ),
                            const DecoratedBox(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment(0.0, 0.5),
                                  end: Alignment.center,
                                  colors: [Color(0x65000000), Color(0x00000000)],
                                ),
                              ),
                            ),
                            Opacity(
                              opacity: bloc.mayPopItemFor(page) ? 1 : 0,
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
                                  child: IgnorePointer(
                                    ignoring: !bloc.mayPopItemFor(page),
                                    child: BackButton(
                                      onPressed: bloc.mayPopItemFor(page) ? () => bloc.popItem() : null,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.topRight,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
                                child: IconButton(
                                  icon: const Icon(Icons.fullscreen),
                                  onPressed: () => bloc.showItemImage(item),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    SliverList(
                      delegate: SliverChildListDelegate(
                        [
                          Padding(
                            padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
                            child: ItemBodyWidget(
                              key: ValueKey(item),
                              item: item,
                              resolvePreviewItem: data.itemById,
                              onLinkTap: (link) {
                                if (kDebugMode) print('> onTapLink: $link');
                                final href = link.href;
                                if (href.isEmpty) return;
                                if (LinkUtils.isOpenItem(href)) {
                                  final item = data.itemById(href.substring(href.indexOf(':') + 1))!;
                                  bloc.openItem(item);
                                } else {
                                  LinkUtils.tryOpenPlatform(href);
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kt_dart/collection.dart';
import 'package:max_clean_arch/domain/product.entities/product.dart';
import 'package:max_clean_arch/extensions/duration_x.dart';
import 'package:max_clean_arch/presentation/features/products_list/blocs/products_list_bloc.dart';
import 'package:max_clean_arch/presentation/generated/l10n.dart';
import 'package:max_clean_arch/presentation/widgets/expanded_animated_switcher_child_layout.dart';
import 'package:rxdart/rxdart.dart';
import 'package:single_bloc/single_bloc.dart';

import 'products_list_widget.dart';

class ProductsListPage extends StatelessWidget {
  const ProductsListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<ProductsListBloc>();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(S.of(context).productsList),
      ),
      body: BlocConsumer<ProductsListBloc, SingleBlocState<void, ErrorAndStackTrace, KtList<Product>>>(
        listener: (context, state) {
          if (state.hasError && state.hasData) {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(SnackBar(
                behavior: SnackBarBehavior.floating,
                content: Text(
                  (state.error.value!.error?.error ?? state.error.value!.source).toString(),
                  textAlign: TextAlign.center,
                ),
              ));
            bloc.resetError();
          } else {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
          }
        },
        builder: (context, state) {
          // print('products list bloc [${bloc.hashCode}], (${state.hasData}/${bloc.hasData},'
          //     ' ${bloc.hasError}/${state.hasError}), state: $state, data: ${bloc.data}, error: ${bloc.error}');
          if (!state.hasData && !state.completed) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state.hasData || state.inProgress) {
            return !state.hasData && state.inProgress
                ? const Center(child: CircularProgressIndicator())
                : RefreshIndicator(
                    onRefresh: () {
                      bloc.load();
                      return bloc.stream.firstWhere((state) => !state.inProgress);
                    },
                    child: AnimatedSwitcher(
                      duration: 500.ms,
                      reverseDuration: 0.ms,
                      layoutBuilder: (currentChild, previousChildren) =>
                          ExpandedAnimatedSwitcherChildLayout(currentChild, previousChildren),
                      child: ProductsListWidget(
                        // With this key AnimatedSwitcher applies effect on every success products retrieval
                        key: ValueKey(identityHashCode(state.data.value)),
                        products: state.data.value!,
                        onProductClick: bloc.openProduct,
                      ),
                    ),
                  );
          }
          // it's an error state
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (state.hasError)
                Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    (state.error.value!.error?.error ?? state.error.value!.source).toString(),
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                ),
              Center(
                child: ElevatedButton(
                  child: Text(S.of(context).loadProducts),
                  onPressed: bloc.load,
                ),
              )
            ],
          );
        },
      ),
    );
  }
}

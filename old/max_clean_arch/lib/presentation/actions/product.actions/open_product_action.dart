import 'package:injectable/injectable.dart';
import 'package:max_clean_arch/domain/product.entities/product.dart';

import '../action.dart';
import '../actions_delegate.dart';

@injectable
class OpenProductAction implements Action {
  const OpenProductAction(
    this.delegate,
  );

  final ActionsDelegate delegate;

  @override
  void call([covariant Product? product]) => delegate.productOpen.add(product!);
}

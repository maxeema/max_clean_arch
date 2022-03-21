import 'package:max_clean_arch/domain/product.entities/product.dart';
import 'package:rxdart/rxdart.dart';

abstract class ActionsDelegate {
  final productOpen = PublishSubject<Product>();
}

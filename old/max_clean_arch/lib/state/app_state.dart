import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_state.freezed.dart';

typedef ProductId = String;

@freezed
class AppStateInfo with _$AppStateInfo {
  const factory AppStateInfo({
    bool? initialized,
    ProductId? lastProductId,
  }) = _AppStateInfo;
}
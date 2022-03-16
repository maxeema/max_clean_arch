import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_state.freezed.dart';

@freezed
class AppStateInfo with _$AppStateInfo {
  const factory AppStateInfo({
    bool? initialized,
    String? pageId,
  }) = _AppStateInfo;
}
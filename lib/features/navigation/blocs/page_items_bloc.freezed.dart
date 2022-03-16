// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'page_items_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$PageItemsArgsTearOff {
  const _$PageItemsArgsTearOff();

  _SwitchPage switchPage(Page page) {
    return _SwitchPage(
      page,
    );
  }

  _OpenItem openItem(Item item) {
    return _OpenItem(
      item,
    );
  }

  _PopBack popBack() {
    return const _PopBack();
  }
}

/// @nodoc
const $PageItemsArgs = _$PageItemsArgsTearOff();

/// @nodoc
mixin _$PageItemsArgs {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Page page) switchPage,
    required TResult Function(Item item) openItem,
    required TResult Function() popBack,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(Page page)? switchPage,
    TResult Function(Item item)? openItem,
    TResult Function()? popBack,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Page page)? switchPage,
    TResult Function(Item item)? openItem,
    TResult Function()? popBack,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SwitchPage value) switchPage,
    required TResult Function(_OpenItem value) openItem,
    required TResult Function(_PopBack value) popBack,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_SwitchPage value)? switchPage,
    TResult Function(_OpenItem value)? openItem,
    TResult Function(_PopBack value)? popBack,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SwitchPage value)? switchPage,
    TResult Function(_OpenItem value)? openItem,
    TResult Function(_PopBack value)? popBack,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PageItemsArgsCopyWith<$Res> {
  factory $PageItemsArgsCopyWith(
          PageItemsArgs value, $Res Function(PageItemsArgs) then) =
      _$PageItemsArgsCopyWithImpl<$Res>;
}

/// @nodoc
class _$PageItemsArgsCopyWithImpl<$Res>
    implements $PageItemsArgsCopyWith<$Res> {
  _$PageItemsArgsCopyWithImpl(this._value, this._then);

  final PageItemsArgs _value;
  // ignore: unused_field
  final $Res Function(PageItemsArgs) _then;
}

/// @nodoc
abstract class _$SwitchPageCopyWith<$Res> {
  factory _$SwitchPageCopyWith(
          _SwitchPage value, $Res Function(_SwitchPage) then) =
      __$SwitchPageCopyWithImpl<$Res>;
  $Res call({Page page});
}

/// @nodoc
class __$SwitchPageCopyWithImpl<$Res> extends _$PageItemsArgsCopyWithImpl<$Res>
    implements _$SwitchPageCopyWith<$Res> {
  __$SwitchPageCopyWithImpl(
      _SwitchPage _value, $Res Function(_SwitchPage) _then)
      : super(_value, (v) => _then(v as _SwitchPage));

  @override
  _SwitchPage get _value => super._value as _SwitchPage;

  @override
  $Res call({
    Object? page = freezed,
  }) {
    return _then(_SwitchPage(
      page == freezed
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as Page,
    ));
  }
}

/// @nodoc

class _$_SwitchPage with DiagnosticableTreeMixin implements _SwitchPage {
  const _$_SwitchPage(this.page);

  @override
  final Page page;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PageItemsArgs.switchPage(page: $page)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PageItemsArgs.switchPage'))
      ..add(DiagnosticsProperty('page', page));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SwitchPage &&
            const DeepCollectionEquality().equals(other.page, page));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(page));

  @JsonKey(ignore: true)
  @override
  _$SwitchPageCopyWith<_SwitchPage> get copyWith =>
      __$SwitchPageCopyWithImpl<_SwitchPage>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Page page) switchPage,
    required TResult Function(Item item) openItem,
    required TResult Function() popBack,
  }) {
    return switchPage(page);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(Page page)? switchPage,
    TResult Function(Item item)? openItem,
    TResult Function()? popBack,
  }) {
    return switchPage?.call(page);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Page page)? switchPage,
    TResult Function(Item item)? openItem,
    TResult Function()? popBack,
    required TResult orElse(),
  }) {
    if (switchPage != null) {
      return switchPage(page);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SwitchPage value) switchPage,
    required TResult Function(_OpenItem value) openItem,
    required TResult Function(_PopBack value) popBack,
  }) {
    return switchPage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_SwitchPage value)? switchPage,
    TResult Function(_OpenItem value)? openItem,
    TResult Function(_PopBack value)? popBack,
  }) {
    return switchPage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SwitchPage value)? switchPage,
    TResult Function(_OpenItem value)? openItem,
    TResult Function(_PopBack value)? popBack,
    required TResult orElse(),
  }) {
    if (switchPage != null) {
      return switchPage(this);
    }
    return orElse();
  }
}

abstract class _SwitchPage implements PageItemsArgs {
  const factory _SwitchPage(Page page) = _$_SwitchPage;

  Page get page;
  @JsonKey(ignore: true)
  _$SwitchPageCopyWith<_SwitchPage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$OpenItemCopyWith<$Res> {
  factory _$OpenItemCopyWith(_OpenItem value, $Res Function(_OpenItem) then) =
      __$OpenItemCopyWithImpl<$Res>;
  $Res call({Item item});
}

/// @nodoc
class __$OpenItemCopyWithImpl<$Res> extends _$PageItemsArgsCopyWithImpl<$Res>
    implements _$OpenItemCopyWith<$Res> {
  __$OpenItemCopyWithImpl(_OpenItem _value, $Res Function(_OpenItem) _then)
      : super(_value, (v) => _then(v as _OpenItem));

  @override
  _OpenItem get _value => super._value as _OpenItem;

  @override
  $Res call({
    Object? item = freezed,
  }) {
    return _then(_OpenItem(
      item == freezed
          ? _value.item
          : item // ignore: cast_nullable_to_non_nullable
              as Item,
    ));
  }
}

/// @nodoc

class _$_OpenItem with DiagnosticableTreeMixin implements _OpenItem {
  const _$_OpenItem(this.item);

  @override
  final Item item;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PageItemsArgs.openItem(item: $item)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PageItemsArgs.openItem'))
      ..add(DiagnosticsProperty('item', item));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _OpenItem &&
            const DeepCollectionEquality().equals(other.item, item));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(item));

  @JsonKey(ignore: true)
  @override
  _$OpenItemCopyWith<_OpenItem> get copyWith =>
      __$OpenItemCopyWithImpl<_OpenItem>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Page page) switchPage,
    required TResult Function(Item item) openItem,
    required TResult Function() popBack,
  }) {
    return openItem(item);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(Page page)? switchPage,
    TResult Function(Item item)? openItem,
    TResult Function()? popBack,
  }) {
    return openItem?.call(item);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Page page)? switchPage,
    TResult Function(Item item)? openItem,
    TResult Function()? popBack,
    required TResult orElse(),
  }) {
    if (openItem != null) {
      return openItem(item);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SwitchPage value) switchPage,
    required TResult Function(_OpenItem value) openItem,
    required TResult Function(_PopBack value) popBack,
  }) {
    return openItem(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_SwitchPage value)? switchPage,
    TResult Function(_OpenItem value)? openItem,
    TResult Function(_PopBack value)? popBack,
  }) {
    return openItem?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SwitchPage value)? switchPage,
    TResult Function(_OpenItem value)? openItem,
    TResult Function(_PopBack value)? popBack,
    required TResult orElse(),
  }) {
    if (openItem != null) {
      return openItem(this);
    }
    return orElse();
  }
}

abstract class _OpenItem implements PageItemsArgs {
  const factory _OpenItem(Item item) = _$_OpenItem;

  Item get item;
  @JsonKey(ignore: true)
  _$OpenItemCopyWith<_OpenItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$PopBackCopyWith<$Res> {
  factory _$PopBackCopyWith(_PopBack value, $Res Function(_PopBack) then) =
      __$PopBackCopyWithImpl<$Res>;
}

/// @nodoc
class __$PopBackCopyWithImpl<$Res> extends _$PageItemsArgsCopyWithImpl<$Res>
    implements _$PopBackCopyWith<$Res> {
  __$PopBackCopyWithImpl(_PopBack _value, $Res Function(_PopBack) _then)
      : super(_value, (v) => _then(v as _PopBack));

  @override
  _PopBack get _value => super._value as _PopBack;
}

/// @nodoc

class _$_PopBack with DiagnosticableTreeMixin implements _PopBack {
  const _$_PopBack();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PageItemsArgs.popBack()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'PageItemsArgs.popBack'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _PopBack);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Page page) switchPage,
    required TResult Function(Item item) openItem,
    required TResult Function() popBack,
  }) {
    return popBack();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(Page page)? switchPage,
    TResult Function(Item item)? openItem,
    TResult Function()? popBack,
  }) {
    return popBack?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Page page)? switchPage,
    TResult Function(Item item)? openItem,
    TResult Function()? popBack,
    required TResult orElse(),
  }) {
    if (popBack != null) {
      return popBack();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SwitchPage value) switchPage,
    required TResult Function(_OpenItem value) openItem,
    required TResult Function(_PopBack value) popBack,
  }) {
    return popBack(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_SwitchPage value)? switchPage,
    TResult Function(_OpenItem value)? openItem,
    TResult Function(_PopBack value)? popBack,
  }) {
    return popBack?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SwitchPage value)? switchPage,
    TResult Function(_OpenItem value)? openItem,
    TResult Function(_PopBack value)? popBack,
    required TResult orElse(),
  }) {
    if (popBack != null) {
      return popBack(this);
    }
    return orElse();
  }
}

abstract class _PopBack implements PageItemsArgs {
  const factory _PopBack() = _$_PopBack;
}

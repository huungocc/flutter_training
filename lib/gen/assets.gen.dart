/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart' as _svg;
import 'package:vector_graphics/vector_graphics.dart' as _vg;

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/ic_apple.svg
  SvgGenImage get icApple => const SvgGenImage('assets/icons/ic_apple.svg');

  /// File path: assets/icons/ic_calendar.svg
  SvgGenImage get icCalendar =>
      const SvgGenImage('assets/icons/ic_calendar.svg');

  /// File path: assets/icons/ic_clock.svg
  SvgGenImage get icClock => const SvgGenImage('assets/icons/ic_clock.svg');

  /// File path: assets/icons/ic_facebook.svg
  SvgGenImage get icFacebook =>
      const SvgGenImage('assets/icons/ic_facebook.svg');

  /// File path: assets/icons/ic_google.svg
  SvgGenImage get icGoogle => const SvgGenImage('assets/icons/ic_google.svg');

  /// File path: assets/icons/ic_star.svg
  SvgGenImage get icStar => const SvgGenImage('assets/icons/ic_star.svg');

  /// File path: assets/icons/ic_ticket.svg
  SvgGenImage get icTicket => const SvgGenImage('assets/icons/ic_ticket.svg');

  /// File path: assets/icons/ic_todo_calendar.svg
  SvgGenImage get icTodoCalendar =>
      const SvgGenImage('assets/icons/ic_todo_calendar.svg');

  /// File path: assets/icons/ic_todo_calendar_2.svg
  SvgGenImage get icTodoCalendar2 =>
      const SvgGenImage('assets/icons/ic_todo_calendar_2.svg');

  /// File path: assets/icons/ic_todo_clock.svg
  SvgGenImage get icTodoClock =>
      const SvgGenImage('assets/icons/ic_todo_clock.svg');

  /// File path: assets/icons/ic_todo_list.svg
  SvgGenImage get icTodoList =>
      const SvgGenImage('assets/icons/ic_todo_list.svg');

  /// File path: assets/icons/ic_todo_trophy.svg
  SvgGenImage get icTodoTrophy =>
      const SvgGenImage('assets/icons/ic_todo_trophy.svg');

  /// List of all assets
  List<SvgGenImage> get values => [
    icApple,
    icCalendar,
    icClock,
    icFacebook,
    icGoogle,
    icStar,
    icTicket,
    icTodoCalendar,
    icTodoCalendar2,
    icTodoClock,
    icTodoList,
    icTodoTrophy,
  ];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/welcome_image.png
  AssetGenImage get welcomeImage =>
      const AssetGenImage('assets/images/welcome_image.png');

  /// List of all assets
  List<AssetGenImage> get values => [welcomeImage];
}

class Assets {
  const Assets._();

  static const String aEnv = '.env';
  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();

  /// List of all assets
  static List<String> get values => [aEnv];
}

class AssetGenImage {
  const AssetGenImage(this._assetName, {this.size, this.flavors = const {}});

  final String _assetName;

  final Size? size;
  final Set<String> flavors;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = true,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.medium,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({AssetBundle? bundle, String? package}) {
    return AssetImage(_assetName, bundle: bundle, package: package);
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class SvgGenImage {
  const SvgGenImage(this._assetName, {this.size, this.flavors = const {}})
    : _isVecFormat = false;

  const SvgGenImage.vec(this._assetName, {this.size, this.flavors = const {}})
    : _isVecFormat = true;

  final String _assetName;
  final Size? size;
  final Set<String> flavors;
  final bool _isVecFormat;

  _svg.SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    _svg.SvgTheme? theme,
    ColorFilter? colorFilter,
    Clip clipBehavior = Clip.hardEdge,
    @deprecated Color? color,
    @deprecated BlendMode colorBlendMode = BlendMode.srcIn,
    @deprecated bool cacheColorFilter = false,
  }) {
    final _svg.BytesLoader loader;
    if (_isVecFormat) {
      loader = _vg.AssetBytesLoader(
        _assetName,
        assetBundle: bundle,
        packageName: package,
      );
    } else {
      loader = _svg.SvgAssetLoader(
        _assetName,
        assetBundle: bundle,
        packageName: package,
        theme: theme,
      );
    }
    return _svg.SvgPicture(
      loader,
      key: key,
      matchTextDirection: matchTextDirection,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      colorFilter:
          colorFilter ??
          (color == null ? null : ColorFilter.mode(color, colorBlendMode)),
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

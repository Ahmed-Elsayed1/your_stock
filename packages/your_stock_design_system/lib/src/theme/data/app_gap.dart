import 'package:gap/gap.dart';

import '../../../your_stock_design_system.dart';

enum AppGapSize {
  none,
  xxxs,
  xxs,
  xs,
  s,
  m,
  l,
  xl,
  xxl,
  xxxl,
  x4l,
  x5l,
  x6l,
  x7l,
  x8l,
  x9l,
  x10l,
  x11l,
  x12l,
  x13l,
  x14l,
  x15l,
  x16l,
  x17l,
  x18l,
  x19l,
  x20l,
  x21l,
  x22l,
  x23l,
  x24l,
  x25l,
  x26l,
  x27l,
  x28l,
  x29l,
  x30l,
}

extension AppGapSizeExtension on AppGapSize {
  double getSpacing(AppSpacingData spacing) {
    switch (this) {
      case AppGapSize.none:
        return spacing.none;
      case AppGapSize.xxxs:
        return spacing.xxxs;
      case AppGapSize.xxs:
        return spacing.xxs;
      case AppGapSize.xs:
        return spacing.xs;
      case AppGapSize.s:
        return spacing.s;
      case AppGapSize.m:
        return spacing.m;
      case AppGapSize.l:
        return spacing.l;
      case AppGapSize.xl:
        return spacing.xl;
      case AppGapSize.xxl:
        return spacing.xxl;
      case AppGapSize.xxxl:
        return spacing.xxxl;
      case AppGapSize.x4l:
        return spacing.x4l;
      case AppGapSize.x5l:
        return spacing.x5l;
      case AppGapSize.x6l:
        return spacing.x6l;
      case AppGapSize.x7l:
        return spacing.x7l;
      case AppGapSize.x8l:
        return spacing.x8l;
      case AppGapSize.x9l:
        return spacing.x9l;
      case AppGapSize.x10l:
        return spacing.x10l;
      case AppGapSize.x11l:
        return spacing.x11l;
      case AppGapSize.x12l:
        return spacing.x12l;
      case AppGapSize.x13l:
        return spacing.x13l;
      case AppGapSize.x14l:
        return spacing.x14l;
      case AppGapSize.x15l:
        return spacing.x15l;
      case AppGapSize.x16l:
        return spacing.x16l;
      case AppGapSize.x17l:
        return spacing.x17l;
      case AppGapSize.x18l:
        return spacing.x18l;
      case AppGapSize.x19l:
        return spacing.x19l;
      case AppGapSize.x20l:
        return spacing.x20l;
      case AppGapSize.x21l:
        return spacing.x21l;
      case AppGapSize.x22l:
        return spacing.x22l;
      case AppGapSize.x23l:
        return spacing.x23l;
      case AppGapSize.x24l:
        return spacing.x24l;
      case AppGapSize.x25l:
        return spacing.x25l;
      case AppGapSize.x26l:
        return spacing.x26l;
      case AppGapSize.x27l:
        return spacing.x27l;
      case AppGapSize.x28l:
        return spacing.x28l;
      case AppGapSize.x29l:
        return spacing.x29l;
      case AppGapSize.x30l:
        return spacing.x30l;
    }
  }
}

class AppGap extends StatelessWidget {
  const AppGap(
    this.size, {
    super.key,
  });

  /// 2 px
  const AppGap.xxxs({
    super.key,
  }) : size = AppGapSize.xxxs;

  /// 4 px
  const AppGap.xxs({
    super.key,
  }) : size = AppGapSize.xxs;

  /// 8 px
  const AppGap.xs({
    super.key,
  }) : size = AppGapSize.xs;

  /// 12 px
  const AppGap.s({
    super.key,
  }) : size = AppGapSize.s;

  /// 16 px
  const AppGap.m({
    super.key,
  }) : size = AppGapSize.m;

  /// 20 px
  const AppGap.l({
    super.key,
  }) : size = AppGapSize.l;

  /// 24 px
  const AppGap.xl({
    super.key,
  }) : size = AppGapSize.xl;

  /// 32 px
  const AppGap.xxl({
    super.key,
  }) : size = AppGapSize.xxl;

  /// 40 px
  const AppGap.xxxl({
    super.key,
  }) : size = AppGapSize.xxxl;

  /// 48 px
  const AppGap.x4l({
    super.key,
  }) : size = AppGapSize.x4l;

  /// 56 px
  const AppGap.x5l({
    super.key,
  }) : size = AppGapSize.x5l;

  /// 64 px
  const AppGap.x6l({
    super.key,
  }) : size = AppGapSize.x6l;

  /// 72 px
  const AppGap.x7l({
    super.key,
  }) : size = AppGapSize.x7l;

  /// 80 px
  const AppGap.x8l({
    super.key,
  }) : size = AppGapSize.x8l;

  /// 88 px
  const AppGap.x9l({
    super.key,
  }) : size = AppGapSize.x9l;

  /// 96 px
  const AppGap.x10l({
    super.key,
  }) : size = AppGapSize.x10l;

  /// 104 px
  const AppGap.x11l({
    super.key,
  }) : size = AppGapSize.x11l;

  /// 112 px
  const AppGap.x12l({
    super.key,
  }) : size = AppGapSize.x12l;

  /// 120 px
  const AppGap.x13l({
    super.key,
  }) : size = AppGapSize.x13l;

  /// 128 px
  const AppGap.x14l({
    super.key,
  }) : size = AppGapSize.x14l;

  /// 136 px
  const AppGap.x15l({
    super.key,
  }) : size = AppGapSize.x15l;

  /// 144 px
  const AppGap.x16l({
    super.key,
  }) : size = AppGapSize.x16l;

  /// 152 px
  const AppGap.x17l({
    super.key,
  }) : size = AppGapSize.x17l;

  /// 160 px
  const AppGap.x18l({
    super.key,
  }) : size = AppGapSize.x18l;

  /// 168 px
  const AppGap.x19l({
    super.key,
  }) : size = AppGapSize.x19l;

  /// 176 px
  const AppGap.x20l({
    super.key,
  }) : size = AppGapSize.x20l;

  /// 184 px
  const AppGap.x21l({
    super.key,
  }) : size = AppGapSize.x21l;

  /// 192 px
  const AppGap.x22l({
    super.key,
  }) : size = AppGapSize.x22l;

  /// 200 px
  const AppGap.x23l({
    super.key,
  }) : size = AppGapSize.x23l;

  /// 208 px
  const AppGap.x24l({
    super.key,
  }) : size = AppGapSize.x24l;

  /// 216 px
  const AppGap.x25l({
    super.key,
  }) : size = AppGapSize.x25l;

  /// 224 px
  const AppGap.x26l({
    super.key,
  }) : size = AppGapSize.x26l;

  /// 232 px
  const AppGap.x27l({
    super.key,
  }) : size = AppGapSize.x27l;

  /// 240 px
  const AppGap.x28l({
    super.key,
  }) : size = AppGapSize.x28l;

  /// 248 px
  const AppGap.x29l({
    super.key,
  }) : size = AppGapSize.x29l;

  /// 256 px
  const AppGap.x30l({
    super.key,
  }) : size = AppGapSize.x30l;

  final AppGapSize size;

  @override
  Widget build(BuildContext context) {
    final spacing = AppSpacingData.regular();
    return Gap(size.getSpacing(spacing));
  }
}

import 'package:flutter/painting.dart';

class AppSpacingData {
  const AppSpacingData({
    required this.none,
    required this.xxxs,
    required this.xxs,
    required this.xs,
    required this.s,
    required this.m,
    required this.l,
    required this.xl,
    required this.xxl,
    required this.xxxl,
    required this.x4l,
    required this.x5l,
    required this.x6l,
    required this.x7l,
    required this.x8l,
    required this.x9l,
    required this.x10l,
    required this.x11l,
    required this.x12l,
    required this.x13l,
    required this.x14l,
    required this.x15l,
    required this.x16l,
    required this.x17l,
    required this.x18l,
    required this.x19l,
    required this.x20l,
    required this.x21l,
    required this.x22l,
    required this.x23l,
    required this.x24l,
    required this.x25l,
    required this.x26l,
    required this.x27l,
    required this.x28l,
    required this.x29l,
    required this.x30l,
  });

  factory AppSpacingData.regular() => const AppSpacingData(
        none: 0,
        xxxs: 2,
        xxs: 4,
        xs: 8,
        s: 12,
        m: 16,
        l: 20,
        xl: 24,
        xxl: 32,
        xxxl: 40,
        x4l: 48,
        x5l: 56,
        x6l: 64,
        x7l: 72,
        x8l: 80,
        x9l: 88,
        x10l: 96,
        x11l: 104,
        x12l: 112,
        x13l: 120,
        x14l: 128,
        x15l: 136,
        x16l: 144,
        x17l: 152,
        x18l: 160,
        x19l: 168,
        x20l: 176,
        x21l: 184,
        x22l: 192,
        x23l: 200,
        x24l: 208,
        x25l: 216,
        x26l: 224,
        x27l: 232,
        x28l: 240,
        x29l: 248,
        x30l: 256,
      );

  /// space.none
  ///
  /// 0 px When a component has no padding or spacing between elements.
  final double none;

  /// space.1
  ///
  /// 2 px used for the spacing gap between icons and related text inside a component.
  final double xxxs;

  /// space.1
  ///
  /// 4 px used for the spacing gap between icons and related text inside a component.
  final double xxs;

  /// space.2
  ///
  /// 8 px
  final double xs;

  /// space.3
  ///
  /// 12 px
  final double s;

  /// space.4
  ///
  /// 16 px
  final double m;

  /// space.5
  ///
  /// 20 px
  final double l;

  /// space.6
  ///
  /// 24 px
  final double xl;

  /// space.7
  ///
  /// 32 px
  final double xxl;

  /// space.8
  ///
  /// 40 px
  final double xxxl;

  /// space.9
  ///
  /// 48 px
  final double x4l;

  /// 56 px
  final double x5l;

  /// 64 px
  final double x6l;

  /// 72 px
  final double x7l;

  /// 80 px
  final double x8l;

  /// 88 px
  final double x9l;

  /// 96 px
  final double x10l;

  /// 104 px
  final double x11l;

  /// 112 px
  final double x12l;

  /// 120 px
  final double x13l;

  /// 128 px
  final double x14l;

  /// 136 px
  final double x15l;

  /// 144 px
  final double x16l;

  /// 152 px
  final double x17l;

  /// 160 px
  final double x18l;

  /// 168 px
  final double x19l;

  /// 176 px
  final double x20l;

  /// 184 px
  final double x21l;

  /// 192 px
  final double x22l;

  /// 200 px
  final double x23l;

  /// 208 px
  final double x24l;

  /// 216 px
  final double x25l;

  /// 224 px
  final double x26l;

  /// 232 px
  final double x27l;

  /// 240 px
  final double x28l;

  /// 248 px
  final double x29l;

  /// 256 px
  final double x30l;

  AppEdgeInsetsSpacingData asInsets() => AppEdgeInsetsSpacingData(this);
}

class AppEdgeInsetsSpacingData {
  const AppEdgeInsetsSpacingData(this._spacing);

  EdgeInsets get none => EdgeInsets.all(_spacing.none);
  EdgeInsets get xxs => EdgeInsets.all(_spacing.xxs);
  EdgeInsets get xs => EdgeInsets.all(_spacing.xs);
  EdgeInsets get s => EdgeInsets.all(_spacing.s);
  EdgeInsets get m => EdgeInsets.all(_spacing.m);
  EdgeInsets get l => EdgeInsets.all(_spacing.l);
  EdgeInsets get xl => EdgeInsets.all(_spacing.xl);
  EdgeInsets get xxl => EdgeInsets.all(_spacing.xxl);
  EdgeInsets get xxxl => EdgeInsets.all(_spacing.xxxl);
  EdgeInsets get x4l => EdgeInsets.all(_spacing.x4l);
  EdgeInsets get x5l => EdgeInsets.all(_spacing.x5l);
  EdgeInsets get x6l => EdgeInsets.all(_spacing.x6l);
  EdgeInsets get x7l => EdgeInsets.all(_spacing.x7l);
  EdgeInsets get x8l => EdgeInsets.all(_spacing.x8l);
  EdgeInsets get x9l => EdgeInsets.all(_spacing.x9l);
  EdgeInsets get x10l => EdgeInsets.all(_spacing.x10l);
  EdgeInsets get x11l => EdgeInsets.all(_spacing.x11l);
  EdgeInsets get x12l => EdgeInsets.all(_spacing.x12l);
  EdgeInsets get x13l => EdgeInsets.all(_spacing.x13l);
  EdgeInsets get x14l => EdgeInsets.all(_spacing.x14l);
  EdgeInsets get x15l => EdgeInsets.all(_spacing.x15l);
  EdgeInsets get x16l => EdgeInsets.all(_spacing.x16l);
  EdgeInsets get x17l => EdgeInsets.all(_spacing.x17l);
  EdgeInsets get x18l => EdgeInsets.all(_spacing.x18l);
  EdgeInsets get x19l => EdgeInsets.all(_spacing.x19l);
  EdgeInsets get x20l => EdgeInsets.all(_spacing.x20l);
  EdgeInsets get x21l => EdgeInsets.all(_spacing.x21l);
  EdgeInsets get x22l => EdgeInsets.all(_spacing.x22l);
  EdgeInsets get x23l => EdgeInsets.all(_spacing.x23l);
  EdgeInsets get x24l => EdgeInsets.all(_spacing.x24l);
  EdgeInsets get x25l => EdgeInsets.all(_spacing.x25l);
  EdgeInsets get x26l => EdgeInsets.all(_spacing.x26l);
  EdgeInsets get x27l => EdgeInsets.all(_spacing.x27l);
  EdgeInsets get x28l => EdgeInsets.all(_spacing.x28l);
  EdgeInsets get x29l => EdgeInsets.all(_spacing.x29l);
  EdgeInsets get x30l => EdgeInsets.all(_spacing.x30l);

  final AppSpacingData _spacing;
}

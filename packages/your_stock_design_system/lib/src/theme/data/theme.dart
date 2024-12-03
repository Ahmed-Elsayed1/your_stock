import '../../../your_stock_design_system.dart';

class AppThemeData {
  // final AppColorsData colors;
  // final AppTypographyData typography;
  final AppSpacingData spacing;
  // final AppEffectsData effects;
  // final AppRadiusData radius;
  // final AppMessagesData messages;

  ThemeMode themeMode;
  // ignore: unused_field
  TargetPlatform? _platform;

  AppThemeData({
    required this.spacing,
    required this.themeMode,
    // required this.colors,
    // required this.typography,
    // required this.effects,
    // required this.radius,
    // required this.messages,
    TargetPlatform? platform,
  }) : _platform = platform;

  factory AppThemeData.regular() => AppThemeData(
        spacing: AppSpacingData.regular(),
        themeMode: ThemeMode.light,
        // typography: AppTypographyData.regular(),
        // colors: AppColorsData.light(),
        // effects: AppEffectsData.regular(),
        // radius: AppRadiusData.regular(),
        // messages: AppMessagesData.regular(),
      );

  AppThemeData copyWith({
    AppSpacingData? spacing,
    ThemeMode? themeMode,
    TargetPlatform? platform,
    // AppColorsData? colors,
    // AppTypographyData? typography,
    // AppEffectsData? effects,
    // AppRadiusData? radius,
    // AppMessagesData? messages,
  }) =>
      AppThemeData(
        spacing: spacing ?? this.spacing,
        themeMode: themeMode ?? this.themeMode,
        platform: platform ?? _platform,
        // typography: AppTypographyData.regular(),
        // colors: colors ?? this.colors,
        // effects: effects ?? this.effects,
        // radius: radius ?? this.radius,
        // messages: messages ?? this.messages,
      );
}

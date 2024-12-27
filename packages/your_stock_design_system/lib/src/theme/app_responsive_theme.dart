import '../../your_stock_design_system.dart';

class AppResponsiveTheme extends StatefulWidget {
  const AppResponsiveTheme({
    super.key,

    //
    required this.child,
    this.colorMode,

    ///
    this.isArabic = false,
    // this.darkColorsPallet,
    // this.lightColorsPallet,
  });

  final Widget child;

  final bool isArabic;

  final ThemeMode? colorMode;

  // final AppColorsData? lightColorsPallet;
  // final AppColorsData? darkColorsPallet;

  @override
  State<AppResponsiveTheme> createState() => _AppResponsiveThemeState();

  // ignore: library_private_types_in_public_api
  static _AppResponsiveThemeState? of(BuildContext context) =>
      context.findAncestorStateOfType<_AppResponsiveThemeState>();
}

class _AppResponsiveThemeState extends State<AppResponsiveTheme> {
  @override
  Widget build(BuildContext context) {
    var theme = AppThemeData.regular();
    final colorMode = this.colorMode();
    theme.themeMode = colorMode;

    // switch (colorMode) {
    //   case ThemeMode.dark:
    //     theme = theme.copyWith(
    //       colors: widget.darkColorsPallet ?? AppColorsData.dark(),
    //     );
    //     break;
    //   case ThemeMode.light:
    //     theme = theme.copyWith(
    //       colors: widget.lightColorsPallet ?? AppColorsData.light(),
    //     );
    //     break;
    //   case ThemeMode.system:
    //     break;
    // }

    return Directionality(
      textDirection: widget.isArabic ? TextDirection.rtl : TextDirection.ltr,
      child: AppTheme(
        data: theme,
        child: MediaQuery(
          data: MediaQuery.of(context).copyWith(
            textScaler: const TextScaler.linear(1.0),
          ),
          child: widget.child,
        ),
      ),
    );
  }

  ThemeMode colorMode() {
    final colorMode = widget.colorMode;
    if (colorMode != null && colorMode != ThemeMode.system) return colorMode;

    var brightness = MediaQuery.of(context).platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;

    if (isDarkMode) {
      return ThemeMode.dark;
    }
    return ThemeMode.light;
  }
}

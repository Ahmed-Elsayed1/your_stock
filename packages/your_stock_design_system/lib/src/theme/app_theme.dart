import '../../your_stock_design_system.dart';

class AppTheme extends InheritedWidget {
  final AppThemeData data;

  const AppTheme({
    super.key,
    required super.child,
    required this.data,
  });

  /// Returns the nearest widget of the given type [AppTheme] and creates a dependency on it, or null if no appropriate widget is found.
  ///
  static AppThemeData of(BuildContext context) {
    final widget = context.dependOnInheritedWidgetOfExactType<AppTheme>();
    if (widget == null) throw 'App theme widget not exist';
    return widget.data;
  }

  @override
  bool updateShouldNotify(covariant AppTheme oldWidget) {
    return oldWidget.data.themeMode != data.themeMode;
  }
}

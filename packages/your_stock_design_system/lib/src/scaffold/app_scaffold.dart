import 'package:your_stock_design_system/your_stock_design_system.dart';

typedef AppScaffoldBodyBuilder = Widget Function(
  BuildContext context,
  ScrollController scrollController,
  AnimationController animationController,
);
typedef FloatingChildrenBuilder = List<Widget> Function(
  BuildContext context,
  AnimationController animationController,
);

typedef AppBarBuilder = Widget Function(
  AnimationController animationController,
);

abstract class AppScaffold extends Widget {
  factory AppScaffold({
    Key? key,
    Widget? body,
    bool resizeToAvoidBottomInset = true,
    Widget? bottomNavigationBar,
    PreferredSizeWidget? appbar,
    bool extendBody = false,
    bool extendBodyBehindAppBar = false,
    Gradient? gradient,
    Color? backgroundColor,
  }) =>
      AppScaffoldContainer(
        key: key,
        body: body,
        resizeToAvoidBottomInset: resizeToAvoidBottomInset,
        bottomNavigationBar: bottomNavigationBar,
        appbar: appbar,
        extendBody: extendBody,
        extendBodyBehindAppBar: extendBodyBehindAppBar,
        gradient: gradient,
        floatingActionButton: null,
        floatingActionButtonLocation: null,
        backgroundColor: backgroundColor,
      );

  factory AppScaffold.gradient({
    Key? key,
    Widget? body,
    bool resizeToAvoidBottomInset = true,
    Widget? bottomNavigationBar,
    PreferredSizeWidget? appbar,
    bool withPattern = false,
    bool extendBody = false,
    bool extendBodyBehindAppBar = false,
    Gradient? gradient,
    Color? backgroundColor,
  }) =>
      AppScaffoldContainer.gradient(
        key: key,
        body: body,
        resizeToAvoidBottomInset: resizeToAvoidBottomInset,
        bottomNavigationBar: bottomNavigationBar,
        appbar: appbar,
        // withPattern: withPattern,
        extendBody: extendBody,
        extendBodyBehindAppBar: extendBodyBehindAppBar,
        gradient: gradient,
        floatingActionButton: null,
        floatingActionButtonLocation: null,
        backgroundColor: backgroundColor,
      );

  factory AppScaffold.floating({
    Key? key,
    Widget? body,
    bool resizeToAvoidBottomInset = true,
    Widget? bottomNavigationBar,
    PreferredSizeWidget? appbar,
    bool withPattern = false,
    bool extendBody = false,
    bool extendBodyBehindAppBar = false,
    Widget? floatingActionButton,
    FloatingActionButtonLocation? floatingActionButtonLocation,
    Color? backgroundColor,
  }) =>
      AppScaffoldContainer.gradient(
        key: key,
        body: body,
        resizeToAvoidBottomInset: resizeToAvoidBottomInset,
        bottomNavigationBar: bottomNavigationBar,
        appbar: appbar,
        // withPattern: withPattern,
        extendBody: extendBody,
        extendBodyBehindAppBar: extendBodyBehindAppBar,
        gradient: null,
        floatingActionButton: floatingActionButton,
        floatingActionButtonLocation: floatingActionButtonLocation,
        backgroundColor: backgroundColor,
      );
}

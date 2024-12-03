import 'package:your_stock_design_system/your_stock_design_system.dart';

// ignore: must_be_immutable
class AppScaffoldContainer extends StatelessWidget implements AppScaffold {
  AppScaffoldContainer({
    super.key,
    this.body,
    this.resizeToAvoidBottomInset = true,
    this.bottomNavigationBar,
    this.appbar,
    // this.withPattern = false,
    this.extendBody = false,
    this.extendBodyBehindAppBar = false,
    this.gradient,
    this.floatingActionButton,
    this.floatingActionButtonLocation,
    this.backgroundColor,
  });

  AppScaffoldContainer.gradient({
    super.key,
    this.body,
    Gradient? gradient,
    this.bottomNavigationBar,
    this.resizeToAvoidBottomInset = true,
    this.appbar,
    // this.withPattern = false,
    this.extendBody = false,
    this.extendBodyBehindAppBar = false,
    this.floatingActionButton,
    this.floatingActionButtonLocation,
    this.backgroundColor,
    // ignore: prefer_initializing_formals
  }) : gradient = gradient;

  // bool withPattern;
  bool extendBody;
  bool extendBodyBehindAppBar;
  Widget? body;
  Gradient? gradient;
  Widget? bottomNavigationBar;
  PreferredSizeWidget? appbar;
  final bool resizeToAvoidBottomInset;
  final Color? backgroundColor;

  final Widget? floatingActionButton;
  final FloatingActionButtonLocation? floatingActionButtonLocation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar,
      extendBody: extendBody,
      extendBodyBehindAppBar: extendBodyBehindAppBar,
      backgroundColor: backgroundColor ?? Colors.white,
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
      // extendBodyBehindAppBar: true,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            gradient: gradient,
            color: backgroundColor ?? Colors.white,
          ),
          height: double.infinity,
          child: body ?? const SizedBox(),
        ),
      ),
      bottomNavigationBar: bottomNavigationBar,
      floatingActionButtonLocation: floatingActionButtonLocation,
      floatingActionButton: floatingActionButton,
    );
  }
}

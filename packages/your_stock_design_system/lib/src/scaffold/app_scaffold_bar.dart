import 'dart:ui' as ui;
import 'package:your_stock_design_system/your_stock_design_system.dart';
import 'package:your_stock_core/your_stock_core.dart';

class AppScaffoldBar extends StatelessWidget implements PreferredSizeWidget {
  const AppScaffoldBar.center({
    super.key,
    this.actions,
    this.bottom,
    this.opacity = 1,
    this.withBackButton = false,
    this.automaticallyImplyLeading = false,
    this.title,
    this.elevation = 0.5,
    this.backgroundColor,
    // this.profileInfoWiget,
  }) : centerTitle = true;

  const AppScaffoldBar.leadingTitle({
    super.key,
    this.actions,
    this.bottom,
    this.opacity = 1,
    this.withBackButton = false,
    this.automaticallyImplyLeading = false,
    this.title,
    this.backgroundColor,
    this.elevation = 0,
    // this.profileInfoWiget,
  }) : centerTitle = false;

  const AppScaffoldBar.withProfileInfo({
    super.key,
    this.actions,
    this.bottom,
    this.opacity = 1,
    this.withBackButton = true,
    this.automaticallyImplyLeading = false,
    this.title,
    this.backgroundColor,
    this.elevation = 0,
    // required this.profileInfoWiget,
  }) : centerTitle = false;

  // final String? backTitle;
  final String? title;
  final Color? backgroundColor;
  final bool withBackButton;
  // final ProfileInfoWidget? profileInfoWiget;
  final PreferredSizeWidget? bottom;
  final double opacity;
  final bool automaticallyImplyLeading;
  final bool centerTitle;
  final double? elevation;

  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    final isLtr = Directionality.of(context) == ui.TextDirection.ltr;
    final content = Container(
      child: (title ?? '').isNotEmpty
          ? FittedBox(
              child: Text(
                title ?? '',
                style: const TextStyle(
                  color: Colors.black,
                ),
              ),
            )
          : null,
    );
    return AppBar(
        leadingWidth: 28,
        titleSpacing: withBackButton ? 0 : null,
        title: content,
        centerTitle: centerTitle,
        elevation: elevation,
        foregroundColor: Colors.black,
        backgroundColor: backgroundColor ?? Colors.white,
        automaticallyImplyLeading: automaticallyImplyLeading,
        leading: withBackButton
            ? Row(
                children: [
                  Flexible(
                    child: InkWell(
                      onTap: () => context.router.maybePop(),
                      child: Align(
                        child: Icon(
                          isLtr
                              ? Icons.arrow_back_ios_new_rounded
                              : Icons.arrow_forward_ios_rounded,
                          color: Colors.black,
                          size: 16,
                        ),
                      ),
                    ),
                  ),
                  // if (profileInfoWiget != null)
                  //   Flexible(flex: 7, child: profileInfoWiget!),
                ],
              )
            : null,
        actions: actions,
        bottom: bottom);
  }

  @override
  Size get preferredSize => bottom != null
      ? const Size.fromHeight(kToolbarHeight + kTextTabBarHeight)
      : AppBar().preferredSize;
}

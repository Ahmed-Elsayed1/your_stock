import '../../your_stock_design_system.dart';

Future<T?> showAppModalBottomSheet<T>(
  BuildContext context, {
  Widget? header,
  required Widget body,
  bool hasHeader = true,
  double maxHeight = double.infinity,
  double maxWidth = double.infinity,
  double minHeight = 0.0,
  double minWidth = 0.0,
  bool isScrollControlled = false,
}) =>
    showModalBottomSheet<T>(
      context: context,
      isScrollControlled: isScrollControlled,
      useSafeArea: true,
      backgroundColor: Colors.white,
      constraints: BoxConstraints(
        maxHeight: maxHeight,
        minHeight: maxHeight,
        maxWidth: maxWidth,
        minWidth: minWidth,
      ),
      builder: (context) {
        final theme = AppTheme.of(context);
        return AppScaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(60)),
                ),
                child: hasHeader
                    ? header ??
                        AppDivider(
                          thickness: theme.spacing.xxxs,
                          verticalMargin: theme.spacing.m,
                          horizontalMargin:
                              MediaQuery.of(context).size.width * 0.4,
                          radius: 100,
                        )
                    : null,
              ),
              if (hasHeader) const AppDivider(),
              Expanded(child: body),
            ],
          ),
        );
      },
    );

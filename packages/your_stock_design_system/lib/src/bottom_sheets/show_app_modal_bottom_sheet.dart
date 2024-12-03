import '../../your_stock_design_system.dart';

Future<T?> showAppModalBottomSheet<T>(
  BuildContext context, {
  required Widget body,
  bool isScrollControlled = false,
}) =>
    showModalBottomSheet<T>(
      context: context,
      isScrollControlled: isScrollControlled,
      useSafeArea: true,
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
                child: AppDivider(
                  thickness: theme.spacing.xxxs,
                  verticalMargin: theme.spacing.l,
                  horizontalMargin: MediaQuery.of(context).size.width * 0.4,
                  radius: 100,
                ),
              ),
              const AppDivider(),
              Expanded(child: body),
            ],
          ),
        );
      },
    );

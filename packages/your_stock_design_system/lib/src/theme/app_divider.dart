import '../../your_stock_design_system.dart';

class AppDivider extends StatelessWidget {
  const AppDivider({
    super.key,
    this.thickness,
    this.horizontalMargin,
    this.verticalMargin,
    this.radius,
  });
  final double? thickness;
  final double? horizontalMargin;
  final double? verticalMargin;
  final double? radius;

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: horizontalMargin ?? theme.spacing.s,
        vertical: verticalMargin ?? theme.spacing.xs,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(radius ?? 100)),
        border: Border.all(
          color: Colors.black26,
          width: thickness ?? 0.2,
        ),
      ),
    );
  }
}

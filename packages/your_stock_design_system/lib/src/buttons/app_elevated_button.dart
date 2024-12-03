import '../../your_stock_design_system.dart';

class AppElevatedButton extends StatelessWidget {
  const AppElevatedButton({
    super.key,
    this.title,
    this.backgroundColor,
    this.foregroundColor,
    this.borderRadius,
    this.onTap,
  });
  final String? title;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final double? borderRadius;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(
          backgroundColor ?? Colors.deepOrange,
        ),
        foregroundColor: WidgetStatePropertyAll(
          foregroundColor ?? Colors.white,
        ),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(borderRadius ?? 8),
            ),
          ),
        ),
        minimumSize: const WidgetStatePropertyAll(Size(48, 40)),
        maximumSize: const WidgetStatePropertyAll(Size.fromHeight(40)),
      ),
      child: Text(title ?? ''),
    );
  }
}

import 'package:your_stock_design_system/your_stock_design_system.dart';
import 'package:your_stock_core/your_stock_core.dart';

Future<void> showErrorDialog(
  BuildContext context,
  String text,
) async =>
    await showDialog(
      context: context,
      builder: (context) => Dialog(
        elevation: 16,
        backgroundColor: Colors.transparent,
        child: Container(
          width: 327,
          padding: const EdgeInsets.all(16),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(12)),
            color: Colors.white,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "Something went wrong",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const AppGap.m(),
              Text(
                text,
                style: const TextStyle(
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
              const AppGap.m(),
              AppElevatedButton(
                title: "Ok",
                onTap: () => context.router.maybePop(),
              ),
            ],
          ),
        ),
      ),
    );

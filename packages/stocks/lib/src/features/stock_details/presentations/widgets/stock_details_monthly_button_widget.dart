import 'package:common/common.dart';
import 'package:your_stock_core/your_stock_core.dart';
import 'package:your_stock_design_system/your_stock_design_system.dart';

import '../cubit/cubit.dart';

class StockDetailsMonthlyButtonWidget extends StatelessWidget {
  const StockDetailsMonthlyButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StockDetailsCubit, StockDetailsState>(
      builder: (context, state) {
        final cubit = context.read<StockDetailsCubit>();
        return InkWell(
          onTap: () {
            cubit.changeTimeSeries(TimeSeries.month);
          },
          child: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black54),
              borderRadius: const BorderRadius.all(
                Radius.circular(8),
              ),
            ),
            child: const Center(
              child: Text(
                "1M",
                style: TextStyle(
                  color: Colors.black54,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

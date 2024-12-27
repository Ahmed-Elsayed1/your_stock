import 'package:common/common.dart';
import 'package:your_stock_core/your_stock_core.dart';
import 'package:your_stock_design_system/your_stock_design_system.dart';

import '../cubit/cubit.dart';

class StockDetailsWeeklyButtonWidget extends StatelessWidget {
  const StockDetailsWeeklyButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StockDetailsCubit, StockDetailsState>(
      builder: (context, state) {
        final cubit = context.read<StockDetailsCubit>();
        return InkWell(
          onTap: () {
            cubit.changeTimeSeries(TimeSeries.week);
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
                "1W",
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

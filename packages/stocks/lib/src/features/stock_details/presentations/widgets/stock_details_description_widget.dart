import 'package:your_stock_design_system/your_stock_design_system.dart';
import 'package:your_stock_core/your_stock_core.dart';

import '../cubit/cubit.dart';

class StockDescriptionWidget extends StatelessWidget {
  final String symbol;

  const StockDescriptionWidget({super.key, required this.symbol});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StockDetailsCubit, StockDetailsState>(
      buildWhen: (context, state) => state.maybeWhen(
        orElse: () => false,
        descriptionLoading: () => true,
        descriptionLoaded: (_) => true,
        descriptionError: (_) => true,
      ),
      builder: (context, state) => state.maybeWhen(
        orElse: () => const SizedBox.shrink(),
        descriptionLoading: () => const Center(
          child: CircularProgressIndicator(),
        ),
        descriptionError: (error) => Center(
          child: Text(error),
        ),
        descriptionLoaded: (description) => Text(
          description,
          style: TextStyle(
            color: Colors.black.withOpacity(0.6),
            fontSize: 14,
            height: 1.5,
          ),
        ),
      ),
    );
  }
}

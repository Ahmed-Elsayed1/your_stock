import 'package:flutter/material.dart';
import 'package:your_stock_core/your_stock_core.dart';

import '../cubit/cubit.dart';

class StockDescriptionWidget extends StatelessWidget {
  final String symbol;

  const StockDescriptionWidget({super.key, required this.symbol});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => StockDetailsCubit(symbol)..getDescriptionData(),
      child: BlocBuilder<StockDetailsCubit, StockDetailsState>(
        builder: (context, state) => state.maybeWhen(
          orElse: () => const SizedBox.shrink(),
          loading: () => const Center(
            child: CircularProgressIndicator(),
          ),
          descriptionLoaded: (description) => Text(
            description,
            style: TextStyle(
              color: Colors.black.withOpacity(0.6),
              fontSize: 14,
              height: 1.5,
            ),
          ),
          error: (error) => Center(
            child: Text(error),
          ),
        ),
      ),
    );
  }
}

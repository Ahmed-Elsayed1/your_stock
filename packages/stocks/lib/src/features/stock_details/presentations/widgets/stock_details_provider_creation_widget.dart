import 'package:common/common.dart';
import 'package:your_stock_design_system/your_stock_design_system.dart';
import 'package:your_stock_core/your_stock_core.dart';

import '../cubit/cubit.dart';

class StockDetailsProviderCreationWidget extends StatelessWidget {
  const StockDetailsProviderCreationWidget({
    super.key,
    required this.stock,
    required this.child,
  });
  final StockModel stock;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<StockDetailsCubit>()
        ..init(stock)
        ..getDataMinute()
        ..getDescriptionData(),
      child: child,
    );
  }
}

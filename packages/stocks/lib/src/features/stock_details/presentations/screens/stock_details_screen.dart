import 'package:common/common.dart';
import 'package:watch_list/watch_list.dart';
import 'package:your_stock_design_system/your_stock_design_system.dart';
import 'package:your_stock_core/your_stock_core.dart';

import '../widgets/widgets.dart';

@RoutePage()
class StockDetailsScreen extends StatelessWidget {
  final String symbol;

  const StockDetailsScreen({super.key, required this.symbol});

  @override
  Widget build(BuildContext context) {
    return StockDetailsProviderCreationWidget(
      stock: StockModel(symbol: symbol),
      child: AppScaffold(
        appbar: AppScaffoldBar.leadingTitle(
          title: symbol,
          withBackButton: true,
          actions: [
            AddToWatchListButton(symbol: symbol),
          ],
        ),
        body: const StockDetailsProviderConsumerWidget(),
      ),
    );
  }
}

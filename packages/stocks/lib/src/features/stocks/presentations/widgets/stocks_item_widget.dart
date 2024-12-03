import 'package:your_stock_core/your_stock_core.dart';
import 'package:your_stock_design_system/your_stock_design_system.dart';

import '../../../../../stocks.dart';

class StocksItemWidget extends StatelessWidget {
  const StocksItemWidget({
    super.key,
    this.name,
    this.ticker,
  });
  final String? name;
  final String? ticker;

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    return Padding(
      padding: EdgeInsets.all(theme.spacing.s),
      child: StockItemWidget(
        name: name,
        ticker: ticker,
        image: AssetImage('assets/images/logos/${ticker ?? ''}.png'),
        onTap: () => context.router.push(
          StockDetailsRoute(symbol: ticker ?? ''),
        ),
      ),
    );
  }
}

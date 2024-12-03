import 'package:common/common.dart';
import 'package:your_stock_core/your_stock_core.dart';
import 'package:your_stock_design_system/your_stock_design_system.dart';

import '../widgets/widgets.dart';

@RoutePage()
class StocksScreen extends StatelessWidget {
  const StocksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appbar: AppScaffoldBar.center(
        title: 'Stocks',
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // context.router.push(SearchRoute());
              showSearchBottomSheet(context);
            },
          ),
        ],
      ),
      body: const StocksBodyWidget(),
    );
  }
}
